# Loadstring

```lua
local Params = {
 RepoURL = "https://raw.githubusercontent.com/UncertainlyRound/SynSaveInstanceEdit/main/",
 SSI = "saveinstance",
}
local synsaveinstance = loadstring(game:HttpGet(Params.RepoURL .. Params.SSI .. ".luau", true), Params.SSI)()
local Options = {} -- Documentation here https://luau.github.io/UniversalSynSaveInstance/api/SynSaveInstance
synsaveinstance(Options)
```

# Universal Syn Save Instance Edit

The original script, shortly USSI, is a project aimed at resurrecting saveinstance function from [Synapse X Source 2019] & Other Executor Source leaks :trollface:.<br />
Reason: Many Executors fail miserably at providing good user experience when it comes to tinkering with saving instances.
This edit provides the ability to save ModuleScripts without needing a decompile function, instead using require() to obtain information. Please note that functions cannot be saved using this method.

> [OG USSI CREDITS]
> Abiding under the Section 7 (b) in the LICENSE:
> - Credit string: `UniversalSynSaveInstance https://discord.gg/wx4ThpAsmw`
> - Original Repository: https://github.com/luau/UniversalSynSaveInstance
> - [License](https://github.com/luau/UniversalSynSaveInstance/blob/main/LICENSE)

> [!TIP]
> Important part about this saveinstance is that it doesn't modify anything, therefore reduces the amount of detection vectors by a lot.<br />
> You can also enable the `SafeMode` option to completely bypass any detections and save **ANY** game!<br /><br />

# 💖 Support Them & Their Work

<a href='https://ko-fi.com/M4M1JNH5G' target='_blank'><img height='36' style='border:0px;height:36px;' src='https://storage.ko-fi.com/cdn/kofi2.png?v=3' border='0' alt='Buy Me a Coffee at ko-fi.com' title='KO-FI' /></a>
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/M4M1JNH5G "KO-FI")
<br />
[![ko-fi](https://user-images.githubusercontent.com/95628489/231759262-25661006-b7ca-4967-a79d-2b465cd9575a.png)](https://ko-fi.com/M4M1JNH5G "KO-FI QR-CODE")

# USSI DISCORD SERVER:<br />

<https://discord.com/invite/wx4ThpAsmw> **/** <https://discord.gg/wx4ThpAsmw><br />
[<img src="https://discordapp.com/api/guilds/1022465460517740654/widget.png?style=banner2" alt="Our Official Discord Server!"></img>](https://discord.com/invite/wx4ThpAsmw)<br />

\*\*\* View source code of this file for more credits

[@Acrillis]: https://github.com/Acrillis
[@Anaminus]: https://github.com/Anaminus
[@Dekkonot]: https://github.com/Dekkonot
[@mblouka]: https://github.com/mblouka
[@LorekeeperZinnia]: https://github.com/LorekeeperZinnia
[bit32]: https://create.roblox.com/docs/reference/engine/libraries/bit32
[buffer]: https://create.roblox.com/docs/reference/engine/libraries/buffer
[pack]: https://create.roblox.com/docs/reference/engine/libraries/string#pack
[unpack]: https://create.roblox.com/docs/reference/engine/libraries/string#unpack
[string]: https://create.roblox.com/docs/reference/engine/libraries/string
[DataType Exceptions]: https://github.com/rojo-rbx/rbx-dom/blob/8ca9250fa5a5ad3756c89e1e111e1aabaf698b27/rbx_reflector/src/cli/generate.rs#L196
[KRNL Docs]: https://app.archbee.com/public/PREVIEW-2Jp4SDaAD4P1COFfx1p_t/PREVIEW-EtjA4sQe5zYUxIHwA6CqJ#mDB9D
[KRNL-like saveinstance Options]: https://app.archbee.com/public/PREVIEW-2Jp4SDaAD4P1COFfx1p_t/PREVIEW-EtjA4sQe5zYUxIHwA6CqJ#mDB9D
[Rojo Rbx Dom Xml]: https://github.com/rojo-rbx/rbx-dom/blob/master/docs/xml.md
[Rojo Rbx Dom Binary]: https://github.com/rojo-rbx/rbx-dom/blob/master/docs/binary.md
[Luau Syntax]: https://luau-lang.org/syntax
[Rbx-Binary-Format]: https://github.com/Dekkonot/rbx-binary-format/blob/master/src/writer.lua
[Roblox Client Tracker]: https://github.com/MaximumADHD/Roblox-Client-Tracker
[Roblox File Format]: https://github.com/MaximumADHD/Roblox-File-Format
[Roblox Format Specifications]: https://github.com/RobloxAPI/spec/
[Roblox Format Specifications Binary]: https://github.com/RobloxAPI/spec/blob/master/formats/rbxl.md
[SharedStrings]: https://github.com/RobloxAPI/spec/blob/master/formats/rbxlx.md#sharedstring
[Synapse X Docs Old]: https://synapsexdocs.github.io/custom-lua-functions/misc-functions/#save-instance
[debug]: https://web.archive.org/web/20221021015553/https://docs.synapse.to/reference/debug_lib.html
[Synapse X Docs]: https://web.archive.org/web/20230318113846/https://docs.synapse.to/reference/misc.html
[Synapse X Source 2019]: https://github.com/Acrillis/SynapseX
[PropertyPatches v1]: https://github.com/MaximumADHD/Roblox-File-Format/blob/main/Plugins/GenerateApiDump/PropertyPatches.lua#L72
[PropertyPatches v2]: https://github.com/rojo-rbx/rbx-dom/tree/master/patches
[PropertyPatches v3]: https://github.com/rojo-rbx/rbx-dom/blob/master/rbx_dom_lua/src/customProperties.lua
[UNC]: https://github.com/unified-naming-convention/NamingStandard/commit/613c1956b801ace54ba141dfc60842a16608b54f
