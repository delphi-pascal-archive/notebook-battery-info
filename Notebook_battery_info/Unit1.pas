{Автор Зорков Игорь - zorkovigor@mail.ru}

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan;

type
  USHORT = Word;

type
  TGUID = record
    Data1: DWORD;
    Data2: Word;
    Data3: Word;
    Data4: array[0..7] of Byte;
  end;

type
  LPGUID = ^TGUID;

type
  SP_DEVICE_INTERFACE_DATA = record
    cbSize: DWORD;
    Guid: TGUID;
    Flags: DWORD;
    Reserve: Pointer;
  end;

type
  PSP_DEVICE_INTERFACE_DATA = ^SP_DEVICE_INTERFACE_DATA;

type
  SP_DEVINFO_DATA = record
    cbSize: DWord;
    Guid: TGUID;
    DevInst: DWORD;
    Reserve: DWORD;
  end;

type
  PSP_DEVINFO_DATA = ^SP_DEVINFO_DATA;

type
  SP_DEVICE_INTERFACE_DETAIL_DATA = packed record
    cbSize: DWORD;
    DevicePath: array[0..0] of AnsiChar;
  end;

type
  PSP_DEVICE_INTERFACE_DETAIL_DATA = ^SP_DEVICE_INTERFACE_DETAIL_DATA;

  BATTERY_QUERY_INFORMATION_LEVEL = (
    BatteryInformation,
    BatteryGranularityInformation,
    BatteryTemperature,
    BatteryEstimatedTime,
    BatteryDeviceName,
    BatteryManufactureDate,
    BatteryManufactureName,
    BatteryUniqueID,
    BatterySerialNumber);
  TBatteryQueryInformationLevel = BATTERY_QUERY_INFORMATION_LEVEL;

  _BATTERY_QUERY_INFORMATION = record
    BatteryTag: ULONG;
    InformationLevel: BATTERY_QUERY_INFORMATION_LEVEL;
    AtRate: integer;
  end;
  BATTERY_QUERY_INFORMATION = _BATTERY_QUERY_INFORMATION;
  PBATTERY_QUERY_INFORMATION = ^BATTERY_QUERY_INFORMATION;
  TBatteryQueryInformation = BATTERY_QUERY_INFORMATION;
  PBatteryQueryInformation = PBATTERY_QUERY_INFORMATION;

  _BATTERY_INFORMATION = record
    Capabilities: ULONG;
    Technology: UCHAR;
    Reserved: array[0..2] of UCHAR;
    Chemistry: array[0..3] of UCHAR;
    DesignedCapacity: ULONG;
    FullChargedCapacity: ULONG;
    DefaultAlert1: ULONG;
    DefaultAlert2: ULONG;
    CriticalBias: ULONG;
    CycleCount: ULONG;
  end;
  BATTERY_INFORMATION = _BATTERY_INFORMATION;
  PBATTERY_INFORMATION = ^BATTERY_INFORMATION;
  TBatteryInformation = BATTERY_INFORMATION;
  PBatteryInformation = PBATTERY_INFORMATION;

type
  _BATTERY_MANUFACTURE_DATE = record
    Day: UCHAR;
    Month: UCHAR;
    Year: USHORT;
  end;
  BATTERY_MANUFACTURE_DATE = _BATTERY_MANUFACTURE_DATE;
  PBATTERY_MANUFACTURE_DATE = ^BATTERY_MANUFACTURE_DATE;
  TBatteryManufactureDate = BATTERY_MANUFACTURE_DATE;
  PBatteryManufactureDate = PBATTERY_MANUFACTURE_DATE;

  _BATTERY_WAIT_STATUS = record
    BatteryTag: ULONG;
    Timeout: ULONG;
    PowerState: ULONG;
    LowCapacity: ULONG;
    HighCapacity: ULONG;
  end;
  BATTERY_WAIT_STATUS = _BATTERY_WAIT_STATUS;
  PBATTERY_WAIT_STATUS = ^BATTERY_WAIT_STATUS;
  TBatteryWaitStatus = BATTERY_WAIT_STATUS;
  PBatteryWaitStatus = PBATTERY_WAIT_STATUS;

  _BATTERY_STATUS = record
    PowerState: ULONG;
    Capacity: ULONG;
    Voltage: ULONG;
    Rate: integer;
  end;
  BATTERY_STATUS = _BATTERY_STATUS;
  PBATTERY_STATUS = ^BATTERY_STATUS;
  TBatteryStatus = BATTERY_STATUS;
  PBatteryStatus = PBATTERY_STATUS;

type
  _BATTERY_REPORTING_SCALE = record
    Granularity: DWORD;
    Capacity: DWORD;
  end;
  BATTERY_REPORTING_SCALE = _BATTERY_REPORTING_SCALE;
  PBATTERY_REPORTING_SCALE = ^BATTERY_REPORTING_SCALE;
  TBatteryReportingScale = BATTERY_REPORTING_SCALE;
  PBatteryReportingScale = PBATTERY_REPORTING_SCALE;

const
  GUID_DEVICE_BATTERY: TGUID = (Data1: $72631E54; Data2: $78A4; Data3: $11D0; Data4: ($BC, $F7, $00, $AA, $00, $B7, $B3, $2A));

const
  DIGCF_DEFAULT = $00000001;
  DIGCF_PRESENT = $00000002;
  DIGCF_ALLCLASSES = $00000004;
  DIGCF_PROFILE = $00000008;
  DIGCF_DEVICEINTERFACE = $00000010;
  FILE_DEVICE_BATTERY = $00000029;
  FILE_READ_ACCESS = $0001;
  METHOD_BUFFERED = 0;

  BATTERY_CAPACITY_RELATIVE = $40000000;
  BATTERY_IS_SHORT_TERM = $20000000;
  BATTERY_SET_CHARGE_SUPPORTED = $00000001;
  BATTERY_SET_DISCHARGE_SUPPORTED = $00000002;
  BATTERY_SYSTEM_BATTERY = $80000000;

const
  BATTERY_CHARGING = $00000004;
  BATTERY_CRITICAL = $00000008;
  BATTERY_DISCHARGING = $00000002;
  BATTERY_POWER_ON_LINE = $00000001;

const
  BATTERY_UNKNOWN_RATE = $80000000;

  IOCTL_BATTERY_QUERY_INFORMATION = (FILE_DEVICE_BATTERY shl 16) or (FILE_READ_ACCESS shl 14) or ($11 shl 2) or METHOD_BUFFERED;
  IOCTL_BATTERY_QUERY_TAG = (FILE_DEVICE_BATTERY shl 16) or (FILE_READ_ACCESS shl 14) or ($10 shl 2) or METHOD_BUFFERED;
  IOCTL_BATTERY_QUERY_STATUS = (FILE_DEVICE_BATTERY shl 16) or (FILE_READ_ACCESS shl 14) or ($13 shl 2) or METHOD_BUFFERED;

type
  TSetupDiGetClassDevs = function(const ClassGuid: LPGUID; Enumerator: LPCTSTR; hwndParent: HWND; Flags: DWORD): Pointer; stdcall;
  TSetupDiEnumDeviceInterfaces = function(DeviceInfoSet: Pointer; DeviceInfoData: PSP_DEVINFO_DATA; const InterfaceClassGuid: LPGUID; MemberIndex: DWORD; DeviceInterfaceData: PSP_DEVICE_INTERFACE_DATA): Boolean; stdcall;
  TSetupDiGetDeviceInterfaceDetail = function(DeviceInfoSet: Pointer; DeviceInterfaceData: PSP_DEVICE_INTERFACE_DATA; DeviceInterfaceDetailData: PSP_DEVICE_INTERFACE_DETAIL_DATA; DeviceInterfaceDetailDataSize: DWORD; RequiredSize: PDWORD; DeviceInfoData: PSP_DEVINFO_DATA): Boolean; stdcall;
  TSetupDiDestroyDeviceInfoList = function(DeviceInfoSet: Pointer): Boolean; stdcall;

type
  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    XPManifest1: TXPManifest;
    Button1: TButton;
    Edit29: TEdit;
    Edit28: TEdit;
    Edit27: TEdit;
    Edit26: TEdit;
    Edit25: TEdit;
    Edit24: TEdit;
    Edit23: TEdit;
    Edit22: TEdit;
    Edit21: TEdit;
    Edit20: TEdit;
    Edit19: TEdit;
    Edit18: TEdit;
    Edit17: TEdit;
    Edit16: TEdit;
    Edit15: TEdit;
    Edit14: TEdit;
    Edit13: TEdit;
    Edit12: TEdit;
    Edit11: TEdit;
    Edit10: TEdit;
    Edit8: TEdit;
    Edit7: TEdit;
    Edit6: TEdit;
    Edit5: TEdit;
    Edit4: TEdit;
    Edit3: TEdit;
    Edit2: TEdit;
    Edit1: TEdit;
    Label29: TLabel;
    Label28: TLabel;
    Label27: TLabel;
    Label26: TLabel;
    Label25: TLabel;
    Label24: TLabel;
    Label23: TLabel;
    Label22: TLabel;
    Label21: TLabel;
    Label20: TLabel;
    Label19: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  BatteryDevicePath: Array of String;
  SetupDiGetClassDevs: TSetupDiGetClassDevs;
  SetupDiEnumDeviceInterfaces: TSetupDiEnumDeviceInterfaces;
  SetupDiGetDeviceInterfaceDetail: TSetupDiGetDeviceInterfaceDetail;
  SetupDiDestroyDeviceInfoList: TSetupDiDestroyDeviceInfoList;

implementation

{$R *.dfm}

function EnumerateBatteries: Cardinal;
var
  DeviceInfo: Pointer;
  DeviceInterfaceData: SP_DEVICE_INTERFACE_DATA;
  RequiredSize: DWORD;
  DevicePath: String;
  PDeviceInformationDetailData: PSP_DEVICE_INTERFACE_DETAIL_DATA;
begin
  Result := 0;
  Finalize(BatteryDevicePath);
  DeviceInfo := SetupDiGetClassDevs(@GUID_DEVICE_BATTERY, nil, 0, DIGCF_PRESENT or DIGCF_DEVICEINTERFACE);
  while True do
  begin
    DeviceInterfaceData.cbSize := SizeOf(DeviceInterfaceData);
    if not SetupDiEnumDeviceInterfaces(DeviceInfo, nil, @GUID_DEVICE_BATTERY, Result, @DeviceInterfaceData) then
      Break;
    SetupDiGetDeviceInterfaceDetail(DeviceInfo, @DeviceInterfaceData, nil, 0, @RequiredSize, nil);
    PDeviceInformationDetailData := AllocMem(RequiredSize + SizeOf(SP_DEVICE_INTERFACE_DETAIL_DATA));
    PDeviceInformationDetailData.cbSize := SizeOf(SP_DEVICE_INTERFACE_DETAIL_DATA);
    SetupDiGetDeviceInterfaceDetail(DeviceInfo, @DeviceInterfaceData, PDeviceInformationDetailData, RequiredSize, @RequiredSize, nil);
    DevicePath := PChar(@PDeviceInformationDetailData^.DevicePath);
    FreeMem(PDeviceInformationDetailData);
    Inc(Result);
    SetLength(BatteryDevicePath, Result);
    BatteryDevicePath[Result - 1] := DevicePath;
  end;
  SetupDiDestroyDeviceInfoList(DeviceInfo);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  hLibrary: HMODULE;
  i, BatteryCount: Cardinal;
begin
  hLibrary := LoadLibrary('setupapi.dll');
  if hLibrary <> 0 then
  begin
    @SetupDiGetClassDevs := GetProcAddress(hLibrary, 'SetupDiGetClassDevsA');
    @SetupDiEnumDeviceInterfaces := GetProcAddress(hLibrary, 'SetupDiEnumDeviceInterfaces');
    @SetupDiGetDeviceInterfaceDetail := GetProcAddress(hLibrary, 'SetupDiGetDeviceInterfaceDetailA');
    @SetupDiDestroyDeviceInfoList := GetProcAddress(hLibrary, 'SetupDiDestroyDeviceInfoList');
  end;
  BatteryCount := EnumerateBatteries;
  if BatteryCount > 0 then
  begin
    for i := 0 to BatteryCount - 1 do
      ComboBox1.Items.Add(BatteryDevicePath[i]);
    ComboBox1.ItemIndex := 0;
  end;
  Button1.Click;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  Button1.Click;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i, hBattery: Cardinal;
  lpBytesReturned: DWORD;
  BQI: TBatteryQueryInformation;
  BI: TBatteryInformation;
  BS: TBatteryStatus;
  BMD: TBatteryManufactureDate;
  BWS: TBatteryWaitStatus;
  BRS: array[0..3] of BATTERY_REPORTING_SCALE;
  OutBuffer: PWideChar;
begin
  if EnumerateBatteries > 0 then
  begin
    hBattery := CreateFile(PAnsiChar(BatteryDevicePath[ComboBox1.ItemIndex]), GENERIC_READ or GENERIC_WRITE, FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
    DeviceIoControl(hBattery, IOCTL_BATTERY_QUERY_TAG, nil, 0, @i, SizeOf(Cardinal), lpBytesReturned, nil);
    ZeroMemory(@BQI, SizeOf(BATTERY_QUERY_INFORMATION));
    BQI.BatteryTag := i;
    BWS.BatteryTag := BQI.BatteryTag;
    BWS.Timeout := 1;
    BS.PowerState := 0;
    BS.Capacity := 0;
    DeviceIoControl(hBattery, IOCTL_BATTERY_QUERY_STATUS, @BWS, SizeOf(BWS), @BS, SizeOf(BS), lpBytesReturned, nil);
    Edit5.Text := '';
    if BS.PowerState and BATTERY_CHARGING = BATTERY_CHARGING then
      Edit5.Text := Edit5.Text + 'Charging, ';
    if BS.PowerState and BATTERY_CRITICAL = BATTERY_CRITICAL then
      Edit5.Text := (Edit5.Text + 'Critical, ');
    if BS.PowerState and BATTERY_DISCHARGING = BATTERY_DISCHARGING then
      Edit5.Text := (Edit5.Text + 'Discharging, ');
    if BS.PowerState and BATTERY_POWER_ON_LINE = BATTERY_POWER_ON_LINE then
      Edit5.Text := (Edit5.Text + 'Power On Line');
    Edit11.Text := IntToStr(BS.Capacity) + ' mWh';
    if BS.Voltage = $FFFFFFFF then
      Edit8.Text := IntToStr(0) + ' mV'
    else
      Edit8.Text := IntToStr(BS.Voltage) + ' mV';
    if BS.Rate = BATTERY_UNKNOWN_RATE then
      Edit14.Text := IntToStr(0) + ' mWh'
    else
      Edit14.Text := IntToStr(BS.Rate) + ' mWh';
    OutBuffer := AllocMem(MAX_PATH + 1);
    try
      BQI.InformationLevel := BatteryManufactureName;
      if DeviceIoControl(hBattery, IOCTL_BATTERY_QUERY_INFORMATION, @BQI, SizeOf(BATTERY_QUERY_INFORMATION), OutBuffer, 255, lpBytesReturned, nil) then
        Edit1.Text := WideCharToString(OutBuffer);
      BQI.InformationLevel := BatteryDeviceName;
      if DeviceIoControl(hBattery, IOCTL_BATTERY_QUERY_INFORMATION, @BQI, SizeOf(BATTERY_QUERY_INFORMATION), OutBuffer, 255, lpBytesReturned, nil) then
        Edit2.Text := WideCharToString(OutBuffer);
      BQI.InformationLevel := BatterySerialNumber;
      if DeviceIoControl(hBattery, IOCTL_BATTERY_QUERY_INFORMATION, @BQI, SizeOf(BATTERY_QUERY_INFORMATION), OutBuffer, 255, lpBytesReturned, nil) then
        Edit3.Text := WideCharToString(OutBuffer);
      BQI.InformationLevel := BatteryUniqueID;
      if DeviceIoControl(hBattery, IOCTL_BATTERY_QUERY_INFORMATION, @BQI, SizeOf(BATTERY_QUERY_INFORMATION), OutBuffer, 255, lpBytesReturned, nil) then
        Edit4.Text := WideCharToString(OutBuffer);
      for i := 0 to 3 do
      begin
        BRS[i].Granularity := 0;
        BRS[i].Capacity := 0;
      end;
      BQI.InformationLevel := BatteryGranularityInformation;
      if DeviceIoControl(hBattery, IOCTL_BATTERY_QUERY_INFORMATION, @BQI, SizeOf(BATTERY_QUERY_INFORMATION), @BRS, SizeOf(BRS), lpBytesReturned, nil) then
      begin
        Edit21.Text := IntToStr(BRS[0].Granularity) + ' mWh';
        Edit22.Text := IntToStr(BRS[1].Granularity) + ' mWh';
        Edit23.Text := IntToStr(BRS[2].Granularity) + ' mWh';
        Edit24.Text := IntToStr(BRS[3].Granularity) + ' mWh';
        Edit25.Text := IntToStr(BRS[0].Capacity) + ' mWh';
        Edit26.Text := IntToStr(BRS[1].Capacity) + ' mWh';
        Edit27.Text := IntToStr(BRS[2].Capacity) + ' mWh';
        Edit28.Text := IntToStr(BRS[3].Capacity) + ' mWh';
      end;
      BQI.InformationLevel := BatteryGranularityInformation;
      if DeviceIoControl(hBattery, IOCTL_BATTERY_QUERY_INFORMATION, @BQI, SizeOf(BATTERY_QUERY_INFORMATION), @BMD, SizeOf(BMD), lpBytesReturned, nil) then
        Edit16.Text := IntToStr(BMD.Day) + '.' + IntToStr(BMD.Month) + '.' + IntToStr(BMD.Year);
      BQI.InformationLevel := BatteryInformation;
      if DeviceIoControl(hBattery, IOCTL_BATTERY_QUERY_INFORMATION, @BQI, SizeOf(BATTERY_QUERY_INFORMATION), @BI, SizeOf(BI), lpBytesReturned, nil) then
      begin
        Edit6.Text := '';
        for i := 0 to 3 do
          Edit6.Text := Edit6.Text + Char(BI.Chemistry[i]);
        case BI.Technology of
          0: Edit7.Text := 'Non Rechargeable';
          1: Edit7.Text := 'Rechargeable';
        end;
        Edit13.Text := IntToStr(BI.DesignedCapacity) + ' mWh';
        Edit12.Text := IntToStr(BI.FullChargedCapacity) + ' mWh';
        if BI.CycleCount = 0 then
          Edit29.Text := 'Not supported'
        else
          Edit29.Text := IntToStr(BI.CycleCount);
        Edit18.Text := IntToStr(BI.DefaultAlert1) + ' mWh';
        Edit19.Text := IntToStr(BI.DefaultAlert2) + ' mWh';
        Edit20.Text := IntToStr(BI.CriticalBias) + ' mWh';
        Edit15.Text := '';
        if (BI.Capabilities and BATTERY_CAPACITY_RELATIVE) <> 0 then
          Edit15.Text := Edit15.Text + 'Capacity Relative';
        if (BI.Capabilities and BATTERY_IS_SHORT_TERM) <> 0 then
          Edit15.Text := Edit15.Text + 'Is Short Term';
        if (BI.Capabilities and BATTERY_SET_CHARGE_SUPPORTED) <> 0 then
          Edit15.Text := Edit15.Text + 'Set Charge Supported';
        if (BI.Capabilities and BATTERY_SET_DISCHARGE_SUPPORTED) <> 0 then
          Edit15.Text := Edit15.Text + 'Set Discharge Supported';
        if (BI.Capabilities and BATTERY_SYSTEM_BATTERY) <> 0 then
          Edit15.Text := Edit15.Text + 'System Battery';
      end;
      BQI.InformationLevel := BatteryEstimatedTime;
      if DeviceIoControl(hBattery, IOCTL_BATTERY_QUERY_INFORMATION, @BQI, SizeOf(BATTERY_QUERY_INFORMATION), @i, 255, lpBytesReturned, nil) then
        Edit10.Text := IntToStr(i); //в секундах
      //the battery's current temperature, in 10ths of a degree Kelvin
      //Round(Temperature/ 10 + 273.15)
      BQI.InformationLevel := BatteryTemperature;
      if DeviceIoControl(hBattery, IOCTL_BATTERY_QUERY_INFORMATION, @BQI, SizeOf(BATTERY_QUERY_INFORMATION), @i, 255, lpBytesReturned, nil) then
        if i <> 0 then
          Edit17.Text := IntToStr(i);
    finally
      FreeMem(OutBuffer);
    end;
    CloseHandle(hBattery);
  end;
end;

end.

