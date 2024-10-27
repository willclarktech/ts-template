import willclarktechConfig from "eslint-config-willclarktech";

const config = [
	...willclarktechConfig,
	{
		ignores: [
			"node_modules/",
			"build/",
			"custom_types/",
			"dist/",
			"docs/",
			"generated/",
			"types/",
		],
	},
	{
		files: ["**/*.{cts,mts,ts,tsx}"],
		rules: {
			"import/extensions": "off",
		},
	},
];

export default config;
