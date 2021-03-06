unit D3DProxy;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Direct3D9, Windows, D3DDevice9Proxy;

type
  PIDirect3D9 = ^IDirect3D9;


  Direct3D9Proxy = class(TInterfacedObject, IDirect3D9)
    private
      ptr_Direct3D9: IDirect3D9;

    public
      constructor Create(pOriginal: IDirect3D9);
      function QueryInterface(constref riid: TGuid; out ppvObj): HResult; stdcall;
      function _AddRef: LongInt; stdcall;
      function _Release: LongInt; stdcall;
      function RegisterSoftwareDevice(pInitializeFunction: Pointer): HResult; stdcall;
      function GetAdapterCount: LongWord; stdcall;
      function GetAdapterIdentifier(Adapter: LongWord; Flags: DWord; out pIdentifier: TD3DAdapterIdentifier9): HResult; stdcall;
      function GetAdapterModeCount(Adapter: LongWord; Format: TD3DFormat): LongWord; stdcall;
      function EnumAdapterModes(Adapter: LongWord; Format: TD3DFormat; Mode: LongWord; out pMode: TD3DDisplayMode): HResult; stdcall;
      function GetAdapterDisplayMode(Adapter: LongWord; out pMode: TD3DDisplayMode): HResult; stdcall;
      function CheckDeviceType(Adapter: LongWord; CheckType: TD3DDevType; AdapterFormat, BackBufferFormat: TD3DFormat; Windowed: BOOL): HResult; stdcall;
      function CheckDeviceFormat(Adapter: LongWord; DeviceType: TD3DDevType; AdapterFormat: TD3DFormat; Usage: DWord; RType: TD3DResourceType; CheckFormat: TD3DFormat): HResult; stdcall;
      function CheckDeviceMultiSampleType(Adapter: LongWord; DeviceType: TD3DDevType; SurfaceFormat: TD3DFormat; Windowed: BOOL; MultiSampleType: TD3DMultiSampleType; pQualityLevels: PDWORD): HResult; stdcall;
      function CheckDepthStencilMatch(Adapter: LongWord; DeviceType: TD3DDevType; AdapterFormat, RenderTargetFormat, DepthStencilFormat: TD3DFormat): HResult; stdcall;
      function CheckDeviceFormatConversion(Adapter: LongWord; DeviceType: TD3DDevType; SourceFormat, TargetFormat: TD3DFormat): HResult; stdcall;
      function GetDeviceCaps(Adapter: LongWord; DeviceType: TD3DDevType; out pCaps: TD3DCaps9): HResult; stdcall;
      function GetAdapterMonitor(Adapter: LongWord): HMONITOR; stdcall;
      function CreateDevice(Adapter: LongWord; DeviceType: TD3DDevType; hFocusWindow: HWND; BehaviorFlags: DWord; pPresentationParameters: PD3DPresentParameters; out ppReturnedDeviceInterface: IDirect3DDevice9): HResult; stdcall;
  end;

implementation

constructor Direct3D9Proxy.Create(pOriginal: IDirect3D9);
begin
  self.ptr_Direct3D9 := IDirect3D9(pOriginal);
end;

function Direct3D9Proxy.QueryInterface(constref riid: TGuid; out ppvObj): HResult; stdcall;
type
  PPointer = ^Pointer;
begin
  Result := ptr_Direct3D9.QueryInterface(riid, ppvObj);

  if (Result = S_OK) then
    PPointer(ppvObj)^ := self
  else
    PPointer(ppvObj)^ := nil;
end;

function Direct3D9Proxy._AddRef: LongInt; stdcall;
begin
  Result := ptr_Direct3D9._AddRef;
end;

function Direct3D9Proxy._Release: LongInt; stdcall;
begin
  Result := ptr_Direct3D9._Release;
  if (Result = 0) then
    Self.Destroy;
end;

function Direct3D9Proxy.RegisterSoftwareDevice(pInitializeFunction: Pointer): HResult; stdcall;
begin
  Result := ptr_Direct3D9.RegisterSoftwareDevice(pInitializeFunction);
end;

function Direct3D9Proxy.GetAdapterCount: LongWord; stdcall;
begin
  Result := ptr_Direct3D9.GetAdapterCount;
end;

function Direct3D9Proxy.GetAdapterIdentifier(Adapter: LongWord; Flags: DWord; out pIdentifier: TD3DAdapterIdentifier9): HResult; stdcall;
begin
  Result := ptr_Direct3D9.GetAdapterIdentifier(Adapter, Flags, pIdentifier);
end;

function Direct3D9Proxy.GetAdapterModeCount(Adapter: LongWord; Format: TD3DFormat): LongWord; stdcall;
begin
  Result := ptr_Direct3D9.GetAdapterModeCount(Adapter, Format);
end;

function Direct3D9Proxy.EnumAdapterModes(Adapter: LongWord; Format: TD3DFormat; Mode: LongWord; out pMode: TD3DDisplayMode): HResult; stdcall;
begin
  Result := ptr_Direct3D9.EnumAdapterModes(Adapter, Format, Mode, pMode);
end;

function Direct3D9Proxy.GetAdapterDisplayMode(Adapter: LongWord; out pMode: TD3DDisplayMode): HResult; stdcall;
begin
  Result := ptr_Direct3D9.GetAdapterDisplayMode(Adapter, pMode);
end;

function Direct3D9Proxy.CheckDeviceType(Adapter: LongWord; CheckType: TD3DDevType; AdapterFormat, BackBufferFormat: TD3DFormat; Windowed: BOOL): HResult; stdcall;
begin
  Result := ptr_Direct3D9.CheckDeviceType(Adapter, CheckType, AdapterFormat, BackBufferFormat, Windowed);
end;

function Direct3D9Proxy.CheckDeviceFormat(Adapter: LongWord; DeviceType: TD3DDevType; AdapterFormat: TD3DFormat; Usage: DWord; RType: TD3DResourceType; CheckFormat: TD3DFormat): HResult; stdcall;
begin
  Result := ptr_Direct3D9.CheckDeviceFormat(Adapter, DeviceType, AdapterFormat, Usage, RType, CheckFormat);
end;

function Direct3D9Proxy.CheckDeviceMultiSampleType(Adapter: LongWord; DeviceType: TD3DDevType; SurfaceFormat: TD3DFormat; Windowed: BOOL; MultiSampleType: TD3DMultiSampleType; pQualityLevels: PDWORD): HResult; stdcall;
begin
  Result := ptr_Direct3D9.CheckDeviceMultiSampleType(Adapter, DeviceType, SurfaceFormat, Windowed, MultiSampleType, pQualityLevels);
end;

function Direct3D9Proxy.CheckDepthStencilMatch(Adapter: LongWord; DeviceType: TD3DDevType; AdapterFormat, RenderTargetFormat, DepthStencilFormat: TD3DFormat): HResult; stdcall;
begin
  Result := ptr_Direct3D9.CheckDepthStencilMatch(Adapter, DeviceType, AdapterFormat, RenderTargetFormat, DepthStencilFormat);
end;

function Direct3D9Proxy.CheckDeviceFormatConversion(Adapter: LongWord; DeviceType: TD3DDevType; SourceFormat, TargetFormat: TD3DFormat): HResult; stdcall;
begin
  Result := ptr_Direct3D9.CheckDeviceFormatConversion(Adapter, DeviceType, SourceFormat, TargetFormat);
end;

function Direct3D9Proxy.GetDeviceCaps(Adapter: LongWord; DeviceType: TD3DDevType; out pCaps: TD3DCaps9): HResult; stdcall;
begin
  Result := ptr_Direct3D9.GetDeviceCaps(Adapter, DeviceType, pCaps);
end;

function Direct3D9Proxy.GetAdapterMonitor(Adapter: LongWord): HMONITOR; stdcall;
begin
  Result := ptr_Direct3D9.GetAdapterMonitor(Adapter);
end;

function Direct3D9Proxy.CreateDevice(Adapter: LongWord; DeviceType: TD3DDevType; hFocusWindow: HWND; BehaviorFlags: DWord; pPresentationParameters: PD3DPresentParameters; out ppReturnedDeviceInterface: IDirect3DDevice9): HResult; stdcall;
begin
  Result := IDirect3D9(ptr_Direct3D9).CreateDevice(Adapter, DeviceType, hFocusWindow, BehaviorFlags, pPresentationParameters, ppReturnedDeviceInterface);
  if (Result = S_OK) then
  begin
    ppReturnedDeviceInterface := IDirect3DDevice9(Direct3DDevice9Proxy.Create(ppReturnedDeviceInterface));
  end else
    ppReturnedDeviceInterface := nil;
end;

end.

