module uim.cms;

@safe:
// Phobos
public import std.algorithm; 
public import std.range; 
public import std.range.primitives; 
public import std.range.interfaces; 
public import std.base64;
public import std.csv;
// public import std.json;
public import std.zip; // Read/write data in the ZIP archive format.
public import std.zlib;
public import std.stdio;
public import std.string;
public import std.uuid;
public import std.digest; // Compute digests such as md5, sha1 and crc32.
public import std.digest.crc; // Cyclic Redundancy Check (32-bit) implementation.
public import std.digest.hmac; // Compute HMAC digests of arbitrary data.
public import std.digest.md; // Compute MD5 hash of arbitrary data.
public import std.digest.murmurhash; // Compute MurmurHash of arbitrary data.
public import std.digest.ripemd; // Compute RIPEMD-160 hash of arbitrary data.
public import std.digest.sha; // Compute SHA1 and SHA2 hashes of arbitrary data.
public import std.file; // Manipulate files and directories.
public import std.path; // Manipulate strings that represent filesystem paths.
public import std.stdio; // Perform buffered I/O.
// Networking
public import std.socket; // Socket primitives.
public import std.typecons;
public import std.net.curl; // Networking client functionality as provided by libcurl.
public import std.net.isemail; // Validates an email address according to RFCs 5321, 5322 and others.
public import std.uri; // Encode and decode Uniform Resource Identifiers (URIs).
public import std.uuid; // Universally-unique identifiers for resources in distributed systems.
// Numeric
public import std.bigint; // An arbitrary-precision integer type.
public import std.complex; // A complex number type.
public import std.math; // Elementary mathematical functions (powers, roots, trigonometry).
public import std.mathspecial; // Families of transcendental functions.
public import std.numeric; // Floating point numerics functions.
public import std.random; // Pseudo-random number generators.
// String manipulation
public import std.string; // Algorithms that work specifically with strings.
public import std.array; // Manipulate builtin arrays.
public import std.algorithm; // Generic algorithms for processing sequences.
public import std.uni; // Fundamental Unicode algorithms and data structures.
public import std.utf; // Encode and decode UTF-8, UTF-16 and UTF-32 strings.
public import std.format; // Format data into strings.
public import std.path; // Manipulate strings that represent filesystem paths.
public import std.regex; // Regular expressions.
public import std.ascii; // Routines specific to the ASCII subset of Unicode.
public import std.encoding; // Handle and transcode between various text encodings.
public import std.windows.charset; // Windows specific character set support.
public import std.outbuffer; // Serialize data to ubyte arrays.

// Dub
public import vibe.d;

// UIM
public import uim.core;
public import uim.bootstrap;
public import uim.javascript;
public import uim.html;
// public import uim.mongo;
public import uim.oop;
// // public import uim.web;
public import uim.apps;
public import uim.servers;

// uim-cms
public import uim.cms.controllers;
public import uim.cms.data;
public import uim.cms.javascripts;
public import uim.cms.layouts;
public import uim.cms.translations;
public import uim.cms.views;

auto editorSummary = `const editorSummary = KothingEditor.create("entity_summary", {
  display: "block",
  width: "100%",
  height: "auto",
  popupDisplay: "full",
  katex: katex,
  toolbarItem: [
    ["undo", "redo"],
    ["font", "fontSize", "formatBlock"],
    ["bold", "underline", "italic", "strike", "subscript", "superscript", "fontColor", "hiliteColor"],
    ["outdent", "indent", "align", "list", "horizontalRule"],
    ["link", "table", "image", "audio", "video"],
    ["lineHeight", "paragraphStyle", "textStyle"],
    ["showBlocks", "codeView"],
    ["math"],
    ["preview", "print", "fullScreen"],
    ["save", "template"],
    ["removeFormat"],
  ],
  templates: [
    {
      name: "Template-1",
      html: "<p>HTML source1</p>",
    },
    {
      name: "Template-2",
      html: "<p>HTML source2</p>",
    },
  ],
  charCounter: true,
});`;

auto editorText = `const editorText = KothingEditor.create("entity_text", {
  display: "block",
  width: "100%",
  height: "auto",
  popupDisplay: "full",
  katex: katex,
  toolbarItem: [
    ["undo", "redo"],
    ["font", "fontSize", "formatBlock"],
    ["bold", "underline", "italic", "strike", "subscript", "superscript", "fontColor", "hiliteColor"],
    ["outdent", "indent", "align", "list", "horizontalRule"],
    ["link", "table", "image", "audio", "video"],
    ["lineHeight", "paragraphStyle", "textStyle"],
    ["showBlocks", "codeView"],
    ["math"],
    ["preview", "print", "fullScreen"],
    ["save", "template"],
    ["removeFormat"],
  ],
  templates: [
    {
      name: "Template-1",
      html: "<p>HTML source1</p>",
    },
    {
      name: "Template-2",
      html: "<p>HTML source2</p>",
    },
  ],
  charCounter: true,
});`;
