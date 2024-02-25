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
-- Submodules: 66
entity screen_2bpp_0CLK_29be10e5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 x1 : in unsigned(7 downto 0);
 y1 : in unsigned(7 downto 0);
 color : in unsigned(3 downto 0);
 fx : in unsigned(0 downto 0);
 fy : in unsigned(0 downto 0);
 ram_addr : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out screen_blit_result_t);
end screen_2bpp_0CLK_29be10e5;
architecture arch of screen_2bpp_0CLK_29be10e5 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal blending : uint8_t_80 := (
0 => to_unsigned(0, 8),
1 => to_unsigned(0, 8),
2 => to_unsigned(0, 8),
3 => to_unsigned(0, 8),
4 => to_unsigned(1, 8),
5 => to_unsigned(0, 8),
6 => to_unsigned(1, 8),
7 => to_unsigned(1, 8),
8 => to_unsigned(2, 8),
9 => to_unsigned(2, 8),
10 => to_unsigned(0, 8),
11 => to_unsigned(2, 8),
12 => to_unsigned(3, 8),
13 => to_unsigned(3, 8),
14 => to_unsigned(3, 8),
15 => to_unsigned(0, 8),
16 => to_unsigned(0, 8),
17 => to_unsigned(1, 8),
18 => to_unsigned(2, 8),
19 => to_unsigned(3, 8),
20 => to_unsigned(0, 8),
21 => to_unsigned(1, 8),
22 => to_unsigned(2, 8),
23 => to_unsigned(3, 8),
24 => to_unsigned(0, 8),
25 => to_unsigned(1, 8),
26 => to_unsigned(2, 8),
27 => to_unsigned(3, 8),
28 => to_unsigned(0, 8),
29 => to_unsigned(1, 8),
30 => to_unsigned(2, 8),
31 => to_unsigned(3, 8),
32 => to_unsigned(1, 8),
33 => to_unsigned(2, 8),
34 => to_unsigned(3, 8),
35 => to_unsigned(1, 8),
36 => to_unsigned(1, 8),
37 => to_unsigned(2, 8),
38 => to_unsigned(3, 8),
39 => to_unsigned(1, 8),
40 => to_unsigned(1, 8),
41 => to_unsigned(2, 8),
42 => to_unsigned(3, 8),
43 => to_unsigned(1, 8),
44 => to_unsigned(1, 8),
45 => to_unsigned(2, 8),
46 => to_unsigned(3, 8),
47 => to_unsigned(1, 8),
48 => to_unsigned(2, 8),
49 => to_unsigned(3, 8),
50 => to_unsigned(1, 8),
51 => to_unsigned(2, 8),
52 => to_unsigned(2, 8),
53 => to_unsigned(3, 8),
54 => to_unsigned(1, 8),
55 => to_unsigned(2, 8),
56 => to_unsigned(2, 8),
57 => to_unsigned(3, 8),
58 => to_unsigned(1, 8),
59 => to_unsigned(2, 8),
60 => to_unsigned(2, 8),
61 => to_unsigned(3, 8),
62 => to_unsigned(1, 8),
63 => to_unsigned(2, 8),
64 => to_unsigned(0, 8),
65 => to_unsigned(1, 8),
66 => to_unsigned(1, 8),
67 => to_unsigned(1, 8),
68 => to_unsigned(1, 8),
69 => to_unsigned(0, 8),
70 => to_unsigned(1, 8),
71 => to_unsigned(1, 8),
72 => to_unsigned(1, 8),
73 => to_unsigned(1, 8),
74 => to_unsigned(0, 8),
75 => to_unsigned(1, 8),
76 => to_unsigned(1, 8),
77 => to_unsigned(1, 8),
78 => to_unsigned(1, 8),
79 => to_unsigned(0, 8),
others => to_unsigned(0, 8))
;
signal x : unsigned(15 downto 0) := to_unsigned(0, 16);
signal y : unsigned(15 downto 0) := to_unsigned(0, 16);
signal xmod : unsigned(7 downto 0) := to_unsigned(0, 8);
signal opaque : unsigned(0 downto 0) := to_unsigned(0, 1);
signal c : unsigned(15 downto 0) := to_unsigned(0, 16);
signal ch : unsigned(7 downto 0) := to_unsigned(0, 8);
signal color8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : screen_blit_result_t := screen_blit_result_t_NULL;
signal phase_minus_two : unsigned(7 downto 0) := to_unsigned(0, 8);
signal phase7_downto_4 : unsigned(3 downto 0) := to_unsigned(0, 4);
signal phase7_downto_3 : unsigned(4 downto 0) := to_unsigned(0, 5);
signal phase2_downto_0 : unsigned(2 downto 0) := to_unsigned(0, 3);
signal sprite_rows : uint8_t_16 := (others => to_unsigned(0, 8));
signal REG_COMB_blending : uint8_t_80;
signal REG_COMB_x : unsigned(15 downto 0);
signal REG_COMB_y : unsigned(15 downto 0);
signal REG_COMB_xmod : unsigned(7 downto 0);
signal REG_COMB_opaque : unsigned(0 downto 0);
signal REG_COMB_c : unsigned(15 downto 0);
signal REG_COMB_ch : unsigned(7 downto 0);
signal REG_COMB_color8 : unsigned(7 downto 0);
signal REG_COMB_result : screen_blit_result_t;
signal REG_COMB_phase_minus_two : unsigned(7 downto 0);
signal REG_COMB_phase7_downto_4 : unsigned(3 downto 0);
signal REG_COMB_phase7_downto_3 : unsigned(4 downto 0);
signal REG_COMB_phase2_downto_0 : unsigned(2 downto 0);
signal REG_COMB_sprite_rows : uint8_t_16;

-- Each function instance gets signals
-- BIN_OP_MINUS[uxn_device_h_l67_c20_9803]
signal BIN_OP_MINUS_uxn_device_h_l67_c20_9803_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l67_c20_9803_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l67_c20_9803_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l69_c6_2011]
signal BIN_OP_EQ_uxn_device_h_l69_c6_2011_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l69_c6_2011_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l69_c6_2011_return_output : unsigned(0 downto 0);

-- sprite_rows_MUX[uxn_device_h_l69_c2_53bf]
signal sprite_rows_MUX_uxn_device_h_l69_c2_53bf_cond : unsigned(0 downto 0);
signal sprite_rows_MUX_uxn_device_h_l69_c2_53bf_iftrue : uint8_t_16;
signal sprite_rows_MUX_uxn_device_h_l69_c2_53bf_iffalse : uint8_t_16;
signal sprite_rows_MUX_uxn_device_h_l69_c2_53bf_return_output : uint8_t_16;

-- VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60[uxn_device_h_l70_c3_8ebf]
signal VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_8ebf_elem_val : unsigned(7 downto 0);
signal VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_8ebf_ref_toks_0 : uint8_t_16;
signal VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_8ebf_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_8ebf_return_output : uint8_t_array_16_t;

-- BIN_OP_EQ[uxn_device_h_l73_c6_94d2]
signal BIN_OP_EQ_uxn_device_h_l73_c6_94d2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l73_c6_94d2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l73_c6_94d2_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l73_c2_1541]
signal x_MUX_uxn_device_h_l73_c2_1541_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l73_c2_1541_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l73_c2_1541_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l73_c2_1541_return_output : unsigned(15 downto 0);

-- opaque_MUX[uxn_device_h_l73_c2_1541]
signal opaque_MUX_uxn_device_h_l73_c2_1541_cond : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l73_c2_1541_iftrue : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l73_c2_1541_iffalse : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l73_c2_1541_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l73_c2_1541]
signal y_MUX_uxn_device_h_l73_c2_1541_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l73_c2_1541_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l73_c2_1541_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l73_c2_1541_return_output : unsigned(15 downto 0);

-- xmod_MUX[uxn_device_h_l73_c2_1541]
signal xmod_MUX_uxn_device_h_l73_c2_1541_cond : unsigned(0 downto 0);
signal xmod_MUX_uxn_device_h_l73_c2_1541_iftrue : unsigned(7 downto 0);
signal xmod_MUX_uxn_device_h_l73_c2_1541_iffalse : unsigned(7 downto 0);
signal xmod_MUX_uxn_device_h_l73_c2_1541_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l74_c21_6067]
signal BIN_OP_PLUS_uxn_device_h_l74_c21_6067_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l74_c21_6067_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l74_c21_6067_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d[uxn_device_h_l74_c12_c70c]
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_c70c_ref_toks_0 : uint8_t_80;
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_c70c_var_dim_0 : unsigned(6 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_c70c_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l75_c10_58a3]
signal MUX_uxn_device_h_l75_c10_58a3_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l75_c10_58a3_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l75_c10_58a3_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l75_c10_58a3_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l76_c7_e7b4]
signal BIN_OP_PLUS_uxn_device_h_l76_c7_e7b4_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l76_c7_e7b4_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l76_c7_e7b4_return_output : unsigned(8 downto 0);

-- MUX[uxn_device_h_l77_c13_ceaf]
signal MUX_uxn_device_h_l77_c13_ceaf_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l77_c13_ceaf_iftrue : unsigned(2 downto 0);
signal MUX_uxn_device_h_l77_c13_ceaf_iffalse : unsigned(2 downto 0);
signal MUX_uxn_device_h_l77_c13_ceaf_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l77_c7_84c1]
signal BIN_OP_PLUS_uxn_device_h_l77_c7_84c1_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l77_c7_84c1_right : unsigned(2 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l77_c7_84c1_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_device_h_l80_c6_d8d3]
signal BIN_OP_EQ_uxn_device_h_l80_c6_d8d3_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l80_c6_d8d3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l80_c6_d8d3_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l80_c2_fde8]
signal x_MUX_uxn_device_h_l80_c2_fde8_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l80_c2_fde8_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l80_c2_fde8_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l80_c2_fde8_return_output : unsigned(15 downto 0);

-- c_MUX[uxn_device_h_l80_c2_fde8]
signal c_MUX_uxn_device_h_l80_c2_fde8_cond : unsigned(0 downto 0);
signal c_MUX_uxn_device_h_l80_c2_fde8_iftrue : unsigned(15 downto 0);
signal c_MUX_uxn_device_h_l80_c2_fde8_iffalse : unsigned(15 downto 0);
signal c_MUX_uxn_device_h_l80_c2_fde8_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l80_c2_fde8]
signal result_is_vram_write_MUX_uxn_device_h_l80_c2_fde8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l80_c2_fde8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l80_c2_fde8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l80_c2_fde8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l80_c2_fde8]
signal result_u8_value_MUX_uxn_device_h_l80_c2_fde8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l80_c2_fde8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l80_c2_fde8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l80_c2_fde8_return_output : unsigned(7 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l80_c2_fde8]
signal result_u16_addr_MUX_uxn_device_h_l80_c2_fde8_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l80_c2_fde8_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l80_c2_fde8_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l80_c2_fde8_return_output : unsigned(15 downto 0);

-- result_is_blit_done_MUX[uxn_device_h_l80_c2_fde8]
signal result_is_blit_done_MUX_uxn_device_h_l80_c2_fde8_cond : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l80_c2_fde8_iftrue : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l80_c2_fde8_iffalse : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l80_c2_fde8_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l80_c2_fde8]
signal y_MUX_uxn_device_h_l80_c2_fde8_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l80_c2_fde8_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l80_c2_fde8_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l80_c2_fde8_return_output : unsigned(15 downto 0);

-- ch_MUX[uxn_device_h_l80_c2_fde8]
signal ch_MUX_uxn_device_h_l80_c2_fde8_cond : unsigned(0 downto 0);
signal ch_MUX_uxn_device_h_l80_c2_fde8_iftrue : unsigned(7 downto 0);
signal ch_MUX_uxn_device_h_l80_c2_fde8_iffalse : unsigned(7 downto 0);
signal ch_MUX_uxn_device_h_l80_c2_fde8_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l84_c21_d671]
signal BIN_OP_PLUS_uxn_device_h_l84_c21_d671_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l84_c21_d671_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l84_c21_d671_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l86_c7_c56a]
signal BIN_OP_EQ_uxn_device_h_l86_c7_c56a_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l86_c7_c56a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l86_c7_c56a_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l86_c46_f23c]
signal BIN_OP_MINUS_uxn_device_h_l86_c46_f23c_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l86_c46_f23c_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l86_c46_f23c_return_output : unsigned(7 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d[uxn_device_h_l86_c34_ed7b]
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_ed7b_ref_toks_0 : uint8_t_16;
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_ed7b_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_ed7b_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l86_c96_b5cd]
signal BIN_OP_PLUS_uxn_device_h_l86_c96_b5cd_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l86_c96_b5cd_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l86_c96_b5cd_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d[uxn_device_h_l86_c84_0a72]
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_0a72_ref_toks_0 : uint8_t_16;
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_0a72_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_0a72_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_device_h_l86_c84_5351]
signal CONST_SL_8_uxn_device_h_l86_c84_5351_x : unsigned(7 downto 0);
signal CONST_SL_8_uxn_device_h_l86_c84_5351_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l86_c34_0458]
signal BIN_OP_OR_uxn_device_h_l86_c34_0458_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l86_c34_0458_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l86_c34_0458_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l86_c7_5a6d]
signal MUX_uxn_device_h_l86_c7_5a6d_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l86_c7_5a6d_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l86_c7_5a6d_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l86_c7_5a6d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l87_c7_acab]
signal BIN_OP_EQ_uxn_device_h_l87_c7_acab_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l87_c7_acab_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l87_c7_acab_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l87_c35_2845]
signal BIN_OP_PLUS_uxn_device_h_l87_c35_2845_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l87_c35_2845_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l87_c35_2845_return_output : unsigned(8 downto 0);

-- MUX[uxn_device_h_l87_c7_80b8]
signal MUX_uxn_device_h_l87_c7_80b8_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l87_c7_80b8_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l87_c7_80b8_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l87_c7_80b8_return_output : unsigned(15 downto 0);

-- CONST_SL_1[uxn_device_h_l89_c3_15c1]
signal CONST_SL_1_uxn_device_h_l89_c3_15c1_x : unsigned(7 downto 0);
signal CONST_SL_1_uxn_device_h_l89_c3_15c1_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l90_c3_726b]
signal BIN_OP_OR_uxn_device_h_l90_c3_726b_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l90_c3_726b_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l90_c3_726b_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_device_h_l91_c22_6f89]
signal CONST_SL_8_uxn_device_h_l91_c22_6f89_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_device_h_l91_c22_6f89_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l91_c22_2e70]
signal BIN_OP_PLUS_uxn_device_h_l91_c22_2e70_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l91_c22_2e70_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l91_c22_2e70_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l92_c36_7603]
signal BIN_OP_EQ_uxn_device_h_l92_c36_7603_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l92_c36_7603_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l92_c36_7603_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l92_c36_9462]
signal MUX_uxn_device_h_l92_c36_9462_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l92_c36_9462_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l92_c36_9462_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l92_c36_9462_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l92_c26_8136]
signal BIN_OP_OR_uxn_device_h_l92_c26_8136_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l92_c26_8136_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l92_c26_8136_return_output : unsigned(0 downto 0);

-- CONST_SL_4[uxn_device_h_l93_c40_07b6]
signal CONST_SL_4_uxn_device_h_l93_c40_07b6_x : unsigned(7 downto 0);
signal CONST_SL_4_uxn_device_h_l93_c40_07b6_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l93_c30_ce50]
signal BIN_OP_PLUS_uxn_device_h_l93_c30_ce50_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l93_c30_ce50_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l93_c30_ce50_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d[uxn_device_h_l93_c21_d90e]
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_d90e_ref_toks_0 : uint8_t_80;
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_d90e_var_dim_0 : unsigned(6 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_d90e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l94_c7_59d0]
signal BIN_OP_EQ_uxn_device_h_l94_c7_59d0_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l94_c7_59d0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l94_c7_59d0_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l94_c41_378d]
signal BIN_OP_MINUS_uxn_device_h_l94_c41_378d_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l94_c41_378d_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l94_c41_378d_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l94_c51_b968]
signal BIN_OP_PLUS_uxn_device_h_l94_c51_b968_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l94_c51_b968_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l94_c51_b968_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l94_c35_3a97]
signal MUX_uxn_device_h_l94_c35_3a97_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l94_c35_3a97_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l94_c35_3a97_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l94_c35_3a97_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l94_c7_b18f]
signal MUX_uxn_device_h_l94_c7_b18f_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l94_c7_b18f_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l94_c7_b18f_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l94_c7_b18f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l95_c25_46aa]
signal BIN_OP_EQ_uxn_device_h_l95_c25_46aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l95_c25_46aa_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l95_c25_46aa_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l95_c25_5494]
signal MUX_uxn_device_h_l95_c25_5494_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l95_c25_5494_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l95_c25_5494_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l95_c25_5494_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l96_c14_0463]
signal BIN_OP_PLUS_uxn_device_h_l96_c14_0463_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l96_c14_0463_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l96_c14_0463_return_output : unsigned(16 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l96_c24_a553]
signal BIN_OP_MINUS_uxn_device_h_l96_c24_a553_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l96_c24_a553_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l96_c24_a553_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l96_c8_d3f0]
signal MUX_uxn_device_h_l96_c8_d3f0_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l96_c8_d3f0_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l96_c8_d3f0_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l96_c8_d3f0_return_output : unsigned(15 downto 0);

-- CONST_SR_1[uxn_device_h_l97_c3_35cc]
signal CONST_SR_1_uxn_device_h_l97_c3_35cc_x : unsigned(15 downto 0);
signal CONST_SR_1_uxn_device_h_l97_c3_35cc_return_output : unsigned(15 downto 0);

function uint8_7_4( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(3 downto 0);
begin
return_output := unsigned(std_logic_vector(x(7 downto 4)));
return return_output;
end function;

function uint8_7_3( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(4 downto 0);
begin
return_output := unsigned(std_logic_vector(x(7 downto 3)));
return return_output;
end function;

function uint8_2_0( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(2 downto 0);
begin
return_output := unsigned(std_logic_vector(x(2 downto 0)));
return return_output;
end function;

function CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5( ref_toks_0 : uint8_t_array_16_t) return uint8_t_16 is
 
  variable base : uint8_t_16; 
  variable return_output : uint8_t_16;
begin
      base(9) := ref_toks_0.data(9);
      base(12) := ref_toks_0.data(12);
      base(15) := ref_toks_0.data(15);
      base(1) := ref_toks_0.data(1);
      base(4) := ref_toks_0.data(4);
      base(7) := ref_toks_0.data(7);
      base(13) := ref_toks_0.data(13);
      base(10) := ref_toks_0.data(10);
      base(2) := ref_toks_0.data(2);
      base(5) := ref_toks_0.data(5);
      base(11) := ref_toks_0.data(11);
      base(8) := ref_toks_0.data(8);
      base(14) := ref_toks_0.data(14);
      base(0) := ref_toks_0.data(0);
      base(6) := ref_toks_0.data(6);
      base(3) := ref_toks_0.data(3);

      return_output := base;
      return return_output; 
end function;

function uint16_8_8( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(8- i);
      end loop;
return return_output;
end function;

function uint16_0_0( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(0- i);
      end loop;
return return_output;
end function;

function CAST_TO_uint8_t_uint5_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(4 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_15f2( ref_toks_0 : screen_blit_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return screen_blit_result_t is
 
  variable base : screen_blit_result_t; 
  variable return_output : screen_blit_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.u16_addr := ref_toks_3;
      base.is_blit_done := ref_toks_4;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_MINUS_uxn_device_h_l67_c20_9803
BIN_OP_MINUS_uxn_device_h_l67_c20_9803 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l67_c20_9803_left,
BIN_OP_MINUS_uxn_device_h_l67_c20_9803_right,
BIN_OP_MINUS_uxn_device_h_l67_c20_9803_return_output);

-- BIN_OP_EQ_uxn_device_h_l69_c6_2011
BIN_OP_EQ_uxn_device_h_l69_c6_2011 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l69_c6_2011_left,
BIN_OP_EQ_uxn_device_h_l69_c6_2011_right,
BIN_OP_EQ_uxn_device_h_l69_c6_2011_return_output);

-- sprite_rows_MUX_uxn_device_h_l69_c2_53bf
sprite_rows_MUX_uxn_device_h_l69_c2_53bf : entity work.MUX_uint1_t_uint8_t_16_uint8_t_16_0CLK_de264c78 port map (
sprite_rows_MUX_uxn_device_h_l69_c2_53bf_cond,
sprite_rows_MUX_uxn_device_h_l69_c2_53bf_iftrue,
sprite_rows_MUX_uxn_device_h_l69_c2_53bf_iffalse,
sprite_rows_MUX_uxn_device_h_l69_c2_53bf_return_output);

-- VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_8ebf
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_8ebf : entity work.VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_0CLK_6481cb28 port map (
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_8ebf_elem_val,
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_8ebf_ref_toks_0,
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_8ebf_var_dim_0,
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_8ebf_return_output);

-- BIN_OP_EQ_uxn_device_h_l73_c6_94d2
BIN_OP_EQ_uxn_device_h_l73_c6_94d2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l73_c6_94d2_left,
BIN_OP_EQ_uxn_device_h_l73_c6_94d2_right,
BIN_OP_EQ_uxn_device_h_l73_c6_94d2_return_output);

-- x_MUX_uxn_device_h_l73_c2_1541
x_MUX_uxn_device_h_l73_c2_1541 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l73_c2_1541_cond,
x_MUX_uxn_device_h_l73_c2_1541_iftrue,
x_MUX_uxn_device_h_l73_c2_1541_iffalse,
x_MUX_uxn_device_h_l73_c2_1541_return_output);

-- opaque_MUX_uxn_device_h_l73_c2_1541
opaque_MUX_uxn_device_h_l73_c2_1541 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opaque_MUX_uxn_device_h_l73_c2_1541_cond,
opaque_MUX_uxn_device_h_l73_c2_1541_iftrue,
opaque_MUX_uxn_device_h_l73_c2_1541_iffalse,
opaque_MUX_uxn_device_h_l73_c2_1541_return_output);

-- y_MUX_uxn_device_h_l73_c2_1541
y_MUX_uxn_device_h_l73_c2_1541 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l73_c2_1541_cond,
y_MUX_uxn_device_h_l73_c2_1541_iftrue,
y_MUX_uxn_device_h_l73_c2_1541_iffalse,
y_MUX_uxn_device_h_l73_c2_1541_return_output);

-- xmod_MUX_uxn_device_h_l73_c2_1541
xmod_MUX_uxn_device_h_l73_c2_1541 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
xmod_MUX_uxn_device_h_l73_c2_1541_cond,
xmod_MUX_uxn_device_h_l73_c2_1541_iftrue,
xmod_MUX_uxn_device_h_l73_c2_1541_iffalse,
xmod_MUX_uxn_device_h_l73_c2_1541_return_output);

-- BIN_OP_PLUS_uxn_device_h_l74_c21_6067
BIN_OP_PLUS_uxn_device_h_l74_c21_6067 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l74_c21_6067_left,
BIN_OP_PLUS_uxn_device_h_l74_c21_6067_right,
BIN_OP_PLUS_uxn_device_h_l74_c21_6067_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_c70c
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_c70c : entity work.VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_0CLK_4b00ae23 port map (
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_c70c_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_c70c_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_c70c_return_output);

-- MUX_uxn_device_h_l75_c10_58a3
MUX_uxn_device_h_l75_c10_58a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l75_c10_58a3_cond,
MUX_uxn_device_h_l75_c10_58a3_iftrue,
MUX_uxn_device_h_l75_c10_58a3_iffalse,
MUX_uxn_device_h_l75_c10_58a3_return_output);

-- BIN_OP_PLUS_uxn_device_h_l76_c7_e7b4
BIN_OP_PLUS_uxn_device_h_l76_c7_e7b4 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l76_c7_e7b4_left,
BIN_OP_PLUS_uxn_device_h_l76_c7_e7b4_right,
BIN_OP_PLUS_uxn_device_h_l76_c7_e7b4_return_output);

-- MUX_uxn_device_h_l77_c13_ceaf
MUX_uxn_device_h_l77_c13_ceaf : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l77_c13_ceaf_cond,
MUX_uxn_device_h_l77_c13_ceaf_iftrue,
MUX_uxn_device_h_l77_c13_ceaf_iffalse,
MUX_uxn_device_h_l77_c13_ceaf_return_output);

-- BIN_OP_PLUS_uxn_device_h_l77_c7_84c1
BIN_OP_PLUS_uxn_device_h_l77_c7_84c1 : entity work.BIN_OP_PLUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l77_c7_84c1_left,
BIN_OP_PLUS_uxn_device_h_l77_c7_84c1_right,
BIN_OP_PLUS_uxn_device_h_l77_c7_84c1_return_output);

-- BIN_OP_EQ_uxn_device_h_l80_c6_d8d3
BIN_OP_EQ_uxn_device_h_l80_c6_d8d3 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l80_c6_d8d3_left,
BIN_OP_EQ_uxn_device_h_l80_c6_d8d3_right,
BIN_OP_EQ_uxn_device_h_l80_c6_d8d3_return_output);

-- x_MUX_uxn_device_h_l80_c2_fde8
x_MUX_uxn_device_h_l80_c2_fde8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l80_c2_fde8_cond,
x_MUX_uxn_device_h_l80_c2_fde8_iftrue,
x_MUX_uxn_device_h_l80_c2_fde8_iffalse,
x_MUX_uxn_device_h_l80_c2_fde8_return_output);

-- c_MUX_uxn_device_h_l80_c2_fde8
c_MUX_uxn_device_h_l80_c2_fde8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
c_MUX_uxn_device_h_l80_c2_fde8_cond,
c_MUX_uxn_device_h_l80_c2_fde8_iftrue,
c_MUX_uxn_device_h_l80_c2_fde8_iffalse,
c_MUX_uxn_device_h_l80_c2_fde8_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l80_c2_fde8
result_is_vram_write_MUX_uxn_device_h_l80_c2_fde8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l80_c2_fde8_cond,
result_is_vram_write_MUX_uxn_device_h_l80_c2_fde8_iftrue,
result_is_vram_write_MUX_uxn_device_h_l80_c2_fde8_iffalse,
result_is_vram_write_MUX_uxn_device_h_l80_c2_fde8_return_output);

-- result_u8_value_MUX_uxn_device_h_l80_c2_fde8
result_u8_value_MUX_uxn_device_h_l80_c2_fde8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l80_c2_fde8_cond,
result_u8_value_MUX_uxn_device_h_l80_c2_fde8_iftrue,
result_u8_value_MUX_uxn_device_h_l80_c2_fde8_iffalse,
result_u8_value_MUX_uxn_device_h_l80_c2_fde8_return_output);

-- result_u16_addr_MUX_uxn_device_h_l80_c2_fde8
result_u16_addr_MUX_uxn_device_h_l80_c2_fde8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l80_c2_fde8_cond,
result_u16_addr_MUX_uxn_device_h_l80_c2_fde8_iftrue,
result_u16_addr_MUX_uxn_device_h_l80_c2_fde8_iffalse,
result_u16_addr_MUX_uxn_device_h_l80_c2_fde8_return_output);

-- result_is_blit_done_MUX_uxn_device_h_l80_c2_fde8
result_is_blit_done_MUX_uxn_device_h_l80_c2_fde8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_blit_done_MUX_uxn_device_h_l80_c2_fde8_cond,
result_is_blit_done_MUX_uxn_device_h_l80_c2_fde8_iftrue,
result_is_blit_done_MUX_uxn_device_h_l80_c2_fde8_iffalse,
result_is_blit_done_MUX_uxn_device_h_l80_c2_fde8_return_output);

-- y_MUX_uxn_device_h_l80_c2_fde8
y_MUX_uxn_device_h_l80_c2_fde8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l80_c2_fde8_cond,
y_MUX_uxn_device_h_l80_c2_fde8_iftrue,
y_MUX_uxn_device_h_l80_c2_fde8_iffalse,
y_MUX_uxn_device_h_l80_c2_fde8_return_output);

-- ch_MUX_uxn_device_h_l80_c2_fde8
ch_MUX_uxn_device_h_l80_c2_fde8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ch_MUX_uxn_device_h_l80_c2_fde8_cond,
ch_MUX_uxn_device_h_l80_c2_fde8_iftrue,
ch_MUX_uxn_device_h_l80_c2_fde8_iffalse,
ch_MUX_uxn_device_h_l80_c2_fde8_return_output);

-- BIN_OP_PLUS_uxn_device_h_l84_c21_d671
BIN_OP_PLUS_uxn_device_h_l84_c21_d671 : entity work.BIN_OP_PLUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l84_c21_d671_left,
BIN_OP_PLUS_uxn_device_h_l84_c21_d671_right,
BIN_OP_PLUS_uxn_device_h_l84_c21_d671_return_output);

-- BIN_OP_EQ_uxn_device_h_l86_c7_c56a
BIN_OP_EQ_uxn_device_h_l86_c7_c56a : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l86_c7_c56a_left,
BIN_OP_EQ_uxn_device_h_l86_c7_c56a_right,
BIN_OP_EQ_uxn_device_h_l86_c7_c56a_return_output);

-- BIN_OP_MINUS_uxn_device_h_l86_c46_f23c
BIN_OP_MINUS_uxn_device_h_l86_c46_f23c : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l86_c46_f23c_left,
BIN_OP_MINUS_uxn_device_h_l86_c46_f23c_right,
BIN_OP_MINUS_uxn_device_h_l86_c46_f23c_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_ed7b
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_ed7b : entity work.VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_0CLK_e799c7f1 port map (
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_ed7b_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_ed7b_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_ed7b_return_output);

-- BIN_OP_PLUS_uxn_device_h_l86_c96_b5cd
BIN_OP_PLUS_uxn_device_h_l86_c96_b5cd : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l86_c96_b5cd_left,
BIN_OP_PLUS_uxn_device_h_l86_c96_b5cd_right,
BIN_OP_PLUS_uxn_device_h_l86_c96_b5cd_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_0a72
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_0a72 : entity work.VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_0CLK_e799c7f1 port map (
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_0a72_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_0a72_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_0a72_return_output);

-- CONST_SL_8_uxn_device_h_l86_c84_5351
CONST_SL_8_uxn_device_h_l86_c84_5351 : entity work.CONST_SL_8_uint8_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_device_h_l86_c84_5351_x,
CONST_SL_8_uxn_device_h_l86_c84_5351_return_output);

-- BIN_OP_OR_uxn_device_h_l86_c34_0458
BIN_OP_OR_uxn_device_h_l86_c34_0458 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l86_c34_0458_left,
BIN_OP_OR_uxn_device_h_l86_c34_0458_right,
BIN_OP_OR_uxn_device_h_l86_c34_0458_return_output);

-- MUX_uxn_device_h_l86_c7_5a6d
MUX_uxn_device_h_l86_c7_5a6d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l86_c7_5a6d_cond,
MUX_uxn_device_h_l86_c7_5a6d_iftrue,
MUX_uxn_device_h_l86_c7_5a6d_iffalse,
MUX_uxn_device_h_l86_c7_5a6d_return_output);

-- BIN_OP_EQ_uxn_device_h_l87_c7_acab
BIN_OP_EQ_uxn_device_h_l87_c7_acab : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l87_c7_acab_left,
BIN_OP_EQ_uxn_device_h_l87_c7_acab_right,
BIN_OP_EQ_uxn_device_h_l87_c7_acab_return_output);

-- BIN_OP_PLUS_uxn_device_h_l87_c35_2845
BIN_OP_PLUS_uxn_device_h_l87_c35_2845 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l87_c35_2845_left,
BIN_OP_PLUS_uxn_device_h_l87_c35_2845_right,
BIN_OP_PLUS_uxn_device_h_l87_c35_2845_return_output);

-- MUX_uxn_device_h_l87_c7_80b8
MUX_uxn_device_h_l87_c7_80b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l87_c7_80b8_cond,
MUX_uxn_device_h_l87_c7_80b8_iftrue,
MUX_uxn_device_h_l87_c7_80b8_iffalse,
MUX_uxn_device_h_l87_c7_80b8_return_output);

-- CONST_SL_1_uxn_device_h_l89_c3_15c1
CONST_SL_1_uxn_device_h_l89_c3_15c1 : entity work.CONST_SL_1_uint8_t_0CLK_de264c78 port map (
CONST_SL_1_uxn_device_h_l89_c3_15c1_x,
CONST_SL_1_uxn_device_h_l89_c3_15c1_return_output);

-- BIN_OP_OR_uxn_device_h_l90_c3_726b
BIN_OP_OR_uxn_device_h_l90_c3_726b : entity work.BIN_OP_OR_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l90_c3_726b_left,
BIN_OP_OR_uxn_device_h_l90_c3_726b_right,
BIN_OP_OR_uxn_device_h_l90_c3_726b_return_output);

-- CONST_SL_8_uxn_device_h_l91_c22_6f89
CONST_SL_8_uxn_device_h_l91_c22_6f89 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_device_h_l91_c22_6f89_x,
CONST_SL_8_uxn_device_h_l91_c22_6f89_return_output);

-- BIN_OP_PLUS_uxn_device_h_l91_c22_2e70
BIN_OP_PLUS_uxn_device_h_l91_c22_2e70 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l91_c22_2e70_left,
BIN_OP_PLUS_uxn_device_h_l91_c22_2e70_right,
BIN_OP_PLUS_uxn_device_h_l91_c22_2e70_return_output);

-- BIN_OP_EQ_uxn_device_h_l92_c36_7603
BIN_OP_EQ_uxn_device_h_l92_c36_7603 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l92_c36_7603_left,
BIN_OP_EQ_uxn_device_h_l92_c36_7603_right,
BIN_OP_EQ_uxn_device_h_l92_c36_7603_return_output);

-- MUX_uxn_device_h_l92_c36_9462
MUX_uxn_device_h_l92_c36_9462 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l92_c36_9462_cond,
MUX_uxn_device_h_l92_c36_9462_iftrue,
MUX_uxn_device_h_l92_c36_9462_iffalse,
MUX_uxn_device_h_l92_c36_9462_return_output);

-- BIN_OP_OR_uxn_device_h_l92_c26_8136
BIN_OP_OR_uxn_device_h_l92_c26_8136 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l92_c26_8136_left,
BIN_OP_OR_uxn_device_h_l92_c26_8136_right,
BIN_OP_OR_uxn_device_h_l92_c26_8136_return_output);

-- CONST_SL_4_uxn_device_h_l93_c40_07b6
CONST_SL_4_uxn_device_h_l93_c40_07b6 : entity work.CONST_SL_4_uint8_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_device_h_l93_c40_07b6_x,
CONST_SL_4_uxn_device_h_l93_c40_07b6_return_output);

-- BIN_OP_PLUS_uxn_device_h_l93_c30_ce50
BIN_OP_PLUS_uxn_device_h_l93_c30_ce50 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l93_c30_ce50_left,
BIN_OP_PLUS_uxn_device_h_l93_c30_ce50_right,
BIN_OP_PLUS_uxn_device_h_l93_c30_ce50_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_d90e
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_d90e : entity work.VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_0CLK_4b00ae23 port map (
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_d90e_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_d90e_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_d90e_return_output);

-- BIN_OP_EQ_uxn_device_h_l94_c7_59d0
BIN_OP_EQ_uxn_device_h_l94_c7_59d0 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l94_c7_59d0_left,
BIN_OP_EQ_uxn_device_h_l94_c7_59d0_right,
BIN_OP_EQ_uxn_device_h_l94_c7_59d0_return_output);

-- BIN_OP_MINUS_uxn_device_h_l94_c41_378d
BIN_OP_MINUS_uxn_device_h_l94_c41_378d : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l94_c41_378d_left,
BIN_OP_MINUS_uxn_device_h_l94_c41_378d_right,
BIN_OP_MINUS_uxn_device_h_l94_c41_378d_return_output);

-- BIN_OP_PLUS_uxn_device_h_l94_c51_b968
BIN_OP_PLUS_uxn_device_h_l94_c51_b968 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l94_c51_b968_left,
BIN_OP_PLUS_uxn_device_h_l94_c51_b968_right,
BIN_OP_PLUS_uxn_device_h_l94_c51_b968_return_output);

-- MUX_uxn_device_h_l94_c35_3a97
MUX_uxn_device_h_l94_c35_3a97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l94_c35_3a97_cond,
MUX_uxn_device_h_l94_c35_3a97_iftrue,
MUX_uxn_device_h_l94_c35_3a97_iffalse,
MUX_uxn_device_h_l94_c35_3a97_return_output);

-- MUX_uxn_device_h_l94_c7_b18f
MUX_uxn_device_h_l94_c7_b18f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l94_c7_b18f_cond,
MUX_uxn_device_h_l94_c7_b18f_iftrue,
MUX_uxn_device_h_l94_c7_b18f_iffalse,
MUX_uxn_device_h_l94_c7_b18f_return_output);

-- BIN_OP_EQ_uxn_device_h_l95_c25_46aa
BIN_OP_EQ_uxn_device_h_l95_c25_46aa : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l95_c25_46aa_left,
BIN_OP_EQ_uxn_device_h_l95_c25_46aa_right,
BIN_OP_EQ_uxn_device_h_l95_c25_46aa_return_output);

-- MUX_uxn_device_h_l95_c25_5494
MUX_uxn_device_h_l95_c25_5494 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l95_c25_5494_cond,
MUX_uxn_device_h_l95_c25_5494_iftrue,
MUX_uxn_device_h_l95_c25_5494_iffalse,
MUX_uxn_device_h_l95_c25_5494_return_output);

-- BIN_OP_PLUS_uxn_device_h_l96_c14_0463
BIN_OP_PLUS_uxn_device_h_l96_c14_0463 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l96_c14_0463_left,
BIN_OP_PLUS_uxn_device_h_l96_c14_0463_right,
BIN_OP_PLUS_uxn_device_h_l96_c14_0463_return_output);

-- BIN_OP_MINUS_uxn_device_h_l96_c24_a553
BIN_OP_MINUS_uxn_device_h_l96_c24_a553 : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l96_c24_a553_left,
BIN_OP_MINUS_uxn_device_h_l96_c24_a553_right,
BIN_OP_MINUS_uxn_device_h_l96_c24_a553_return_output);

-- MUX_uxn_device_h_l96_c8_d3f0
MUX_uxn_device_h_l96_c8_d3f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l96_c8_d3f0_cond,
MUX_uxn_device_h_l96_c8_d3f0_iftrue,
MUX_uxn_device_h_l96_c8_d3f0_iffalse,
MUX_uxn_device_h_l96_c8_d3f0_return_output);

-- CONST_SR_1_uxn_device_h_l97_c3_35cc
CONST_SR_1_uxn_device_h_l97_c3_35cc : entity work.CONST_SR_1_uint16_t_0CLK_de264c78 port map (
CONST_SR_1_uxn_device_h_l97_c3_35cc_x,
CONST_SR_1_uxn_device_h_l97_c3_35cc_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 x1,
 y1,
 color,
 fx,
 fy,
 ram_addr,
 previous_ram_read,
 -- Registers
 blending,
 x,
 y,
 xmod,
 opaque,
 c,
 ch,
 color8,
 result,
 phase_minus_two,
 phase7_downto_4,
 phase7_downto_3,
 phase2_downto_0,
 sprite_rows,
 -- All submodule outputs
 BIN_OP_MINUS_uxn_device_h_l67_c20_9803_return_output,
 BIN_OP_EQ_uxn_device_h_l69_c6_2011_return_output,
 sprite_rows_MUX_uxn_device_h_l69_c2_53bf_return_output,
 VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_8ebf_return_output,
 BIN_OP_EQ_uxn_device_h_l73_c6_94d2_return_output,
 x_MUX_uxn_device_h_l73_c2_1541_return_output,
 opaque_MUX_uxn_device_h_l73_c2_1541_return_output,
 y_MUX_uxn_device_h_l73_c2_1541_return_output,
 xmod_MUX_uxn_device_h_l73_c2_1541_return_output,
 BIN_OP_PLUS_uxn_device_h_l74_c21_6067_return_output,
 VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_c70c_return_output,
 MUX_uxn_device_h_l75_c10_58a3_return_output,
 BIN_OP_PLUS_uxn_device_h_l76_c7_e7b4_return_output,
 MUX_uxn_device_h_l77_c13_ceaf_return_output,
 BIN_OP_PLUS_uxn_device_h_l77_c7_84c1_return_output,
 BIN_OP_EQ_uxn_device_h_l80_c6_d8d3_return_output,
 x_MUX_uxn_device_h_l80_c2_fde8_return_output,
 c_MUX_uxn_device_h_l80_c2_fde8_return_output,
 result_is_vram_write_MUX_uxn_device_h_l80_c2_fde8_return_output,
 result_u8_value_MUX_uxn_device_h_l80_c2_fde8_return_output,
 result_u16_addr_MUX_uxn_device_h_l80_c2_fde8_return_output,
 result_is_blit_done_MUX_uxn_device_h_l80_c2_fde8_return_output,
 y_MUX_uxn_device_h_l80_c2_fde8_return_output,
 ch_MUX_uxn_device_h_l80_c2_fde8_return_output,
 BIN_OP_PLUS_uxn_device_h_l84_c21_d671_return_output,
 BIN_OP_EQ_uxn_device_h_l86_c7_c56a_return_output,
 BIN_OP_MINUS_uxn_device_h_l86_c46_f23c_return_output,
 VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_ed7b_return_output,
 BIN_OP_PLUS_uxn_device_h_l86_c96_b5cd_return_output,
 VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_0a72_return_output,
 CONST_SL_8_uxn_device_h_l86_c84_5351_return_output,
 BIN_OP_OR_uxn_device_h_l86_c34_0458_return_output,
 MUX_uxn_device_h_l86_c7_5a6d_return_output,
 BIN_OP_EQ_uxn_device_h_l87_c7_acab_return_output,
 BIN_OP_PLUS_uxn_device_h_l87_c35_2845_return_output,
 MUX_uxn_device_h_l87_c7_80b8_return_output,
 CONST_SL_1_uxn_device_h_l89_c3_15c1_return_output,
 BIN_OP_OR_uxn_device_h_l90_c3_726b_return_output,
 CONST_SL_8_uxn_device_h_l91_c22_6f89_return_output,
 BIN_OP_PLUS_uxn_device_h_l91_c22_2e70_return_output,
 BIN_OP_EQ_uxn_device_h_l92_c36_7603_return_output,
 MUX_uxn_device_h_l92_c36_9462_return_output,
 BIN_OP_OR_uxn_device_h_l92_c26_8136_return_output,
 CONST_SL_4_uxn_device_h_l93_c40_07b6_return_output,
 BIN_OP_PLUS_uxn_device_h_l93_c30_ce50_return_output,
 VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_d90e_return_output,
 BIN_OP_EQ_uxn_device_h_l94_c7_59d0_return_output,
 BIN_OP_MINUS_uxn_device_h_l94_c41_378d_return_output,
 BIN_OP_PLUS_uxn_device_h_l94_c51_b968_return_output,
 MUX_uxn_device_h_l94_c35_3a97_return_output,
 MUX_uxn_device_h_l94_c7_b18f_return_output,
 BIN_OP_EQ_uxn_device_h_l95_c25_46aa_return_output,
 MUX_uxn_device_h_l95_c25_5494_return_output,
 BIN_OP_PLUS_uxn_device_h_l96_c14_0463_return_output,
 BIN_OP_MINUS_uxn_device_h_l96_c24_a553_return_output,
 MUX_uxn_device_h_l96_c8_d3f0_return_output,
 CONST_SR_1_uxn_device_h_l97_c3_35cc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : screen_blit_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_x1 : unsigned(7 downto 0);
 variable VAR_y1 : unsigned(7 downto 0);
 variable VAR_color : unsigned(3 downto 0);
 variable VAR_fx : unsigned(0 downto 0);
 variable VAR_fy : unsigned(0 downto 0);
 variable VAR_ram_addr : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_color8_uxn_device_h_l63_c2_d6b0 : unsigned(7 downto 0);
 variable VAR_uint8_7_4_uxn_device_h_l64_c20_43ad_return_output : unsigned(3 downto 0);
 variable VAR_uint8_7_3_uxn_device_h_l65_c20_2b72_return_output : unsigned(4 downto 0);
 variable VAR_uint8_2_0_uxn_device_h_l66_c20_acb4_return_output : unsigned(2 downto 0);
 variable VAR_phase_minus_two_uxn_device_h_l67_c2_1f71 : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l67_c20_9803_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l67_c20_9803_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l67_c20_9803_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l69_c6_2011_left : unsigned(3 downto 0);
 variable VAR_uint8_7_4_uxn_device_h_l69_c6_1aaf_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l69_c6_2011_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l69_c6_2011_return_output : unsigned(0 downto 0);
 variable VAR_sprite_rows_MUX_uxn_device_h_l69_c2_53bf_iftrue : uint8_t_16;
 variable VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5_uxn_device_h_l69_c2_53bf_return_output : uint8_t_16;
 variable VAR_sprite_rows_MUX_uxn_device_h_l69_c2_53bf_iffalse : uint8_t_16;
 variable VAR_sprite_rows_MUX_uxn_device_h_l69_c2_53bf_return_output : uint8_t_16;
 variable VAR_sprite_rows_MUX_uxn_device_h_l69_c2_53bf_cond : unsigned(0 downto 0);
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_8ebf_return_output : uint8_t_array_16_t;
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_8ebf_elem_val : unsigned(7 downto 0);
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_8ebf_ref_toks_0 : uint8_t_16;
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_8ebf_var_dim_0 : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c6_94d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c6_94d2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c6_94d2_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l73_c2_1541_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l76_c3_707c : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l73_c2_1541_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l73_c2_1541_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l73_c2_1541_cond : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l73_c2_1541_iftrue : unsigned(0 downto 0);
 variable VAR_opaque_uxn_device_h_l74_c3_657a : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l73_c2_1541_iffalse : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l73_c2_1541_return_output : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l73_c2_1541_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l73_c2_1541_iftrue : unsigned(15 downto 0);
 variable VAR_y_uxn_device_h_l77_c3_57d6 : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l73_c2_1541_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l73_c2_1541_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l73_c2_1541_cond : unsigned(0 downto 0);
 variable VAR_xmod_MUX_uxn_device_h_l73_c2_1541_iftrue : unsigned(7 downto 0);
 variable VAR_xmod_MUX_uxn_device_h_l73_c2_1541_iffalse : unsigned(7 downto 0);
 variable VAR_xmod_MUX_uxn_device_h_l73_c2_1541_return_output : unsigned(7 downto 0);
 variable VAR_xmod_MUX_uxn_device_h_l73_c2_1541_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l74_c21_6067_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l74_c21_6067_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l74_c21_6067_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_c70c_var_dim_0 : unsigned(6 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_c70c_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_c70c_ref_toks_0 : uint8_t_80;
 variable VAR_MUX_uxn_device_h_l75_c10_58a3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l75_c10_58a3_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l75_c10_58a3_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l75_c10_58a3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l76_c7_e7b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l76_c7_e7b4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l76_c7_e7b4_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_84c1_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l77_c13_ceaf_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l77_c13_ceaf_iftrue : unsigned(2 downto 0);
 variable VAR_MUX_uxn_device_h_l77_c13_ceaf_iffalse : unsigned(2 downto 0);
 variable VAR_MUX_uxn_device_h_l77_c13_ceaf_return_output : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_84c1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_84c1_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l80_c6_d8d3_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l80_c6_d8d3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l80_c6_d8d3_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l80_c2_fde8_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l80_c2_fde8_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l80_c2_fde8_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l80_c2_fde8_cond : unsigned(0 downto 0);
 variable VAR_c_MUX_uxn_device_h_l80_c2_fde8_iftrue : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l80_c2_fde8_iffalse : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l80_c2_fde8_return_output : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l80_c2_fde8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l80_c2_fde8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l80_c2_fde8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l80_c2_fde8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l80_c2_fde8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l80_c2_fde8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l82_c3_92e1 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l80_c2_fde8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l80_c2_fde8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l80_c2_fde8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l80_c2_fde8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l84_c3_9ab5 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l80_c2_fde8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l91_c3_6728 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l80_c2_fde8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l80_c2_fde8_cond : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l80_c2_fde8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l80_c2_fde8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l80_c2_fde8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l80_c2_fde8_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l80_c2_fde8_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l80_c2_fde8_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l80_c2_fde8_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l80_c2_fde8_cond : unsigned(0 downto 0);
 variable VAR_ch_MUX_uxn_device_h_l80_c2_fde8_iftrue : unsigned(7 downto 0);
 variable VAR_ch_MUX_uxn_device_h_l80_c2_fde8_iffalse : unsigned(7 downto 0);
 variable VAR_ch_MUX_uxn_device_h_l80_c2_fde8_return_output : unsigned(7 downto 0);
 variable VAR_ch_MUX_uxn_device_h_l80_c2_fde8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l84_c21_d671_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l84_c21_d671_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l84_c21_d671_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l86_c7_5a6d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l86_c7_c56a_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l86_c7_c56a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l86_c7_c56a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l86_c7_5a6d_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l86_c7_5a6d_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l86_c46_f23c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l86_c46_f23c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l86_c46_f23c_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_ed7b_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_ed7b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l86_c34_0458_left : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_ed7b_ref_toks_0 : uint8_t_16;
 variable VAR_BIN_OP_PLUS_uxn_device_h_l86_c96_b5cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l86_c96_b5cd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l86_c96_b5cd_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_0a72_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_0a72_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_0a72_ref_toks_0 : uint8_t_16;
 variable VAR_CONST_SL_8_uxn_device_h_l86_c84_5351_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l86_c34_0458_right : unsigned(7 downto 0);
 variable VAR_CONST_SL_8_uxn_device_h_l86_c84_5351_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l86_c34_0458_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l86_c7_5a6d_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l87_c7_80b8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l87_c7_acab_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l87_c7_acab_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l87_c7_acab_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l87_c7_80b8_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l87_c7_80b8_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l87_c35_2845_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l87_c35_2845_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l87_c35_2845_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_device_h_l87_c7_80b8_return_output : unsigned(15 downto 0);
 variable VAR_ch_uxn_device_h_l88_c3_490e : unsigned(7 downto 0);
 variable VAR_uint16_8_8_uxn_device_h_l88_c8_a656_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SL_1_uxn_device_h_l89_c3_15c1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SL_1_uxn_device_h_l89_c3_15c1_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l90_c3_726b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l90_c3_726b_right : unsigned(0 downto 0);
 variable VAR_uint16_0_0_uxn_device_h_l90_c9_eb10_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l90_c3_726b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SL_8_uxn_device_h_l91_c22_6f89_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l91_c22_2e70_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_device_h_l91_c22_6f89_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l91_c22_2e70_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l91_c22_2e70_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l92_c26_8136_left : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c36_9462_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l92_c36_7603_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l92_c36_7603_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l92_c36_7603_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c36_9462_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c36_9462_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c36_9462_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l92_c26_8136_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l92_c26_8136_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l93_c30_ce50_left : unsigned(7 downto 0);
 variable VAR_CONST_SL_4_uxn_device_h_l93_c40_07b6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l93_c30_ce50_right : unsigned(7 downto 0);
 variable VAR_CONST_SL_4_uxn_device_h_l93_c40_07b6_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l93_c30_ce50_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_d90e_var_dim_0 : unsigned(6 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_d90e_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_d90e_ref_toks_0 : uint8_t_80;
 variable VAR_MUX_uxn_device_h_l94_c7_b18f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l94_c7_59d0_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l94_c7_59d0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l94_c7_59d0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l94_c7_b18f_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l94_c7_b18f_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l94_c35_3a97_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l94_c35_3a97_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l94_c35_3a97_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l94_c41_378d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l94_c41_378d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l94_c41_378d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l94_c51_b968_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l94_c51_b968_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l94_c51_b968_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l94_c35_3a97_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l94_c7_b18f_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c25_5494_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c25_46aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c25_46aa_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c25_46aa_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c25_5494_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c25_5494_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c25_5494_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c8_d3f0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c8_d3f0_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c8_d3f0_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l96_c14_0463_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l96_c14_0463_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l96_c14_0463_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l96_c24_a553_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l96_c24_a553_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l96_c24_a553_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c8_d3f0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l97_c3_35cc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l97_c3_35cc_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint5_t_uxn_device_h_l86_DUPLICATE_2414_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_15f2_uxn_device_h_l100_l42_DUPLICATE_1907_return_output : screen_blit_result_t;
 -- State registers comb logic variables
variable REG_VAR_blending : uint8_t_80;
variable REG_VAR_x : unsigned(15 downto 0);
variable REG_VAR_y : unsigned(15 downto 0);
variable REG_VAR_xmod : unsigned(7 downto 0);
variable REG_VAR_opaque : unsigned(0 downto 0);
variable REG_VAR_c : unsigned(15 downto 0);
variable REG_VAR_ch : unsigned(7 downto 0);
variable REG_VAR_color8 : unsigned(7 downto 0);
variable REG_VAR_result : screen_blit_result_t;
variable REG_VAR_phase_minus_two : unsigned(7 downto 0);
variable REG_VAR_phase7_downto_4 : unsigned(3 downto 0);
variable REG_VAR_phase7_downto_3 : unsigned(4 downto 0);
variable REG_VAR_phase2_downto_0 : unsigned(2 downto 0);
variable REG_VAR_sprite_rows : uint8_t_16;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_blending := blending;
  REG_VAR_x := x;
  REG_VAR_y := y;
  REG_VAR_xmod := xmod;
  REG_VAR_opaque := opaque;
  REG_VAR_c := c;
  REG_VAR_ch := ch;
  REG_VAR_color8 := color8;
  REG_VAR_result := result;
  REG_VAR_phase_minus_two := phase_minus_two;
  REG_VAR_phase7_downto_4 := phase7_downto_4;
  REG_VAR_phase7_downto_3 := phase7_downto_3;
  REG_VAR_phase2_downto_0 := phase2_downto_0;
  REG_VAR_sprite_rows := sprite_rows;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_device_h_l94_c51_b968_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l92_c36_7603_right := to_unsigned(0, 8);
     VAR_MUX_uxn_device_h_l95_c25_5494_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l74_c21_6067_left := to_unsigned(64, 8);
     VAR_BIN_OP_MINUS_uxn_device_h_l94_c41_378d_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l75_c10_58a3_iffalse := resize(to_unsigned(7, 3), 8);
     VAR_MUX_uxn_device_h_l95_c25_5494_iffalse := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l80_c2_fde8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l86_c96_b5cd_right := to_unsigned(6, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l87_c7_acab_right := to_unsigned(0, 3);
     VAR_BIN_OP_MINUS_uxn_device_h_l86_c46_f23c_right := to_unsigned(2, 8);
     VAR_MUX_uxn_device_h_l92_c36_9462_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l69_c6_2011_right := to_unsigned(0, 1);
     VAR_result_u8_value_uxn_device_h_l82_c3_92e1 := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l80_c2_fde8_iftrue := VAR_result_u8_value_uxn_device_h_l82_c3_92e1;
     VAR_BIN_OP_MINUS_uxn_device_h_l67_c20_9803_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l94_c7_59d0_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l95_c25_46aa_right := to_unsigned(79, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l73_c6_94d2_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l77_c13_ceaf_iftrue := to_unsigned(7, 3);
     VAR_BIN_OP_MINUS_uxn_device_h_l96_c24_a553_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l86_c7_c56a_right := to_unsigned(0, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l80_c6_d8d3_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l75_c10_58a3_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_device_h_l77_c13_ceaf_iffalse := resize(to_unsigned(0, 1), 3);
     VAR_BIN_OP_PLUS_uxn_device_h_l96_c14_0463_right := to_unsigned(1, 1);
     VAR_result_is_blit_done_MUX_uxn_device_h_l80_c2_fde8_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l92_c36_9462_iffalse := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_x1 := x1;
     VAR_y1 := y1;
     VAR_color := color;
     VAR_fx := fx;
     VAR_fy := fy;
     VAR_ram_addr := ram_addr;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_c70c_ref_toks_0 := blending;
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_d90e_ref_toks_0 := blending;
     REG_VAR_blending := blending;
     VAR_MUX_uxn_device_h_l86_c7_5a6d_iffalse := c;
     VAR_c_MUX_uxn_device_h_l80_c2_fde8_iftrue := c;
     VAR_ch_MUX_uxn_device_h_l80_c2_fde8_iftrue := ch;
     VAR_color8_uxn_device_h_l63_c2_d6b0 := resize(VAR_color, 8);
     VAR_MUX_uxn_device_h_l75_c10_58a3_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l96_c8_d3f0_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l77_c13_ceaf_cond := VAR_fy;
     VAR_MUX_uxn_device_h_l94_c35_3a97_cond := VAR_fy;
     VAR_opaque_MUX_uxn_device_h_l73_c2_1541_iffalse := opaque;
     VAR_BIN_OP_EQ_uxn_device_h_l73_c6_94d2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l95_c25_46aa_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l67_c20_9803_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_device_h_l84_c21_d671_right := VAR_phase;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_8ebf_elem_val := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_device_h_l84_c21_d671_left := VAR_ram_addr;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_8ebf_ref_toks_0 := sprite_rows;
     VAR_sprite_rows_MUX_uxn_device_h_l69_c2_53bf_iffalse := sprite_rows;
     VAR_x_MUX_uxn_device_h_l73_c2_1541_iffalse := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l76_c7_e7b4_left := VAR_x1;
     VAR_BIN_OP_PLUS_uxn_device_h_l87_c35_2845_left := VAR_x1;
     VAR_xmod_MUX_uxn_device_h_l73_c2_1541_iffalse := xmod;
     VAR_y_MUX_uxn_device_h_l73_c2_1541_iffalse := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_84c1_left := VAR_y1;
     VAR_BIN_OP_PLUS_uxn_device_h_l74_c21_6067_right := VAR_color8_uxn_device_h_l63_c2_d6b0;
     VAR_BIN_OP_PLUS_uxn_device_h_l93_c30_ce50_left := VAR_color8_uxn_device_h_l63_c2_d6b0;
     REG_VAR_color8 := VAR_color8_uxn_device_h_l63_c2_d6b0;
     -- MUX[uxn_device_h_l75_c10_58a3] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l75_c10_58a3_cond <= VAR_MUX_uxn_device_h_l75_c10_58a3_cond;
     MUX_uxn_device_h_l75_c10_58a3_iftrue <= VAR_MUX_uxn_device_h_l75_c10_58a3_iftrue;
     MUX_uxn_device_h_l75_c10_58a3_iffalse <= VAR_MUX_uxn_device_h_l75_c10_58a3_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l75_c10_58a3_return_output := MUX_uxn_device_h_l75_c10_58a3_return_output;

     -- BIN_OP_EQ[uxn_device_h_l73_c6_94d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l73_c6_94d2_left <= VAR_BIN_OP_EQ_uxn_device_h_l73_c6_94d2_left;
     BIN_OP_EQ_uxn_device_h_l73_c6_94d2_right <= VAR_BIN_OP_EQ_uxn_device_h_l73_c6_94d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l73_c6_94d2_return_output := BIN_OP_EQ_uxn_device_h_l73_c6_94d2_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l67_c20_9803] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l67_c20_9803_left <= VAR_BIN_OP_MINUS_uxn_device_h_l67_c20_9803_left;
     BIN_OP_MINUS_uxn_device_h_l67_c20_9803_right <= VAR_BIN_OP_MINUS_uxn_device_h_l67_c20_9803_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l67_c20_9803_return_output := BIN_OP_MINUS_uxn_device_h_l67_c20_9803_return_output;

     -- BIN_OP_EQ[uxn_device_h_l95_c25_46aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l95_c25_46aa_left <= VAR_BIN_OP_EQ_uxn_device_h_l95_c25_46aa_left;
     BIN_OP_EQ_uxn_device_h_l95_c25_46aa_right <= VAR_BIN_OP_EQ_uxn_device_h_l95_c25_46aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l95_c25_46aa_return_output := BIN_OP_EQ_uxn_device_h_l95_c25_46aa_return_output;

     -- uint8_7_4[uxn_device_h_l64_c20_43ad] LATENCY=0
     VAR_uint8_7_4_uxn_device_h_l64_c20_43ad_return_output := uint8_7_4(
     VAR_phase);

     -- uint8_2_0[uxn_device_h_l66_c20_acb4] LATENCY=0
     VAR_uint8_2_0_uxn_device_h_l66_c20_acb4_return_output := uint8_2_0(
     VAR_phase);

     -- BIN_OP_PLUS[uxn_device_h_l84_c21_d671] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l84_c21_d671_left <= VAR_BIN_OP_PLUS_uxn_device_h_l84_c21_d671_left;
     BIN_OP_PLUS_uxn_device_h_l84_c21_d671_right <= VAR_BIN_OP_PLUS_uxn_device_h_l84_c21_d671_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l84_c21_d671_return_output := BIN_OP_PLUS_uxn_device_h_l84_c21_d671_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l74_c21_6067] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l74_c21_6067_left <= VAR_BIN_OP_PLUS_uxn_device_h_l74_c21_6067_left;
     BIN_OP_PLUS_uxn_device_h_l74_c21_6067_right <= VAR_BIN_OP_PLUS_uxn_device_h_l74_c21_6067_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l74_c21_6067_return_output := BIN_OP_PLUS_uxn_device_h_l74_c21_6067_return_output;

     -- uint8_7_3[uxn_device_h_l65_c20_2b72] LATENCY=0
     VAR_uint8_7_3_uxn_device_h_l65_c20_2b72_return_output := uint8_7_3(
     VAR_phase);

     -- MUX[uxn_device_h_l77_c13_ceaf] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l77_c13_ceaf_cond <= VAR_MUX_uxn_device_h_l77_c13_ceaf_cond;
     MUX_uxn_device_h_l77_c13_ceaf_iftrue <= VAR_MUX_uxn_device_h_l77_c13_ceaf_iftrue;
     MUX_uxn_device_h_l77_c13_ceaf_iffalse <= VAR_MUX_uxn_device_h_l77_c13_ceaf_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l77_c13_ceaf_return_output := MUX_uxn_device_h_l77_c13_ceaf_return_output;

     -- Submodule level 1
     VAR_opaque_MUX_uxn_device_h_l73_c2_1541_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c6_94d2_return_output;
     VAR_x_MUX_uxn_device_h_l73_c2_1541_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c6_94d2_return_output;
     VAR_xmod_MUX_uxn_device_h_l73_c2_1541_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c6_94d2_return_output;
     VAR_y_MUX_uxn_device_h_l73_c2_1541_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c6_94d2_return_output;
     VAR_MUX_uxn_device_h_l95_c25_5494_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c25_46aa_return_output;
     VAR_phase_minus_two_uxn_device_h_l67_c2_1f71 := VAR_BIN_OP_MINUS_uxn_device_h_l67_c20_9803_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_c70c_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l74_c21_6067_return_output, 7);
     VAR_result_u16_addr_uxn_device_h_l84_c3_9ab5 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l84_c21_d671_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_device_h_l76_c7_e7b4_right := VAR_MUX_uxn_device_h_l75_c10_58a3_return_output;
     VAR_xmod_MUX_uxn_device_h_l73_c2_1541_iftrue := VAR_MUX_uxn_device_h_l75_c10_58a3_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_84c1_right := VAR_MUX_uxn_device_h_l77_c13_ceaf_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l86_c7_c56a_left := VAR_uint8_2_0_uxn_device_h_l66_c20_acb4_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l87_c7_acab_left := VAR_uint8_2_0_uxn_device_h_l66_c20_acb4_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l94_c7_59d0_left := VAR_uint8_2_0_uxn_device_h_l66_c20_acb4_return_output;
     REG_VAR_phase2_downto_0 := VAR_uint8_2_0_uxn_device_h_l66_c20_acb4_return_output;
     REG_VAR_phase7_downto_3 := VAR_uint8_7_3_uxn_device_h_l65_c20_2b72_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l80_c6_d8d3_left := VAR_uint8_7_4_uxn_device_h_l64_c20_43ad_return_output;
     REG_VAR_phase7_downto_4 := VAR_uint8_7_4_uxn_device_h_l64_c20_43ad_return_output;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_8ebf_var_dim_0 := resize(VAR_phase_minus_two_uxn_device_h_l67_c2_1f71, 4);
     REG_VAR_phase_minus_two := VAR_phase_minus_two_uxn_device_h_l67_c2_1f71;
     VAR_result_u16_addr_MUX_uxn_device_h_l80_c2_fde8_iftrue := VAR_result_u16_addr_uxn_device_h_l84_c3_9ab5;
     -- VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60[uxn_device_h_l70_c3_8ebf] LATENCY=0
     -- Inputs
     VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_8ebf_elem_val <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_8ebf_elem_val;
     VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_8ebf_ref_toks_0 <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_8ebf_ref_toks_0;
     VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_8ebf_var_dim_0 <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_8ebf_var_dim_0;
     -- Outputs
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_8ebf_return_output := VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_8ebf_return_output;

     -- BIN_OP_EQ[uxn_device_h_l86_c7_c56a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l86_c7_c56a_left <= VAR_BIN_OP_EQ_uxn_device_h_l86_c7_c56a_left;
     BIN_OP_EQ_uxn_device_h_l86_c7_c56a_right <= VAR_BIN_OP_EQ_uxn_device_h_l86_c7_c56a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l86_c7_c56a_return_output := BIN_OP_EQ_uxn_device_h_l86_c7_c56a_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l76_c7_e7b4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l76_c7_e7b4_left <= VAR_BIN_OP_PLUS_uxn_device_h_l76_c7_e7b4_left;
     BIN_OP_PLUS_uxn_device_h_l76_c7_e7b4_right <= VAR_BIN_OP_PLUS_uxn_device_h_l76_c7_e7b4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l76_c7_e7b4_return_output := BIN_OP_PLUS_uxn_device_h_l76_c7_e7b4_return_output;

     -- BIN_OP_EQ[uxn_device_h_l87_c7_acab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l87_c7_acab_left <= VAR_BIN_OP_EQ_uxn_device_h_l87_c7_acab_left;
     BIN_OP_EQ_uxn_device_h_l87_c7_acab_right <= VAR_BIN_OP_EQ_uxn_device_h_l87_c7_acab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l87_c7_acab_return_output := BIN_OP_EQ_uxn_device_h_l87_c7_acab_return_output;

     -- CAST_TO_uint8_t_uint5_t_uxn_device_h_l86_DUPLICATE_2414 LATENCY=0
     VAR_CAST_TO_uint8_t_uint5_t_uxn_device_h_l86_DUPLICATE_2414_return_output := CAST_TO_uint8_t_uint5_t(
     VAR_uint8_7_3_uxn_device_h_l65_c20_2b72_return_output);

     -- BIN_OP_PLUS[uxn_device_h_l77_c7_84c1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l77_c7_84c1_left <= VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_84c1_left;
     BIN_OP_PLUS_uxn_device_h_l77_c7_84c1_right <= VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_84c1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_84c1_return_output := BIN_OP_PLUS_uxn_device_h_l77_c7_84c1_return_output;

     -- xmod_MUX[uxn_device_h_l73_c2_1541] LATENCY=0
     -- Inputs
     xmod_MUX_uxn_device_h_l73_c2_1541_cond <= VAR_xmod_MUX_uxn_device_h_l73_c2_1541_cond;
     xmod_MUX_uxn_device_h_l73_c2_1541_iftrue <= VAR_xmod_MUX_uxn_device_h_l73_c2_1541_iftrue;
     xmod_MUX_uxn_device_h_l73_c2_1541_iffalse <= VAR_xmod_MUX_uxn_device_h_l73_c2_1541_iffalse;
     -- Outputs
     VAR_xmod_MUX_uxn_device_h_l73_c2_1541_return_output := xmod_MUX_uxn_device_h_l73_c2_1541_return_output;

     -- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d[uxn_device_h_l74_c12_c70c] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_c70c_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_c70c_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_c70c_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_c70c_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_c70c_return_output := VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_c70c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l80_c6_d8d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l80_c6_d8d3_left <= VAR_BIN_OP_EQ_uxn_device_h_l80_c6_d8d3_left;
     BIN_OP_EQ_uxn_device_h_l80_c6_d8d3_right <= VAR_BIN_OP_EQ_uxn_device_h_l80_c6_d8d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l80_c6_d8d3_return_output := BIN_OP_EQ_uxn_device_h_l80_c6_d8d3_return_output;

     -- MUX[uxn_device_h_l95_c25_5494] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l95_c25_5494_cond <= VAR_MUX_uxn_device_h_l95_c25_5494_cond;
     MUX_uxn_device_h_l95_c25_5494_iftrue <= VAR_MUX_uxn_device_h_l95_c25_5494_iftrue;
     MUX_uxn_device_h_l95_c25_5494_iffalse <= VAR_MUX_uxn_device_h_l95_c25_5494_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l95_c25_5494_return_output := MUX_uxn_device_h_l95_c25_5494_return_output;

     -- uint8_7_4[uxn_device_h_l69_c6_1aaf] LATENCY=0
     VAR_uint8_7_4_uxn_device_h_l69_c6_1aaf_return_output := uint8_7_4(
     VAR_phase_minus_two_uxn_device_h_l67_c2_1f71);

     -- BIN_OP_EQ[uxn_device_h_l94_c7_59d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l94_c7_59d0_left <= VAR_BIN_OP_EQ_uxn_device_h_l94_c7_59d0_left;
     BIN_OP_EQ_uxn_device_h_l94_c7_59d0_right <= VAR_BIN_OP_EQ_uxn_device_h_l94_c7_59d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l94_c7_59d0_return_output := BIN_OP_EQ_uxn_device_h_l94_c7_59d0_return_output;

     -- Submodule level 2
     VAR_c_MUX_uxn_device_h_l80_c2_fde8_cond := VAR_BIN_OP_EQ_uxn_device_h_l80_c6_d8d3_return_output;
     VAR_ch_MUX_uxn_device_h_l80_c2_fde8_cond := VAR_BIN_OP_EQ_uxn_device_h_l80_c6_d8d3_return_output;
     VAR_result_is_blit_done_MUX_uxn_device_h_l80_c2_fde8_cond := VAR_BIN_OP_EQ_uxn_device_h_l80_c6_d8d3_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l80_c2_fde8_cond := VAR_BIN_OP_EQ_uxn_device_h_l80_c6_d8d3_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l80_c2_fde8_cond := VAR_BIN_OP_EQ_uxn_device_h_l80_c6_d8d3_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l80_c2_fde8_cond := VAR_BIN_OP_EQ_uxn_device_h_l80_c6_d8d3_return_output;
     VAR_x_MUX_uxn_device_h_l80_c2_fde8_cond := VAR_BIN_OP_EQ_uxn_device_h_l80_c6_d8d3_return_output;
     VAR_y_MUX_uxn_device_h_l80_c2_fde8_cond := VAR_BIN_OP_EQ_uxn_device_h_l80_c6_d8d3_return_output;
     VAR_MUX_uxn_device_h_l86_c7_5a6d_cond := VAR_BIN_OP_EQ_uxn_device_h_l86_c7_c56a_return_output;
     VAR_MUX_uxn_device_h_l87_c7_80b8_cond := VAR_BIN_OP_EQ_uxn_device_h_l87_c7_acab_return_output;
     VAR_MUX_uxn_device_h_l94_c7_b18f_cond := VAR_BIN_OP_EQ_uxn_device_h_l94_c7_59d0_return_output;
     VAR_x_uxn_device_h_l76_c3_707c := resize(VAR_BIN_OP_PLUS_uxn_device_h_l76_c7_e7b4_return_output, 16);
     VAR_y_uxn_device_h_l77_c3_57d6 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_84c1_return_output, 16);
     VAR_BIN_OP_MINUS_uxn_device_h_l86_c46_f23c_left := VAR_CAST_TO_uint8_t_uint5_t_uxn_device_h_l86_DUPLICATE_2414_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l86_c96_b5cd_left := VAR_CAST_TO_uint8_t_uint5_t_uxn_device_h_l86_DUPLICATE_2414_return_output;
     VAR_result_is_blit_done_MUX_uxn_device_h_l80_c2_fde8_iffalse := VAR_MUX_uxn_device_h_l95_c25_5494_return_output;
     VAR_opaque_uxn_device_h_l74_c3_657a := resize(VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_c70c_return_output, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l69_c6_2011_left := VAR_uint8_7_4_uxn_device_h_l69_c6_1aaf_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l87_c35_2845_right := VAR_xmod_MUX_uxn_device_h_l73_c2_1541_return_output;
     REG_VAR_xmod := VAR_xmod_MUX_uxn_device_h_l73_c2_1541_return_output;
     VAR_opaque_MUX_uxn_device_h_l73_c2_1541_iftrue := VAR_opaque_uxn_device_h_l74_c3_657a;
     VAR_x_MUX_uxn_device_h_l73_c2_1541_iftrue := VAR_x_uxn_device_h_l76_c3_707c;
     VAR_y_MUX_uxn_device_h_l73_c2_1541_iftrue := VAR_y_uxn_device_h_l77_c3_57d6;
     -- result_is_blit_done_MUX[uxn_device_h_l80_c2_fde8] LATENCY=0
     -- Inputs
     result_is_blit_done_MUX_uxn_device_h_l80_c2_fde8_cond <= VAR_result_is_blit_done_MUX_uxn_device_h_l80_c2_fde8_cond;
     result_is_blit_done_MUX_uxn_device_h_l80_c2_fde8_iftrue <= VAR_result_is_blit_done_MUX_uxn_device_h_l80_c2_fde8_iftrue;
     result_is_blit_done_MUX_uxn_device_h_l80_c2_fde8_iffalse <= VAR_result_is_blit_done_MUX_uxn_device_h_l80_c2_fde8_iffalse;
     -- Outputs
     VAR_result_is_blit_done_MUX_uxn_device_h_l80_c2_fde8_return_output := result_is_blit_done_MUX_uxn_device_h_l80_c2_fde8_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l87_c35_2845] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l87_c35_2845_left <= VAR_BIN_OP_PLUS_uxn_device_h_l87_c35_2845_left;
     BIN_OP_PLUS_uxn_device_h_l87_c35_2845_right <= VAR_BIN_OP_PLUS_uxn_device_h_l87_c35_2845_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l87_c35_2845_return_output := BIN_OP_PLUS_uxn_device_h_l87_c35_2845_return_output;

     -- opaque_MUX[uxn_device_h_l73_c2_1541] LATENCY=0
     -- Inputs
     opaque_MUX_uxn_device_h_l73_c2_1541_cond <= VAR_opaque_MUX_uxn_device_h_l73_c2_1541_cond;
     opaque_MUX_uxn_device_h_l73_c2_1541_iftrue <= VAR_opaque_MUX_uxn_device_h_l73_c2_1541_iftrue;
     opaque_MUX_uxn_device_h_l73_c2_1541_iffalse <= VAR_opaque_MUX_uxn_device_h_l73_c2_1541_iffalse;
     -- Outputs
     VAR_opaque_MUX_uxn_device_h_l73_c2_1541_return_output := opaque_MUX_uxn_device_h_l73_c2_1541_return_output;

     -- y_MUX[uxn_device_h_l73_c2_1541] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l73_c2_1541_cond <= VAR_y_MUX_uxn_device_h_l73_c2_1541_cond;
     y_MUX_uxn_device_h_l73_c2_1541_iftrue <= VAR_y_MUX_uxn_device_h_l73_c2_1541_iftrue;
     y_MUX_uxn_device_h_l73_c2_1541_iffalse <= VAR_y_MUX_uxn_device_h_l73_c2_1541_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l73_c2_1541_return_output := y_MUX_uxn_device_h_l73_c2_1541_return_output;

     -- x_MUX[uxn_device_h_l73_c2_1541] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l73_c2_1541_cond <= VAR_x_MUX_uxn_device_h_l73_c2_1541_cond;
     x_MUX_uxn_device_h_l73_c2_1541_iftrue <= VAR_x_MUX_uxn_device_h_l73_c2_1541_iftrue;
     x_MUX_uxn_device_h_l73_c2_1541_iffalse <= VAR_x_MUX_uxn_device_h_l73_c2_1541_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l73_c2_1541_return_output := x_MUX_uxn_device_h_l73_c2_1541_return_output;

     -- sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5[uxn_device_h_l69_c2_53bf] LATENCY=0
     VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5_uxn_device_h_l69_c2_53bf_return_output := CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5(
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_8ebf_return_output);

     -- BIN_OP_PLUS[uxn_device_h_l86_c96_b5cd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l86_c96_b5cd_left <= VAR_BIN_OP_PLUS_uxn_device_h_l86_c96_b5cd_left;
     BIN_OP_PLUS_uxn_device_h_l86_c96_b5cd_right <= VAR_BIN_OP_PLUS_uxn_device_h_l86_c96_b5cd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l86_c96_b5cd_return_output := BIN_OP_PLUS_uxn_device_h_l86_c96_b5cd_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l86_c46_f23c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l86_c46_f23c_left <= VAR_BIN_OP_MINUS_uxn_device_h_l86_c46_f23c_left;
     BIN_OP_MINUS_uxn_device_h_l86_c46_f23c_right <= VAR_BIN_OP_MINUS_uxn_device_h_l86_c46_f23c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l86_c46_f23c_return_output := BIN_OP_MINUS_uxn_device_h_l86_c46_f23c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l69_c6_2011] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l69_c6_2011_left <= VAR_BIN_OP_EQ_uxn_device_h_l69_c6_2011_left;
     BIN_OP_EQ_uxn_device_h_l69_c6_2011_right <= VAR_BIN_OP_EQ_uxn_device_h_l69_c6_2011_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l69_c6_2011_return_output := BIN_OP_EQ_uxn_device_h_l69_c6_2011_return_output;

     -- Submodule level 3
     VAR_sprite_rows_MUX_uxn_device_h_l69_c2_53bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l69_c6_2011_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_ed7b_var_dim_0 := resize(VAR_BIN_OP_MINUS_uxn_device_h_l86_c46_f23c_return_output, 4);
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_0a72_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l86_c96_b5cd_return_output, 4);
     VAR_MUX_uxn_device_h_l87_c7_80b8_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l87_c35_2845_return_output, 16);
     VAR_BIN_OP_OR_uxn_device_h_l92_c26_8136_left := VAR_opaque_MUX_uxn_device_h_l73_c2_1541_return_output;
     REG_VAR_opaque := VAR_opaque_MUX_uxn_device_h_l73_c2_1541_return_output;
     VAR_sprite_rows_MUX_uxn_device_h_l69_c2_53bf_iftrue := VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5_uxn_device_h_l69_c2_53bf_return_output;
     VAR_MUX_uxn_device_h_l87_c7_80b8_iffalse := VAR_x_MUX_uxn_device_h_l73_c2_1541_return_output;
     VAR_x_MUX_uxn_device_h_l80_c2_fde8_iftrue := VAR_x_MUX_uxn_device_h_l73_c2_1541_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l94_c41_378d_left := VAR_y_MUX_uxn_device_h_l73_c2_1541_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l94_c51_b968_left := VAR_y_MUX_uxn_device_h_l73_c2_1541_return_output;
     VAR_CONST_SL_8_uxn_device_h_l91_c22_6f89_x := VAR_y_MUX_uxn_device_h_l73_c2_1541_return_output;
     VAR_MUX_uxn_device_h_l94_c7_b18f_iffalse := VAR_y_MUX_uxn_device_h_l73_c2_1541_return_output;
     VAR_y_MUX_uxn_device_h_l80_c2_fde8_iftrue := VAR_y_MUX_uxn_device_h_l73_c2_1541_return_output;
     -- MUX[uxn_device_h_l87_c7_80b8] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l87_c7_80b8_cond <= VAR_MUX_uxn_device_h_l87_c7_80b8_cond;
     MUX_uxn_device_h_l87_c7_80b8_iftrue <= VAR_MUX_uxn_device_h_l87_c7_80b8_iftrue;
     MUX_uxn_device_h_l87_c7_80b8_iffalse <= VAR_MUX_uxn_device_h_l87_c7_80b8_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l87_c7_80b8_return_output := MUX_uxn_device_h_l87_c7_80b8_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l94_c41_378d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l94_c41_378d_left <= VAR_BIN_OP_MINUS_uxn_device_h_l94_c41_378d_left;
     BIN_OP_MINUS_uxn_device_h_l94_c41_378d_right <= VAR_BIN_OP_MINUS_uxn_device_h_l94_c41_378d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l94_c41_378d_return_output := BIN_OP_MINUS_uxn_device_h_l94_c41_378d_return_output;

     -- sprite_rows_MUX[uxn_device_h_l69_c2_53bf] LATENCY=0
     -- Inputs
     sprite_rows_MUX_uxn_device_h_l69_c2_53bf_cond <= VAR_sprite_rows_MUX_uxn_device_h_l69_c2_53bf_cond;
     sprite_rows_MUX_uxn_device_h_l69_c2_53bf_iftrue <= VAR_sprite_rows_MUX_uxn_device_h_l69_c2_53bf_iftrue;
     sprite_rows_MUX_uxn_device_h_l69_c2_53bf_iffalse <= VAR_sprite_rows_MUX_uxn_device_h_l69_c2_53bf_iffalse;
     -- Outputs
     VAR_sprite_rows_MUX_uxn_device_h_l69_c2_53bf_return_output := sprite_rows_MUX_uxn_device_h_l69_c2_53bf_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l94_c51_b968] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l94_c51_b968_left <= VAR_BIN_OP_PLUS_uxn_device_h_l94_c51_b968_left;
     BIN_OP_PLUS_uxn_device_h_l94_c51_b968_right <= VAR_BIN_OP_PLUS_uxn_device_h_l94_c51_b968_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l94_c51_b968_return_output := BIN_OP_PLUS_uxn_device_h_l94_c51_b968_return_output;

     -- CONST_SL_8[uxn_device_h_l91_c22_6f89] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_device_h_l91_c22_6f89_x <= VAR_CONST_SL_8_uxn_device_h_l91_c22_6f89_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_device_h_l91_c22_6f89_return_output := CONST_SL_8_uxn_device_h_l91_c22_6f89_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l94_c35_3a97_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l94_c41_378d_return_output;
     VAR_MUX_uxn_device_h_l94_c35_3a97_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l94_c51_b968_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_device_h_l91_c22_2e70_left := VAR_CONST_SL_8_uxn_device_h_l91_c22_6f89_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l96_c24_a553_left := VAR_MUX_uxn_device_h_l87_c7_80b8_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l91_c22_2e70_right := VAR_MUX_uxn_device_h_l87_c7_80b8_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l96_c14_0463_left := VAR_MUX_uxn_device_h_l87_c7_80b8_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_ed7b_ref_toks_0 := VAR_sprite_rows_MUX_uxn_device_h_l69_c2_53bf_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_0a72_ref_toks_0 := VAR_sprite_rows_MUX_uxn_device_h_l69_c2_53bf_return_output;
     REG_VAR_sprite_rows := VAR_sprite_rows_MUX_uxn_device_h_l69_c2_53bf_return_output;
     -- MUX[uxn_device_h_l94_c35_3a97] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l94_c35_3a97_cond <= VAR_MUX_uxn_device_h_l94_c35_3a97_cond;
     MUX_uxn_device_h_l94_c35_3a97_iftrue <= VAR_MUX_uxn_device_h_l94_c35_3a97_iftrue;
     MUX_uxn_device_h_l94_c35_3a97_iffalse <= VAR_MUX_uxn_device_h_l94_c35_3a97_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l94_c35_3a97_return_output := MUX_uxn_device_h_l94_c35_3a97_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l96_c14_0463] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l96_c14_0463_left <= VAR_BIN_OP_PLUS_uxn_device_h_l96_c14_0463_left;
     BIN_OP_PLUS_uxn_device_h_l96_c14_0463_right <= VAR_BIN_OP_PLUS_uxn_device_h_l96_c14_0463_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l96_c14_0463_return_output := BIN_OP_PLUS_uxn_device_h_l96_c14_0463_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l96_c24_a553] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l96_c24_a553_left <= VAR_BIN_OP_MINUS_uxn_device_h_l96_c24_a553_left;
     BIN_OP_MINUS_uxn_device_h_l96_c24_a553_right <= VAR_BIN_OP_MINUS_uxn_device_h_l96_c24_a553_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l96_c24_a553_return_output := BIN_OP_MINUS_uxn_device_h_l96_c24_a553_return_output;

     -- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d[uxn_device_h_l86_c34_ed7b] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_ed7b_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_ed7b_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_ed7b_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_ed7b_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_ed7b_return_output := VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_ed7b_return_output;

     -- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d[uxn_device_h_l86_c84_0a72] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_0a72_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_0a72_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_0a72_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_0a72_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_0a72_return_output := VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_0a72_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l91_c22_2e70] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l91_c22_2e70_left <= VAR_BIN_OP_PLUS_uxn_device_h_l91_c22_2e70_left;
     BIN_OP_PLUS_uxn_device_h_l91_c22_2e70_right <= VAR_BIN_OP_PLUS_uxn_device_h_l91_c22_2e70_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l91_c22_2e70_return_output := BIN_OP_PLUS_uxn_device_h_l91_c22_2e70_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_device_h_l96_c8_d3f0_iffalse := VAR_BIN_OP_MINUS_uxn_device_h_l96_c24_a553_return_output;
     VAR_result_u16_addr_uxn_device_h_l91_c3_6728 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l91_c22_2e70_return_output, 16);
     VAR_MUX_uxn_device_h_l96_c8_d3f0_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l96_c14_0463_return_output, 16);
     VAR_MUX_uxn_device_h_l94_c7_b18f_iftrue := VAR_MUX_uxn_device_h_l94_c35_3a97_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l86_c34_0458_left := VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_ed7b_return_output;
     VAR_CONST_SL_8_uxn_device_h_l86_c84_5351_x := VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_0a72_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l80_c2_fde8_iffalse := VAR_result_u16_addr_uxn_device_h_l91_c3_6728;
     -- MUX[uxn_device_h_l94_c7_b18f] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l94_c7_b18f_cond <= VAR_MUX_uxn_device_h_l94_c7_b18f_cond;
     MUX_uxn_device_h_l94_c7_b18f_iftrue <= VAR_MUX_uxn_device_h_l94_c7_b18f_iftrue;
     MUX_uxn_device_h_l94_c7_b18f_iffalse <= VAR_MUX_uxn_device_h_l94_c7_b18f_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l94_c7_b18f_return_output := MUX_uxn_device_h_l94_c7_b18f_return_output;

     -- MUX[uxn_device_h_l96_c8_d3f0] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l96_c8_d3f0_cond <= VAR_MUX_uxn_device_h_l96_c8_d3f0_cond;
     MUX_uxn_device_h_l96_c8_d3f0_iftrue <= VAR_MUX_uxn_device_h_l96_c8_d3f0_iftrue;
     MUX_uxn_device_h_l96_c8_d3f0_iffalse <= VAR_MUX_uxn_device_h_l96_c8_d3f0_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l96_c8_d3f0_return_output := MUX_uxn_device_h_l96_c8_d3f0_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l80_c2_fde8] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l80_c2_fde8_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l80_c2_fde8_cond;
     result_u16_addr_MUX_uxn_device_h_l80_c2_fde8_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l80_c2_fde8_iftrue;
     result_u16_addr_MUX_uxn_device_h_l80_c2_fde8_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l80_c2_fde8_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l80_c2_fde8_return_output := result_u16_addr_MUX_uxn_device_h_l80_c2_fde8_return_output;

     -- CONST_SL_8[uxn_device_h_l86_c84_5351] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_device_h_l86_c84_5351_x <= VAR_CONST_SL_8_uxn_device_h_l86_c84_5351_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_device_h_l86_c84_5351_return_output := CONST_SL_8_uxn_device_h_l86_c84_5351_return_output;

     -- Submodule level 6
     VAR_BIN_OP_OR_uxn_device_h_l86_c34_0458_right := VAR_CONST_SL_8_uxn_device_h_l86_c84_5351_return_output;
     VAR_y_MUX_uxn_device_h_l80_c2_fde8_iffalse := VAR_MUX_uxn_device_h_l94_c7_b18f_return_output;
     VAR_x_MUX_uxn_device_h_l80_c2_fde8_iffalse := VAR_MUX_uxn_device_h_l96_c8_d3f0_return_output;
     -- BIN_OP_OR[uxn_device_h_l86_c34_0458] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l86_c34_0458_left <= VAR_BIN_OP_OR_uxn_device_h_l86_c34_0458_left;
     BIN_OP_OR_uxn_device_h_l86_c34_0458_right <= VAR_BIN_OP_OR_uxn_device_h_l86_c34_0458_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l86_c34_0458_return_output := BIN_OP_OR_uxn_device_h_l86_c34_0458_return_output;

     -- x_MUX[uxn_device_h_l80_c2_fde8] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l80_c2_fde8_cond <= VAR_x_MUX_uxn_device_h_l80_c2_fde8_cond;
     x_MUX_uxn_device_h_l80_c2_fde8_iftrue <= VAR_x_MUX_uxn_device_h_l80_c2_fde8_iftrue;
     x_MUX_uxn_device_h_l80_c2_fde8_iffalse <= VAR_x_MUX_uxn_device_h_l80_c2_fde8_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l80_c2_fde8_return_output := x_MUX_uxn_device_h_l80_c2_fde8_return_output;

     -- y_MUX[uxn_device_h_l80_c2_fde8] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l80_c2_fde8_cond <= VAR_y_MUX_uxn_device_h_l80_c2_fde8_cond;
     y_MUX_uxn_device_h_l80_c2_fde8_iftrue <= VAR_y_MUX_uxn_device_h_l80_c2_fde8_iftrue;
     y_MUX_uxn_device_h_l80_c2_fde8_iffalse <= VAR_y_MUX_uxn_device_h_l80_c2_fde8_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l80_c2_fde8_return_output := y_MUX_uxn_device_h_l80_c2_fde8_return_output;

     -- Submodule level 7
     VAR_MUX_uxn_device_h_l86_c7_5a6d_iftrue := resize(VAR_BIN_OP_OR_uxn_device_h_l86_c34_0458_return_output, 16);
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l80_c2_fde8_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l80_c2_fde8_return_output;
     -- MUX[uxn_device_h_l86_c7_5a6d] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l86_c7_5a6d_cond <= VAR_MUX_uxn_device_h_l86_c7_5a6d_cond;
     MUX_uxn_device_h_l86_c7_5a6d_iftrue <= VAR_MUX_uxn_device_h_l86_c7_5a6d_iftrue;
     MUX_uxn_device_h_l86_c7_5a6d_iffalse <= VAR_MUX_uxn_device_h_l86_c7_5a6d_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l86_c7_5a6d_return_output := MUX_uxn_device_h_l86_c7_5a6d_return_output;

     -- Submodule level 8
     VAR_CONST_SR_1_uxn_device_h_l97_c3_35cc_x := VAR_MUX_uxn_device_h_l86_c7_5a6d_return_output;
     -- uint16_8_8[uxn_device_h_l88_c8_a656] LATENCY=0
     VAR_uint16_8_8_uxn_device_h_l88_c8_a656_return_output := uint16_8_8(
     VAR_MUX_uxn_device_h_l86_c7_5a6d_return_output);

     -- CONST_SR_1[uxn_device_h_l97_c3_35cc] LATENCY=0
     -- Inputs
     CONST_SR_1_uxn_device_h_l97_c3_35cc_x <= VAR_CONST_SR_1_uxn_device_h_l97_c3_35cc_x;
     -- Outputs
     VAR_CONST_SR_1_uxn_device_h_l97_c3_35cc_return_output := CONST_SR_1_uxn_device_h_l97_c3_35cc_return_output;

     -- uint16_0_0[uxn_device_h_l90_c9_eb10] LATENCY=0
     VAR_uint16_0_0_uxn_device_h_l90_c9_eb10_return_output := uint16_0_0(
     VAR_MUX_uxn_device_h_l86_c7_5a6d_return_output);

     -- Submodule level 9
     VAR_c_MUX_uxn_device_h_l80_c2_fde8_iffalse := VAR_CONST_SR_1_uxn_device_h_l97_c3_35cc_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l90_c3_726b_right := VAR_uint16_0_0_uxn_device_h_l90_c9_eb10_return_output;
     VAR_ch_uxn_device_h_l88_c3_490e := resize(VAR_uint16_8_8_uxn_device_h_l88_c8_a656_return_output, 8);
     VAR_CONST_SL_1_uxn_device_h_l89_c3_15c1_x := VAR_ch_uxn_device_h_l88_c3_490e;
     -- CONST_SL_1[uxn_device_h_l89_c3_15c1] LATENCY=0
     -- Inputs
     CONST_SL_1_uxn_device_h_l89_c3_15c1_x <= VAR_CONST_SL_1_uxn_device_h_l89_c3_15c1_x;
     -- Outputs
     VAR_CONST_SL_1_uxn_device_h_l89_c3_15c1_return_output := CONST_SL_1_uxn_device_h_l89_c3_15c1_return_output;

     -- c_MUX[uxn_device_h_l80_c2_fde8] LATENCY=0
     -- Inputs
     c_MUX_uxn_device_h_l80_c2_fde8_cond <= VAR_c_MUX_uxn_device_h_l80_c2_fde8_cond;
     c_MUX_uxn_device_h_l80_c2_fde8_iftrue <= VAR_c_MUX_uxn_device_h_l80_c2_fde8_iftrue;
     c_MUX_uxn_device_h_l80_c2_fde8_iffalse <= VAR_c_MUX_uxn_device_h_l80_c2_fde8_iffalse;
     -- Outputs
     VAR_c_MUX_uxn_device_h_l80_c2_fde8_return_output := c_MUX_uxn_device_h_l80_c2_fde8_return_output;

     -- Submodule level 10
     VAR_BIN_OP_OR_uxn_device_h_l90_c3_726b_left := VAR_CONST_SL_1_uxn_device_h_l89_c3_15c1_return_output;
     REG_VAR_c := VAR_c_MUX_uxn_device_h_l80_c2_fde8_return_output;
     -- BIN_OP_OR[uxn_device_h_l90_c3_726b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l90_c3_726b_left <= VAR_BIN_OP_OR_uxn_device_h_l90_c3_726b_left;
     BIN_OP_OR_uxn_device_h_l90_c3_726b_right <= VAR_BIN_OP_OR_uxn_device_h_l90_c3_726b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l90_c3_726b_return_output := BIN_OP_OR_uxn_device_h_l90_c3_726b_return_output;

     -- Submodule level 11
     VAR_BIN_OP_EQ_uxn_device_h_l92_c36_7603_left := VAR_BIN_OP_OR_uxn_device_h_l90_c3_726b_return_output;
     VAR_CONST_SL_4_uxn_device_h_l93_c40_07b6_x := VAR_BIN_OP_OR_uxn_device_h_l90_c3_726b_return_output;
     VAR_ch_MUX_uxn_device_h_l80_c2_fde8_iffalse := VAR_BIN_OP_OR_uxn_device_h_l90_c3_726b_return_output;
     -- ch_MUX[uxn_device_h_l80_c2_fde8] LATENCY=0
     -- Inputs
     ch_MUX_uxn_device_h_l80_c2_fde8_cond <= VAR_ch_MUX_uxn_device_h_l80_c2_fde8_cond;
     ch_MUX_uxn_device_h_l80_c2_fde8_iftrue <= VAR_ch_MUX_uxn_device_h_l80_c2_fde8_iftrue;
     ch_MUX_uxn_device_h_l80_c2_fde8_iffalse <= VAR_ch_MUX_uxn_device_h_l80_c2_fde8_iffalse;
     -- Outputs
     VAR_ch_MUX_uxn_device_h_l80_c2_fde8_return_output := ch_MUX_uxn_device_h_l80_c2_fde8_return_output;

     -- BIN_OP_EQ[uxn_device_h_l92_c36_7603] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l92_c36_7603_left <= VAR_BIN_OP_EQ_uxn_device_h_l92_c36_7603_left;
     BIN_OP_EQ_uxn_device_h_l92_c36_7603_right <= VAR_BIN_OP_EQ_uxn_device_h_l92_c36_7603_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l92_c36_7603_return_output := BIN_OP_EQ_uxn_device_h_l92_c36_7603_return_output;

     -- CONST_SL_4[uxn_device_h_l93_c40_07b6] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_device_h_l93_c40_07b6_x <= VAR_CONST_SL_4_uxn_device_h_l93_c40_07b6_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_device_h_l93_c40_07b6_return_output := CONST_SL_4_uxn_device_h_l93_c40_07b6_return_output;

     -- Submodule level 12
     VAR_MUX_uxn_device_h_l92_c36_9462_cond := VAR_BIN_OP_EQ_uxn_device_h_l92_c36_7603_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l93_c30_ce50_right := VAR_CONST_SL_4_uxn_device_h_l93_c40_07b6_return_output;
     REG_VAR_ch := VAR_ch_MUX_uxn_device_h_l80_c2_fde8_return_output;
     -- BIN_OP_PLUS[uxn_device_h_l93_c30_ce50] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l93_c30_ce50_left <= VAR_BIN_OP_PLUS_uxn_device_h_l93_c30_ce50_left;
     BIN_OP_PLUS_uxn_device_h_l93_c30_ce50_right <= VAR_BIN_OP_PLUS_uxn_device_h_l93_c30_ce50_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l93_c30_ce50_return_output := BIN_OP_PLUS_uxn_device_h_l93_c30_ce50_return_output;

     -- MUX[uxn_device_h_l92_c36_9462] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l92_c36_9462_cond <= VAR_MUX_uxn_device_h_l92_c36_9462_cond;
     MUX_uxn_device_h_l92_c36_9462_iftrue <= VAR_MUX_uxn_device_h_l92_c36_9462_iftrue;
     MUX_uxn_device_h_l92_c36_9462_iffalse <= VAR_MUX_uxn_device_h_l92_c36_9462_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l92_c36_9462_return_output := MUX_uxn_device_h_l92_c36_9462_return_output;

     -- Submodule level 13
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_d90e_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l93_c30_ce50_return_output, 7);
     VAR_BIN_OP_OR_uxn_device_h_l92_c26_8136_right := VAR_MUX_uxn_device_h_l92_c36_9462_return_output;
     -- BIN_OP_OR[uxn_device_h_l92_c26_8136] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l92_c26_8136_left <= VAR_BIN_OP_OR_uxn_device_h_l92_c26_8136_left;
     BIN_OP_OR_uxn_device_h_l92_c26_8136_right <= VAR_BIN_OP_OR_uxn_device_h_l92_c26_8136_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l92_c26_8136_return_output := BIN_OP_OR_uxn_device_h_l92_c26_8136_return_output;

     -- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d[uxn_device_h_l93_c21_d90e] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_d90e_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_d90e_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_d90e_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_d90e_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_d90e_return_output := VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_d90e_return_output;

     -- Submodule level 14
     VAR_result_is_vram_write_MUX_uxn_device_h_l80_c2_fde8_iffalse := VAR_BIN_OP_OR_uxn_device_h_l92_c26_8136_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l80_c2_fde8_iffalse := VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_d90e_return_output;
     -- result_is_vram_write_MUX[uxn_device_h_l80_c2_fde8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l80_c2_fde8_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l80_c2_fde8_cond;
     result_is_vram_write_MUX_uxn_device_h_l80_c2_fde8_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l80_c2_fde8_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l80_c2_fde8_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l80_c2_fde8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l80_c2_fde8_return_output := result_is_vram_write_MUX_uxn_device_h_l80_c2_fde8_return_output;

     -- result_u8_value_MUX[uxn_device_h_l80_c2_fde8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l80_c2_fde8_cond <= VAR_result_u8_value_MUX_uxn_device_h_l80_c2_fde8_cond;
     result_u8_value_MUX_uxn_device_h_l80_c2_fde8_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l80_c2_fde8_iftrue;
     result_u8_value_MUX_uxn_device_h_l80_c2_fde8_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l80_c2_fde8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l80_c2_fde8_return_output := result_u8_value_MUX_uxn_device_h_l80_c2_fde8_return_output;

     -- Submodule level 15
     -- CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_15f2_uxn_device_h_l100_l42_DUPLICATE_1907 LATENCY=0
     VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_15f2_uxn_device_h_l100_l42_DUPLICATE_1907_return_output := CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_15f2(
     result,
     VAR_result_is_vram_write_MUX_uxn_device_h_l80_c2_fde8_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l80_c2_fde8_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l80_c2_fde8_return_output,
     VAR_result_is_blit_done_MUX_uxn_device_h_l80_c2_fde8_return_output);

     -- Submodule level 16
     REG_VAR_result := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_15f2_uxn_device_h_l100_l42_DUPLICATE_1907_return_output;
     VAR_return_output := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_15f2_uxn_device_h_l100_l42_DUPLICATE_1907_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_blending <= REG_VAR_blending;
REG_COMB_x <= REG_VAR_x;
REG_COMB_y <= REG_VAR_y;
REG_COMB_xmod <= REG_VAR_xmod;
REG_COMB_opaque <= REG_VAR_opaque;
REG_COMB_c <= REG_VAR_c;
REG_COMB_ch <= REG_VAR_ch;
REG_COMB_color8 <= REG_VAR_color8;
REG_COMB_result <= REG_VAR_result;
REG_COMB_phase_minus_two <= REG_VAR_phase_minus_two;
REG_COMB_phase7_downto_4 <= REG_VAR_phase7_downto_4;
REG_COMB_phase7_downto_3 <= REG_VAR_phase7_downto_3;
REG_COMB_phase2_downto_0 <= REG_VAR_phase2_downto_0;
REG_COMB_sprite_rows <= REG_VAR_sprite_rows;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     blending <= REG_COMB_blending;
     x <= REG_COMB_x;
     y <= REG_COMB_y;
     xmod <= REG_COMB_xmod;
     opaque <= REG_COMB_opaque;
     c <= REG_COMB_c;
     ch <= REG_COMB_ch;
     color8 <= REG_COMB_color8;
     result <= REG_COMB_result;
     phase_minus_two <= REG_COMB_phase_minus_two;
     phase7_downto_4 <= REG_COMB_phase7_downto_4;
     phase7_downto_3 <= REG_COMB_phase7_downto_3;
     phase2_downto_0 <= REG_COMB_phase2_downto_0;
     sprite_rows <= REG_COMB_sprite_rows;
 end if;
 end if;
end process;

end arch;
