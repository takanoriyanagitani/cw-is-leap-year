//@ts-expect-error
import { readFile } from "node:fs/promises";

(async () => {
	/** @type {string} */
	const wasm = "./isleap.wasm";

	const pbytes = readFile(wasm);
	const pwasm = pbytes.then(WebAssembly.instantiate);

	const { instance } = await pwasm;
	const { exports } = instance;
	const { isleap } = exports;

	for (let i = 1; i <= 9999; i++) {
		/** @type {number} */
		const leapyear = isleap(i);
		console.info(`${i}:${leapyear}`);
	}
})();
