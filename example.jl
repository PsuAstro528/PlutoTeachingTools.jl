### A Pluto.jl notebook ###
# v0.19.46

#> [frontmatter]
#> title = "PlutoTeachingTools.jl Examples"
#> description = "Demonstrates functions and patterns for making tutorials in Pluto with PlutoTeachingTools"
#> tags = ["basic", "julia", "pluto", "plutoteachingtools", "examples"]
#> date = "2024-09-24"
#> license = "CC BY-SA 4.0"
#> license_url = "https://creativecommons.org/licenses/by-sa/4.0/"
#> image = "https://avatars.githubusercontent.com/u/74617459?s=200&v=4"
#> 
#>     [[frontmatter.author]]
#>     name = "Eric Ford"
#>     url = "https://github.com/eford"

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ dee4aa68-e5eb-4a8a-869f-867e61de5ec5
using PlutoUI

# ╔═╡ 3f8dc975-b091-4dbe-bd48-c33236e61ece
using LaTeXStrings

# ╔═╡ 537f8ef3-a66f-4da3-a4f7-8c5b1eb58225
using ShortCodes, MarkdownLiteral

# ╔═╡ cd581a51-fb2b-4579-9a7d-0d723ad5d467
md"# [PlutoTeachingTools.jl](https://github.com/JuliaPluto/PlutoTeachingTools.jl) Examples"

# ╔═╡ 84ccb960-41f8-430d-bd73-a7c0248cfb95
md"""
Language for common prompts: $(@bind lang Select(["en"=>"English", "de"=>"German/Deutsch", "es"=>"Spanish/Español", "ru"=>"Russian", "zh"=>"Chinese"]))
"""

# ╔═╡ 657c3eea-1ef6-11ed-3e82-5daad2bc19a1
begin
    using PlutoTeachingTools
    # Optionally override default language choice (lang defined in widget above)
    set_language!(PlutoTeachingTools.get_language(lang))

    nb_link_prefix = string(PlutoRunner.notebook_id[]) # for making urls to notebook
    pkg_cell_link = "#" * (string(PlutoRunner.currently_running_cell_id[])) # for making urls to this cell
end;

# ╔═╡ f0704e56-7e97-4c92-bbdd-76d7a873e6d8
TableOfContents()   # from PlutoUI

# ╔═╡ 4cdfcaf6-d172-4dbf-afa9-8f0cd37a10e8
md"[test](pkg_cell_link)"

# ╔═╡ d173896e-021a-4b2c-b913-62c5a2320341
md"""
## Common Note Boxes
"""

# ╔═╡ 8c3f1fe2-c934-4743-b30b-07dc97aeac46
almost(
    md"You're right that the answer is a positive number, but the value isn't quite right."
)

# ╔═╡ b48468f0-eeaa-4e1a-ad0b-3cfe42b6ab15
correct()

# ╔═╡ 4f968b5c-cb11-4d22-ad5b-5ec9c7c94c87
danger(md"Don't forget to commit your saved notebook to your repository.")

# ╔═╡ 9ceaa0a3-0e68-4373-add9-49b6fa908b39
hint(md"It may be useful to make use of the identity $\sin \theta^2 + \cos \theta^2 =1$.")

# ╔═╡ cbea3a7b-522d-4f6e-908a-6baec22a9ce3
keep_working()

# ╔═╡ cf73022f-abfd-407c-bcb4-989b54b5dd03
still_missing()

# ╔═╡ 319dacff-fdfb-4d0b-918f-d389e4ac81fd
still_nothing()

# ╔═╡ 343eff72-62b0-4cd1-abd9-991245d4054a
tip(md"Think back to exercise 1.")

# ╔═╡ 12619e7d-5360-4d71-9a2d-5cf0385f0bcf
question_box(md"Why does the stone have a greater force?")

# ╔═╡ 947ce2c8-42e3-4704-89b2-c1968077212b
warning_box(md"Be extra careful here.")

# ╔═╡ 04ccfd06-ce54-4dc0-86c0-e7afa2fdbc6c
blockquote("A insightful quote that spans two lines.")

# ╔═╡ e9c10995-ff3d-4a47-82d1-051b0b7cc65d
blockquote(
    "Logic will get you from A to B.  Imagination will take you everywhere.",
    md"-- A. Einstein",
)

# ╔═╡ 4758e75c-1729-4dab-964c-7a2ee9798534
TODO("Remember to add good documentation.")

# ╔═╡ 39766d40-81a8-498b-83d9-c6f27c131db7
TODO("Remember to add good documentation."; heading="TODO #2")

# ╔═╡ 462025ab-b520-499d-9925-4b5770b80355
md"""
# Convenient checking of responces
"""

# ╔═╡ 8e053634-bca8-46eb-9202-8ab276dcad12
md"""
## Checking variables are defined
"""

# ╔═╡ c7c3f53e-435a-4ded-a420-04476adfae1c
var_not_defined(:x)

# ╔═╡ d5b25395-1929-46a7-bfed-1327c650a7a5
func_not_defined(:calc_x)

# ╔═╡ 9ca655cd-2919-4be5-b4de-edcb10d20e3e
not_defined(:x) # deprecated

# ╔═╡ 79f4a49c-4ea3-4888-afaf-7860b883ef38
md"""
## Checking variable types
"""

# ╔═╡ 438c621a-1991-476f-9889-55c053941e1b
a = 1

# ╔═╡ 1381ca68-cc1d-4fe7-9587-ee13a5db92ab
type_eq(a, Float64)

# ╔═╡ b52ff55b-3a8a-44e6-9bf6-2b6f9dda5e33
type_isa(a, Real)

# ╔═╡ 0cb5c037-8c2f-4fca-a999-63f9a4f9b891
wrong_type(:a, Float64)

# ╔═╡ 4a380230-f977-4ff7-9114-9d4075bba240
eval(Meta.parse(PlutoTeachingTools.code_for_check_type_funcs))

# ╔═╡ 42cb6d16-98e0-4ea8-8b54-370df71fe54e
display_msg_if_fail(check_type_isa(:a, a, Float64))

# ╔═╡ 1f3e04b4-28f9-4bb8-a233-fd061ac2ee75
display_msg_if_fail(check_type_isa(:a, a, Int64))  # should display nothing

# ╔═╡ db745245-805a-478b-b3f5-c7974fab0e9c
md"""
## Checking responces
"""

# ╔═╡ d1c7c926-7000-4ee3-8d9c-cb03d2dd8ae9
response_1 = missing # replace with your answer

# ╔═╡ 8f980fa3-559e-491d-8a84-34a4678fa53d
if ismissing(response_1)
    still_missing()
end

# ╔═╡ 5f95518f-62cd-4869-b6cf-85a7860f38ec
response_2 = "Insert your response here."

# ╔═╡ 3e12dbd9-f02a-479d-9eff-234ac88e059b
PlutoTeachingTools.keep_working_if_var_contains_substr(
    :response_2, response_2, "Insert your"
)

# ╔═╡ c8811462-874c-47da-bb34-797234046fdf
PlutoTeachingTools.keep_working_if_var_contains_substr(
    :response_2, response_2, "should display nothing"
)

# ╔═╡ 40155961-e8bb-41d1-bf54-178cf2a0c524
responce_1 = missing

# ╔═╡ 957ec770-ab5b-4b0b-a38d-46834d96fa68
if !ismissing(responce_1) && responce_1 == 42
    PlutoTeachingTools.confetti()
end

# ╔═╡ 7596325b-7a1b-4fad-bac3-ae6743e3f8dd
md"""# Robust Local Resources"""

# ╔═╡ 2bfcfe6d-221e-4619-b794-92e44494460b
begin
    url = "https://raw.githubusercontent.com/gist/fonsp/9a36c183e2cad7c8fc30290ec95eb104/raw/ca3a38a61f95cd58d79d00b663a3c114d21e284e/cute.svg"
    path = "data/cute.svg"
end;

# ╔═╡ 43a47026-4b09-4c20-9ccb-a766a17f8ff4
RobustLocalResource(url, path; cache=false) # specify to not save a local copy

# ╔═╡ 4774a4d7-d5f1-40e4-8c2f-f0f96e9242ce
RobustLocalResource(url, path, :width => 200, :alt => "Pluto logo") # add html attributes

# ╔═╡ d61ec51d-60c4-4f48-8179-2c8045416953
md"""
# Fancy Formating
"""

# ╔═╡ cccaff2f-3fa0-45f2-9fa6-cf8a21ade844
md"""
## Foldable content
"""

# ╔═╡ c46d1e7c-df6e-460e-a103-a486d27932c9
Foldable("Want more?", md"Extra info")

# ╔═╡ fb77557c-cbf1-4d91-bf4b-76abd54a4024
answer_box(
    md"""
    The stone has a greater force becasue force is given by Newtons 2nd law: 

    ```math
    F=m \times a
    ```

    It has a greater mass, therefore $m$ is larger. This then results in a larger force $F$
    """
)

# ╔═╡ 8eb551ef-a9c0-43e3-aea7-d83679436e93
answer_box(md"""Three"""; invite="1+2 = ?")

# ╔═╡ fb4ff876-a668-40ab-8d30-bfaa858849e4
protip(md"The `CSV.read` function has lots of useful optional arguments.")

# ╔═╡ 69a9e9f3-a72e-4935-a200-2842010f1e54
protip(
    md"Several of these functions have optional arguments.";
    invite="Invitation to learn more",
)

# ╔═╡ 08794ef8-4e10-4913-808e-06ac194625b6
md"""
## Aside
`aside` shows text on the right side of the Pluto notebook. 
The vertical offset can be set by the optional parameter `v_offset`.
"""

# ╔═╡ 77bb3822-2a1d-4e23-b852-6b6202069efa
aside(tip(md"Extra information to consider."))

# ╔═╡ cc66ef97-36f2-478c-961b-dd8ab2bda4ac
aside(tip(md"Even more information to consider."); v_offset=100)

# ╔═╡ 0b2a4490-7e29-42c0-af9a-e99b5540d154
set_aside_width(400)

# ╔═╡ 88b9d474-3449-4931-ac39-4dc377c04abd
md"""
## Markdown / LaTeX / HTML hacks
"""

# ╔═╡ f49ccb75-7cb8-49ce-95b9-ed59033a589d
A = rand(2, 2)

# ╔═╡ af5673b5-a7f9-4033-ac9b-845254f62c98
md"Now, you can include variables like $A=$ $(latexify_md(A)) inside markdown."

# ╔═╡ 8fcfe710-ac2b-4282-85c6-d3b8800fa53a
eqn_str = "x^2+y^2 = z^2"

# ╔═╡ 7390e4a7-0561-4611-b3c1-9b83601c5805
md"And you can grab equations in variables like $(wrap_tex(eqn_str)) inside markdown."

# ╔═╡ a9d9d87e-4cfe-4a34-bdb9-6bf3fc979bab
md"To simplify typing and displaying equations, we recommend using the [LaTeXStrings.jl](https://github.com/JuliaStrings/LaTeXStrings.jl) package:"

# ╔═╡ 0aefcfcd-ac8f-471b-8f90-7bb5235589ad
L"x^2+y^2 = z^2"

# ╔═╡ a05aa377-a201-4670-aae9-8de4059b67cb
md"#### Heading $nbsp $nbsp with extra space"

# ╔═╡ 25066f0b-7100-431c-8695-70005738bbfd
md"#### Multi-line $br heading"  # actually from PlutoUI

# ╔═╡ d7593309-3462-4dba-8275-c2eb76b4c3fe
md"""
## Multiple Columns
"""

# ╔═╡ fc5789dd-4b86-4007-9771-a6246235fd73
Columns(md"Left col", md"Right col")

# ╔═╡ 2881e5de-f6b7-47c0-a794-3e0fa57b712b
Columns(md"Left col", md"Middle col", md"Right col")

# ╔═╡ c22f7f6a-171d-4379-86c9-1781875cf0a4
md"""
You can customize the widths of the columns.
"""

# ╔═╡ 0e1e62a6-3b78-4415-89fe-fa17279fddbf
Columns(md"Left col", md"Right col"; widths=[33, 66])

# ╔═╡ f43beea9-7a7e-4ee6-8ae6-350640c426aa
TwoColumnWideRight(md"Left col", md"Right col")

# ╔═╡ 44d651d3-ce42-4061-b193-da7c31efed8e
TwoColumnWideLeft(
    warning_box(md"Discussion of figure on right."), RobustLocalResource(url, path)
)

# ╔═╡ 7859ad2b-7e87-442c-8684-f731f2512a42
md"""
## Presentation mode
"""

# ╔═╡ 96ebc3d2-fc70-4a56-8e87-dfe686c723c4
ChooseDisplayMode()

# ╔═╡ a6485a75-6b52-4549-94e9-658dd971c43b
present_button()  # Don't use this with ChooseDisplayMode() since two ways to toggle will make the checkbox behavior confusing

# ╔═╡ 1f417420-cc7f-4e88-9b2b-05185ff81c31
#WidthOverDocs()  # deprecated in favor of ChooseDisplayMode

# ╔═╡ a0e8b662-074f-47c0-9f0c-545ee847f6b9
Markdown.parse("Here's a link to the [Pkg cell]($pkg_cell_link).")

# ╔═╡ 97967267-6dbe-4d13-b9cf-1be9038b23ab
md"""
## Footnotes
"""

# ╔═╡ c83e0b4a-7376-4061-8796-ba396c9fbc7a
md"""
### Create inline footnotes

Here is the footnotemark for footnote1[^footnote1].  Here is another one[^info]. 
"""

# ╔═╡ 26219cb8-b1a2-4a35-b50d-10d496954f34
md"""
We can refer/label them whatever we want[^xyz]. 
Here is the first one again[^footnote1].
Notice how the reference number is reused. 

If there is no footnote title/info found then an error is shown[^ahh] Oh No!
"""

# ╔═╡ 93467d07-7235-41a2-a6a7-e89c87e28006
md"""
### Create the footnote text
These would usually appear at the bottom of the notebook.  But their cells can be placed where ever works best.  
The number is assigned based on the order of the footnote text in the notebook (and not the order of the footnotemark).
"""

# ╔═╡ e33a5805-dfc6-4331-83cd-42f113955e5a
md"""
[^footnote1]: This is the text to go with footnote 1.
"""

# ╔═╡ 0be97858-c4f4-4c47-adde-caed151971bb
md"""
[^info]: Here is some extra information.  
         Foonotes are fun.  

[^xyz]: Author et al. (2022) *Journal of Footnotes*, 123, 45.
        
"""

# ╔═╡ d98ea117-9aab-4fad-af19-0a8e69b0c251
md"""
Call the functions below to specify your preferred footnote format.
These might be best at the bottom of your notebook.  
Note that you should not suppress their output (e.g., with a semicolon or putting them in a cell with other code). 
If you do, the CSS that they provide may not take effect.
"""

# ╔═╡ cb31500f-0cc4-49f0-a338-a75a34c95560
FootnotesInlineStyleSuperscript()
#FootnotesInlineStyleBaseline()
#FootnotesInlineStyleSubscript()

# ╔═╡ f66b3b03-78ee-4eef-a0d6-43f4249d3332
FootnotesNumbered()
#FootnotesInlineNumbered()
#FootnotesBottomNumbered()

# ╔═╡ 4d70269c-fd59-43f3-b63d-1b45d2386ceb
md"""
### Citations with [`ShortCodes.jl`](https://github.com/hellemo/ShortCodes.jl)

One common use-case is to quickly cite something in a footnote. Why write out or copy the citation manually when you can do it automatically? Doing so requires [`ShortCodes.jl`](https://github.com/hellemo/ShortCodes.jl) and [`MarkdownLiteral.jl`](https://github.com/JuliaPluto/MarkdownLiteral.jl)

> When discussing whether a machine can think, it is important to first decide what a "machine" is, and what "thinking" means.[^turing]

"""

# ╔═╡ 9c53984f-0632-4bdf-a041-6e0df4beb43a
MarkdownLiteral.@markdown(
"""
[^turing]: $(DOI("10.1007/978-1-4020-6710-5_3"))
"""
)

# ╔═╡ f4201010-71d1-4889-99e7-abb774612a4d
begin
    mls_link = "#" * (string(PlutoRunner.currently_running_cell_id[]))
    md"# Multi-language support"
end

# ╔═╡ d6b3f009-22e4-4b21-8986-a29e3f261c3b
Markdown.parse("""See also [multi-language support]($mls_link) section below""")

# ╔═╡ ef32d891-0a7a-4803-95ae-a930787c243a
preferred_text((en=md"Hello", de=md"Hallo", es=md"Hola", ru=md"привет", zh="你好!"))

# ╔═╡ d3762092-e31d-4b96-840a-3939b89f60b7
tip(
    preferred_text((
        en=md"Remember to add good documentation.",
        de=md"Denken Sie daran, eine gute Dokumentation hinzuzufügen.",
        es=md"Recuerde agregar buena documentación",
    )),
)

# ╔═╡ 93e4e977-efb1-48c7-ac4c-c578140135ee
Markdown.parse(
    """See also [package cell]($pkg_cell_link) for overriding default language selected from `ENV[LANG]`.""",
)

# ╔═╡ 743491af-3d4b-4dee-9ad7-2372ba4e97bd
md"""
# Ingredients
(Including code from external files)
"""

# ╔═╡ 23afc83f-e971-4356-a30e-1b7a247ff38d
begin
    MyModule = @ingredients "demo_module.jl" # provided by PlutoLinks.jl
    import .MyModule: Demo
    import .Demo: hello
end

# ╔═╡ d4b1b5f2-b4ae-4988-aded-79398949f1c8
MyModule.Demo.hundred

# ╔═╡ 95528ca8-bb97-4af2-bbba-dbf1ac188622
Demo.hundred

# ╔═╡ 5985de1c-a429-4449-87c2-3eb6d5bfb247
hello()

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
LaTeXStrings = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
MarkdownLiteral = "736d6165-7244-6769-4267-6b50796e6954"
PlutoTeachingTools = "661c6b06-c737-4d37-b85c-46df65de6f69"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
ShortCodes = "f62ebe17-55c5-4640-972f-b59c0dd11ccf"

[compat]
LaTeXStrings = "~1.3.1"
MarkdownLiteral = "~0.1.1"
PlutoTeachingTools = "~0.3.0"
PlutoUI = "~0.7.60"
ShortCodes = "~0.3.6"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.10.4"
manifest_format = "2.0"
project_hash = "ab90d137919bfda3c1914147f8feb51a20cd1c02"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "6e1d2a35f2f90a4bc7c2ed98079b2ba09c35b83a"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.3.2"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.CodeTracking]]
deps = ["InteractiveUtils", "UUIDs"]
git-tree-sha1 = "7eee164f122511d3e4e1ebadb7956939ea7e1c77"
uuid = "da1fd8a2-8d9e-5ec2-8556-3022fb5608a2"
version = "1.3.6"

[[deps.CodecZlib]]
deps = ["TranscodingStreams", "Zlib_jll"]
git-tree-sha1 = "bce6804e5e6044c6daab27bb533d1295e4a2e759"
uuid = "944b1d66-785c-5afd-91f1-9de20f533193"
version = "0.7.6"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "b10d0b65641d57b8b4d5e234446582de5047050d"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.5"

[[deps.CommonMark]]
deps = ["Crayons", "JSON", "PrecompileTools", "URIs"]
git-tree-sha1 = "532c4185d3c9037c0237546d817858b23cf9e071"
uuid = "a80b9123-70ca-4bc0-993e-6e3bcb318db6"
version = "0.8.12"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.1.1+0"

[[deps.Crayons]]
git-tree-sha1 = "249fe38abf76d48563e2f4556bebd215aa317e15"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.1.1"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "05882d6995ae5c12bb5f36dd2ed3f61c98cbb172"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.5"

[[deps.Format]]
git-tree-sha1 = "9c68794ef81b08086aeb32eeaf33531668d5f5fc"
uuid = "1fa38f19-a742-5d3f-a2b9-30dd87b9d5f8"
version = "1.3.7"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "179267cfa5e712760cd43dcae385d7ea90cc25a4"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.5"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "7134810b1afce04bbc1045ca1985fbe81ce17653"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.5"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "b6d6bfdd7ce25b0f9b2f6b3dd56b2673a66c8770"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.5"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

[[deps.JSON3]]
deps = ["Dates", "Mmap", "Parsers", "PrecompileTools", "StructTypes", "UUIDs"]
git-tree-sha1 = "eb3edce0ed4fa32f75a0a11217433c31d56bd48b"
uuid = "0f8b85d8-7281-11e9-16c2-39a750bddbf1"
version = "1.14.0"

    [deps.JSON3.extensions]
    JSON3ArrowExt = ["ArrowTypes"]

    [deps.JSON3.weakdeps]
    ArrowTypes = "31f734f8-188a-4ce0-8406-c8a06bd891cd"

[[deps.JuliaInterpreter]]
deps = ["CodeTracking", "InteractiveUtils", "Random", "UUIDs"]
git-tree-sha1 = "2984284a8abcfcc4784d95a9e2ea4e352dd8ede7"
uuid = "aa1ae85d-cabe-5617-a682-6adf51b2e16a"
version = "0.9.36"

[[deps.LaTeXStrings]]
git-tree-sha1 = "50901ebc375ed41dbf8058da26f9de442febbbec"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.1"

[[deps.Latexify]]
deps = ["Format", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "OrderedCollections", "Requires"]
git-tree-sha1 = "ce5f5621cac23a86011836badfedf664a612cee4"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.16.5"

    [deps.Latexify.extensions]
    DataFramesExt = "DataFrames"
    SparseArraysExt = "SparseArrays"
    SymEngineExt = "SymEngine"

    [deps.Latexify.weakdeps]
    DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
    SymEngine = "123dc426-2d89-5057-bbad-38513e3affd8"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.4"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "8.4.0+0"

[[deps.LibGit2]]
deps = ["Base64", "LibGit2_jll", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibGit2_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll"]
uuid = "e37daf67-58a4-590a-8e99-b0245dd2ffc5"
version = "1.6.4+0"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.11.0+1"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.LoweredCodeUtils]]
deps = ["JuliaInterpreter"]
git-tree-sha1 = "c2b5e92eaf5101404a58ce9c6083d595472361d6"
uuid = "6f1432cf-f94c-5a45-995e-cdbf5db27b0b"
version = "3.0.2"

[[deps.MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[deps.MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "2fa9ee3e63fd3a4f7a9a4f4744a52f4856de82df"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.13"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MarkdownLiteral]]
deps = ["CommonMark", "HypertextLiteral"]
git-tree-sha1 = "0d3fa2dd374934b62ee16a4721fe68c418b92899"
uuid = "736d6165-7244-6769-4267-6b50796e6954"
version = "0.1.1"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.2+1"

[[deps.Memoize]]
deps = ["MacroTools"]
git-tree-sha1 = "2b1dfcba103de714d31c033b5dacc2e4a12c7caa"
uuid = "c03570c3-d221-55d1-a50c-7939bbd78826"
version = "0.4.4"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2023.1.10"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.23+4"

[[deps.OrderedCollections]]
git-tree-sha1 = "dfdf5519f235516220579f949664f1bf44e741c5"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.6.3"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "8489905bcdbcfac64d1daa51ca07c0d8f0283821"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.8.1"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.10.0"

[[deps.PlutoHooks]]
deps = ["InteractiveUtils", "Markdown", "UUIDs"]
git-tree-sha1 = "072cdf20c9b0507fdd977d7d246d90030609674b"
uuid = "0ff47ea0-7a50-410d-8455-4348d5de0774"
version = "0.0.5"

[[deps.PlutoLinks]]
deps = ["FileWatching", "InteractiveUtils", "Markdown", "PlutoHooks", "Revise", "UUIDs"]
git-tree-sha1 = "8f5fa7056e6dcfb23ac5211de38e6c03f6367794"
uuid = "0ff47ea0-7a50-410d-8455-4348d5de0420"
version = "0.1.6"

[[deps.PlutoTeachingTools]]
deps = ["Downloads", "HypertextLiteral", "Latexify", "Markdown", "PlutoLinks", "PlutoUI"]
git-tree-sha1 = "e2593782a6b53dc5176058d27e20387a0576a59e"
uuid = "661c6b06-c737-4d37-b85c-46df65de6f69"
version = "0.3.0"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "eba4810d5e6a01f612b948c9fa94f905b49087b0"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.60"

[[deps.PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "5aa36f7049a63a1528fe8f7c3f2113413ffd4e1f"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.2.1"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "9306f6085165d270f7e3db02af26a400d580f5c6"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.4.3"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.Revise]]
deps = ["CodeTracking", "Distributed", "FileWatching", "JuliaInterpreter", "LibGit2", "LoweredCodeUtils", "OrderedCollections", "REPL", "Requires", "UUIDs", "Unicode"]
git-tree-sha1 = "7b7850bb94f75762d567834d7e9802fc22d62f9c"
uuid = "295af30f-e4ad-537b-8983-00126c2a3abe"
version = "3.5.18"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.ShortCodes]]
deps = ["Base64", "CodecZlib", "Downloads", "JSON3", "Memoize", "URIs", "UUIDs"]
git-tree-sha1 = "5844ee60d9fd30a891d48bab77ac9e16791a0a57"
uuid = "f62ebe17-55c5-4640-972f-b59c0dd11ccf"
version = "0.3.6"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SparseArrays]]
deps = ["Libdl", "LinearAlgebra", "Random", "Serialization", "SuiteSparse_jll"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
version = "1.10.0"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.10.0"

[[deps.StructTypes]]
deps = ["Dates", "UUIDs"]
git-tree-sha1 = "159331b30e94d7b11379037feeb9b690950cace8"
uuid = "856f2bd8-1eba-4b0a-8007-ebc267875bd4"
version = "1.11.0"

[[deps.SuiteSparse_jll]]
deps = ["Artifacts", "Libdl", "libblastrampoline_jll"]
uuid = "bea87d4a-7f5b-5778-9afe-8cc45184846c"
version = "7.2.1+1"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.TranscodingStreams]]
git-tree-sha1 = "e84b3a11b9bece70d14cce63406bbc79ed3464d2"
uuid = "3bb67fe8-82b1-5028-8e26-92a6c54297fa"
version = "0.11.2"

[[deps.Tricks]]
git-tree-sha1 = "7822b97e99a1672bfb1b49b668a6d46d58d8cbcb"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.9"

[[deps.URIs]]
git-tree-sha1 = "67db6cc7b3821e19ebe75791a9dd19c9b1188f2b"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.5.1"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.13+1"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.8.0+1"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.52.0+1"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+2"
"""

# ╔═╡ Cell order:
# ╟─cd581a51-fb2b-4579-9a7d-0d723ad5d467
# ╠═dee4aa68-e5eb-4a8a-869f-867e61de5ec5
# ╠═84ccb960-41f8-430d-bd73-a7c0248cfb95
# ╟─d6b3f009-22e4-4b21-8986-a29e3f261c3b
# ╠═657c3eea-1ef6-11ed-3e82-5daad2bc19a1
# ╠═f0704e56-7e97-4c92-bbdd-76d7a873e6d8
# ╠═4cdfcaf6-d172-4dbf-afa9-8f0cd37a10e8
# ╟─d173896e-021a-4b2c-b913-62c5a2320341
# ╠═8c3f1fe2-c934-4743-b30b-07dc97aeac46
# ╠═b48468f0-eeaa-4e1a-ad0b-3cfe42b6ab15
# ╠═4f968b5c-cb11-4d22-ad5b-5ec9c7c94c87
# ╠═9ceaa0a3-0e68-4373-add9-49b6fa908b39
# ╠═cbea3a7b-522d-4f6e-908a-6baec22a9ce3
# ╠═cf73022f-abfd-407c-bcb4-989b54b5dd03
# ╠═319dacff-fdfb-4d0b-918f-d389e4ac81fd
# ╠═343eff72-62b0-4cd1-abd9-991245d4054a
# ╠═12619e7d-5360-4d71-9a2d-5cf0385f0bcf
# ╠═947ce2c8-42e3-4704-89b2-c1968077212b
# ╠═04ccfd06-ce54-4dc0-86c0-e7afa2fdbc6c
# ╠═e9c10995-ff3d-4a47-82d1-051b0b7cc65d
# ╠═4758e75c-1729-4dab-964c-7a2ee9798534
# ╠═39766d40-81a8-498b-83d9-c6f27c131db7
# ╟─462025ab-b520-499d-9925-4b5770b80355
# ╟─8e053634-bca8-46eb-9202-8ab276dcad12
# ╠═c7c3f53e-435a-4ded-a420-04476adfae1c
# ╠═d5b25395-1929-46a7-bfed-1327c650a7a5
# ╠═9ca655cd-2919-4be5-b4de-edcb10d20e3e
# ╟─79f4a49c-4ea3-4888-afaf-7860b883ef38
# ╠═438c621a-1991-476f-9889-55c053941e1b
# ╠═1381ca68-cc1d-4fe7-9587-ee13a5db92ab
# ╠═b52ff55b-3a8a-44e6-9bf6-2b6f9dda5e33
# ╠═0cb5c037-8c2f-4fca-a999-63f9a4f9b891
# ╠═4a380230-f977-4ff7-9114-9d4075bba240
# ╠═42cb6d16-98e0-4ea8-8b54-370df71fe54e
# ╠═1f3e04b4-28f9-4bb8-a233-fd061ac2ee75
# ╟─db745245-805a-478b-b3f5-c7974fab0e9c
# ╠═d1c7c926-7000-4ee3-8d9c-cb03d2dd8ae9
# ╠═8f980fa3-559e-491d-8a84-34a4678fa53d
# ╠═5f95518f-62cd-4869-b6cf-85a7860f38ec
# ╠═3e12dbd9-f02a-479d-9eff-234ac88e059b
# ╠═c8811462-874c-47da-bb34-797234046fdf
# ╠═40155961-e8bb-41d1-bf54-178cf2a0c524
# ╠═957ec770-ab5b-4b0b-a38d-46834d96fa68
# ╟─7596325b-7a1b-4fad-bac3-ae6743e3f8dd
# ╠═2bfcfe6d-221e-4619-b794-92e44494460b
# ╠═43a47026-4b09-4c20-9ccb-a766a17f8ff4
# ╠═4774a4d7-d5f1-40e4-8c2f-f0f96e9242ce
# ╟─d61ec51d-60c4-4f48-8179-2c8045416953
# ╟─cccaff2f-3fa0-45f2-9fa6-cf8a21ade844
# ╠═c46d1e7c-df6e-460e-a103-a486d27932c9
# ╠═fb77557c-cbf1-4d91-bf4b-76abd54a4024
# ╠═8eb551ef-a9c0-43e3-aea7-d83679436e93
# ╠═fb4ff876-a668-40ab-8d30-bfaa858849e4
# ╠═69a9e9f3-a72e-4935-a200-2842010f1e54
# ╟─08794ef8-4e10-4913-808e-06ac194625b6
# ╠═77bb3822-2a1d-4e23-b852-6b6202069efa
# ╠═cc66ef97-36f2-478c-961b-dd8ab2bda4ac
# ╠═0b2a4490-7e29-42c0-af9a-e99b5540d154
# ╟─88b9d474-3449-4931-ac39-4dc377c04abd
# ╠═f49ccb75-7cb8-49ce-95b9-ed59033a589d
# ╠═af5673b5-a7f9-4033-ac9b-845254f62c98
# ╠═8fcfe710-ac2b-4282-85c6-d3b8800fa53a
# ╠═7390e4a7-0561-4611-b3c1-9b83601c5805
# ╟─a9d9d87e-4cfe-4a34-bdb9-6bf3fc979bab
# ╠═3f8dc975-b091-4dbe-bd48-c33236e61ece
# ╠═0aefcfcd-ac8f-471b-8f90-7bb5235589ad
# ╠═a05aa377-a201-4670-aae9-8de4059b67cb
# ╠═25066f0b-7100-431c-8695-70005738bbfd
# ╟─d7593309-3462-4dba-8275-c2eb76b4c3fe
# ╠═fc5789dd-4b86-4007-9771-a6246235fd73
# ╠═2881e5de-f6b7-47c0-a794-3e0fa57b712b
# ╟─c22f7f6a-171d-4379-86c9-1781875cf0a4
# ╠═0e1e62a6-3b78-4415-89fe-fa17279fddbf
# ╠═f43beea9-7a7e-4ee6-8ae6-350640c426aa
# ╠═44d651d3-ce42-4061-b193-da7c31efed8e
# ╟─7859ad2b-7e87-442c-8684-f731f2512a42
# ╠═96ebc3d2-fc70-4a56-8e87-dfe686c723c4
# ╠═a6485a75-6b52-4549-94e9-658dd971c43b
# ╠═1f417420-cc7f-4e88-9b2b-05185ff81c31
# ╠═a0e8b662-074f-47c0-9f0c-545ee847f6b9
# ╟─97967267-6dbe-4d13-b9cf-1be9038b23ab
# ╠═c83e0b4a-7376-4061-8796-ba396c9fbc7a
# ╠═26219cb8-b1a2-4a35-b50d-10d496954f34
# ╠═93467d07-7235-41a2-a6a7-e89c87e28006
# ╠═e33a5805-dfc6-4331-83cd-42f113955e5a
# ╠═0be97858-c4f4-4c47-adde-caed151971bb
# ╟─d98ea117-9aab-4fad-af19-0a8e69b0c251
# ╠═cb31500f-0cc4-49f0-a338-a75a34c95560
# ╠═f66b3b03-78ee-4eef-a0d6-43f4249d3332
# ╠═4d70269c-fd59-43f3-b63d-1b45d2386ceb
# ╠═537f8ef3-a66f-4da3-a4f7-8c5b1eb58225
# ╠═9c53984f-0632-4bdf-a041-6e0df4beb43a
# ╟─f4201010-71d1-4889-99e7-abb774612a4d
# ╠═ef32d891-0a7a-4803-95ae-a930787c243a
# ╠═d3762092-e31d-4b96-840a-3939b89f60b7
# ╟─93e4e977-efb1-48c7-ac4c-c578140135ee
# ╟─743491af-3d4b-4dee-9ad7-2372ba4e97bd
# ╠═23afc83f-e971-4356-a30e-1b7a247ff38d
# ╠═d4b1b5f2-b4ae-4988-aded-79398949f1c8
# ╠═95528ca8-bb97-4af2-bbba-dbf1ac188622
# ╠═5985de1c-a429-4449-87c2-3eb6d5bfb247
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
