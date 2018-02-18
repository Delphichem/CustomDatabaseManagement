unit uuServerList;
{
  Mar 2016 Code By: Daniel Campbell
}
interface

uses
   JvComCtrls, ComCtrls, Classes;

procedure PopulateServerList(atvServerList : TJvTreeView);
procedure GetRegisteredServers(aServerList : TStrings);
procedure ExpandServer(aSelectedNode : TTreeNode; atvServerList : TJvTreeView;
   aServer, aAlias : String);
procedure ExpandAlias(aSelectedNode : TTreeNode; atvServerList : TJvTreeView;
   aServer, aAlias : String);
procedure ExpandTables(aSelectedNode : TTreeNode; atvServerList : TJvTreeView;
   aServer, aAlias : String; lClickedTablesFolder : Boolean);
procedure ExpandStoredProcFunc(aSelectedNode : TTreeNode; atvServerList : TJvTreeView;
   aServer, aAlias : String);
procedure ExpandTriggers(aSelectedNode : TTreeNode; atvServerList : TJvTreeView;
   aServer, aAlias : String);
procedure ExpandViews(aSelectedNode : TTreeNode; atvServerList : TJvTreeView;
   aServer, aAlias : String);

implementation

uses
   ufNexusDatabase, uuGlobals, SysUtils, IniFiles, DBTables, ufISQLDataBase, ufPDXDataBase;

procedure PopulateServerList(atvServerList : TJvTreeView);
   procedure FillServerListTree(aServerList : TStrings);
   var
      I : Integer;
      lNewNode : TTreeNode;
   begin
      atvServerList.Items.BeginUpdate;
      for I := 0 to aServerList.Count - 1 do
      begin
         lNewNode := atvServerList.Items.Add(nil, aServerList[I]);
         lNewNode.ImageIndex := 2;
         lNewNode.SelectedIndex := 2;
      end;
      atvServerList.Items.EndUpdate;
   end;
var
   lServerList : TStrings;
   lNexusDataBase : TNexusDataBase;
begin
   atvServerList.ReadOnly := False;
   atvServerList.Items.Clear;
   lServerList := TStringList.Create;
   lNexusDataBase := TNexusDataBase.Create;
   try
      lServerList.Add('Paradox');
      FillServerListTree(lServerList);

      if gSettings.RemoteNexus then
      begin
         lServerList.Clear;
         lNexusDataBase.GetServerNames(lServerList);
         FillServerListTree(lServerList);

         lServerList.Clear;
         lNexusDataBase.GetPipedServerNames(lServerList);
         FillServerListTree(lServerList);

         lServerList.Clear;
         GetRegisteredServers(lServerList);
         FillServerListTree(lServerList);
      end
      else
      begin
         lServerList.Clear;
         lServerList.Add('NexusDB');
         FillServerListTree(lServerList);
      end;

      //lServerList.Clear;
      //lServerList.Add('MSSQL');
      //FillServerListTree(lServerList);
   finally
      FreeAndNil(lServerList);
      if Assigned(lNexusDataBase) then
         FreeAndNil(lNexusDataBase);
      atvServerList.ReadOnly := True;
   end;
end;

procedure GetRegisteredServers(aServerList : TStrings);
var
   PersonalIni : TIniFile;
   lDesc : String;
   lCount : Integer;
begin
   PersonalIni := TIniFile.Create(gAppPath + PERSONAL_INI);
   try
      lDesc := 'something';
      lCount := 1;
      while lDesc <> '' do
      begin
         lDesc := PersonalIni.ReadString('ServerList', 'Server' + IntToStr(lCount), '');
         if lDesc <> '' then
            aServerList.Add(lDesc);
         Inc(lCount);
      end;
   finally
      PersonalIni.Free;
   end;
end;

procedure ExpandServer(aSelectedNode : TTreeNode; atvServerList : TJvTreeView;
   aServer, aAlias : String);
var
   lPDXAliasNames : TStringList;
   lAliasNames : TStrings;
   lWorkingDirectory : string;
   I : Integer;
   lServerName : String;
   lNexusDataBase : TNexusDataBase;
   lNewNode : TTreeNode;
   ldbParadox : TDataBase;
begin
   if not aSelectedNode.HasChildren then //haven't already filled it
   begin
      lServerName := aSelectedNode.Text;
      //fill this server with alias names as children
      if AnsiPos('Paradox', lServerName) <> 0 then
      begin
         lPDXAliasNames := TStringList.Create;
         ldbParadox := TDatabase.Create(nil);
         try
            //should probably use a locally declared database like nexus..
            ldbParadox.Session.ConfigMode := cmAll;
            ldbParadox.Session.GetAliasNames(lPDXAliasNames);
            if Assigned(lPDXAliasNames) and (lPDXAliasNames.Count <> 0) then
            begin
               for I := 0 to lPDXAliasNames.Count - 1 do
               begin
                  //we'll assume TempSQLAlias is MSSQL based
                  if lPDXAliasNames[I] <> 'TempSQLAlias' then
                  begin
                     lNewNode := atvServerList.Items.AddChild(aSelectedNode, lPDXAliasNames[I]);
                     lNewNode.ImageIndex := 1;
                     lNewNode.SelectedIndex := 1;
                     if (lPDXAliasNames[I] = aAlias) and (lServerName = aServer) then
                        atvServerList.SetBold(lNewNode, True);
                  end;
               end;
            end;
         finally
            FreeAndNil(lPDXAliasNames);
         end;
      end
      else if AnsiPos('MSSQL', lServerName) <> 0 then//MS SQL
      begin
         lNewNode := atvServerList.Items.AddChild(aSelectedNode, 'Any');
         lNewNode.ImageIndex := 3;
         lNewNode.SelectedIndex := 3;
      end
      else //nexus
      begin
         lNexusDataBase := TNexusDataBase.Create;
         try
            //not a great way of doing it
            //if IsNexusServerNamePiped(lServerName) then
            //   lNexusDataBase.UsePipedTransport;
            lNexusDataBase.ServerName := lServerName;
            lAliasNames := lNexusDataBase.GetDatabaseNames;
            if Assigned(lAliasNames) and (lAliasNames.Count <> 0) then
            begin
               for I := 0 to lAliasNames.Count - 1 do
               begin
                  lNewNode := atvServerList.Items.AddChild(aSelectedNode, lAliasNames[I]);
                  lNewNode.ImageIndex := 0;
                  lNewNode.SelectedIndex := 0;
                  if (lAliasNames[I] = aAlias) and (lServerName = aServer)then
                     atvServerList.SetBold(lNewNode, True);
               end;
               FreeAndNil(lAliasNames);
            end;
         finally
            FreeAndNil(lNexusDataBase);
         end;
      end;
      aSelectedNode.Expanded := True;
   end
   else //it already has children
   begin
      aSelectedNode.Expanded := not aSelectedNode.Expanded;
   end;
end;

procedure ExpandAlias(aSelectedNode : TTreeNode; atvServerList : TJvTreeView;
   aServer, aAlias : String);
var
   I : Integer;
   lNewNode : TTreeNode;
   lTableNames : TStringList;
   lClickedTablesFolder : Boolean;
begin
   if not aSelectedNode.HasChildren then //haven't already filled it
   begin
      lClickedTablesFolder := (Uppercase(aSelectedNode.Text) = 'TABLES');
      //if they already have this database open already, get the tablenames from
      //that. Otherwise create a temporary database to get the tablenames
      if Assigned(gDataBase) and
       ((gDBType = dtParadox) and (aSelectedNode.Parent.Text = aServer) and (aSelectedNode.Text = aAlias)) or
       ((gDBType = dtNexus) and lClickedTablesFolder and
          (aSelectedNode.Parent.Parent.Text = aServer) and (aSelectedNode.Parent.Text = aAlias)) then
      begin
         lTableNames := gDataBase.GetTableNames;
         try
            //expand tables
            for I := 0 to lTableNames.Count - 1 do
            begin
               lNewNode := atvServerList.Items.AddChild(aSelectedNode, lTableNames[I]);
               lNewNode.ImageIndex := -1;
               lNewNode.SelectedIndex := -1;
            end;
         finally
            FreeAndNil(lTableNames);
         end;
      end
      else //They are not connected to the alias they clicked
      begin
         if (AnsiPos('Paradox', aSelectedNode.Parent.Text) <> 0) or (AnsiPos('MSSQL', aSelectedNode.Parent.Text) <> 0) then
            ExpandTables(aSelectedNode, atvServerList, aServer, aAlias, lClickedTablesFolder)
         else //Clicked on a Nexus Alias
         begin
            lNewNode := atvServerList.Items.AddChild(aSelectedNode, 'Tables');
            lNewNode.ImageIndex := 4;
            lNewNode.SelectedIndex := -1;

            lNewNode := atvServerList.Items.AddChild(aSelectedNode, 'Stored Procs');
            lNewNode.ImageIndex := 4;
            lNewNode.SelectedIndex := -1;

            lNewNode := atvServerList.Items.AddChild(aSelectedNode, 'Triggers');
            lNewNode.ImageIndex := 4;
            lNewNode.SelectedIndex := -1;

            lNewNode := atvServerList.Items.AddChild(aSelectedNode, 'Views');
            lNewNode.ImageIndex := 4;
            lNewNode.SelectedIndex := -1;
         end;
      end;
      aSelectedNode.Expanded := True;
   end
   else //it already has children
   begin
      aSelectedNode.Expanded := not aSelectedNode.Expanded;
   end;
end;

procedure ExpandTables(aSelectedNode : TTreeNode; atvServerList : TJvTreeView;
   aServer, aAlias : String; lClickedTablesFolder : Boolean);
var
   lISQLDataBase : ISQLDataBase;
   lTableNames : TStringList;
   I : Integer;
   lNewNode : TTreeNode;
   lServerName, lAlias : string;
   lNexus : Boolean;
begin
   if not aSelectedNode.HasChildren then //haven't already filled it
   begin
      lServerName := aSelectedNode.Parent.Text;
      lAlias      := aSelectedNode.Text;

      lNexus := False;

      if (AnsiPos('Paradox', lServerName) <> 0) then
      begin
         lISQLDataBase := TPDXDataBase.Create;
      end
      else if (AnsiPos('MSSQL', lServerName) <> 0) then
      begin
         //Only get the tablenames for a MSSQL after we've connected
         //Otherwise, will have to enter credentials twice
         Exit;
         //lISQLDataBase := TDBEDataBase.Create;
      end
      else if lClickedTablesFolder then //Nexus
      begin
         lISQLDataBase := TNexusDataBase.Create;
         lNexus := True;
         lServerName := aSelectedNode.Parent.Parent.Text;
         lAlias      := aSelectedNode.Parent.Text;
      end
      else
         Exit;

      //get table names
      try
         //not a great way of doing it
         //if lNexus and IsNexusServerNamePiped(lServerName) then
         //   lISQLDataBase.UsePipedTransport;

         lISQLDataBase.ServerName := lServerName;
         lISQLDataBase.AliasName  := lAlias;
         try
            lISQLDataBase.Connected := True;
         except
            if Assigned(lISQLDataBase) then
            begin
               lISQLDataBase.Connected := False;
               lISQLDataBase := nil;
            end;
            Exit; //give up on trying to get the table names
         end;
         lTableNames := lISQLDataBase.GetTableNames;
         try
            //expand tables
            for I := 0 to lTableNames.Count - 1 do
            begin
               lNewNode := atvServerList.Items.AddChild(aSelectedNode, lTableNames[I]);
               lNewNode.ImageIndex := -1;
               lNewNode.SelectedIndex := -1;
            end;
         finally
            FreeAndNil(lTableNames);
         end;
      finally
         if Assigned(lISQLDataBase) then
         begin
            lISQLDataBase.Connected := False;
            lISQLDataBase := nil;
         end;
      end;
      aSelectedNode.Expanded := True;
   end
   else //it already has children
   begin
      aSelectedNode.Expanded := not aSelectedNode.Expanded;
   end;
end;

procedure ExpandStoredProcFunc(aSelectedNode : TTreeNode; atvServerList : TJvTreeView;
   aServer, aAlias : String);
var
   lISQLDataBase : ISQLDataBase;
   lStoredProcNames : TStringList;
   I : Integer;
   lNewNode : TTreeNode;
   lServerName, lAlias : string;
begin
   if not aSelectedNode.HasChildren then //haven't already filled it
   begin
      lServerName := aSelectedNode.Parent.Parent.Text;
      lAlias      := aSelectedNode.Parent.Text;

      lISQLDataBase := TNexusDataBase.Create;
      try
         lISQLDataBase.ServerName := lServerName;
         lISQLDataBase.AliasName  := lAlias;
         try
            lISQLDataBase.Connected := True;
         except
            if Assigned(lISQLDataBase) then
            begin
               lISQLDataBase.Connected := False;
               lISQLDataBase := nil;
            end;
            Exit; //give up
         end;
         lStoredProcNames := lISQLDataBase.GetStoredProcNames;
         try
            //expand procs
            for I := 0 to lStoredProcNames.Count - 1 do
            begin
               lNewNode := atvServerList.Items.AddChild(aSelectedNode, lStoredProcNames[I]);
               lNewNode.ImageIndex := -1;
               lNewNode.SelectedIndex := -1;
            end;
         finally
            FreeAndNil(lStoredProcNames);
         end;
      finally
         if Assigned(lISQLDataBase) then
         begin
            lISQLDataBase.Connected := False;
            lISQLDataBase := nil;
         end;
      end;
      aSelectedNode.Expanded := True;
   end
   else //it already has children
   begin
      aSelectedNode.Expanded := not aSelectedNode.Expanded;
   end;
end;

procedure ExpandTriggers(aSelectedNode : TTreeNode; atvServerList : TJvTreeView;
   aServer, aAlias : String);
var
   lISQLDataBase : ISQLDataBase;
   lTriggerNames : TStringList;
   I : Integer;
   lNewNode : TTreeNode;
   lServerName, lAlias : string;
begin
   if not aSelectedNode.HasChildren then //haven't already filled it
   begin
      lServerName := aSelectedNode.Parent.Parent.Text;
      lAlias      := aSelectedNode.Parent.Text;

      lISQLDataBase := TNexusDataBase.Create;
      try
         lISQLDataBase.ServerName := lServerName;
         lISQLDataBase.AliasName  := lAlias;
         try
            lISQLDataBase.Connected := True;
         except
            if Assigned(lISQLDataBase) then
            begin
               lISQLDataBase.Connected := False;
               lISQLDataBase := nil;
            end;
            Exit; //give up
         end;
         lTriggerNames := lISQLDataBase.GetTriggerNames;
         try
            //expand triggers
            for I := 0 to lTriggerNames.Count - 1 do
            begin
               lNewNode := atvServerList.Items.AddChild(aSelectedNode, lTriggerNames[I]);
               lNewNode.ImageIndex := -1;
               lNewNode.SelectedIndex := -1;
            end;
         finally
            FreeAndNil(lTriggerNames);
         end;
      finally
         if Assigned(lISQLDataBase) then
         begin
            lISQLDataBase.Connected := False;
            lISQLDataBase := nil;
         end;
      end;
      aSelectedNode.Expanded := True;
   end
   else //it already has children
   begin
      aSelectedNode.Expanded := not aSelectedNode.Expanded;
   end;
end;

procedure ExpandViews(aSelectedNode : TTreeNode; atvServerList : TJvTreeView;
   aServer, aAlias : String);
var
   lISQLDataBase : ISQLDataBase;
   lViewNames : TStringList;
   I : Integer;
   lNewNode : TTreeNode;
   lServerName, lAlias : string;
begin
   if not aSelectedNode.HasChildren then //haven't already filled it
   begin
      lServerName := aSelectedNode.Parent.Parent.Text;
      lAlias      := aSelectedNode.Parent.Text;

      lISQLDataBase := TNexusDataBase.Create;
      try
         lISQLDataBase.ServerName := lServerName;
         lISQLDataBase.AliasName  := lAlias;
         try
            lISQLDataBase.Connected := True;
         except
            if Assigned(lISQLDataBase) then
            begin
               lISQLDataBase.Connected := False;
               lISQLDataBase := nil;
            end;
            Exit; //give up
         end;
         lViewNames := lISQLDataBase.GetViewNames;
         try
            //expand triggers
            for I := 0 to lViewNames.Count - 1 do
            begin
               lNewNode := atvServerList.Items.AddChild(aSelectedNode, lViewNames[I]);
               lNewNode.ImageIndex := -1;
               lNewNode.SelectedIndex := -1;
            end;
         finally
            FreeAndNil(lViewNames);
         end;
      finally
         if Assigned(lISQLDataBase) then
         begin
            lISQLDataBase.Connected := False;
            lISQLDataBase := nil;
         end;
      end;
      aSelectedNode.Expanded := True;
   end
   else //it already has children
   begin
      aSelectedNode.Expanded := not aSelectedNode.Expanded;
   end;
end;

end.
