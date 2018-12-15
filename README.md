# wrceletter
### D Evangelista
Letterhead format for US Naval Academy Dept of Weapons, Robotics, and Control Engineering. The letterhead is based on the .docx file provided by the department called "stationary[sic] with line.docx". The example is based on the Navy Correspondence Manual. The docx had graphics that were low resolution and un-usable, so I had to re-generate them. Also, the docx uses a mix of Garamond and Calibri (?) while the Navy Correspondence Manual specifies Times New Roman. 

## How to get this package
Clone the repository into your `texmf` tree. 
```bash
git clone https://github.com/devangel77b/wrceletter
```
On Ubuntu machines, your `texmf` is typically within your home directory (usually `/home/username/texmf`). The files should probably go within `~/texmf/tex/latex` somehwere). After placing the files in your `texmf` tree you will want to call `sudo texhash`. 

On Windows machines using Miktex I usually put the files in a `texmf` tree under `This PC > Documents` for example. After placing the files in your `texmf` tree you will want to use the Miktex admin tools to refresh files. 

## Examples
See the examples using `\documentclass{wrceletter}`, which is derived from `\documentclass{letter}`. 

## Contributors
D Evangelista

## Thanks to
The Latex class was based on similar letterhead classes from Cornell, Stanford, MIT, and University of Wisconsin CS dept. 
