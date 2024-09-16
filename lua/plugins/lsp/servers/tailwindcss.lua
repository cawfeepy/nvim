return {
  settings = {
    tailwindcss = {
      classAttributes = { "class", "className", "ngClass" },
      root_dir = function(...)
        return require("lspconfig.util").root_pattern(".git")(...)
      end,
      experimental = {
        classRegex = {
          "tw`([^`]*)", -- tw`...`
          "tw='([^']*)", -- <div tw="..." />
          "tw={`([^`}]*)", -- <div tw={"..."} />
          "tw\\.\\w+`([^`]*)", -- tw.xxx`...`
          "tw\\(.*?\\)`([^`]*)", -- tw(component)`...`
          "styled\\(.*?, '([^']*)'\\)",
          { "cn\\(([^)]*)\\)", "(?:'|\"|`)([^\"'`]*)(?:'|\"|`)" },
          { "clsx\\(([^]*)\\)", "(?:'|\"|`)([^\"'`]*)(?:'|\"|`)" },
          { "(?:twMerge|twJoin)\\(([^\\);]*)[\\);]", "[`'\"`]([^'\"`,;]*)[`'\"`]" },
          { "{([\\s\\S]*)}", ":\\s*['\"`]([^'\"`]*)['\"`]" },
        },
      },
    },
  }
}
