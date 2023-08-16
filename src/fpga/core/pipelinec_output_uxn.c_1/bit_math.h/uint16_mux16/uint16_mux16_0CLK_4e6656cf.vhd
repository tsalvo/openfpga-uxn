-- Timing params:
--   Fixed?: False
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
-- Submodules: 19
entity uint16_mux16_0CLK_4e6656cf is
port(
 sel : in unsigned(3 downto 0);
 in0 : in unsigned(15 downto 0);
 in1 : in unsigned(15 downto 0);
 in2 : in unsigned(15 downto 0);
 in3 : in unsigned(15 downto 0);
 in4 : in unsigned(15 downto 0);
 in5 : in unsigned(15 downto 0);
 in6 : in unsigned(15 downto 0);
 in7 : in unsigned(15 downto 0);
 in8 : in unsigned(15 downto 0);
 in9 : in unsigned(15 downto 0);
 in10 : in unsigned(15 downto 0);
 in11 : in unsigned(15 downto 0);
 in12 : in unsigned(15 downto 0);
 in13 : in unsigned(15 downto 0);
 in14 : in unsigned(15 downto 0);
 in15 : in unsigned(15 downto 0);
 return_output : out unsigned(15 downto 0));
end uint16_mux16_0CLK_4e6656cf;
architecture arch of uint16_mux16_0CLK_4e6656cf is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- layer0_node0_MUX[bit_math_h_l18_c3_ab2b]
signal layer0_node0_MUX_bit_math_h_l18_c3_ab2b_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_ab2b_iftrue : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_ab2b_iffalse : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_ab2b_return_output : unsigned(15 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_5886]
signal layer0_node1_MUX_bit_math_h_l29_c3_5886_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_5886_iftrue : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_5886_iffalse : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_5886_return_output : unsigned(15 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_2f0e]
signal layer0_node2_MUX_bit_math_h_l40_c3_2f0e_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_2f0e_iftrue : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_2f0e_iffalse : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_2f0e_return_output : unsigned(15 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_ff16]
signal layer0_node3_MUX_bit_math_h_l51_c3_ff16_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_ff16_iftrue : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_ff16_iffalse : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_ff16_return_output : unsigned(15 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_d58b]
signal layer0_node4_MUX_bit_math_h_l62_c3_d58b_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_d58b_iftrue : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_d58b_iffalse : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_d58b_return_output : unsigned(15 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_d59b]
signal layer0_node5_MUX_bit_math_h_l73_c3_d59b_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_d59b_iftrue : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_d59b_iffalse : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_d59b_return_output : unsigned(15 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_5fec]
signal layer0_node6_MUX_bit_math_h_l84_c3_5fec_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_5fec_iftrue : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_5fec_iffalse : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_5fec_return_output : unsigned(15 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_9cfb]
signal layer0_node7_MUX_bit_math_h_l95_c3_9cfb_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_9cfb_iftrue : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_9cfb_iffalse : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_9cfb_return_output : unsigned(15 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_f764]
signal layer1_node0_MUX_bit_math_h_l112_c3_f764_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_f764_iftrue : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_f764_iffalse : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_f764_return_output : unsigned(15 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_0cea]
signal layer1_node1_MUX_bit_math_h_l123_c3_0cea_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_0cea_iftrue : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_0cea_iffalse : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_0cea_return_output : unsigned(15 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_f166]
signal layer1_node2_MUX_bit_math_h_l134_c3_f166_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_f166_iftrue : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_f166_iffalse : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_f166_return_output : unsigned(15 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_f47b]
signal layer1_node3_MUX_bit_math_h_l145_c3_f47b_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_f47b_iftrue : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_f47b_iffalse : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_f47b_return_output : unsigned(15 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_cb0d]
signal layer2_node0_MUX_bit_math_h_l162_c3_cb0d_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_cb0d_iftrue : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_cb0d_iffalse : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_cb0d_return_output : unsigned(15 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_5c4c]
signal layer2_node1_MUX_bit_math_h_l173_c3_5c4c_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_5c4c_iftrue : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_5c4c_iffalse : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_5c4c_return_output : unsigned(15 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_3e89]
signal layer3_node0_MUX_bit_math_h_l190_c3_3e89_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_3e89_iftrue : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_3e89_iffalse : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_3e89_return_output : unsigned(15 downto 0);

function uint4_0_0( x : unsigned) return unsigned is
--variable x : unsigned(3 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(0- i);
      end loop;
return return_output;
end function;

function uint4_1_1( x : unsigned) return unsigned is
--variable x : unsigned(3 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(1- i);
      end loop;
return return_output;
end function;

function uint4_2_2( x : unsigned) return unsigned is
--variable x : unsigned(3 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(2- i);
      end loop;
return return_output;
end function;

function uint4_3_3( x : unsigned) return unsigned is
--variable x : unsigned(3 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(3- i);
      end loop;
return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- layer0_node0_MUX_bit_math_h_l18_c3_ab2b
layer0_node0_MUX_bit_math_h_l18_c3_ab2b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_ab2b_cond,
layer0_node0_MUX_bit_math_h_l18_c3_ab2b_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_ab2b_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_ab2b_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_5886
layer0_node1_MUX_bit_math_h_l29_c3_5886 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_5886_cond,
layer0_node1_MUX_bit_math_h_l29_c3_5886_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_5886_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_5886_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_2f0e
layer0_node2_MUX_bit_math_h_l40_c3_2f0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_2f0e_cond,
layer0_node2_MUX_bit_math_h_l40_c3_2f0e_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_2f0e_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_2f0e_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_ff16
layer0_node3_MUX_bit_math_h_l51_c3_ff16 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_ff16_cond,
layer0_node3_MUX_bit_math_h_l51_c3_ff16_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_ff16_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_ff16_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_d58b
layer0_node4_MUX_bit_math_h_l62_c3_d58b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_d58b_cond,
layer0_node4_MUX_bit_math_h_l62_c3_d58b_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_d58b_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_d58b_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_d59b
layer0_node5_MUX_bit_math_h_l73_c3_d59b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_d59b_cond,
layer0_node5_MUX_bit_math_h_l73_c3_d59b_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_d59b_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_d59b_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_5fec
layer0_node6_MUX_bit_math_h_l84_c3_5fec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_5fec_cond,
layer0_node6_MUX_bit_math_h_l84_c3_5fec_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_5fec_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_5fec_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_9cfb
layer0_node7_MUX_bit_math_h_l95_c3_9cfb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_9cfb_cond,
layer0_node7_MUX_bit_math_h_l95_c3_9cfb_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_9cfb_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_9cfb_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_f764
layer1_node0_MUX_bit_math_h_l112_c3_f764 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_f764_cond,
layer1_node0_MUX_bit_math_h_l112_c3_f764_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_f764_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_f764_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_0cea
layer1_node1_MUX_bit_math_h_l123_c3_0cea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_0cea_cond,
layer1_node1_MUX_bit_math_h_l123_c3_0cea_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_0cea_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_0cea_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_f166
layer1_node2_MUX_bit_math_h_l134_c3_f166 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_f166_cond,
layer1_node2_MUX_bit_math_h_l134_c3_f166_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_f166_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_f166_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_f47b
layer1_node3_MUX_bit_math_h_l145_c3_f47b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_f47b_cond,
layer1_node3_MUX_bit_math_h_l145_c3_f47b_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_f47b_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_f47b_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_cb0d
layer2_node0_MUX_bit_math_h_l162_c3_cb0d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_cb0d_cond,
layer2_node0_MUX_bit_math_h_l162_c3_cb0d_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_cb0d_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_cb0d_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_5c4c
layer2_node1_MUX_bit_math_h_l173_c3_5c4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_5c4c_cond,
layer2_node1_MUX_bit_math_h_l173_c3_5c4c_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_5c4c_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_5c4c_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_3e89
layer3_node0_MUX_bit_math_h_l190_c3_3e89 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_3e89_cond,
layer3_node0_MUX_bit_math_h_l190_c3_3e89_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_3e89_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_3e89_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 sel,
 in0,
 in1,
 in2,
 in3,
 in4,
 in5,
 in6,
 in7,
 in8,
 in9,
 in10,
 in11,
 in12,
 in13,
 in14,
 in15,
 -- All submodule outputs
 layer0_node0_MUX_bit_math_h_l18_c3_ab2b_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_5886_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_2f0e_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_ff16_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_d58b_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_d59b_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_5fec_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_9cfb_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_f764_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_0cea_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_f166_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_f47b_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_cb0d_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_5c4c_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_3e89_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_sel : unsigned(3 downto 0);
 variable VAR_in0 : unsigned(15 downto 0);
 variable VAR_in1 : unsigned(15 downto 0);
 variable VAR_in2 : unsigned(15 downto 0);
 variable VAR_in3 : unsigned(15 downto 0);
 variable VAR_in4 : unsigned(15 downto 0);
 variable VAR_in5 : unsigned(15 downto 0);
 variable VAR_in6 : unsigned(15 downto 0);
 variable VAR_in7 : unsigned(15 downto 0);
 variable VAR_in8 : unsigned(15 downto 0);
 variable VAR_in9 : unsigned(15 downto 0);
 variable VAR_in10 : unsigned(15 downto 0);
 variable VAR_in11 : unsigned(15 downto 0);
 variable VAR_in12 : unsigned(15 downto 0);
 variable VAR_in13 : unsigned(15 downto 0);
 variable VAR_in14 : unsigned(15 downto 0);
 variable VAR_in15 : unsigned(15 downto 0);
 variable VAR_sel0 : unsigned(0 downto 0);
 variable VAR_uint4_0_0_bit_math_h_l14_c10_40ac_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_ab2b_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_ab2b_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_ab2b_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_ab2b_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_5886_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_5886_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_5886_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_5886_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_2f0e_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_2f0e_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_2f0e_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_2f0e_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_ff16_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_ff16_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_ff16_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_ff16_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_d58b_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_d58b_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_d58b_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_d58b_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_d59b_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_d59b_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_d59b_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_d59b_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_5fec_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_5fec_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_5fec_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_5fec_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_9cfb_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_9cfb_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_9cfb_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_9cfb_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_97f2_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_f764_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_f764_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_f764_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_f764_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_0cea_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_0cea_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_0cea_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_0cea_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_f166_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_f166_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_f166_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_f166_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_f47b_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_f47b_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_f47b_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_f47b_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_8974_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_cb0d_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_cb0d_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_cb0d_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_cb0d_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_5c4c_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_5c4c_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_5c4c_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_5c4c_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_04d5_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_3e89_iftrue : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_3e89_iffalse : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_3e89_return_output : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_3e89_cond : unsigned(0 downto 0);
begin

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_sel := sel;
     VAR_in0 := in0;
     VAR_in1 := in1;
     VAR_in2 := in2;
     VAR_in3 := in3;
     VAR_in4 := in4;
     VAR_in5 := in5;
     VAR_in6 := in6;
     VAR_in7 := in7;
     VAR_in8 := in8;
     VAR_in9 := in9;
     VAR_in10 := in10;
     VAR_in11 := in11;
     VAR_in12 := in12;
     VAR_in13 := in13;
     VAR_in14 := in14;
     VAR_in15 := in15;

     -- Submodule level 0
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_ab2b_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_ab2b_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_d59b_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_d59b_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_5fec_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_5fec_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_9cfb_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_9cfb_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_5886_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_5886_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_2f0e_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_2f0e_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_ff16_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_ff16_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_d58b_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_d58b_iftrue := VAR_in9;
     -- uint4_3_3[bit_math_h_l186_c10_04d5] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_04d5_return_output := uint4_3_3(
     VAR_sel);

     -- uint4_0_0[bit_math_h_l14_c10_40ac] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_40ac_return_output := uint4_0_0(
     VAR_sel);

     -- uint4_1_1[bit_math_h_l108_c10_97f2] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_97f2_return_output := uint4_1_1(
     VAR_sel);

     -- uint4_2_2[bit_math_h_l158_c10_8974] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_8974_return_output := uint4_2_2(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_ab2b_cond := VAR_uint4_0_0_bit_math_h_l14_c10_40ac_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_5886_cond := VAR_uint4_0_0_bit_math_h_l14_c10_40ac_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_2f0e_cond := VAR_uint4_0_0_bit_math_h_l14_c10_40ac_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_ff16_cond := VAR_uint4_0_0_bit_math_h_l14_c10_40ac_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_d58b_cond := VAR_uint4_0_0_bit_math_h_l14_c10_40ac_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_d59b_cond := VAR_uint4_0_0_bit_math_h_l14_c10_40ac_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_5fec_cond := VAR_uint4_0_0_bit_math_h_l14_c10_40ac_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_9cfb_cond := VAR_uint4_0_0_bit_math_h_l14_c10_40ac_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_f764_cond := VAR_uint4_1_1_bit_math_h_l108_c10_97f2_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_0cea_cond := VAR_uint4_1_1_bit_math_h_l108_c10_97f2_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_f166_cond := VAR_uint4_1_1_bit_math_h_l108_c10_97f2_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_f47b_cond := VAR_uint4_1_1_bit_math_h_l108_c10_97f2_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_cb0d_cond := VAR_uint4_2_2_bit_math_h_l158_c10_8974_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_5c4c_cond := VAR_uint4_2_2_bit_math_h_l158_c10_8974_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_3e89_cond := VAR_uint4_3_3_bit_math_h_l186_c10_04d5_return_output;
     -- layer0_node1_MUX[bit_math_h_l29_c3_5886] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_5886_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_5886_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_5886_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_5886_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_5886_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_5886_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_5886_return_output := layer0_node1_MUX_bit_math_h_l29_c3_5886_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_ab2b] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_ab2b_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_ab2b_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_ab2b_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_ab2b_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_ab2b_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_ab2b_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_ab2b_return_output := layer0_node0_MUX_bit_math_h_l18_c3_ab2b_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_d58b] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_d58b_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_d58b_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_d58b_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_d58b_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_d58b_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_d58b_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_d58b_return_output := layer0_node4_MUX_bit_math_h_l62_c3_d58b_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_ff16] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_ff16_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_ff16_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_ff16_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_ff16_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_ff16_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_ff16_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_ff16_return_output := layer0_node3_MUX_bit_math_h_l51_c3_ff16_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_5fec] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_5fec_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_5fec_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_5fec_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_5fec_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_5fec_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_5fec_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_5fec_return_output := layer0_node6_MUX_bit_math_h_l84_c3_5fec_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_9cfb] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_9cfb_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_9cfb_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_9cfb_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_9cfb_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_9cfb_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_9cfb_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_9cfb_return_output := layer0_node7_MUX_bit_math_h_l95_c3_9cfb_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_2f0e] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_2f0e_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_2f0e_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_2f0e_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_2f0e_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_2f0e_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_2f0e_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_2f0e_return_output := layer0_node2_MUX_bit_math_h_l40_c3_2f0e_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_d59b] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_d59b_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_d59b_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_d59b_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_d59b_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_d59b_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_d59b_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_d59b_return_output := layer0_node5_MUX_bit_math_h_l73_c3_d59b_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_f764_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_ab2b_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_f764_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_5886_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_0cea_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_2f0e_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_0cea_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_ff16_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_f166_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_d58b_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_f166_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_d59b_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_f47b_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_5fec_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_f47b_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_9cfb_return_output;
     -- layer1_node0_MUX[bit_math_h_l112_c3_f764] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_f764_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_f764_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_f764_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_f764_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_f764_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_f764_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_f764_return_output := layer1_node0_MUX_bit_math_h_l112_c3_f764_return_output;

     -- layer1_node2_MUX[bit_math_h_l134_c3_f166] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_f166_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_f166_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_f166_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_f166_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_f166_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_f166_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_f166_return_output := layer1_node2_MUX_bit_math_h_l134_c3_f166_return_output;

     -- layer1_node1_MUX[bit_math_h_l123_c3_0cea] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_0cea_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_0cea_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_0cea_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_0cea_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_0cea_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_0cea_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_0cea_return_output := layer1_node1_MUX_bit_math_h_l123_c3_0cea_return_output;

     -- layer1_node3_MUX[bit_math_h_l145_c3_f47b] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_f47b_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_f47b_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_f47b_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_f47b_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_f47b_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_f47b_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_f47b_return_output := layer1_node3_MUX_bit_math_h_l145_c3_f47b_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_cb0d_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_f764_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_cb0d_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_0cea_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_5c4c_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_f166_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_5c4c_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_f47b_return_output;
     -- layer2_node1_MUX[bit_math_h_l173_c3_5c4c] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_5c4c_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_5c4c_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_5c4c_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_5c4c_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_5c4c_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_5c4c_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_5c4c_return_output := layer2_node1_MUX_bit_math_h_l173_c3_5c4c_return_output;

     -- layer2_node0_MUX[bit_math_h_l162_c3_cb0d] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_cb0d_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_cb0d_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_cb0d_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_cb0d_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_cb0d_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_cb0d_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_cb0d_return_output := layer2_node0_MUX_bit_math_h_l162_c3_cb0d_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_3e89_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_cb0d_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_3e89_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_5c4c_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_3e89] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_3e89_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_3e89_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_3e89_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_3e89_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_3e89_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_3e89_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_3e89_return_output := layer3_node0_MUX_bit_math_h_l190_c3_3e89_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_3e89_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
