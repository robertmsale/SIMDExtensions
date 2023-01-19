# SIMDExtensions

This package extends Swift's `simd` data types making them easier to use.

## Why?

Using SIMD vector arithmetic yields better performance, especially for graphics intensive software such as (FieldFab for iOS)[https:\\fieldfab.net]. This package enables a very Swifty API for SIMD data types that make it much easier to use (no need to look at all the overloads for `simd_insphere` to see what types support it because now it's baked into the container!). Rather than dealing with global functions all the SIMD arithmetic functions are encapsulated in their underlying type. 

## How?

Due to the way SIMD works, there is no way to generically enable these extensions. You have to specify the SIMD container by size and storage type (i.e. `SIMD3<Float>`) when writing the extension. So to simplify this process a text templating engine was used to generate the source files. The template is around 400 lines of code but expands out to around 2000 lines to cover all of the different SIMD types (subject to increase as more functionality gets added). Because everything is done with templates, as long as the template is well written all the types generated will behave identically.
