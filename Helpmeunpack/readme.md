# The Problem statement

The challenge is to receive bytes and extract some numbers from those bytes.
Connect to the problem endpoint, grab a base64-encoded pack of bytes, unpack the required values from it and send them back.

The pack contains, always in the following order:

- a regular int (signed), to start off
- an unsigned int
- a short (signed) to make things interesting
- a float because floating point is important
- a double as well
- another double but this time in big endian (network byte order)