// source https://github.com/LRelar/APIDevTools_json-schema-ref-parser_launcher/blob/master/readme.md

const process = require('process');
const $RefParser = require("@apidevtools/json-schema-ref-parser");
const path = require('path');

let parser = new $RefParser();
fs = require('fs');

async function loadAndParse(target) {
	const data = await parser.dereference(target);
	return JSON.stringify(data)
}

function writeToFile(data, target) {
	const jsonObj = JSON.parse(data);

	fs.writeFile(target, JSON.stringify(jsonObj, null, '\t'), function(err) {
		if (err) return console.log(err);
		console.log('OK');
	})
}

function fillPathObj(target, name) {
	target.name = name;
	target.ext = '.json';
	target.base = name + '.json';
}

function checkTargetArgv() {
	let dst;
	let dstPath;

	if (process.argv.length == 4) {
		dstPath = path.resolve(process.argv.pop());
		dst = path.parse(dstPath)
		if (fs.existsSync(dstPath) && fs.lstatSync(dstPath).isDirectory()) {
			dst.dir = dstPath;
			fillPathObj(dst, 'api_agregated');
		}
		if (!dst.ext) fillPathObj(dst, dst.name);
	}
	return dst;
}

async function main() {
	let src;
	let dst;
	let srcPath;

	dst = checkTargetArgv();
	srcPath = path.resolve(process.argv.pop());
	src = path.parse(srcPath);
	if (!dst) {
		dst = src;
		fillPathObj(dst, 'api_agregated');
	}
	const data = await loadAndParse(srcPath);
	if (!dst) return console.log("Invalid API file given");
	writeToFile(data, path.format(dst));
}

main();