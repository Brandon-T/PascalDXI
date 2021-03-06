unit D3DDevice9Proxy;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Direct3D9, Windows, DXHooks;

type
  PIDirect3DDevice9 = ^IDirect3DDevice9;

  Direct3DDevice9Proxy = class(TInterfacedObject, IDirect3DDevice9)
    private
      ptr_Direct3DDevice9: IDirect3DDevice9;

    public
      constructor Create(pOriginal: IDirect3DDevice9);
      function QueryInterface(constref riid: TGuid; out ppvObj): HResult; stdcall;
      function _AddRef: LongInt; stdcall;
      function _Release: LongInt; stdcall;
      function TestCooperativeLevel: HResult; stdcall;
      function GetAvailableTextureMem: LongWord; stdcall;
      function EvictManagedResources: HResult; stdcall;
      function GetDirect3D(out ppD3D9: IDirect3D9): HResult; stdcall;
      function GetDeviceCaps(out pCaps: TD3DCaps9): HResult; stdcall;
      function GetDisplayMode(iSwapChain: LongWord; out pMode: TD3DDisplayMode): HResult; stdcall;
      function GetCreationParameters(out pParameters: TD3DDeviceCreationParameters): HResult; stdcall;
      function SetCursorProperties(XHotSpot, YHotSpot: LongWord; pCursorBitmap: IDirect3DSurface9): HResult; stdcall;
      procedure SetCursorPosition(XScreenSpace, YScreenSpace: LongWord; Flags: DWord); stdcall;
      function ShowCursor(bShow: BOOL): BOOL; stdcall;
      function CreateAdditionalSwapChain(const pPresentationParameters: TD3DPresentParameters; out pSwapChain: IDirect3DSwapChain9): HResult; stdcall;
      function GetSwapChain(iSwapChain: LongWord; out pSwapChain: IDirect3DSwapChain9): HResult; stdcall;
      function GetNumberOfSwapChains: LongWord; stdcall;
      function Reset(const pPresentationParameters: TD3DPresentParameters): HResult; stdcall;
      function Present(pSourceRect, pDestRect: PRect; hDestWindowOverride: HWND; pDirtyRegion: PRgnData): HResult; stdcall;
      function GetBackBuffer(iSwapChain: LongWord; iBackBuffer: LongWord; _Type: TD3DBackBufferType; out ppBackBuffer: IDirect3DSurface9): HResult; stdcall;
      function GetRasterStatus(iSwapChain: LongWord; out pRasterStatus: TD3DRasterStatus): HResult; stdcall;
      function SetDialogBoxMode(bEnableDialogs: BOOL): HResult; stdcall;
      procedure SetGammaRamp(iSwapChain: LongWord; Flags: DWord; const pRamp: TD3DGammaRamp); stdcall;
      procedure GetGammaRamp(iSwapChain: LongWord; out pRamp: TD3DGammaRamp); stdcall;
      function CreateTexture(Width, Height, Levels: LongWord; Usage: DWord; Format: TD3DFormat; Pool: TD3DPool; out ppTexture: IDirect3DTexture9; pSharedHandle: PHandle): HResult; stdcall;
      function CreateVolumeTexture(Width, Height, Depth, Levels: LongWord; Usage: DWord; Format: TD3DFormat; Pool: TD3DPool; out ppVolumeTexture: IDirect3DVolumeTexture9; pSharedHandle: PHandle): HResult; stdcall;
      function CreateCubeTexture(EdgeLength, Levels: LongWord; Usage: DWord; Format: TD3DFormat; Pool: TD3DPool; out ppCubeTexture: IDirect3DCubeTexture9; pSharedHandle: PHandle): HResult; stdcall;
      function CreateVertexBuffer(Length: LongWord; Usage, FVF: DWord; Pool: TD3DPool; out ppVertexBuffer: IDirect3DVertexBuffer9; pSharedHandle: PHandle): HResult; stdcall;
      function CreateIndexBuffer(Length: LongWord; Usage: DWord; Format: TD3DFormat; Pool: TD3DPool; out ppIndexBuffer: IDirect3DIndexBuffer9; pSharedHandle: PHandle): HResult; stdcall;
      function CreateRenderTarget(Width, Height: LongWord; Format: TD3DFormat; MultiSample: TD3DMultiSampleType; MultisampleQuality: DWORD; Lockable: BOOL; out ppSurface: IDirect3DSurface9; pSharedHandle: PHandle): HResult; stdcall;
      function CreateDepthStencilSurface(Width, Height: LongWord; Format: TD3DFormat; MultiSample: TD3DMultiSampleType; MultisampleQuality: DWORD; Discard: BOOL; out ppSurface: IDirect3DSurface9; pSharedHandle: PHandle): HResult; stdcall;
      function UpdateSurface(pSourceSurface: IDirect3DSurface9; pSourceRect: PRect; pDestinationSurface: IDirect3DSurface9; pDestPoint: PPoint): HResult; stdcall;
      function UpdateTexture(pSourceTexture, pDestinationTexture: IDirect3DBaseTexture9): HResult; stdcall;
      function GetRenderTargetData(pRenderTarget, pDestSurface: IDirect3DSurface9): HResult; stdcall;
      function GetFrontBufferData(iSwapChain: LongWord; pDestSurface: IDirect3DSurface9): HResult; stdcall;
      function StretchRect(pSourceSurface: IDirect3DSurface9; pSourceRect: PRect; pDestSurface: IDirect3DSurface9; pDestRect: PRect; Filter: TD3DTextureFilterType): HResult; stdcall;
      function ColorFill(pSurface: IDirect3DSurface9; pRect: PRect; color: TD3DColor): HResult; stdcall;
      function CreateOffscreenPlainSurface(Width, Height: LongWord; Format: TD3DFormat; Pool: TD3DPool; out ppSurface: IDirect3DSurface9; pSharedHandle: PHandle): HResult; stdcall;
      function SetRenderTarget(RenderTargetIndex: DWORD; pRenderTarget: IDirect3DSurface9): HResult; stdcall;
      function GetRenderTarget(RenderTargetIndex: DWORD; out ppRenderTarget: IDirect3DSurface9): HResult; stdcall;
      function SetDepthStencilSurface(pNewZStencil: IDirect3DSurface9): HResult; stdcall;
      function GetDepthStencilSurface(out ppZStencilSurface: IDirect3DSurface9): HResult; stdcall;
      function BeginScene: HResult; stdcall;
      function EndScene: HResult; stdcall;
      function Clear(Count: DWord; pRects: PD3DRect; Flags: DWord; Color: TD3DColor; Z: Single; Stencil: DWord): HResult; stdcall;
      function SetTransform(State: TD3DTransformStateType; const pMatrix: TD3DMatrix): HResult; stdcall;
      function GetTransform(State: TD3DTransformStateType; out pMatrix: TD3DMatrix): HResult; stdcall;
      function MultiplyTransform(State: TD3DTransformStateType; const pMatrix: TD3DMatrix): HResult; stdcall;
      function SetViewport(const pViewport: TD3DViewport9): HResult; stdcall;
      function GetViewport(out pViewport: TD3DViewport9): HResult; stdcall;
      function SetMaterial(const pMaterial: TD3DMaterial9): HResult; stdcall;
      function GetMaterial(out pMaterial: TD3DMaterial9): HResult; stdcall;
      function SetLight(Index: DWord; const pLight: TD3DLight9): HResult; stdcall;
      function GetLight(Index: DWord; out pLight: TD3DLight9): HResult; stdcall;
      function LightEnable(Index: DWord; Enable: BOOL): HResult; stdcall;
      function GetLightEnable(Index: DWord; out pEnable: BOOL): HResult; stdcall;
      function SetClipPlane(Index: DWord; pPlane: PSingle): HResult; stdcall;
      function GetClipPlane(Index: DWord; pPlane: PSingle): HResult; stdcall;
      function SetRenderState(State: TD3DRenderStateType; Value: DWord): HResult; stdcall;
      function GetRenderState(State: TD3DRenderStateType; out pValue: DWord): HResult; stdcall;
      function CreateStateBlock(_Type: TD3DStateBlockType; out ppSB: IDirect3DStateBlock9): HResult; stdcall;
      function BeginStateBlock: HResult; stdcall;
      function EndStateBlock(out ppSB: IDirect3DStateBlock9): HResult; stdcall;
      function SetClipStatus(const pClipStatus: TD3DClipStatus9): HResult; stdcall;
      function GetClipStatus(out pClipStatus: TD3DClipStatus9): HResult; stdcall;
      function GetTexture(Stage: DWord; out ppTexture: IDirect3DBaseTexture9): HResult; stdcall;
      function SetTexture(Stage: DWord; pTexture: IDirect3DBaseTexture9): HResult; stdcall;
      function GetTextureStageState(Stage: DWord; _Type: TD3DTextureStageStateType; out pValue: DWord): HResult; stdcall;
      function SetTextureStageState(Stage: DWord; _Type: TD3DTextureStageStateType; Value: DWord): HResult; stdcall;
      function GetSamplerState(Sampler: DWORD; _Type: TD3DSamplerStateType; out pValue: DWORD): HResult; stdcall;
      function SetSamplerState(Sampler: DWORD; _Type: TD3DSamplerStateType; Value: DWORD): HResult; stdcall;
      function ValidateDevice(out pNumPasses: DWord): HResult; stdcall;
      function SetPaletteEntries(PaletteNumber: LongWord; pEntries: pPaletteEntry): HResult; stdcall;
      function GetPaletteEntries(PaletteNumber: LongWord; pEntries: pPaletteEntry): HResult; stdcall;
      function SetCurrentTexturePalette(PaletteNumber: LongWord): HResult; stdcall;
      function GetCurrentTexturePalette(out PaletteNumber: LongWord): HResult; stdcall;
      function SetScissorRect(pRect: PRect): HResult; stdcall;
      function GetScissorRect(out pRect: TRect): HResult; stdcall;
      function SetSoftwareVertexProcessing(bSoftware: BOOL): HResult; stdcall;
      function GetSoftwareVertexProcessing: BOOL; stdcall;
      function SetNPatchMode(nSegments: Single): HResult; stdcall;
      function GetNPatchMode: Single; stdcall;
      function DrawPrimitive(PrimitiveType: TD3DPrimitiveType; StartVertex, PrimitiveCount: LongWord): HResult; stdcall;
      function DrawIndexedPrimitive(_Type: TD3DPrimitiveType; BaseVertexIndex: Integer; MinVertexIndex, NumVertices, startIndex, primCount: LongWord): HResult; stdcall;
      function DrawPrimitiveUP(PrimitiveType: TD3DPrimitiveType; PrimitiveCount: LongWord; const pVertexStreamZeroData; VertexStreamZeroStride: LongWord): HResult; stdcall;
      function DrawIndexedPrimitiveUP(PrimitiveType: TD3DPrimitiveType; MinVertexIndex, NumVertice, PrimitiveCount: LongWord; const pIndexData; IndexDataFormat: TD3DFormat; const pVertexStreamZeroData; VertexStreamZeroStride: LongWord): HResult; stdcall;
      function ProcessVertices(SrcStartIndex, DestIndex, VertexCount: LongWord; pDestBuffer: IDirect3DVertexBuffer9; pVertexDecl: IDirect3DVertexDeclaration9; Flags: DWord): HResult; stdcall;
      function CreateVertexDeclaration(pVertexElements: PD3DVertexElement9; out ppDecl: IDirect3DVertexDeclaration9): HResult; stdcall;
      function SetVertexDeclaration(pDecl: IDirect3DVertexDeclaration9): HResult; stdcall;
      function GetVertexDeclaration(out ppDecl: IDirect3DVertexDeclaration9): HResult; stdcall;
      function SetFVF(FVF: DWORD): HResult; stdcall;
      function GetFVF(out FVF: DWORD): HResult; stdcall;
      function CreateVertexShader(pFunction: PDWord; out ppShader: IDirect3DVertexShader9): HResult; stdcall;
      function SetVertexShader(pShader: IDirect3DVertexShader9): HResult; stdcall;
      function GetVertexShader(out ppShader: IDirect3DVertexShader9): HResult; stdcall;
      function SetVertexShaderConstantF(StartRegister: LongWord; pConstantData: PSingle; Vector4fCount: LongWord): HResult; stdcall;
      function GetVertexShaderConstantF(StartRegister: LongWord; pConstantData: PSingle; Vector4fCount: LongWord): HResult; stdcall;
      function SetVertexShaderConstantI(StartRegister: LongWord; pConstantData: PInteger; Vector4iCount: LongWord): HResult; stdcall;
      function GetVertexShaderConstantI(StartRegister: LongWord; pConstantData: PInteger; Vector4iCount: LongWord): HResult; stdcall;
      function SetVertexShaderConstantB(StartRegister: LongWord; pConstantData: PBOOL; BoolCount: LongWord): HResult; stdcall;
      function GetVertexShaderConstantB(StartRegister: LongWord; pConstantData: PBOOL; BoolCount: LongWord): HResult; stdcall;
      function SetStreamSource(StreamNumber: LongWord; pStreamData: IDirect3DVertexBuffer9; OffsetInBytes, Stride: LongWord): HResult; stdcall;
      function GetStreamSource(StreamNumber: LongWord; out ppStreamData: IDirect3DVertexBuffer9; out pOffsetInBytes, pStride: LongWord): HResult; stdcall;
      function SetStreamSourceFreq(StreamNumber: LongWord; Setting: LongWord): HResult; stdcall;
      function GetStreamSourceFreq(StreamNumber: LongWord; out Setting: LongWord): HResult; stdcall;
      function SetIndices(pIndexData: IDirect3DIndexBuffer9): HResult; stdcall;
      function GetIndices(out ppIndexData: IDirect3DIndexBuffer9): HResult; stdcall;
      function CreatePixelShader(pFunction: PDWord; out ppShader: IDirect3DPixelShader9): HResult; stdcall;
      function SetPixelShader(pShader: IDirect3DPixelShader9): HResult; stdcall;
      function GetPixelShader(out ppShader: IDirect3DPixelShader9): HResult; stdcall;
      function SetPixelShaderConstantF(StartRegister: LongWord; pConstantData: PSingle; Vector4fCount: LongWord): HResult; stdcall;
      function GetPixelShaderConstantF(StartRegister: LongWord; pConstantData: PSingle; Vector4fCount: LongWord): HResult; stdcall;
      function SetPixelShaderConstantI(StartRegister: LongWord; pConstantData: PInteger; Vector4iCount: LongWord): HResult; stdcall;
      function GetPixelShaderConstantI(StartRegister: LongWord; pConstantData: PInteger; Vector4iCount: LongWord): HResult; stdcall;
      function SetPixelShaderConstantB(StartRegister: LongWord; pConstantData: PBOOL; BoolCount: LongWord): HResult; stdcall;
      function GetPixelShaderConstantB(StartRegister: LongWord; pConstantData: PBOOL; BoolCount: LongWord): HResult; stdcall;
      function DrawRectPatch(Handle: LongWord; pNumSegs: PSingle; pTriPatchInfo: PD3DRectPatchInfo): HResult; stdcall;
      function DrawTriPatch(Handle: LongWord; pNumSegs: PSingle; pTriPatchInfo: PD3DTriPatchInfo): HResult; stdcall;
      function DeletePatch(Handle: LongWord): HResult; stdcall;
      function CreateQuery(_Type: TD3DQueryType; out ppQuery: IDirect3DQuery9): HResult; stdcall;
  end;

implementation



constructor Direct3DDevice9Proxy.Create(pOriginal: IDirect3DDevice9);
begin
  self.ptr_Direct3DDevice9 := IDirect3DDevice9(pOriginal);
end;

function Direct3DDevice9Proxy.QueryInterface(constref riid: TGuid; out ppvObj): HResult; stdcall;
type
  PPointer = ^Pointer;
begin
  Result := ptr_Direct3DDevice9.QueryInterface(riid, ppvObj);

  if (Result = S_OK) then
    PPointer(ppvObj)^ := @self
  else
    PPointer(ppvObj)^ := nil;
end;

function Direct3DDevice9Proxy._AddRef: LongInt; stdcall;
begin
  Result := ptr_Direct3DDevice9._AddRef();
end;

function Direct3DDevice9Proxy._Release: LongInt; stdcall;
begin
  Result := ptr_Direct3DDevice9._Release();
  if (Result = 0) then
    Self.Destroy;
end;

function Direct3DDevice9Proxy.TestCooperativeLevel: HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.TestCooperativeLevel;
end;

function Direct3DDevice9Proxy.GetAvailableTextureMem: LongWord; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetAvailableTextureMem;
end;

function Direct3DDevice9Proxy.EvictManagedResources: HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.EvictManagedResources;
end;

function Direct3DDevice9Proxy.GetDirect3D(out ppD3D9: IDirect3D9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetDirect3D(ppD3D9);
end;

function Direct3DDevice9Proxy.GetDeviceCaps(out pCaps: TD3DCaps9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetDeviceCaps(pCaps);
end;

function Direct3DDevice9Proxy.GetDisplayMode(iSwapChain: LongWord; out pMode: TD3DDisplayMode): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetDisplayMode(iSwapChain, pMode);
end;

function Direct3DDevice9Proxy.GetCreationParameters(out pParameters: TD3DDeviceCreationParameters): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetCreationParameters(pParameters);
end;

function Direct3DDevice9Proxy.SetCursorProperties(XHotSpot, YHotSpot: LongWord; pCursorBitmap: IDirect3DSurface9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetCursorProperties(XHotSpot, YHotSpot, pCursorBitmap);
end;

procedure Direct3DDevice9Proxy.SetCursorPosition(XScreenSpace, YScreenSpace: LongWord; Flags: DWord); stdcall;
begin
  ptr_Direct3DDevice9.SetCursorPosition(XScreenSpace, YScreenSpace, Flags);
end;

function Direct3DDevice9Proxy.ShowCursor(bShow: BOOL): BOOL; stdcall;
begin
  Result := ptr_Direct3DDevice9.ShowCursor(bShow);
end;

function Direct3DDevice9Proxy.CreateAdditionalSwapChain(const pPresentationParameters: TD3DPresentParameters; out pSwapChain: IDirect3DSwapChain9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.CreateAdditionalSwapChain(pPresentationParameters, pSwapChain);
end;

function Direct3DDevice9Proxy.GetSwapChain(iSwapChain: LongWord; out pSwapChain: IDirect3DSwapChain9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetSwapChain(iSwapChain, pSwapChain);
end;

function Direct3DDevice9Proxy.GetNumberOfSwapChains: LongWord; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetNumberOfSwapChains;
end;

function Direct3DDevice9Proxy.Reset(const pPresentationParameters: TD3DPresentParameters): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.Reset(pPresentationParameters);
end;

function Direct3DDevice9Proxy.Present(pSourceRect, pDestRect: PRect; hDestWindowOverride: HWND; pDirtyRegion: PRgnData): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.Present(pSourceRect, pDestRect, hDestWindowOverride, pDirtyRegion);
end;

function Direct3DDevice9Proxy.GetBackBuffer(iSwapChain: LongWord; iBackBuffer: LongWord; _Type: TD3DBackBufferType; out ppBackBuffer: IDirect3DSurface9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetBackBuffer(iSwapChain, iBackBuffer, _Type, ppBackBuffer);
end;

function Direct3DDevice9Proxy.GetRasterStatus(iSwapChain: LongWord; out pRasterStatus: TD3DRasterStatus): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetRasterStatus(iSwapChain, pRasterStatus);
end;

function Direct3DDevice9Proxy.SetDialogBoxMode(bEnableDialogs: BOOL): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetDialogBoxMode(bEnableDialogs);
end;

procedure Direct3DDevice9Proxy.SetGammaRamp(iSwapChain: LongWord; Flags: DWord; const pRamp: TD3DGammaRamp); stdcall;
begin
  ptr_Direct3DDevice9.SetGammaRamp(iSwapChain, Flags, pRamp);
end;

procedure Direct3DDevice9Proxy.GetGammaRamp(iSwapChain: LongWord; out pRamp: TD3DGammaRamp); stdcall;
begin
  ptr_Direct3DDevice9.GetGammaRamp(iSwapChain, pRamp);
end;

function Direct3DDevice9Proxy.CreateTexture(Width, Height, Levels: LongWord; Usage: DWord; Format: TD3DFormat; Pool: TD3DPool; out ppTexture: IDirect3DTexture9; pSharedHandle: PHandle): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.CreateTexture(Width, Height, Levels, Usage, Format, Pool, ppTexture, pSharedHandle);
end;

function Direct3DDevice9Proxy.CreateVolumeTexture(Width, Height, Depth, Levels: LongWord; Usage: DWord; Format: TD3DFormat; Pool: TD3DPool; out ppVolumeTexture: IDirect3DVolumeTexture9; pSharedHandle: PHandle): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.CreateVolumeTexture(Width, Height, Depth, Levels, Usage, Format, Pool, ppVolumeTexture, pSharedHandle);
end;

function Direct3DDevice9Proxy.CreateCubeTexture(EdgeLength, Levels: LongWord; Usage: DWord; Format: TD3DFormat; Pool: TD3DPool; out ppCubeTexture: IDirect3DCubeTexture9; pSharedHandle: PHandle): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.CreateCubeTexture(EdgeLength, Levels, Usage, Format, Pool, ppCubeTexture, pSharedHandle);
end;

function Direct3DDevice9Proxy.CreateVertexBuffer(Length: LongWord; Usage, FVF: DWord; Pool: TD3DPool; out ppVertexBuffer: IDirect3DVertexBuffer9; pSharedHandle: PHandle): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.CreateVertexBuffer(Length, Usage, FVF, Pool, ppVertexBuffer, pSharedHandle);
end;

function Direct3DDevice9Proxy.CreateIndexBuffer(Length: LongWord; Usage: DWord; Format: TD3DFormat; Pool: TD3DPool; out ppIndexBuffer: IDirect3DIndexBuffer9; pSharedHandle: PHandle): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.CreateIndexBuffer(Length, Usage, Format, Pool, ppIndexBuffer, pSharedHandle);
end;

function Direct3DDevice9Proxy.CreateRenderTarget(Width, Height: LongWord; Format: TD3DFormat; MultiSample: TD3DMultiSampleType; MultisampleQuality: DWORD; Lockable: BOOL; out ppSurface: IDirect3DSurface9; pSharedHandle: PHandle): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.CreateRenderTarget(Width, Height, Format, MultiSample, MultisampleQuality, Lockable, ppSurface, pSharedHandle);
end;

function Direct3DDevice9Proxy.CreateDepthStencilSurface(Width, Height: LongWord; Format: TD3DFormat; MultiSample: TD3DMultiSampleType; MultisampleQuality: DWORD; Discard: BOOL; out ppSurface: IDirect3DSurface9; pSharedHandle: PHandle): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.CreateDepthStencilSurface(Width, Height, Format, MultiSample, MultisampleQuality, Discard, ppSurface, pSharedHandle);
end;

function Direct3DDevice9Proxy.UpdateSurface(pSourceSurface: IDirect3DSurface9; pSourceRect: PRect; pDestinationSurface: IDirect3DSurface9; pDestPoint: PPoint): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.UpdateSurface(pSourceSurface, pSourceRect, pDestinationSurface, pDestPoint);
end;

function Direct3DDevice9Proxy.UpdateTexture(pSourceTexture, pDestinationTexture: IDirect3DBaseTexture9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.UpdateTexture(pSourceTexture, pDestinationTexture);
end;

function Direct3DDevice9Proxy.GetRenderTargetData(pRenderTarget, pDestSurface: IDirect3DSurface9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetRenderTargetData(pRenderTarget, pDestSurface);
end;

function Direct3DDevice9Proxy.GetFrontBufferData(iSwapChain: LongWord; pDestSurface: IDirect3DSurface9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetFrontBufferData(iSwapChain, pDestSurface);
end;

function Direct3DDevice9Proxy.StretchRect(pSourceSurface: IDirect3DSurface9; pSourceRect: PRect; pDestSurface: IDirect3DSurface9; pDestRect: PRect; Filter: TD3DTextureFilterType): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.StretchRect(pSourceSurface, pSourceRect, pDestSurface, pDestRect, Filter);
end;

function Direct3DDevice9Proxy.ColorFill(pSurface: IDirect3DSurface9; pRect: PRect; color: TD3DColor): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.ColorFill(pSurface, pRect, color);
end;

function Direct3DDevice9Proxy.CreateOffscreenPlainSurface(Width, Height: LongWord; Format: TD3DFormat; Pool: TD3DPool; out ppSurface: IDirect3DSurface9; pSharedHandle: PHandle): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.CreateOffscreenPlainSurface(Width, Height, Format, Pool, ppSurface, pSharedHandle);
end;

function Direct3DDevice9Proxy.SetRenderTarget(RenderTargetIndex: DWORD; pRenderTarget: IDirect3DSurface9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetRenderTarget(RenderTargetIndex, pRenderTarget);
end;

function Direct3DDevice9Proxy.GetRenderTarget(RenderTargetIndex: DWORD; out ppRenderTarget: IDirect3DSurface9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetRenderTarget(RenderTargetIndex, ppRenderTarget);
end;

function Direct3DDevice9Proxy.SetDepthStencilSurface(pNewZStencil: IDirect3DSurface9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetDepthStencilSurface(pNewZStencil);
end;

function Direct3DDevice9Proxy.GetDepthStencilSurface(out ppZStencilSurface: IDirect3DSurface9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetDepthStencilSurface(ppZStencilSurface);
end;

function Direct3DDevice9Proxy.BeginScene: HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.BeginScene;
end;

function Direct3DDevice9Proxy.EndScene: HResult; stdcall;
begin
  EndSceneHook(ptr_Direct3DDevice9);
  Result := ptr_Direct3DDevice9.EndScene;
end;

function Direct3DDevice9Proxy.Clear(Count: DWord; pRects: PD3DRect; Flags: DWord; Color: TD3DColor; Z: Single; Stencil: DWord): HResult; stdcall;
begin
  Result := IDirect3DDevice9(ptr_Direct3DDevice9).Clear(Count, pRects, Flags, Color, Z, Stencil);
end;

function Direct3DDevice9Proxy.SetTransform(State: TD3DTransformStateType; const pMatrix: TD3DMatrix): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetTransform(State, pMatrix);
end;

function Direct3DDevice9Proxy.GetTransform(State: TD3DTransformStateType; out pMatrix: TD3DMatrix): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetTransform(State, pMatrix);
end;

function Direct3DDevice9Proxy.MultiplyTransform(State: TD3DTransformStateType; const pMatrix: TD3DMatrix): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.MultiplyTransform(State, pMatrix);
end;

function Direct3DDevice9Proxy.SetViewport(const pViewport: TD3DViewport9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetViewport(pViewport);
end;

function Direct3DDevice9Proxy.GetViewport(out pViewport: TD3DViewport9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetViewport(pViewport);
end;

function Direct3DDevice9Proxy.SetMaterial(const pMaterial: TD3DMaterial9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetMaterial(pMaterial);
end;

function Direct3DDevice9Proxy.GetMaterial(out pMaterial: TD3DMaterial9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetMaterial(pMaterial);
end;

function Direct3DDevice9Proxy.SetLight(Index: DWord; const pLight: TD3DLight9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetLight(Index, pLight);
end;

function Direct3DDevice9Proxy.GetLight(Index: DWord; out pLight: TD3DLight9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetLight(Index, pLight);
end;

function Direct3DDevice9Proxy.LightEnable(Index: DWord; Enable: BOOL): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.LightEnable(Index, Enable);
end;

function Direct3DDevice9Proxy.GetLightEnable(Index: DWord; out pEnable: BOOL): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetLightEnable(Index, pEnable);
end;

function Direct3DDevice9Proxy.SetClipPlane(Index: DWord; pPlane: PSingle): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetClipPlane(Index, pPlane);
end;

function Direct3DDevice9Proxy.GetClipPlane(Index: DWord; pPlane: PSingle): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetClipPlane(Index, pPlane);
end;

function Direct3DDevice9Proxy.SetRenderState(State: TD3DRenderStateType; Value: DWord): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetRenderState(State, Value);
end;

function Direct3DDevice9Proxy.GetRenderState(State: TD3DRenderStateType; out pValue: DWord): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetRenderState(State, pValue);
end;

function Direct3DDevice9Proxy.CreateStateBlock(_Type: TD3DStateBlockType; out ppSB: IDirect3DStateBlock9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.CreateStateBlock(_Type, ppSB);
end;

function Direct3DDevice9Proxy.BeginStateBlock: HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.BeginStateBlock;
end;

function Direct3DDevice9Proxy.EndStateBlock(out ppSB: IDirect3DStateBlock9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.EndStateBlock(ppSB);
end;

function Direct3DDevice9Proxy.SetClipStatus(const pClipStatus: TD3DClipStatus9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetClipStatus(pClipStatus);
end;

function Direct3DDevice9Proxy.GetClipStatus(out pClipStatus: TD3DClipStatus9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetClipStatus(pClipStatus);
end;

function Direct3DDevice9Proxy.GetTexture(Stage: DWord; out ppTexture: IDirect3DBaseTexture9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetTexture(Stage, ppTexture);
end;

function Direct3DDevice9Proxy.SetTexture(Stage: DWord; pTexture: IDirect3DBaseTexture9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetTexture(Stage, pTexture);
end;

function Direct3DDevice9Proxy.GetTextureStageState(Stage: DWord; _Type: TD3DTextureStageStateType; out pValue: DWord): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetTextureStageState(Stage, _Type, pValue);
end;

function Direct3DDevice9Proxy.SetTextureStageState(Stage: DWord; _Type: TD3DTextureStageStateType; Value: DWord): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetTextureStageState(Stage, _Type, Value);
end;

function Direct3DDevice9Proxy.GetSamplerState(Sampler: DWORD; _Type: TD3DSamplerStateType; out pValue: DWORD): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetSamplerState(Sampler, _Type, pValue);
end;

function Direct3DDevice9Proxy.SetSamplerState(Sampler: DWORD; _Type: TD3DSamplerStateType; Value: DWORD): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetSamplerState(Sampler, _Type, Value);
end;

function Direct3DDevice9Proxy.ValidateDevice(out pNumPasses: DWord): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.ValidateDevice(pNumPasses);
end;

function Direct3DDevice9Proxy.SetPaletteEntries(PaletteNumber: LongWord; pEntries: pPaletteEntry): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetPaletteEntries(PaletteNumber, pEntries);
end;

function Direct3DDevice9Proxy.GetPaletteEntries(PaletteNumber: LongWord; pEntries: pPaletteEntry): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetPaletteEntries(PaletteNumber, pEntries);
end;

function Direct3DDevice9Proxy.SetCurrentTexturePalette(PaletteNumber: LongWord): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetCurrentTexturePalette(PaletteNumber);
end;

function Direct3DDevice9Proxy.GetCurrentTexturePalette(out PaletteNumber: LongWord): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetCurrentTexturePalette(PaletteNumber);
end;

function Direct3DDevice9Proxy.SetScissorRect(pRect: PRect): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetScissorRect(pRect);
end;

function Direct3DDevice9Proxy.GetScissorRect(out pRect: TRect): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetScissorRect(pRect);
end;

function Direct3DDevice9Proxy.SetSoftwareVertexProcessing(bSoftware: BOOL): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetSoftwareVertexProcessing(bSoftware);
end;

function Direct3DDevice9Proxy.GetSoftwareVertexProcessing: BOOL; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetSoftwareVertexProcessing;
end;

function Direct3DDevice9Proxy.SetNPatchMode(nSegments: Single): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetNPatchMode(nSegments);
end;

function Direct3DDevice9Proxy.GetNPatchMode: Single; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetNPatchMode;
end;

function Direct3DDevice9Proxy.DrawPrimitive(PrimitiveType: TD3DPrimitiveType; StartVertex, PrimitiveCount: LongWord): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.DrawPrimitive(PrimitiveType, StartVertex, PrimitiveCount);
end;

function Direct3DDevice9Proxy.DrawIndexedPrimitive(_Type: TD3DPrimitiveType; BaseVertexIndex: Integer; MinVertexIndex, NumVertices, startIndex, primCount: LongWord): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.DrawIndexedPrimitive(_Type, BaseVertexIndex, MinVertexIndex, NumVertices, startIndex, primCount);
end;

function Direct3DDevice9Proxy.DrawPrimitiveUP(PrimitiveType: TD3DPrimitiveType; PrimitiveCount: LongWord; const pVertexStreamZeroData; VertexStreamZeroStride: LongWord): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.DrawPrimitiveUP(PrimitiveType, PrimitiveCount, pVertexStreamZeroData, VertexStreamZeroStride);
end;

function Direct3DDevice9Proxy.DrawIndexedPrimitiveUP(PrimitiveType: TD3DPrimitiveType; MinVertexIndex, NumVertice, PrimitiveCount: LongWord; const pIndexData; IndexDataFormat: TD3DFormat; const pVertexStreamZeroData; VertexStreamZeroStride: LongWord): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.DrawIndexedPrimitiveUP(PrimitiveType, MinVertexIndex, NumVertice, PrimitiveCount, pIndexData, IndexDataFormat, pVertexStreamZeroData, VertexStreamZeroStride);
end;

function Direct3DDevice9Proxy.ProcessVertices(SrcStartIndex, DestIndex, VertexCount: LongWord; pDestBuffer: IDirect3DVertexBuffer9; pVertexDecl: IDirect3DVertexDeclaration9; Flags: DWord): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.ProcessVertices(SrcStartIndex, DestIndex, VertexCount, pDestBuffer, pVertexDecl, Flags);
end;

function Direct3DDevice9Proxy.CreateVertexDeclaration(pVertexElements: PD3DVertexElement9; out ppDecl: IDirect3DVertexDeclaration9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.CreateVertexDeclaration(pVertexElements, ppDecl);
end;

function Direct3DDevice9Proxy.SetVertexDeclaration(pDecl: IDirect3DVertexDeclaration9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetVertexDeclaration(pDecl);
end;

function Direct3DDevice9Proxy.GetVertexDeclaration(out ppDecl: IDirect3DVertexDeclaration9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetVertexDeclaration(ppDecl);
end;

function Direct3DDevice9Proxy.SetFVF(FVF: DWORD): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetFVF(FVF);
end;

function Direct3DDevice9Proxy.GetFVF(out FVF: DWORD): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetFVF(FVF);
end;

function Direct3DDevice9Proxy.CreateVertexShader(pFunction: PDWord; out ppShader: IDirect3DVertexShader9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.CreateVertexShader(pFunction, ppShader);
end;

function Direct3DDevice9Proxy.SetVertexShader(pShader: IDirect3DVertexShader9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetVertexShader(pShader);
end;

function Direct3DDevice9Proxy.GetVertexShader(out ppShader: IDirect3DVertexShader9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetVertexShader(ppShader);
end;

function Direct3DDevice9Proxy.SetVertexShaderConstantF(StartRegister: LongWord; pConstantData: PSingle; Vector4fCount: LongWord): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetVertexShaderConstantF(StartRegister, pConstantData, Vector4fCount);
end;

function Direct3DDevice9Proxy.GetVertexShaderConstantF(StartRegister: LongWord; pConstantData: PSingle; Vector4fCount: LongWord): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetVertexShaderConstantF(StartRegister, pConstantData, Vector4fCount);
end;

function Direct3DDevice9Proxy.SetVertexShaderConstantI(StartRegister: LongWord; pConstantData: PInteger; Vector4iCount: LongWord): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetVertexShaderConstantI(StartRegister, pConstantData, Vector4iCount);
end;

function Direct3DDevice9Proxy.GetVertexShaderConstantI(StartRegister: LongWord; pConstantData: PInteger; Vector4iCount: LongWord): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetVertexShaderConstantI(StartRegister, pConstantData, Vector4iCount);
end;

function Direct3DDevice9Proxy.SetVertexShaderConstantB(StartRegister: LongWord; pConstantData: PBOOL; BoolCount: LongWord): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetVertexShaderConstantB(StartRegister, pConstantData, BoolCount);
end;

function Direct3DDevice9Proxy.GetVertexShaderConstantB(StartRegister: LongWord; pConstantData: PBOOL; BoolCount: LongWord): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetVertexShaderConstantB(StartRegister, pConstantData, BoolCount);
end;

function Direct3DDevice9Proxy.SetStreamSource(StreamNumber: LongWord; pStreamData: IDirect3DVertexBuffer9; OffsetInBytes, Stride: LongWord): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetStreamSource(StreamNumber, pStreamData, OffsetInBytes, Stride);
end;

function Direct3DDevice9Proxy.GetStreamSource(StreamNumber: LongWord; out ppStreamData: IDirect3DVertexBuffer9; out pOffsetInBytes, pStride: LongWord): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetStreamSource(StreamNumber, ppStreamData, pOffsetInBytes, pStride);
end;

function Direct3DDevice9Proxy.SetStreamSourceFreq(StreamNumber: LongWord; Setting: LongWord): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetStreamSourceFreq(StreamNumber, Setting);
end;

function Direct3DDevice9Proxy.GetStreamSourceFreq(StreamNumber: LongWord; out Setting: LongWord): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetStreamSourceFreq(StreamNumber, Setting);
end;

function Direct3DDevice9Proxy.SetIndices(pIndexData: IDirect3DIndexBuffer9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetIndices(pIndexData);
end;

function Direct3DDevice9Proxy.GetIndices(out ppIndexData: IDirect3DIndexBuffer9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetIndices(ppIndexData);
end;

function Direct3DDevice9Proxy.CreatePixelShader(pFunction: PDWord; out ppShader: IDirect3DPixelShader9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.CreatePixelShader(pFunction, ppShader);
end;

function Direct3DDevice9Proxy.SetPixelShader(pShader: IDirect3DPixelShader9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetPixelShader(pShader);
end;

function Direct3DDevice9Proxy.GetPixelShader(out ppShader: IDirect3DPixelShader9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetPixelShader(ppShader);
end;

function Direct3DDevice9Proxy.SetPixelShaderConstantF(StartRegister: LongWord; pConstantData: PSingle; Vector4fCount: LongWord): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetPixelShaderConstantF(StartRegister, pConstantData, Vector4fCount);
end;

function Direct3DDevice9Proxy.GetPixelShaderConstantF(StartRegister: LongWord; pConstantData: PSingle; Vector4fCount: LongWord): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetPixelShaderConstantF(StartRegister, pConstantData, Vector4fCount);
end;

function Direct3DDevice9Proxy.SetPixelShaderConstantI(StartRegister: LongWord; pConstantData: PInteger; Vector4iCount: LongWord): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetPixelShaderConstantI(StartRegister, pConstantData, Vector4iCount);
end;

function Direct3DDevice9Proxy.GetPixelShaderConstantI(StartRegister: LongWord; pConstantData: PInteger; Vector4iCount: LongWord): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetPixelShaderConstantI(StartRegister, pConstantData, Vector4iCount);
end;

function Direct3DDevice9Proxy.SetPixelShaderConstantB(StartRegister: LongWord; pConstantData: PBOOL; BoolCount: LongWord): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.SetPixelShaderConstantB(StartRegister, pConstantData, BoolCount);
end;

function Direct3DDevice9Proxy.GetPixelShaderConstantB(StartRegister: LongWord; pConstantData: PBOOL; BoolCount: LongWord): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.GetPixelShaderConstantB(StartRegister, pConstantData, BoolCount);
end;

function Direct3DDevice9Proxy.DrawRectPatch(Handle: LongWord; pNumSegs: PSingle; pTriPatchInfo: PD3DRectPatchInfo): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.DrawRectPatch(Handle, pNumSegs, pTriPatchInfo);
end;

function Direct3DDevice9Proxy.DrawTriPatch(Handle: LongWord; pNumSegs: PSingle; pTriPatchInfo: PD3DTriPatchInfo): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.DrawTriPatch(Handle, pNumSegs, pTriPatchInfo);
end;

function Direct3DDevice9Proxy.DeletePatch(Handle: LongWord): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.DeletePatch(Handle);
end;

function Direct3DDevice9Proxy.CreateQuery(_Type: TD3DQueryType; out ppQuery: IDirect3DQuery9): HResult; stdcall;
begin
  Result := ptr_Direct3DDevice9.CreateQuery(_Type, ppQuery);
end;



end.

