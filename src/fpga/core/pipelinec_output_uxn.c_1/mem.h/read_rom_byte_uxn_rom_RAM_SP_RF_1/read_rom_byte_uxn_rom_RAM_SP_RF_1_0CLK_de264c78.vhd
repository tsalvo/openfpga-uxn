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
 addr0 : in unsigned(6 downto 0);
 wd : in unsigned(7 downto 0);
 we : in unsigned(0 downto 0);
 return_output : out unsigned(7 downto 0));
end read_rom_byte_uxn_rom_RAM_SP_RF_1_0CLK_de264c78;
architecture arch of read_rom_byte_uxn_rom_RAM_SP_RF_1_0CLK_de264c78 is

  signal addr : unsigned(6 downto 0) := to_unsigned(0, 7);

  signal uxn_rom : uint8_t_128 := (
0 => to_unsigned(224, 8),
1 => to_unsigned(0, 8),
2 => to_unsigned(0, 8),
3 => to_unsigned(96, 8),
4 => to_unsigned(0, 8),
5 => to_unsigned(2, 8),
6 => to_unsigned(98, 8),
7 => to_unsigned(0, 8),
8 => to_unsigned(103, 8),
9 => to_unsigned(160, 8),
10 => to_unsigned(8, 8),
11 => to_unsigned(223, 8),
12 => to_unsigned(128, 8),
13 => to_unsigned(8, 8),
14 => to_unsigned(55, 8),
15 => to_unsigned(160, 8),
16 => to_unsigned(18, 8),
17 => to_unsigned(191, 8),
18 => to_unsigned(128, 8),
19 => to_unsigned(10, 8),
20 => to_unsigned(55, 8),
21 => to_unsigned(160, 8),
22 => to_unsigned(84, 8),
23 => to_unsigned(157, 8),
24 => to_unsigned(128, 8),
25 => to_unsigned(12, 8),
26 => to_unsigned(55, 8),
27 => to_unsigned(160, 8),
28 => to_unsigned(0, 8),
29 => to_unsigned(10, 8),
30 => to_unsigned(128, 8),
31 => to_unsigned(40, 8),
32 => to_unsigned(55, 8),
33 => to_unsigned(160, 8),
34 => to_unsigned(0, 8),
35 => to_unsigned(10, 8),
36 => to_unsigned(128, 8),
37 => to_unsigned(42, 8),
38 => to_unsigned(55, 8),
39 => to_unsigned(160, 8),
40 => to_unsigned(2, 8),
41 => to_unsigned(46, 8),
42 => to_unsigned(23, 8),
43 => to_unsigned(160, 8),
44 => to_unsigned(0, 8),
45 => to_unsigned(20, 8),
46 => to_unsigned(128, 8),
47 => to_unsigned(40, 8),
48 => to_unsigned(0, 8),
49 => to_unsigned(0, 8),
50 => to_unsigned(0, 8),
51 => to_unsigned(0, 8),
52 => to_unsigned(0, 8),
53 => to_unsigned(0, 8),
54 => to_unsigned(0, 8),
55 => to_unsigned(0, 8),
56 => to_unsigned(0, 8),
57 => to_unsigned(0, 8),
58 => to_unsigned(0, 8),
59 => to_unsigned(0, 8),
60 => to_unsigned(0, 8),
61 => to_unsigned(0, 8),
62 => to_unsigned(0, 8),
63 => to_unsigned(0, 8),
64 => to_unsigned(0, 8),
65 => to_unsigned(0, 8),
66 => to_unsigned(0, 8),
67 => to_unsigned(0, 8),
68 => to_unsigned(0, 8),
69 => to_unsigned(0, 8),
70 => to_unsigned(0, 8),
71 => to_unsigned(0, 8),
72 => to_unsigned(0, 8),
73 => to_unsigned(0, 8),
74 => to_unsigned(0, 8),
75 => to_unsigned(0, 8),
76 => to_unsigned(0, 8),
77 => to_unsigned(0, 8),
78 => to_unsigned(0, 8),
79 => to_unsigned(0, 8),
80 => to_unsigned(0, 8),
81 => to_unsigned(0, 8),
82 => to_unsigned(0, 8),
83 => to_unsigned(0, 8),
84 => to_unsigned(0, 8),
85 => to_unsigned(0, 8),
86 => to_unsigned(0, 8),
87 => to_unsigned(0, 8),
88 => to_unsigned(0, 8),
89 => to_unsigned(0, 8),
90 => to_unsigned(0, 8),
91 => to_unsigned(0, 8),
92 => to_unsigned(0, 8),
93 => to_unsigned(0, 8),
94 => to_unsigned(0, 8),
95 => to_unsigned(0, 8),
96 => to_unsigned(0, 8),
97 => to_unsigned(0, 8),
98 => to_unsigned(0, 8),
99 => to_unsigned(0, 8),
100 => to_unsigned(0, 8),
101 => to_unsigned(0, 8),
102 => to_unsigned(0, 8),
103 => to_unsigned(0, 8),
104 => to_unsigned(0, 8),
105 => to_unsigned(0, 8),
106 => to_unsigned(0, 8),
107 => to_unsigned(0, 8),
108 => to_unsigned(0, 8),
109 => to_unsigned(0, 8),
110 => to_unsigned(0, 8),
111 => to_unsigned(0, 8),
112 => to_unsigned(0, 8),
113 => to_unsigned(0, 8),
114 => to_unsigned(0, 8),
115 => to_unsigned(0, 8),
116 => to_unsigned(0, 8),
117 => to_unsigned(0, 8),
118 => to_unsigned(0, 8),
119 => to_unsigned(0, 8),
120 => to_unsigned(0, 8),
121 => to_unsigned(0, 8),
122 => to_unsigned(0, 8),
123 => to_unsigned(0, 8),
124 => to_unsigned(0, 8),
125 => to_unsigned(0, 8),
126 => to_unsigned(0, 8),
127 => to_unsigned(0, 8),
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
