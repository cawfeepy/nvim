My own nvim config that i've tried to make work for tsserver in neovim.

My issue with typescript-tools.nvim: TSToolsGoToSourceDefinition takes me a to a cjs file instead of the actual source. But that's not what I'm really frustrated with.

My *main* issue is with automatic import suggestions:

*Here's an example*, just for demonstration:

1. Clone the Mantine UI repo: https://github.com/mantinedev/mantine
2. Run `yarn`, then run `npm run build all`
2A. Go to .storybook/preview.tsx.
3. Comment out `import { MantineEmotionProvider } from "@mantine/emotion"`
4. Write "MantineEmotionProvider".
5. Tsserver won't do anything. It won't suggest an import from "@mantine/emotion"!

ARHH!!!!

This is the behavior that I've been trying to fix. This doesn't happen on Webstorm. Webstorm *knows* where to find "MantineEmotionProvider" and auto completes it for me. Out of the box. 

Moving on to Webstorm for a bit. I'm going to miss Neovim and its plugins, but tsserver has been driving me nuts.
If anyone wants to help me, I would appreciate it very much.
