module.exports = {
  purge: [],
  theme: {
    extend: {
      fontFamily: {
      sans: ['Inter', ...defaultTheme.fontFamily.sans]},
  },
  variants: {},
  plugins: [require('@tailwindcss/ui')],
}
