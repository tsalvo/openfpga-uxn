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
 addr0 : in unsigned(8 downto 0);
 wd : in unsigned(7 downto 0);
 we : in unsigned(0 downto 0);
 return_output : out unsigned(7 downto 0));
end read_rom_byte_uxn_rom_RAM_SP_RF_1_0CLK_de264c78;
architecture arch of read_rom_byte_uxn_rom_RAM_SP_RF_1_0CLK_de264c78 is

  signal addr : unsigned(8 downto 0) := to_unsigned(0, 9);

  signal uxn_rom : uint8_t_512 := (
0 => to_unsigned(224, 8),
1 => to_unsigned(0, 8),
2 => to_unsigned(0, 8),
3 => to_unsigned(96, 8),
4 => to_unsigned(0, 8),
5 => to_unsigned(18, 8),
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
25 => to_unsigned(160, 8),
26 => to_unsigned(8, 8),
27 => to_unsigned(223, 8),
28 => to_unsigned(128, 8),
29 => to_unsigned(8, 8),
30 => to_unsigned(55, 8),
31 => to_unsigned(160, 8),
32 => to_unsigned(18, 8),
33 => to_unsigned(191, 8),
34 => to_unsigned(128, 8),
35 => to_unsigned(10, 8),
36 => to_unsigned(55, 8),
37 => to_unsigned(160, 8),
38 => to_unsigned(84, 8),
39 => to_unsigned(157, 8),
40 => to_unsigned(128, 8),
41 => to_unsigned(12, 8),
42 => to_unsigned(55, 8),
43 => to_unsigned(160, 8),
44 => to_unsigned(3, 8),
45 => to_unsigned(32, 8),
46 => to_unsigned(128, 8),
47 => to_unsigned(34, 8),
48 => to_unsigned(55, 8),
49 => to_unsigned(160, 8),
50 => to_unsigned(2, 8),
51 => to_unsigned(208, 8),
52 => to_unsigned(128, 8),
53 => to_unsigned(36, 8),
54 => to_unsigned(55, 8),
55 => to_unsigned(160, 8),
56 => to_unsigned(253, 8),
57 => to_unsigned(128, 8),
58 => to_unsigned(160, 8),
59 => to_unsigned(1, 8),
60 => to_unsigned(22, 8),
61 => to_unsigned(53, 8),
62 => to_unsigned(160, 8),
63 => to_unsigned(1, 8),
64 => to_unsigned(22, 8),
65 => to_unsigned(52, 8),
66 => to_unsigned(160, 8),
67 => to_unsigned(128, 8),
68 => to_unsigned(0, 8),
69 => to_unsigned(62, 8),
70 => to_unsigned(160, 8),
71 => to_unsigned(128, 8),
72 => to_unsigned(160, 8),
73 => to_unsigned(43, 8),
74 => to_unsigned(128, 8),
75 => to_unsigned(0, 8),
76 => to_unsigned(8, 8),
77 => to_unsigned(32, 8),
78 => to_unsigned(1, 8),
79 => to_unsigned(18, 8),
80 => to_unsigned(160, 8),
81 => to_unsigned(254, 8),
82 => to_unsigned(152, 8),
83 => to_unsigned(160, 8),
84 => to_unsigned(1, 8),
85 => to_unsigned(20, 8),
86 => to_unsigned(53, 8),
87 => to_unsigned(160, 8),
88 => to_unsigned(1, 8),
89 => to_unsigned(20, 8),
90 => to_unsigned(52, 8),
91 => to_unsigned(160, 8),
92 => to_unsigned(128, 8),
93 => to_unsigned(0, 8),
94 => to_unsigned(62, 8),
95 => to_unsigned(160, 8),
96 => to_unsigned(128, 8),
97 => to_unsigned(0, 8),
98 => to_unsigned(42, 8),
99 => to_unsigned(128, 8),
100 => to_unsigned(0, 8),
101 => to_unsigned(4, 8),
102 => to_unsigned(128, 8),
103 => to_unsigned(1, 8),
104 => to_unsigned(30, 8),
105 => to_unsigned(160, 8),
106 => to_unsigned(0, 8),
107 => to_unsigned(0, 8),
108 => to_unsigned(40, 8),
109 => to_unsigned(32, 8),
110 => to_unsigned(0, 8),
111 => to_unsigned(232, 8),
112 => to_unsigned(160, 8),
113 => to_unsigned(0, 8),
114 => to_unsigned(0, 8),
115 => to_unsigned(160, 8),
116 => to_unsigned(1, 8),
117 => to_unsigned(18, 8),
118 => to_unsigned(53, 8),
119 => to_unsigned(160, 8),
120 => to_unsigned(0, 8),
121 => to_unsigned(0, 8),
122 => to_unsigned(160, 8),
123 => to_unsigned(1, 8),
124 => to_unsigned(16, 8),
125 => to_unsigned(53, 8),
126 => to_unsigned(160, 8),
127 => to_unsigned(0, 8),
128 => to_unsigned(0, 8),
129 => to_unsigned(160, 8),
130 => to_unsigned(1, 8),
131 => to_unsigned(14, 8),
132 => to_unsigned(53, 8),
133 => to_unsigned(160, 8),
134 => to_unsigned(1, 8),
135 => to_unsigned(14, 8),
136 => to_unsigned(52, 8),
137 => to_unsigned(160, 8),
138 => to_unsigned(128, 8),
139 => to_unsigned(0, 8),
140 => to_unsigned(62, 8),
141 => to_unsigned(160, 8),
142 => to_unsigned(128, 8),
143 => to_unsigned(25, 8),
144 => to_unsigned(43, 8),
145 => to_unsigned(128, 8),
146 => to_unsigned(0, 8),
147 => to_unsigned(8, 8),
148 => to_unsigned(32, 8),
149 => to_unsigned(0, 8),
150 => to_unsigned(109, 8),
151 => to_unsigned(160, 8),
152 => to_unsigned(132, 8),
153 => to_unsigned(0, 8),
154 => to_unsigned(160, 8),
155 => to_unsigned(1, 8),
156 => to_unsigned(18, 8),
157 => to_unsigned(52, 8),
158 => to_unsigned(160, 8),
159 => to_unsigned(1, 8),
160 => to_unsigned(18, 8),
161 => to_unsigned(52, 8),
162 => to_unsigned(96, 8),
163 => to_unsigned(0, 8),
164 => to_unsigned(194, 8),
165 => to_unsigned(160, 8),
166 => to_unsigned(1, 8),
167 => to_unsigned(12, 8),
168 => to_unsigned(181, 8),
169 => to_unsigned(34, 8),
170 => to_unsigned(160, 8),
171 => to_unsigned(1, 8),
172 => to_unsigned(16, 8),
173 => to_unsigned(52, 8),
174 => to_unsigned(160, 8),
175 => to_unsigned(1, 8),
176 => to_unsigned(16, 8),
177 => to_unsigned(52, 8),
178 => to_unsigned(96, 8),
179 => to_unsigned(0, 8),
180 => to_unsigned(178, 8),
181 => to_unsigned(160, 8),
182 => to_unsigned(1, 8),
183 => to_unsigned(10, 8),
184 => to_unsigned(181, 8),
185 => to_unsigned(34, 8),
186 => to_unsigned(56, 8),
187 => to_unsigned(160, 8),
188 => to_unsigned(128, 8),
189 => to_unsigned(0, 8),
190 => to_unsigned(62, 8),
191 => to_unsigned(43, 8),
192 => to_unsigned(128, 8),
193 => to_unsigned(0, 8),
194 => to_unsigned(8, 8),
195 => to_unsigned(32, 8),
196 => to_unsigned(0, 8),
197 => to_unsigned(3, 8),
198 => to_unsigned(64, 8),
199 => to_unsigned(0, 8),
200 => to_unsigned(59, 8),
201 => to_unsigned(160, 8),
202 => to_unsigned(1, 8),
203 => to_unsigned(12, 8),
204 => to_unsigned(52, 8),
205 => to_unsigned(160, 8),
206 => to_unsigned(1, 8),
207 => to_unsigned(10, 8),
208 => to_unsigned(52, 8),
209 => to_unsigned(57, 8),
210 => to_unsigned(160, 8),
211 => to_unsigned(1, 8),
212 => to_unsigned(22, 8),
213 => to_unsigned(52, 8),
214 => to_unsigned(56, 8),
215 => to_unsigned(160, 8),
216 => to_unsigned(1, 8),
217 => to_unsigned(8, 8),
218 => to_unsigned(53, 8),
219 => to_unsigned(160, 8),
220 => to_unsigned(1, 8),
221 => to_unsigned(16, 8),
222 => to_unsigned(52, 8),
223 => to_unsigned(160, 8),
224 => to_unsigned(1, 8),
225 => to_unsigned(18, 8),
226 => to_unsigned(52, 8),
227 => to_unsigned(96, 8),
228 => to_unsigned(0, 8),
229 => to_unsigned(129, 8),
230 => to_unsigned(128, 8),
231 => to_unsigned(16, 8),
232 => to_unsigned(63, 8),
233 => to_unsigned(160, 8),
234 => to_unsigned(1, 8),
235 => to_unsigned(20, 8),
236 => to_unsigned(52, 8),
237 => to_unsigned(56, 8),
238 => to_unsigned(160, 8),
239 => to_unsigned(1, 8),
240 => to_unsigned(16, 8),
241 => to_unsigned(53, 8),
242 => to_unsigned(160, 8),
243 => to_unsigned(1, 8),
244 => to_unsigned(8, 8),
245 => to_unsigned(52, 8),
246 => to_unsigned(160, 8),
247 => to_unsigned(1, 8),
248 => to_unsigned(18, 8),
249 => to_unsigned(53, 8),
250 => to_unsigned(160, 8),
251 => to_unsigned(1, 8),
252 => to_unsigned(14, 8),
253 => to_unsigned(180, 8),
254 => to_unsigned(33, 8),
255 => to_unsigned(36, 8),
256 => to_unsigned(53, 8),
257 => to_unsigned(64, 8),
258 => to_unsigned(255, 8),
259 => to_unsigned(129, 8),
260 => to_unsigned(160, 8),
261 => to_unsigned(1, 8),
262 => to_unsigned(14, 8),
263 => to_unsigned(52, 8),
264 => to_unsigned(160, 8),
265 => to_unsigned(1, 8),
266 => to_unsigned(22, 8),
267 => to_unsigned(52, 8),
268 => to_unsigned(160, 8),
269 => to_unsigned(1, 8),
270 => to_unsigned(20, 8),
271 => to_unsigned(52, 8),
272 => to_unsigned(56, 8),
273 => to_unsigned(160, 8),
274 => to_unsigned(0, 8),
275 => to_unsigned(1, 8),
276 => to_unsigned(60, 8),
277 => to_unsigned(56, 8),
278 => to_unsigned(128, 8),
279 => to_unsigned(3, 8),
280 => to_unsigned(63, 8),
281 => to_unsigned(160, 8),
282 => to_unsigned(1, 8),
283 => to_unsigned(8, 8),
284 => to_unsigned(53, 8),
285 => to_unsigned(160, 8),
286 => to_unsigned(1, 8),
287 => to_unsigned(22, 8),
288 => to_unsigned(52, 8),
289 => to_unsigned(160, 8),
290 => to_unsigned(2, 8),
291 => to_unsigned(128, 8),
292 => to_unsigned(56, 8),
293 => to_unsigned(128, 8),
294 => to_unsigned(40, 8),
295 => to_unsigned(55, 8),
296 => to_unsigned(160, 8),
297 => to_unsigned(1, 8),
298 => to_unsigned(20, 8),
299 => to_unsigned(52, 8),
300 => to_unsigned(160, 8),
301 => to_unsigned(1, 8),
302 => to_unsigned(104, 8),
303 => to_unsigned(56, 8),
304 => to_unsigned(128, 8),
305 => to_unsigned(42, 8),
306 => to_unsigned(55, 8),
307 => to_unsigned(160, 8),
308 => to_unsigned(1, 8),
309 => to_unsigned(8, 8),
310 => to_unsigned(52, 8),
311 => to_unsigned(3, 8),
312 => to_unsigned(128, 8),
313 => to_unsigned(46, 8),
314 => to_unsigned(23, 8),
315 => to_unsigned(160, 8),
316 => to_unsigned(1, 8),
317 => to_unsigned(104, 8),
318 => to_unsigned(160, 8),
319 => to_unsigned(1, 8),
320 => to_unsigned(20, 8),
321 => to_unsigned(52, 8),
322 => to_unsigned(57, 8),
323 => to_unsigned(128, 8),
324 => to_unsigned(42, 8),
325 => to_unsigned(55, 8),
326 => to_unsigned(160, 8),
327 => to_unsigned(1, 8),
328 => to_unsigned(8, 8),
329 => to_unsigned(52, 8),
330 => to_unsigned(3, 8),
331 => to_unsigned(128, 8),
332 => to_unsigned(46, 8),
333 => to_unsigned(23, 8),
334 => to_unsigned(160, 8),
335 => to_unsigned(1, 8),
336 => to_unsigned(20, 8),
337 => to_unsigned(180, 8),
338 => to_unsigned(33, 8),
339 => to_unsigned(36, 8),
340 => to_unsigned(53, 8),
341 => to_unsigned(64, 8),
342 => to_unsigned(254, 8),
343 => to_unsigned(255, 8),
344 => to_unsigned(160, 8),
345 => to_unsigned(1, 8),
346 => to_unsigned(22, 8),
347 => to_unsigned(180, 8),
348 => to_unsigned(33, 8),
349 => to_unsigned(36, 8),
350 => to_unsigned(53, 8),
351 => to_unsigned(64, 8),
352 => to_unsigned(254, 8),
353 => to_unsigned(220, 8),
354 => to_unsigned(160, 8),
355 => to_unsigned(0, 8),
356 => to_unsigned(0, 8),
357 => to_unsigned(98, 8),
358 => to_unsigned(108, 8),
359 => to_unsigned(224, 8),
360 => to_unsigned(0, 8),
361 => to_unsigned(1, 8),
362 => to_unsigned(36, 8),
363 => to_unsigned(38, 8),
364 => to_unsigned(160, 8),
365 => to_unsigned(128, 8),
366 => to_unsigned(0, 8),
367 => to_unsigned(43, 8),
368 => to_unsigned(32, 8),
369 => to_unsigned(0, 8),
370 => to_unsigned(9, 8),
371 => to_unsigned(160, 8),
372 => to_unsigned(0, 8),
373 => to_unsigned(0, 8),
374 => to_unsigned(36, 8),
375 => to_unsigned(57, 8),
376 => to_unsigned(224, 8),
377 => to_unsigned(255, 8),
378 => to_unsigned(255, 8),
379 => to_unsigned(122, 8),
380 => to_unsigned(36, 8),
381 => to_unsigned(38, 8),
382 => to_unsigned(160, 8),
383 => to_unsigned(128, 8),
384 => to_unsigned(0, 8),
385 => to_unsigned(43, 8),
386 => to_unsigned(32, 8),
387 => to_unsigned(0, 8),
388 => to_unsigned(9, 8),
389 => to_unsigned(160, 8),
390 => to_unsigned(0, 8),
391 => to_unsigned(0, 8),
392 => to_unsigned(36, 8),
393 => to_unsigned(57, 8),
394 => to_unsigned(224, 8),
395 => to_unsigned(255, 8),
396 => to_unsigned(255, 8),
397 => to_unsigned(122, 8),
398 => to_unsigned(167, 8),
399 => to_unsigned(167, 8),
400 => to_unsigned(160, 8),
401 => to_unsigned(0, 8),
402 => to_unsigned(255, 8),
403 => to_unsigned(60, 8),
404 => to_unsigned(36, 8),
405 => to_unsigned(160, 8),
406 => to_unsigned(0, 8),
407 => to_unsigned(255, 8),
408 => to_unsigned(60, 8),
409 => to_unsigned(58, 8),
410 => to_unsigned(128, 8),
411 => to_unsigned(8, 8),
412 => to_unsigned(63, 8),
413 => to_unsigned(37, 8),
414 => to_unsigned(128, 8),
415 => to_unsigned(8, 8),
416 => to_unsigned(63, 8),
417 => to_unsigned(37, 8),
418 => to_unsigned(160, 8),
419 => to_unsigned(0, 8),
420 => to_unsigned(255, 8),
421 => to_unsigned(60, 8),
422 => to_unsigned(58, 8),
423 => to_unsigned(56, 8),
424 => to_unsigned(37, 8),
425 => to_unsigned(160, 8),
426 => to_unsigned(0, 8),
427 => to_unsigned(255, 8),
428 => to_unsigned(60, 8),
429 => to_unsigned(37, 8),
430 => to_unsigned(128, 8),
431 => to_unsigned(8, 8),
432 => to_unsigned(63, 8),
433 => to_unsigned(58, 8),
434 => to_unsigned(56, 8),
435 => to_unsigned(37, 8),
436 => to_unsigned(128, 8),
437 => to_unsigned(8, 8),
438 => to_unsigned(63, 8),
439 => to_unsigned(37, 8),
440 => to_unsigned(128, 8),
441 => to_unsigned(8, 8),
442 => to_unsigned(63, 8),
443 => to_unsigned(58, 8),
444 => to_unsigned(128, 8),
445 => to_unsigned(128, 8),
446 => to_unsigned(63, 8),
447 => to_unsigned(56, 8),
448 => to_unsigned(111, 8),
449 => to_unsigned(58, 8),
450 => to_unsigned(108, 8),
451 => to_unsigned(0, 8),
452 => to_unsigned(0, 8),
453 => to_unsigned(0, 8),
454 => to_unsigned(0, 8),
455 => to_unsigned(0, 8),
456 => to_unsigned(0, 8),
457 => to_unsigned(0, 8),
458 => to_unsigned(0, 8),
459 => to_unsigned(0, 8),
460 => to_unsigned(0, 8),
461 => to_unsigned(0, 8),
462 => to_unsigned(0, 8),
463 => to_unsigned(0, 8),
464 => to_unsigned(0, 8),
465 => to_unsigned(0, 8),
466 => to_unsigned(0, 8),
467 => to_unsigned(0, 8),
468 => to_unsigned(0, 8),
469 => to_unsigned(0, 8),
470 => to_unsigned(0, 8),
471 => to_unsigned(0, 8),
472 => to_unsigned(0, 8),
473 => to_unsigned(0, 8),
474 => to_unsigned(0, 8),
475 => to_unsigned(0, 8),
476 => to_unsigned(0, 8),
477 => to_unsigned(0, 8),
478 => to_unsigned(0, 8),
479 => to_unsigned(0, 8),
480 => to_unsigned(0, 8),
481 => to_unsigned(0, 8),
482 => to_unsigned(0, 8),
483 => to_unsigned(0, 8),
484 => to_unsigned(0, 8),
485 => to_unsigned(0, 8),
486 => to_unsigned(0, 8),
487 => to_unsigned(0, 8),
488 => to_unsigned(0, 8),
489 => to_unsigned(0, 8),
490 => to_unsigned(0, 8),
491 => to_unsigned(0, 8),
492 => to_unsigned(0, 8),
493 => to_unsigned(0, 8),
494 => to_unsigned(0, 8),
495 => to_unsigned(0, 8),
496 => to_unsigned(0, 8),
497 => to_unsigned(0, 8),
498 => to_unsigned(0, 8),
499 => to_unsigned(0, 8),
500 => to_unsigned(0, 8),
501 => to_unsigned(0, 8),
502 => to_unsigned(0, 8),
503 => to_unsigned(0, 8),
504 => to_unsigned(0, 8),
505 => to_unsigned(0, 8),
506 => to_unsigned(0, 8),
507 => to_unsigned(0, 8),
508 => to_unsigned(0, 8),
509 => to_unsigned(0, 8),
510 => to_unsigned(0, 8),
511 => to_unsigned(0, 8),
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
