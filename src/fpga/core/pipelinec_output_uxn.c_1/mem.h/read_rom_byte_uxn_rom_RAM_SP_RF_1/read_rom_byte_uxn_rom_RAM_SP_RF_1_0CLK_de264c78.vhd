-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 0
entity read_rom_byte_uxn_rom_RAM_SP_RF_1_0CLK_de264c78 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 addr0 : in unsigned(9 downto 0);
 wd : in unsigned(7 downto 0);
 we : in unsigned(0 downto 0);
 return_output : out unsigned(7 downto 0));
end read_rom_byte_uxn_rom_RAM_SP_RF_1_0CLK_de264c78;
architecture arch of read_rom_byte_uxn_rom_RAM_SP_RF_1_0CLK_de264c78 is

  signal addr : unsigned(9 downto 0) := to_unsigned(0, 10);

  signal uxn_rom : uint8_t_1024 := (
0 => to_unsigned(224, 8),
1 => to_unsigned(0, 8),
2 => to_unsigned(0, 8),
3 => to_unsigned(96, 8),
4 => to_unsigned(0, 8),
5 => to_unsigned(208, 8),
6 => to_unsigned(98, 8),
7 => to_unsigned(0, 8),
8 => to_unsigned(0, 8),
9 => to_unsigned(0, 8),
10 => to_unsigned(0, 8),
11 => to_unsigned(0, 8),
12 => to_unsigned(0, 8),
13 => to_unsigned(0, 8),
14 => to_unsigned(0, 8),
15 => to_unsigned(0, 8),
16 => to_unsigned(0, 8),
17 => to_unsigned(0, 8),
18 => to_unsigned(0, 8),
19 => to_unsigned(0, 8),
20 => to_unsigned(0, 8),
21 => to_unsigned(0, 8),
22 => to_unsigned(0, 8),
23 => to_unsigned(0, 8),
24 => to_unsigned(103, 8),
25 => to_unsigned(224, 8),
26 => to_unsigned(0, 8),
27 => to_unsigned(6, 8),
28 => to_unsigned(121, 8),
29 => to_unsigned(239, 8),
30 => to_unsigned(160, 8),
31 => to_unsigned(0, 8),
32 => to_unsigned(4, 8),
33 => to_unsigned(56, 8),
34 => to_unsigned(53, 8),
35 => to_unsigned(239, 8),
36 => to_unsigned(33, 8),
37 => to_unsigned(33, 8),
38 => to_unsigned(53, 8),
39 => to_unsigned(160, 8),
40 => to_unsigned(0, 8),
41 => to_unsigned(1, 8),
42 => to_unsigned(239, 8),
43 => to_unsigned(53, 8),
44 => to_unsigned(239, 8),
45 => to_unsigned(160, 8),
46 => to_unsigned(0, 8),
47 => to_unsigned(4, 8),
48 => to_unsigned(56, 8),
49 => to_unsigned(52, 8),
50 => to_unsigned(160, 8),
51 => to_unsigned(128, 8),
52 => to_unsigned(0, 8),
53 => to_unsigned(60, 8),
54 => to_unsigned(160, 8),
55 => to_unsigned(0, 8),
56 => to_unsigned(0, 8),
57 => to_unsigned(40, 8),
58 => to_unsigned(32, 8),
59 => to_unsigned(0, 8),
60 => to_unsigned(24, 8),
61 => to_unsigned(160, 8),
62 => to_unsigned(0, 8),
63 => to_unsigned(0, 8),
64 => to_unsigned(239, 8),
65 => to_unsigned(160, 8),
66 => to_unsigned(0, 8),
67 => to_unsigned(4, 8),
68 => to_unsigned(56, 8),
69 => to_unsigned(52, 8),
70 => to_unsigned(57, 8),
71 => to_unsigned(239, 8),
72 => to_unsigned(160, 8),
73 => to_unsigned(0, 8),
74 => to_unsigned(4, 8),
75 => to_unsigned(56, 8),
76 => to_unsigned(53, 8),
77 => to_unsigned(239, 8),
78 => to_unsigned(180, 8),
79 => to_unsigned(160, 8),
80 => to_unsigned(255, 8),
81 => to_unsigned(255, 8),
82 => to_unsigned(58, 8),
83 => to_unsigned(36, 8),
84 => to_unsigned(53, 8),
85 => to_unsigned(239, 8),
86 => to_unsigned(33, 8),
87 => to_unsigned(33, 8),
88 => to_unsigned(52, 8),
89 => to_unsigned(160, 8),
90 => to_unsigned(128, 8),
91 => to_unsigned(0, 8),
92 => to_unsigned(60, 8),
93 => to_unsigned(160, 8),
94 => to_unsigned(0, 8),
95 => to_unsigned(0, 8),
96 => to_unsigned(40, 8),
97 => to_unsigned(32, 8),
98 => to_unsigned(0, 8),
99 => to_unsigned(20, 8),
100 => to_unsigned(160, 8),
101 => to_unsigned(0, 8),
102 => to_unsigned(0, 8),
103 => to_unsigned(239, 8),
104 => to_unsigned(33, 8),
105 => to_unsigned(33, 8),
106 => to_unsigned(52, 8),
107 => to_unsigned(57, 8),
108 => to_unsigned(239, 8),
109 => to_unsigned(33, 8),
110 => to_unsigned(33, 8),
111 => to_unsigned(53, 8),
112 => to_unsigned(239, 8),
113 => to_unsigned(180, 8),
114 => to_unsigned(160, 8),
115 => to_unsigned(255, 8),
116 => to_unsigned(255, 8),
117 => to_unsigned(58, 8),
118 => to_unsigned(36, 8),
119 => to_unsigned(53, 8),
120 => to_unsigned(239, 8),
121 => to_unsigned(52, 8),
122 => to_unsigned(239, 8),
123 => to_unsigned(33, 8),
124 => to_unsigned(33, 8),
125 => to_unsigned(52, 8),
126 => to_unsigned(160, 8),
127 => to_unsigned(0, 8),
128 => to_unsigned(255, 8),
129 => to_unsigned(60, 8),
130 => to_unsigned(239, 8),
131 => to_unsigned(160, 8),
132 => to_unsigned(0, 8),
133 => to_unsigned(4, 8),
134 => to_unsigned(56, 8),
135 => to_unsigned(52, 8),
136 => to_unsigned(160, 8),
137 => to_unsigned(0, 8),
138 => to_unsigned(255, 8),
139 => to_unsigned(60, 8),
140 => to_unsigned(58, 8),
141 => to_unsigned(128, 8),
142 => to_unsigned(8, 8),
143 => to_unsigned(63, 8),
144 => to_unsigned(239, 8),
145 => to_unsigned(33, 8),
146 => to_unsigned(33, 8),
147 => to_unsigned(52, 8),
148 => to_unsigned(160, 8),
149 => to_unsigned(0, 8),
150 => to_unsigned(255, 8),
151 => to_unsigned(60, 8),
152 => to_unsigned(239, 8),
153 => to_unsigned(160, 8),
154 => to_unsigned(0, 8),
155 => to_unsigned(4, 8),
156 => to_unsigned(56, 8),
157 => to_unsigned(52, 8),
158 => to_unsigned(128, 8),
159 => to_unsigned(8, 8),
160 => to_unsigned(63, 8),
161 => to_unsigned(58, 8),
162 => to_unsigned(56, 8),
163 => to_unsigned(239, 8),
164 => to_unsigned(33, 8),
165 => to_unsigned(33, 8),
166 => to_unsigned(52, 8),
167 => to_unsigned(128, 8),
168 => to_unsigned(8, 8),
169 => to_unsigned(63, 8),
170 => to_unsigned(239, 8),
171 => to_unsigned(160, 8),
172 => to_unsigned(0, 8),
173 => to_unsigned(4, 8),
174 => to_unsigned(56, 8),
175 => to_unsigned(52, 8),
176 => to_unsigned(160, 8),
177 => to_unsigned(0, 8),
178 => to_unsigned(255, 8),
179 => to_unsigned(60, 8),
180 => to_unsigned(58, 8),
181 => to_unsigned(56, 8),
182 => to_unsigned(239, 8),
183 => to_unsigned(33, 8),
184 => to_unsigned(33, 8),
185 => to_unsigned(52, 8),
186 => to_unsigned(128, 8),
187 => to_unsigned(8, 8),
188 => to_unsigned(63, 8),
189 => to_unsigned(239, 8),
190 => to_unsigned(160, 8),
191 => to_unsigned(0, 8),
192 => to_unsigned(4, 8),
193 => to_unsigned(56, 8),
194 => to_unsigned(52, 8),
195 => to_unsigned(128, 8),
196 => to_unsigned(8, 8),
197 => to_unsigned(63, 8),
198 => to_unsigned(58, 8),
199 => to_unsigned(160, 8),
200 => to_unsigned(8, 8),
201 => to_unsigned(64, 8),
202 => to_unsigned(31, 8),
203 => to_unsigned(63, 8),
204 => to_unsigned(56, 8),
205 => to_unsigned(58, 8),
206 => to_unsigned(64, 8),
207 => to_unsigned(0, 8),
208 => to_unsigned(3, 8),
209 => to_unsigned(160, 8),
210 => to_unsigned(0, 8),
211 => to_unsigned(0, 8),
212 => to_unsigned(98, 8),
213 => to_unsigned(108, 8),
214 => to_unsigned(103, 8),
215 => to_unsigned(160, 8),
216 => to_unsigned(8, 8),
217 => to_unsigned(223, 8),
218 => to_unsigned(128, 8),
219 => to_unsigned(8, 8),
220 => to_unsigned(55, 8),
221 => to_unsigned(160, 8),
222 => to_unsigned(18, 8),
223 => to_unsigned(191, 8),
224 => to_unsigned(128, 8),
225 => to_unsigned(10, 8),
226 => to_unsigned(55, 8),
227 => to_unsigned(160, 8),
228 => to_unsigned(84, 8),
229 => to_unsigned(157, 8),
230 => to_unsigned(128, 8),
231 => to_unsigned(12, 8),
232 => to_unsigned(55, 8),
233 => to_unsigned(160, 8),
234 => to_unsigned(1, 8),
235 => to_unsigned(64, 8),
236 => to_unsigned(128, 8),
237 => to_unsigned(34, 8),
238 => to_unsigned(55, 8),
239 => to_unsigned(160, 8),
240 => to_unsigned(1, 8),
241 => to_unsigned(32, 8),
242 => to_unsigned(128, 8),
243 => to_unsigned(36, 8),
244 => to_unsigned(55, 8),
245 => to_unsigned(160, 8),
246 => to_unsigned(255, 8),
247 => to_unsigned(0, 8),
248 => to_unsigned(160, 8),
249 => to_unsigned(1, 8),
250 => to_unsigned(22, 8),
251 => to_unsigned(53, 8),
252 => to_unsigned(160, 8),
253 => to_unsigned(1, 8),
254 => to_unsigned(22, 8),
255 => to_unsigned(52, 8),
256 => to_unsigned(160, 8),
257 => to_unsigned(128, 8),
258 => to_unsigned(0, 8),
259 => to_unsigned(62, 8),
260 => to_unsigned(160, 8),
261 => to_unsigned(128, 8),
262 => to_unsigned(64, 8),
263 => to_unsigned(43, 8),
264 => to_unsigned(128, 8),
265 => to_unsigned(0, 8),
266 => to_unsigned(8, 8),
267 => to_unsigned(32, 8),
268 => to_unsigned(1, 8),
269 => to_unsigned(24, 8),
270 => to_unsigned(160, 8),
271 => to_unsigned(255, 8),
272 => to_unsigned(112, 8),
273 => to_unsigned(160, 8),
274 => to_unsigned(1, 8),
275 => to_unsigned(20, 8),
276 => to_unsigned(53, 8),
277 => to_unsigned(160, 8),
278 => to_unsigned(1, 8),
279 => to_unsigned(20, 8),
280 => to_unsigned(52, 8),
281 => to_unsigned(160, 8),
282 => to_unsigned(128, 8),
283 => to_unsigned(0, 8),
284 => to_unsigned(62, 8),
285 => to_unsigned(160, 8),
286 => to_unsigned(128, 8),
287 => to_unsigned(0, 8),
288 => to_unsigned(42, 8),
289 => to_unsigned(128, 8),
290 => to_unsigned(0, 8),
291 => to_unsigned(4, 8),
292 => to_unsigned(128, 8),
293 => to_unsigned(1, 8),
294 => to_unsigned(30, 8),
295 => to_unsigned(160, 8),
296 => to_unsigned(0, 8),
297 => to_unsigned(0, 8),
298 => to_unsigned(40, 8),
299 => to_unsigned(32, 8),
300 => to_unsigned(0, 8),
301 => to_unsigned(238, 8),
302 => to_unsigned(160, 8),
303 => to_unsigned(0, 8),
304 => to_unsigned(0, 8),
305 => to_unsigned(160, 8),
306 => to_unsigned(1, 8),
307 => to_unsigned(18, 8),
308 => to_unsigned(53, 8),
309 => to_unsigned(160, 8),
310 => to_unsigned(0, 8),
311 => to_unsigned(0, 8),
312 => to_unsigned(160, 8),
313 => to_unsigned(1, 8),
314 => to_unsigned(16, 8),
315 => to_unsigned(53, 8),
316 => to_unsigned(160, 8),
317 => to_unsigned(0, 8),
318 => to_unsigned(0, 8),
319 => to_unsigned(160, 8),
320 => to_unsigned(1, 8),
321 => to_unsigned(14, 8),
322 => to_unsigned(53, 8),
323 => to_unsigned(160, 8),
324 => to_unsigned(1, 8),
325 => to_unsigned(14, 8),
326 => to_unsigned(52, 8),
327 => to_unsigned(160, 8),
328 => to_unsigned(128, 8),
329 => to_unsigned(0, 8),
330 => to_unsigned(62, 8),
331 => to_unsigned(160, 8),
332 => to_unsigned(128, 8),
333 => to_unsigned(25, 8),
334 => to_unsigned(43, 8),
335 => to_unsigned(128, 8),
336 => to_unsigned(0, 8),
337 => to_unsigned(8, 8),
338 => to_unsigned(32, 8),
339 => to_unsigned(0, 8),
340 => to_unsigned(115, 8),
341 => to_unsigned(160, 8),
342 => to_unsigned(132, 8),
343 => to_unsigned(0, 8),
344 => to_unsigned(160, 8),
345 => to_unsigned(1, 8),
346 => to_unsigned(18, 8),
347 => to_unsigned(52, 8),
348 => to_unsigned(160, 8),
349 => to_unsigned(1, 8),
350 => to_unsigned(18, 8),
351 => to_unsigned(52, 8),
352 => to_unsigned(96, 8),
353 => to_unsigned(254, 8),
354 => to_unsigned(181, 8),
355 => to_unsigned(160, 8),
356 => to_unsigned(1, 8),
357 => to_unsigned(12, 8),
358 => to_unsigned(181, 8),
359 => to_unsigned(34, 8),
360 => to_unsigned(160, 8),
361 => to_unsigned(1, 8),
362 => to_unsigned(16, 8),
363 => to_unsigned(52, 8),
364 => to_unsigned(160, 8),
365 => to_unsigned(1, 8),
366 => to_unsigned(16, 8),
367 => to_unsigned(52, 8),
368 => to_unsigned(96, 8),
369 => to_unsigned(254, 8),
370 => to_unsigned(165, 8),
371 => to_unsigned(160, 8),
372 => to_unsigned(1, 8),
373 => to_unsigned(10, 8),
374 => to_unsigned(181, 8),
375 => to_unsigned(34, 8),
376 => to_unsigned(56, 8),
377 => to_unsigned(160, 8),
378 => to_unsigned(128, 8),
379 => to_unsigned(0, 8),
380 => to_unsigned(62, 8),
381 => to_unsigned(43, 8),
382 => to_unsigned(128, 8),
383 => to_unsigned(0, 8),
384 => to_unsigned(8, 8),
385 => to_unsigned(32, 8),
386 => to_unsigned(0, 8),
387 => to_unsigned(3, 8),
388 => to_unsigned(64, 8),
389 => to_unsigned(0, 8),
390 => to_unsigned(65, 8),
391 => to_unsigned(160, 8),
392 => to_unsigned(1, 8),
393 => to_unsigned(12, 8),
394 => to_unsigned(52, 8),
395 => to_unsigned(160, 8),
396 => to_unsigned(1, 8),
397 => to_unsigned(10, 8),
398 => to_unsigned(52, 8),
399 => to_unsigned(57, 8),
400 => to_unsigned(160, 8),
401 => to_unsigned(1, 8),
402 => to_unsigned(22, 8),
403 => to_unsigned(52, 8),
404 => to_unsigned(128, 8),
405 => to_unsigned(16, 8),
406 => to_unsigned(63, 8),
407 => to_unsigned(56, 8),
408 => to_unsigned(160, 8),
409 => to_unsigned(1, 8),
410 => to_unsigned(8, 8),
411 => to_unsigned(53, 8),
412 => to_unsigned(160, 8),
413 => to_unsigned(1, 8),
414 => to_unsigned(16, 8),
415 => to_unsigned(52, 8),
416 => to_unsigned(160, 8),
417 => to_unsigned(1, 8),
418 => to_unsigned(18, 8),
419 => to_unsigned(52, 8),
420 => to_unsigned(96, 8),
421 => to_unsigned(254, 8),
422 => to_unsigned(113, 8),
423 => to_unsigned(128, 8),
424 => to_unsigned(16, 8),
425 => to_unsigned(63, 8),
426 => to_unsigned(160, 8),
427 => to_unsigned(1, 8),
428 => to_unsigned(20, 8),
429 => to_unsigned(52, 8),
430 => to_unsigned(128, 8),
431 => to_unsigned(16, 8),
432 => to_unsigned(63, 8),
433 => to_unsigned(56, 8),
434 => to_unsigned(160, 8),
435 => to_unsigned(1, 8),
436 => to_unsigned(16, 8),
437 => to_unsigned(53, 8),
438 => to_unsigned(160, 8),
439 => to_unsigned(1, 8),
440 => to_unsigned(8, 8),
441 => to_unsigned(52, 8),
442 => to_unsigned(160, 8),
443 => to_unsigned(1, 8),
444 => to_unsigned(18, 8),
445 => to_unsigned(53, 8),
446 => to_unsigned(160, 8),
447 => to_unsigned(1, 8),
448 => to_unsigned(14, 8),
449 => to_unsigned(180, 8),
450 => to_unsigned(33, 8),
451 => to_unsigned(36, 8),
452 => to_unsigned(53, 8),
453 => to_unsigned(64, 8),
454 => to_unsigned(255, 8),
455 => to_unsigned(123, 8),
456 => to_unsigned(160, 8),
457 => to_unsigned(1, 8),
458 => to_unsigned(14, 8),
459 => to_unsigned(52, 8),
460 => to_unsigned(160, 8),
461 => to_unsigned(1, 8),
462 => to_unsigned(22, 8),
463 => to_unsigned(52, 8),
464 => to_unsigned(160, 8),
465 => to_unsigned(1, 8),
466 => to_unsigned(20, 8),
467 => to_unsigned(52, 8),
468 => to_unsigned(56, 8),
469 => to_unsigned(160, 8),
470 => to_unsigned(0, 8),
471 => to_unsigned(1, 8),
472 => to_unsigned(60, 8),
473 => to_unsigned(56, 8),
474 => to_unsigned(128, 8),
475 => to_unsigned(3, 8),
476 => to_unsigned(63, 8),
477 => to_unsigned(160, 8),
478 => to_unsigned(1, 8),
479 => to_unsigned(8, 8),
480 => to_unsigned(53, 8),
481 => to_unsigned(160, 8),
482 => to_unsigned(1, 8),
483 => to_unsigned(22, 8),
484 => to_unsigned(52, 8),
485 => to_unsigned(160, 8),
486 => to_unsigned(1, 8),
487 => to_unsigned(0, 8),
488 => to_unsigned(56, 8),
489 => to_unsigned(128, 8),
490 => to_unsigned(40, 8),
491 => to_unsigned(55, 8),
492 => to_unsigned(160, 8),
493 => to_unsigned(1, 8),
494 => to_unsigned(20, 8),
495 => to_unsigned(52, 8),
496 => to_unsigned(160, 8),
497 => to_unsigned(0, 8),
498 => to_unsigned(144, 8),
499 => to_unsigned(56, 8),
500 => to_unsigned(128, 8),
501 => to_unsigned(42, 8),
502 => to_unsigned(55, 8),
503 => to_unsigned(160, 8),
504 => to_unsigned(1, 8),
505 => to_unsigned(8, 8),
506 => to_unsigned(52, 8),
507 => to_unsigned(3, 8),
508 => to_unsigned(128, 8),
509 => to_unsigned(46, 8),
510 => to_unsigned(23, 8),
511 => to_unsigned(160, 8),
512 => to_unsigned(0, 8),
513 => to_unsigned(144, 8),
514 => to_unsigned(160, 8),
515 => to_unsigned(1, 8),
516 => to_unsigned(20, 8),
517 => to_unsigned(52, 8),
518 => to_unsigned(57, 8),
519 => to_unsigned(128, 8),
520 => to_unsigned(42, 8),
521 => to_unsigned(55, 8),
522 => to_unsigned(160, 8),
523 => to_unsigned(1, 8),
524 => to_unsigned(8, 8),
525 => to_unsigned(52, 8),
526 => to_unsigned(3, 8),
527 => to_unsigned(128, 8),
528 => to_unsigned(46, 8),
529 => to_unsigned(23, 8),
530 => to_unsigned(160, 8),
531 => to_unsigned(1, 8),
532 => to_unsigned(20, 8),
533 => to_unsigned(180, 8),
534 => to_unsigned(33, 8),
535 => to_unsigned(36, 8),
536 => to_unsigned(53, 8),
537 => to_unsigned(64, 8),
538 => to_unsigned(254, 8),
539 => to_unsigned(249, 8),
540 => to_unsigned(160, 8),
541 => to_unsigned(1, 8),
542 => to_unsigned(22, 8),
543 => to_unsigned(180, 8),
544 => to_unsigned(33, 8),
545 => to_unsigned(36, 8),
546 => to_unsigned(53, 8),
547 => to_unsigned(64, 8),
548 => to_unsigned(254, 8),
549 => to_unsigned(214, 8),
550 => to_unsigned(160, 8),
551 => to_unsigned(0, 8),
552 => to_unsigned(0, 8),
553 => to_unsigned(98, 8),
554 => to_unsigned(108, 8),
555 => to_unsigned(0, 8),
556 => to_unsigned(0, 8),
557 => to_unsigned(0, 8),
558 => to_unsigned(0, 8),
559 => to_unsigned(0, 8),
560 => to_unsigned(0, 8),
561 => to_unsigned(0, 8),
562 => to_unsigned(0, 8),
563 => to_unsigned(0, 8),
564 => to_unsigned(0, 8),
565 => to_unsigned(0, 8),
566 => to_unsigned(0, 8),
567 => to_unsigned(0, 8),
568 => to_unsigned(0, 8),
569 => to_unsigned(0, 8),
570 => to_unsigned(0, 8),
571 => to_unsigned(0, 8),
572 => to_unsigned(0, 8),
573 => to_unsigned(0, 8),
574 => to_unsigned(0, 8),
575 => to_unsigned(0, 8),
576 => to_unsigned(0, 8),
577 => to_unsigned(0, 8),
578 => to_unsigned(0, 8),
579 => to_unsigned(0, 8),
580 => to_unsigned(0, 8),
581 => to_unsigned(0, 8),
582 => to_unsigned(0, 8),
583 => to_unsigned(0, 8),
584 => to_unsigned(0, 8),
585 => to_unsigned(0, 8),
586 => to_unsigned(0, 8),
587 => to_unsigned(0, 8),
588 => to_unsigned(0, 8),
589 => to_unsigned(0, 8),
590 => to_unsigned(0, 8),
591 => to_unsigned(0, 8),
592 => to_unsigned(0, 8),
593 => to_unsigned(0, 8),
594 => to_unsigned(0, 8),
595 => to_unsigned(0, 8),
596 => to_unsigned(0, 8),
597 => to_unsigned(0, 8),
598 => to_unsigned(0, 8),
599 => to_unsigned(0, 8),
600 => to_unsigned(0, 8),
601 => to_unsigned(0, 8),
602 => to_unsigned(0, 8),
603 => to_unsigned(0, 8),
604 => to_unsigned(0, 8),
605 => to_unsigned(0, 8),
606 => to_unsigned(0, 8),
607 => to_unsigned(0, 8),
608 => to_unsigned(0, 8),
609 => to_unsigned(0, 8),
610 => to_unsigned(0, 8),
611 => to_unsigned(0, 8),
612 => to_unsigned(0, 8),
613 => to_unsigned(0, 8),
614 => to_unsigned(0, 8),
615 => to_unsigned(0, 8),
616 => to_unsigned(0, 8),
617 => to_unsigned(0, 8),
618 => to_unsigned(0, 8),
619 => to_unsigned(0, 8),
620 => to_unsigned(0, 8),
621 => to_unsigned(0, 8),
622 => to_unsigned(0, 8),
623 => to_unsigned(0, 8),
624 => to_unsigned(0, 8),
625 => to_unsigned(0, 8),
626 => to_unsigned(0, 8),
627 => to_unsigned(0, 8),
628 => to_unsigned(0, 8),
629 => to_unsigned(0, 8),
630 => to_unsigned(0, 8),
631 => to_unsigned(0, 8),
632 => to_unsigned(0, 8),
633 => to_unsigned(0, 8),
634 => to_unsigned(0, 8),
635 => to_unsigned(0, 8),
636 => to_unsigned(0, 8),
637 => to_unsigned(0, 8),
638 => to_unsigned(0, 8),
639 => to_unsigned(0, 8),
640 => to_unsigned(0, 8),
641 => to_unsigned(0, 8),
642 => to_unsigned(0, 8),
643 => to_unsigned(0, 8),
644 => to_unsigned(0, 8),
645 => to_unsigned(0, 8),
646 => to_unsigned(0, 8),
647 => to_unsigned(0, 8),
648 => to_unsigned(0, 8),
649 => to_unsigned(0, 8),
650 => to_unsigned(0, 8),
651 => to_unsigned(0, 8),
652 => to_unsigned(0, 8),
653 => to_unsigned(0, 8),
654 => to_unsigned(0, 8),
655 => to_unsigned(0, 8),
656 => to_unsigned(0, 8),
657 => to_unsigned(0, 8),
658 => to_unsigned(0, 8),
659 => to_unsigned(0, 8),
660 => to_unsigned(0, 8),
661 => to_unsigned(0, 8),
662 => to_unsigned(0, 8),
663 => to_unsigned(0, 8),
664 => to_unsigned(0, 8),
665 => to_unsigned(0, 8),
666 => to_unsigned(0, 8),
667 => to_unsigned(0, 8),
668 => to_unsigned(0, 8),
669 => to_unsigned(0, 8),
670 => to_unsigned(0, 8),
671 => to_unsigned(0, 8),
672 => to_unsigned(0, 8),
673 => to_unsigned(0, 8),
674 => to_unsigned(0, 8),
675 => to_unsigned(0, 8),
676 => to_unsigned(0, 8),
677 => to_unsigned(0, 8),
678 => to_unsigned(0, 8),
679 => to_unsigned(0, 8),
680 => to_unsigned(0, 8),
681 => to_unsigned(0, 8),
682 => to_unsigned(0, 8),
683 => to_unsigned(0, 8),
684 => to_unsigned(0, 8),
685 => to_unsigned(0, 8),
686 => to_unsigned(0, 8),
687 => to_unsigned(0, 8),
688 => to_unsigned(0, 8),
689 => to_unsigned(0, 8),
690 => to_unsigned(0, 8),
691 => to_unsigned(0, 8),
692 => to_unsigned(0, 8),
693 => to_unsigned(0, 8),
694 => to_unsigned(0, 8),
695 => to_unsigned(0, 8),
696 => to_unsigned(0, 8),
697 => to_unsigned(0, 8),
698 => to_unsigned(0, 8),
699 => to_unsigned(0, 8),
700 => to_unsigned(0, 8),
701 => to_unsigned(0, 8),
702 => to_unsigned(0, 8),
703 => to_unsigned(0, 8),
704 => to_unsigned(0, 8),
705 => to_unsigned(0, 8),
706 => to_unsigned(0, 8),
707 => to_unsigned(0, 8),
708 => to_unsigned(0, 8),
709 => to_unsigned(0, 8),
710 => to_unsigned(0, 8),
711 => to_unsigned(0, 8),
712 => to_unsigned(0, 8),
713 => to_unsigned(0, 8),
714 => to_unsigned(0, 8),
715 => to_unsigned(0, 8),
716 => to_unsigned(0, 8),
717 => to_unsigned(0, 8),
718 => to_unsigned(0, 8),
719 => to_unsigned(0, 8),
720 => to_unsigned(0, 8),
721 => to_unsigned(0, 8),
722 => to_unsigned(0, 8),
723 => to_unsigned(0, 8),
724 => to_unsigned(0, 8),
725 => to_unsigned(0, 8),
726 => to_unsigned(0, 8),
727 => to_unsigned(0, 8),
728 => to_unsigned(0, 8),
729 => to_unsigned(0, 8),
730 => to_unsigned(0, 8),
731 => to_unsigned(0, 8),
732 => to_unsigned(0, 8),
733 => to_unsigned(0, 8),
734 => to_unsigned(0, 8),
735 => to_unsigned(0, 8),
736 => to_unsigned(0, 8),
737 => to_unsigned(0, 8),
738 => to_unsigned(0, 8),
739 => to_unsigned(0, 8),
740 => to_unsigned(0, 8),
741 => to_unsigned(0, 8),
742 => to_unsigned(0, 8),
743 => to_unsigned(0, 8),
744 => to_unsigned(0, 8),
745 => to_unsigned(0, 8),
746 => to_unsigned(0, 8),
747 => to_unsigned(0, 8),
748 => to_unsigned(0, 8),
749 => to_unsigned(0, 8),
750 => to_unsigned(0, 8),
751 => to_unsigned(0, 8),
752 => to_unsigned(0, 8),
753 => to_unsigned(0, 8),
754 => to_unsigned(0, 8),
755 => to_unsigned(0, 8),
756 => to_unsigned(0, 8),
757 => to_unsigned(0, 8),
758 => to_unsigned(0, 8),
759 => to_unsigned(0, 8),
760 => to_unsigned(0, 8),
761 => to_unsigned(0, 8),
762 => to_unsigned(0, 8),
763 => to_unsigned(0, 8),
764 => to_unsigned(0, 8),
765 => to_unsigned(0, 8),
766 => to_unsigned(0, 8),
767 => to_unsigned(0, 8),
768 => to_unsigned(0, 8),
769 => to_unsigned(0, 8),
770 => to_unsigned(0, 8),
771 => to_unsigned(0, 8),
772 => to_unsigned(0, 8),
773 => to_unsigned(0, 8),
774 => to_unsigned(0, 8),
775 => to_unsigned(0, 8),
776 => to_unsigned(0, 8),
777 => to_unsigned(0, 8),
778 => to_unsigned(0, 8),
779 => to_unsigned(0, 8),
780 => to_unsigned(0, 8),
781 => to_unsigned(0, 8),
782 => to_unsigned(0, 8),
783 => to_unsigned(0, 8),
784 => to_unsigned(0, 8),
785 => to_unsigned(0, 8),
786 => to_unsigned(0, 8),
787 => to_unsigned(0, 8),
788 => to_unsigned(0, 8),
789 => to_unsigned(0, 8),
790 => to_unsigned(0, 8),
791 => to_unsigned(0, 8),
792 => to_unsigned(0, 8),
793 => to_unsigned(0, 8),
794 => to_unsigned(0, 8),
795 => to_unsigned(0, 8),
796 => to_unsigned(0, 8),
797 => to_unsigned(0, 8),
798 => to_unsigned(0, 8),
799 => to_unsigned(0, 8),
800 => to_unsigned(0, 8),
801 => to_unsigned(0, 8),
802 => to_unsigned(0, 8),
803 => to_unsigned(0, 8),
804 => to_unsigned(0, 8),
805 => to_unsigned(0, 8),
806 => to_unsigned(0, 8),
807 => to_unsigned(0, 8),
808 => to_unsigned(0, 8),
809 => to_unsigned(0, 8),
810 => to_unsigned(0, 8),
811 => to_unsigned(0, 8),
812 => to_unsigned(0, 8),
813 => to_unsigned(0, 8),
814 => to_unsigned(0, 8),
815 => to_unsigned(0, 8),
816 => to_unsigned(0, 8),
817 => to_unsigned(0, 8),
818 => to_unsigned(0, 8),
819 => to_unsigned(0, 8),
820 => to_unsigned(0, 8),
821 => to_unsigned(0, 8),
822 => to_unsigned(0, 8),
823 => to_unsigned(0, 8),
824 => to_unsigned(0, 8),
825 => to_unsigned(0, 8),
826 => to_unsigned(0, 8),
827 => to_unsigned(0, 8),
828 => to_unsigned(0, 8),
829 => to_unsigned(0, 8),
830 => to_unsigned(0, 8),
831 => to_unsigned(0, 8),
832 => to_unsigned(0, 8),
833 => to_unsigned(0, 8),
834 => to_unsigned(0, 8),
835 => to_unsigned(0, 8),
836 => to_unsigned(0, 8),
837 => to_unsigned(0, 8),
838 => to_unsigned(0, 8),
839 => to_unsigned(0, 8),
840 => to_unsigned(0, 8),
841 => to_unsigned(0, 8),
842 => to_unsigned(0, 8),
843 => to_unsigned(0, 8),
844 => to_unsigned(0, 8),
845 => to_unsigned(0, 8),
846 => to_unsigned(0, 8),
847 => to_unsigned(0, 8),
848 => to_unsigned(0, 8),
849 => to_unsigned(0, 8),
850 => to_unsigned(0, 8),
851 => to_unsigned(0, 8),
852 => to_unsigned(0, 8),
853 => to_unsigned(0, 8),
854 => to_unsigned(0, 8),
855 => to_unsigned(0, 8),
856 => to_unsigned(0, 8),
857 => to_unsigned(0, 8),
858 => to_unsigned(0, 8),
859 => to_unsigned(0, 8),
860 => to_unsigned(0, 8),
861 => to_unsigned(0, 8),
862 => to_unsigned(0, 8),
863 => to_unsigned(0, 8),
864 => to_unsigned(0, 8),
865 => to_unsigned(0, 8),
866 => to_unsigned(0, 8),
867 => to_unsigned(0, 8),
868 => to_unsigned(0, 8),
869 => to_unsigned(0, 8),
870 => to_unsigned(0, 8),
871 => to_unsigned(0, 8),
872 => to_unsigned(0, 8),
873 => to_unsigned(0, 8),
874 => to_unsigned(0, 8),
875 => to_unsigned(0, 8),
876 => to_unsigned(0, 8),
877 => to_unsigned(0, 8),
878 => to_unsigned(0, 8),
879 => to_unsigned(0, 8),
880 => to_unsigned(0, 8),
881 => to_unsigned(0, 8),
882 => to_unsigned(0, 8),
883 => to_unsigned(0, 8),
884 => to_unsigned(0, 8),
885 => to_unsigned(0, 8),
886 => to_unsigned(0, 8),
887 => to_unsigned(0, 8),
888 => to_unsigned(0, 8),
889 => to_unsigned(0, 8),
890 => to_unsigned(0, 8),
891 => to_unsigned(0, 8),
892 => to_unsigned(0, 8),
893 => to_unsigned(0, 8),
894 => to_unsigned(0, 8),
895 => to_unsigned(0, 8),
896 => to_unsigned(0, 8),
897 => to_unsigned(0, 8),
898 => to_unsigned(0, 8),
899 => to_unsigned(0, 8),
900 => to_unsigned(0, 8),
901 => to_unsigned(0, 8),
902 => to_unsigned(0, 8),
903 => to_unsigned(0, 8),
904 => to_unsigned(0, 8),
905 => to_unsigned(0, 8),
906 => to_unsigned(0, 8),
907 => to_unsigned(0, 8),
908 => to_unsigned(0, 8),
909 => to_unsigned(0, 8),
910 => to_unsigned(0, 8),
911 => to_unsigned(0, 8),
912 => to_unsigned(0, 8),
913 => to_unsigned(0, 8),
914 => to_unsigned(0, 8),
915 => to_unsigned(0, 8),
916 => to_unsigned(0, 8),
917 => to_unsigned(0, 8),
918 => to_unsigned(0, 8),
919 => to_unsigned(0, 8),
920 => to_unsigned(0, 8),
921 => to_unsigned(0, 8),
922 => to_unsigned(0, 8),
923 => to_unsigned(0, 8),
924 => to_unsigned(0, 8),
925 => to_unsigned(0, 8),
926 => to_unsigned(0, 8),
927 => to_unsigned(0, 8),
928 => to_unsigned(0, 8),
929 => to_unsigned(0, 8),
930 => to_unsigned(0, 8),
931 => to_unsigned(0, 8),
932 => to_unsigned(0, 8),
933 => to_unsigned(0, 8),
934 => to_unsigned(0, 8),
935 => to_unsigned(0, 8),
936 => to_unsigned(0, 8),
937 => to_unsigned(0, 8),
938 => to_unsigned(0, 8),
939 => to_unsigned(0, 8),
940 => to_unsigned(0, 8),
941 => to_unsigned(0, 8),
942 => to_unsigned(0, 8),
943 => to_unsigned(0, 8),
944 => to_unsigned(0, 8),
945 => to_unsigned(0, 8),
946 => to_unsigned(0, 8),
947 => to_unsigned(0, 8),
948 => to_unsigned(0, 8),
949 => to_unsigned(0, 8),
950 => to_unsigned(0, 8),
951 => to_unsigned(0, 8),
952 => to_unsigned(0, 8),
953 => to_unsigned(0, 8),
954 => to_unsigned(0, 8),
955 => to_unsigned(0, 8),
956 => to_unsigned(0, 8),
957 => to_unsigned(0, 8),
958 => to_unsigned(0, 8),
959 => to_unsigned(0, 8),
960 => to_unsigned(0, 8),
961 => to_unsigned(0, 8),
962 => to_unsigned(0, 8),
963 => to_unsigned(0, 8),
964 => to_unsigned(0, 8),
965 => to_unsigned(0, 8),
966 => to_unsigned(0, 8),
967 => to_unsigned(0, 8),
968 => to_unsigned(0, 8),
969 => to_unsigned(0, 8),
970 => to_unsigned(0, 8),
971 => to_unsigned(0, 8),
972 => to_unsigned(0, 8),
973 => to_unsigned(0, 8),
974 => to_unsigned(0, 8),
975 => to_unsigned(0, 8),
976 => to_unsigned(0, 8),
977 => to_unsigned(0, 8),
978 => to_unsigned(0, 8),
979 => to_unsigned(0, 8),
980 => to_unsigned(0, 8),
981 => to_unsigned(0, 8),
982 => to_unsigned(0, 8),
983 => to_unsigned(0, 8),
984 => to_unsigned(0, 8),
985 => to_unsigned(0, 8),
986 => to_unsigned(0, 8),
987 => to_unsigned(0, 8),
988 => to_unsigned(0, 8),
989 => to_unsigned(0, 8),
990 => to_unsigned(0, 8),
991 => to_unsigned(0, 8),
992 => to_unsigned(0, 8),
993 => to_unsigned(0, 8),
994 => to_unsigned(0, 8),
995 => to_unsigned(0, 8),
996 => to_unsigned(0, 8),
997 => to_unsigned(0, 8),
998 => to_unsigned(0, 8),
999 => to_unsigned(0, 8),
1000 => to_unsigned(0, 8),
1001 => to_unsigned(0, 8),
1002 => to_unsigned(0, 8),
1003 => to_unsigned(0, 8),
1004 => to_unsigned(0, 8),
1005 => to_unsigned(0, 8),
1006 => to_unsigned(0, 8),
1007 => to_unsigned(0, 8),
1008 => to_unsigned(0, 8),
1009 => to_unsigned(0, 8),
1010 => to_unsigned(0, 8),
1011 => to_unsigned(0, 8),
1012 => to_unsigned(0, 8),
1013 => to_unsigned(0, 8),
1014 => to_unsigned(0, 8),
1015 => to_unsigned(0, 8),
1016 => to_unsigned(0, 8),
1017 => to_unsigned(0, 8),
1018 => to_unsigned(0, 8),
1019 => to_unsigned(0, 8),
1020 => to_unsigned(0, 8),
1021 => to_unsigned(0, 8),
1022 => to_unsigned(0, 8),
1023 => to_unsigned(0, 8),
others => to_unsigned(0, 8))
;

    signal return_output_r : unsigned(7 downto 0) := to_unsigned(0, 8);
begin


addr <= addr0 ;

      process(clk) is
      begin
        if rising_edge(clk) then
          if CLOCK_ENABLE(0)='1' then            
            -- Read first
            return_output_r <= uxn_rom(to_integer(addr));
            -- RAM logic    
            if we(0) = '1' then
              uxn_rom(to_integer(addr)) <= wd; 
            end if;
          end if;
        end if;
      end process;
      -- Tie output reg to output
      return_output <= return_output_r;
      
end arch;
