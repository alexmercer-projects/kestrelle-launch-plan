"""Trim the empty paper-colored strip Chrome leaves under a full-page screenshot."""
import sys
from PIL import Image
for name in sys.argv[1:]:
    im = Image.open(name).convert("RGB"); w, h = im.size; px = im.load(); bg = px[w // 2, h - 3]
    same = lambda a: all(abs(x - y) < 4 for x, y in zip(a, bg))
    y = h - 1
    while y > 0 and same(px[w // 2, y]) and same(px[4, y]) and same(px[w - 4, y]):
        y -= 1
    im.crop((0, 0, w, y + 1)).save(name)
    print(name, w, y + 1)
