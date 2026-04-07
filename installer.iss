[Setup]
AppName=Local Sender
AppVersion=1.0.0
DefaultDirName={pf}\Local Sender
DefaultGroupName=Local Sender
OutputDir=.
OutputBaseFilename=Local-Sender-{{version}}
Compression=lzma
SolidCompression=yes

[Files]
Source: "{#SourceDir}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\Local Sender"; Filename: "{app}\local_sender.exe"
Name: "{commondesktop}\Local Sender"; Filename: "{app}\local_sender.exe"; Tasks: desktopicon

[Tasks]
Name: "desktopicon"; Description: "Create a desktop icon"; GroupDescription: "Additional icons:"