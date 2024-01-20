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
-- Submodules: 68
entity screen_2bpp_0CLK_c97a7bcc is
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
end screen_2bpp_0CLK_c97a7bcc;
architecture arch of screen_2bpp_0CLK_c97a7bcc is
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
signal ch : unsigned(1 downto 0) := to_unsigned(0, 2);
signal color8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : screen_blit_result_t := screen_blit_result_t_NULL;
signal phase_minus_two : unsigned(7 downto 0) := to_unsigned(0, 8);
signal phase7_downto_4 : unsigned(4 downto 0) := to_unsigned(0, 5);
signal phase7_downto_3 : unsigned(4 downto 0) := to_unsigned(0, 5);
signal phase2_downto_0 : unsigned(2 downto 0) := to_unsigned(0, 3);
signal sprite_rows : uint8_t_16 := (others => to_unsigned(0, 8));
signal REG_COMB_blending : uint8_t_80;
signal REG_COMB_x : unsigned(15 downto 0);
signal REG_COMB_y : unsigned(15 downto 0);
signal REG_COMB_xmod : unsigned(7 downto 0);
signal REG_COMB_opaque : unsigned(0 downto 0);
signal REG_COMB_c : unsigned(15 downto 0);
signal REG_COMB_ch : unsigned(1 downto 0);
signal REG_COMB_color8 : unsigned(7 downto 0);
signal REG_COMB_result : screen_blit_result_t;
signal REG_COMB_phase_minus_two : unsigned(7 downto 0);
signal REG_COMB_phase7_downto_4 : unsigned(4 downto 0);
signal REG_COMB_phase7_downto_3 : unsigned(4 downto 0);
signal REG_COMB_phase2_downto_0 : unsigned(2 downto 0);
signal REG_COMB_sprite_rows : uint8_t_16;

-- Each function instance gets signals
-- BIN_OP_MINUS[uxn_device_h_l67_c20_ade5]
signal BIN_OP_MINUS_uxn_device_h_l67_c20_ade5_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l67_c20_ade5_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l67_c20_ade5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l69_c6_336f]
signal BIN_OP_EQ_uxn_device_h_l69_c6_336f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l69_c6_336f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l69_c6_336f_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l69_c2_a805]
signal y_MUX_uxn_device_h_l69_c2_a805_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l69_c2_a805_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l69_c2_a805_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l69_c2_a805_return_output : unsigned(15 downto 0);

-- xmod_MUX[uxn_device_h_l69_c2_a805]
signal xmod_MUX_uxn_device_h_l69_c2_a805_cond : unsigned(0 downto 0);
signal xmod_MUX_uxn_device_h_l69_c2_a805_iftrue : unsigned(7 downto 0);
signal xmod_MUX_uxn_device_h_l69_c2_a805_iffalse : unsigned(7 downto 0);
signal xmod_MUX_uxn_device_h_l69_c2_a805_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l69_c2_a805]
signal x_MUX_uxn_device_h_l69_c2_a805_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l69_c2_a805_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l69_c2_a805_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l69_c2_a805_return_output : unsigned(15 downto 0);

-- opaque_MUX[uxn_device_h_l69_c2_a805]
signal opaque_MUX_uxn_device_h_l69_c2_a805_cond : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l69_c2_a805_iftrue : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l69_c2_a805_iffalse : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l69_c2_a805_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l70_c21_1201]
signal BIN_OP_PLUS_uxn_device_h_l70_c21_1201_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l70_c21_1201_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l70_c21_1201_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d[uxn_device_h_l70_c12_e67f]
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l70_c12_e67f_ref_toks_0 : uint8_t_80;
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l70_c12_e67f_var_dim_0 : unsigned(6 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l70_c12_e67f_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l71_c10_f7bb]
signal MUX_uxn_device_h_l71_c10_f7bb_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l71_c10_f7bb_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l71_c10_f7bb_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l71_c10_f7bb_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l72_c7_9b86]
signal BIN_OP_PLUS_uxn_device_h_l72_c7_9b86_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l72_c7_9b86_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l72_c7_9b86_return_output : unsigned(8 downto 0);

-- MUX[uxn_device_h_l73_c13_59cc]
signal MUX_uxn_device_h_l73_c13_59cc_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l73_c13_59cc_iftrue : unsigned(2 downto 0);
signal MUX_uxn_device_h_l73_c13_59cc_iffalse : unsigned(2 downto 0);
signal MUX_uxn_device_h_l73_c13_59cc_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l73_c7_3a27]
signal BIN_OP_PLUS_uxn_device_h_l73_c7_3a27_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l73_c7_3a27_right : unsigned(2 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l73_c7_3a27_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_device_h_l76_c6_de0f]
signal BIN_OP_EQ_uxn_device_h_l76_c6_de0f_left : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l76_c6_de0f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l76_c6_de0f_return_output : unsigned(0 downto 0);

-- ch_MUX[uxn_device_h_l76_c2_a131]
signal ch_MUX_uxn_device_h_l76_c2_a131_cond : unsigned(0 downto 0);
signal ch_MUX_uxn_device_h_l76_c2_a131_iftrue : unsigned(1 downto 0);
signal ch_MUX_uxn_device_h_l76_c2_a131_iffalse : unsigned(1 downto 0);
signal ch_MUX_uxn_device_h_l76_c2_a131_return_output : unsigned(1 downto 0);

-- y_MUX[uxn_device_h_l76_c2_a131]
signal y_MUX_uxn_device_h_l76_c2_a131_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l76_c2_a131_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l76_c2_a131_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l76_c2_a131_return_output : unsigned(15 downto 0);

-- c_MUX[uxn_device_h_l76_c2_a131]
signal c_MUX_uxn_device_h_l76_c2_a131_cond : unsigned(0 downto 0);
signal c_MUX_uxn_device_h_l76_c2_a131_iftrue : unsigned(15 downto 0);
signal c_MUX_uxn_device_h_l76_c2_a131_iffalse : unsigned(15 downto 0);
signal c_MUX_uxn_device_h_l76_c2_a131_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l76_c2_a131]
signal x_MUX_uxn_device_h_l76_c2_a131_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l76_c2_a131_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l76_c2_a131_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l76_c2_a131_return_output : unsigned(15 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l76_c2_a131]
signal result_u16_addr_MUX_uxn_device_h_l76_c2_a131_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l76_c2_a131_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l76_c2_a131_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l76_c2_a131_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_device_h_l76_c2_a131]
signal result_u8_value_MUX_uxn_device_h_l76_c2_a131_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l76_c2_a131_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l76_c2_a131_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l76_c2_a131_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l76_c2_a131]
signal result_is_vram_write_MUX_uxn_device_h_l76_c2_a131_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l76_c2_a131_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l76_c2_a131_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l76_c2_a131_return_output : unsigned(0 downto 0);

-- result_is_blit_done_MUX[uxn_device_h_l76_c2_a131]
signal result_is_blit_done_MUX_uxn_device_h_l76_c2_a131_cond : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l76_c2_a131_iftrue : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l76_c2_a131_iffalse : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l76_c2_a131_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l80_c21_88e6]
signal BIN_OP_PLUS_uxn_device_h_l80_c21_88e6_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l80_c21_88e6_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l80_c21_88e6_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l82_c7_c020]
signal BIN_OP_EQ_uxn_device_h_l82_c7_c020_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l82_c7_c020_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l82_c7_c020_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l82_c46_18e2]
signal BIN_OP_MINUS_uxn_device_h_l82_c46_18e2_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l82_c46_18e2_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l82_c46_18e2_return_output : unsigned(7 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d[uxn_device_h_l82_c34_8431]
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c34_8431_ref_toks_0 : uint8_t_16;
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c34_8431_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c34_8431_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l82_c96_b468]
signal BIN_OP_PLUS_uxn_device_h_l82_c96_b468_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l82_c96_b468_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l82_c96_b468_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d[uxn_device_h_l82_c84_6531]
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c84_6531_ref_toks_0 : uint8_t_16;
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c84_6531_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c84_6531_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_device_h_l82_c84_5b14]
signal CONST_SL_8_uxn_device_h_l82_c84_5b14_x : unsigned(7 downto 0);
signal CONST_SL_8_uxn_device_h_l82_c84_5b14_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l82_c34_fe73]
signal BIN_OP_OR_uxn_device_h_l82_c34_fe73_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l82_c34_fe73_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l82_c34_fe73_return_output : unsigned(7 downto 0);

-- CONST_SR_1[uxn_device_h_l82_c139_03aa]
signal CONST_SR_1_uxn_device_h_l82_c139_03aa_x : unsigned(15 downto 0);
signal CONST_SR_1_uxn_device_h_l82_c139_03aa_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l82_c7_ef55]
signal MUX_uxn_device_h_l82_c7_ef55_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l82_c7_ef55_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l82_c7_ef55_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l82_c7_ef55_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l83_c7_833b]
signal BIN_OP_EQ_uxn_device_h_l83_c7_833b_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l83_c7_833b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l83_c7_833b_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l83_c35_4b52]
signal BIN_OP_PLUS_uxn_device_h_l83_c35_4b52_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l83_c35_4b52_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l83_c35_4b52_return_output : unsigned(8 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l83_c55_e549]
signal BIN_OP_MINUS_uxn_device_h_l83_c55_e549_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l83_c55_e549_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l83_c55_e549_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l83_c65_cc82]
signal BIN_OP_PLUS_uxn_device_h_l83_c65_cc82_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l83_c65_cc82_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l83_c65_cc82_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l83_c49_2e92]
signal MUX_uxn_device_h_l83_c49_2e92_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l83_c49_2e92_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l83_c49_2e92_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l83_c49_2e92_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l83_c7_c2e2]
signal MUX_uxn_device_h_l83_c7_c2e2_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l83_c7_c2e2_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l83_c7_c2e2_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l83_c7_c2e2_return_output : unsigned(15 downto 0);

-- CONST_SL_1[uxn_device_h_l85_c3_c1b1]
signal CONST_SL_1_uxn_device_h_l85_c3_c1b1_x : unsigned(1 downto 0);
signal CONST_SL_1_uxn_device_h_l85_c3_c1b1_return_output : unsigned(1 downto 0);

-- BIN_OP_OR[uxn_device_h_l86_c3_3edb]
signal BIN_OP_OR_uxn_device_h_l86_c3_3edb_left : unsigned(1 downto 0);
signal BIN_OP_OR_uxn_device_h_l86_c3_3edb_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l86_c3_3edb_return_output : unsigned(1 downto 0);

-- CONST_SL_8[uxn_device_h_l87_c22_f93b]
signal CONST_SL_8_uxn_device_h_l87_c22_f93b_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_device_h_l87_c22_f93b_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l87_c22_462e]
signal BIN_OP_PLUS_uxn_device_h_l87_c22_462e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l87_c22_462e_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l87_c22_462e_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l88_c36_b523]
signal BIN_OP_EQ_uxn_device_h_l88_c36_b523_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l88_c36_b523_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l88_c36_b523_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l88_c36_eb03]
signal MUX_uxn_device_h_l88_c36_eb03_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l88_c36_eb03_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l88_c36_eb03_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l88_c36_eb03_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l88_c26_51f0]
signal BIN_OP_OR_uxn_device_h_l88_c26_51f0_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l88_c26_51f0_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l88_c26_51f0_return_output : unsigned(0 downto 0);

-- CONST_SL_4[uxn_device_h_l89_c41_8700]
signal CONST_SL_4_uxn_device_h_l89_c41_8700_x : unsigned(7 downto 0);
signal CONST_SL_4_uxn_device_h_l89_c41_8700_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l89_c30_bbd7]
signal BIN_OP_PLUS_uxn_device_h_l89_c30_bbd7_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l89_c30_bbd7_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l89_c30_bbd7_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d[uxn_device_h_l89_c21_2756]
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l89_c21_2756_ref_toks_0 : uint8_t_80;
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l89_c21_2756_var_dim_0 : unsigned(6 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l89_c21_2756_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l90_c7_ee46]
signal BIN_OP_EQ_uxn_device_h_l90_c7_ee46_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c7_ee46_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c7_ee46_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l90_c41_65de]
signal BIN_OP_MINUS_uxn_device_h_l90_c41_65de_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l90_c41_65de_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l90_c41_65de_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l90_c51_8a1e]
signal BIN_OP_PLUS_uxn_device_h_l90_c51_8a1e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l90_c51_8a1e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l90_c51_8a1e_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l90_c35_e79e]
signal MUX_uxn_device_h_l90_c35_e79e_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c35_e79e_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l90_c35_e79e_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l90_c35_e79e_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l90_c7_9609]
signal MUX_uxn_device_h_l90_c7_9609_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c7_9609_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l90_c7_9609_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l90_c7_9609_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l91_c25_5cb1]
signal BIN_OP_EQ_uxn_device_h_l91_c25_5cb1_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l91_c25_5cb1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l91_c25_5cb1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l91_c53_989d]
signal BIN_OP_EQ_uxn_device_h_l91_c53_989d_left : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l91_c53_989d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l91_c53_989d_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l91_c25_de0e]
signal BIN_OP_AND_uxn_device_h_l91_c25_de0e_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l91_c25_de0e_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l91_c25_de0e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l94_c6_c2cf]
signal BIN_OP_EQ_uxn_device_h_l94_c6_c2cf_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l94_c6_c2cf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l94_c6_c2cf_return_output : unsigned(0 downto 0);

-- sprite_rows_MUX[uxn_device_h_l94_c2_8a34]
signal sprite_rows_MUX_uxn_device_h_l94_c2_8a34_cond : unsigned(0 downto 0);
signal sprite_rows_MUX_uxn_device_h_l94_c2_8a34_iftrue : uint8_t_16;
signal sprite_rows_MUX_uxn_device_h_l94_c2_8a34_iffalse : uint8_t_16;
signal sprite_rows_MUX_uxn_device_h_l94_c2_8a34_return_output : uint8_t_16;

-- VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60[uxn_device_h_l95_c3_e131]
signal VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l95_c3_e131_elem_val : unsigned(7 downto 0);
signal VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l95_c3_e131_ref_toks_0 : uint8_t_16;
signal VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l95_c3_e131_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l95_c3_e131_return_output : uint8_t_array_16_t;

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

function uint16_7_7( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(7- i);
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

function CAST_TO_uint8_t_uint2_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(1 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5( ref_toks_0 : uint8_t_array_16_t) return uint8_t_16 is
 
  variable base : uint8_t_16; 
  variable return_output : uint8_t_16;
begin
      base(10) := ref_toks_0.data(10);
      base(2) := ref_toks_0.data(2);
      base(5) := ref_toks_0.data(5);
      base(11) := ref_toks_0.data(11);
      base(8) := ref_toks_0.data(8);
      base(14) := ref_toks_0.data(14);
      base(0) := ref_toks_0.data(0);
      base(6) := ref_toks_0.data(6);
      base(3) := ref_toks_0.data(3);
      base(9) := ref_toks_0.data(9);
      base(12) := ref_toks_0.data(12);
      base(15) := ref_toks_0.data(15);
      base(4) := ref_toks_0.data(4);
      base(1) := ref_toks_0.data(1);
      base(7) := ref_toks_0.data(7);
      base(13) := ref_toks_0.data(13);

      return_output := base;
      return return_output; 
end function;

function CAST_TO_uint8_t_uint5_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(4 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_cd45( ref_toks_0 : screen_blit_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return screen_blit_result_t is
 
  variable base : screen_blit_result_t; 
  variable return_output : screen_blit_result_t;
begin
      base := ref_toks_0;
      base.u16_addr := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_blit_done := ref_toks_4;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_MINUS_uxn_device_h_l67_c20_ade5
BIN_OP_MINUS_uxn_device_h_l67_c20_ade5 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l67_c20_ade5_left,
BIN_OP_MINUS_uxn_device_h_l67_c20_ade5_right,
BIN_OP_MINUS_uxn_device_h_l67_c20_ade5_return_output);

-- BIN_OP_EQ_uxn_device_h_l69_c6_336f
BIN_OP_EQ_uxn_device_h_l69_c6_336f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l69_c6_336f_left,
BIN_OP_EQ_uxn_device_h_l69_c6_336f_right,
BIN_OP_EQ_uxn_device_h_l69_c6_336f_return_output);

-- y_MUX_uxn_device_h_l69_c2_a805
y_MUX_uxn_device_h_l69_c2_a805 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l69_c2_a805_cond,
y_MUX_uxn_device_h_l69_c2_a805_iftrue,
y_MUX_uxn_device_h_l69_c2_a805_iffalse,
y_MUX_uxn_device_h_l69_c2_a805_return_output);

-- xmod_MUX_uxn_device_h_l69_c2_a805
xmod_MUX_uxn_device_h_l69_c2_a805 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
xmod_MUX_uxn_device_h_l69_c2_a805_cond,
xmod_MUX_uxn_device_h_l69_c2_a805_iftrue,
xmod_MUX_uxn_device_h_l69_c2_a805_iffalse,
xmod_MUX_uxn_device_h_l69_c2_a805_return_output);

-- x_MUX_uxn_device_h_l69_c2_a805
x_MUX_uxn_device_h_l69_c2_a805 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l69_c2_a805_cond,
x_MUX_uxn_device_h_l69_c2_a805_iftrue,
x_MUX_uxn_device_h_l69_c2_a805_iffalse,
x_MUX_uxn_device_h_l69_c2_a805_return_output);

-- opaque_MUX_uxn_device_h_l69_c2_a805
opaque_MUX_uxn_device_h_l69_c2_a805 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opaque_MUX_uxn_device_h_l69_c2_a805_cond,
opaque_MUX_uxn_device_h_l69_c2_a805_iftrue,
opaque_MUX_uxn_device_h_l69_c2_a805_iffalse,
opaque_MUX_uxn_device_h_l69_c2_a805_return_output);

-- BIN_OP_PLUS_uxn_device_h_l70_c21_1201
BIN_OP_PLUS_uxn_device_h_l70_c21_1201 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l70_c21_1201_left,
BIN_OP_PLUS_uxn_device_h_l70_c21_1201_right,
BIN_OP_PLUS_uxn_device_h_l70_c21_1201_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l70_c12_e67f
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l70_c12_e67f : entity work.VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_0CLK_4b00ae23 port map (
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l70_c12_e67f_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l70_c12_e67f_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l70_c12_e67f_return_output);

-- MUX_uxn_device_h_l71_c10_f7bb
MUX_uxn_device_h_l71_c10_f7bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l71_c10_f7bb_cond,
MUX_uxn_device_h_l71_c10_f7bb_iftrue,
MUX_uxn_device_h_l71_c10_f7bb_iffalse,
MUX_uxn_device_h_l71_c10_f7bb_return_output);

-- BIN_OP_PLUS_uxn_device_h_l72_c7_9b86
BIN_OP_PLUS_uxn_device_h_l72_c7_9b86 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l72_c7_9b86_left,
BIN_OP_PLUS_uxn_device_h_l72_c7_9b86_right,
BIN_OP_PLUS_uxn_device_h_l72_c7_9b86_return_output);

-- MUX_uxn_device_h_l73_c13_59cc
MUX_uxn_device_h_l73_c13_59cc : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l73_c13_59cc_cond,
MUX_uxn_device_h_l73_c13_59cc_iftrue,
MUX_uxn_device_h_l73_c13_59cc_iffalse,
MUX_uxn_device_h_l73_c13_59cc_return_output);

-- BIN_OP_PLUS_uxn_device_h_l73_c7_3a27
BIN_OP_PLUS_uxn_device_h_l73_c7_3a27 : entity work.BIN_OP_PLUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l73_c7_3a27_left,
BIN_OP_PLUS_uxn_device_h_l73_c7_3a27_right,
BIN_OP_PLUS_uxn_device_h_l73_c7_3a27_return_output);

-- BIN_OP_EQ_uxn_device_h_l76_c6_de0f
BIN_OP_EQ_uxn_device_h_l76_c6_de0f : entity work.BIN_OP_EQ_uint5_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l76_c6_de0f_left,
BIN_OP_EQ_uxn_device_h_l76_c6_de0f_right,
BIN_OP_EQ_uxn_device_h_l76_c6_de0f_return_output);

-- ch_MUX_uxn_device_h_l76_c2_a131
ch_MUX_uxn_device_h_l76_c2_a131 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
ch_MUX_uxn_device_h_l76_c2_a131_cond,
ch_MUX_uxn_device_h_l76_c2_a131_iftrue,
ch_MUX_uxn_device_h_l76_c2_a131_iffalse,
ch_MUX_uxn_device_h_l76_c2_a131_return_output);

-- y_MUX_uxn_device_h_l76_c2_a131
y_MUX_uxn_device_h_l76_c2_a131 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l76_c2_a131_cond,
y_MUX_uxn_device_h_l76_c2_a131_iftrue,
y_MUX_uxn_device_h_l76_c2_a131_iffalse,
y_MUX_uxn_device_h_l76_c2_a131_return_output);

-- c_MUX_uxn_device_h_l76_c2_a131
c_MUX_uxn_device_h_l76_c2_a131 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
c_MUX_uxn_device_h_l76_c2_a131_cond,
c_MUX_uxn_device_h_l76_c2_a131_iftrue,
c_MUX_uxn_device_h_l76_c2_a131_iffalse,
c_MUX_uxn_device_h_l76_c2_a131_return_output);

-- x_MUX_uxn_device_h_l76_c2_a131
x_MUX_uxn_device_h_l76_c2_a131 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l76_c2_a131_cond,
x_MUX_uxn_device_h_l76_c2_a131_iftrue,
x_MUX_uxn_device_h_l76_c2_a131_iffalse,
x_MUX_uxn_device_h_l76_c2_a131_return_output);

-- result_u16_addr_MUX_uxn_device_h_l76_c2_a131
result_u16_addr_MUX_uxn_device_h_l76_c2_a131 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l76_c2_a131_cond,
result_u16_addr_MUX_uxn_device_h_l76_c2_a131_iftrue,
result_u16_addr_MUX_uxn_device_h_l76_c2_a131_iffalse,
result_u16_addr_MUX_uxn_device_h_l76_c2_a131_return_output);

-- result_u8_value_MUX_uxn_device_h_l76_c2_a131
result_u8_value_MUX_uxn_device_h_l76_c2_a131 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l76_c2_a131_cond,
result_u8_value_MUX_uxn_device_h_l76_c2_a131_iftrue,
result_u8_value_MUX_uxn_device_h_l76_c2_a131_iffalse,
result_u8_value_MUX_uxn_device_h_l76_c2_a131_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l76_c2_a131
result_is_vram_write_MUX_uxn_device_h_l76_c2_a131 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l76_c2_a131_cond,
result_is_vram_write_MUX_uxn_device_h_l76_c2_a131_iftrue,
result_is_vram_write_MUX_uxn_device_h_l76_c2_a131_iffalse,
result_is_vram_write_MUX_uxn_device_h_l76_c2_a131_return_output);

-- result_is_blit_done_MUX_uxn_device_h_l76_c2_a131
result_is_blit_done_MUX_uxn_device_h_l76_c2_a131 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_blit_done_MUX_uxn_device_h_l76_c2_a131_cond,
result_is_blit_done_MUX_uxn_device_h_l76_c2_a131_iftrue,
result_is_blit_done_MUX_uxn_device_h_l76_c2_a131_iffalse,
result_is_blit_done_MUX_uxn_device_h_l76_c2_a131_return_output);

-- BIN_OP_PLUS_uxn_device_h_l80_c21_88e6
BIN_OP_PLUS_uxn_device_h_l80_c21_88e6 : entity work.BIN_OP_PLUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l80_c21_88e6_left,
BIN_OP_PLUS_uxn_device_h_l80_c21_88e6_right,
BIN_OP_PLUS_uxn_device_h_l80_c21_88e6_return_output);

-- BIN_OP_EQ_uxn_device_h_l82_c7_c020
BIN_OP_EQ_uxn_device_h_l82_c7_c020 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l82_c7_c020_left,
BIN_OP_EQ_uxn_device_h_l82_c7_c020_right,
BIN_OP_EQ_uxn_device_h_l82_c7_c020_return_output);

-- BIN_OP_MINUS_uxn_device_h_l82_c46_18e2
BIN_OP_MINUS_uxn_device_h_l82_c46_18e2 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l82_c46_18e2_left,
BIN_OP_MINUS_uxn_device_h_l82_c46_18e2_right,
BIN_OP_MINUS_uxn_device_h_l82_c46_18e2_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c34_8431
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c34_8431 : entity work.VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_0CLK_e799c7f1 port map (
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c34_8431_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c34_8431_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c34_8431_return_output);

-- BIN_OP_PLUS_uxn_device_h_l82_c96_b468
BIN_OP_PLUS_uxn_device_h_l82_c96_b468 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l82_c96_b468_left,
BIN_OP_PLUS_uxn_device_h_l82_c96_b468_right,
BIN_OP_PLUS_uxn_device_h_l82_c96_b468_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c84_6531
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c84_6531 : entity work.VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_0CLK_e799c7f1 port map (
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c84_6531_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c84_6531_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c84_6531_return_output);

-- CONST_SL_8_uxn_device_h_l82_c84_5b14
CONST_SL_8_uxn_device_h_l82_c84_5b14 : entity work.CONST_SL_8_uint8_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_device_h_l82_c84_5b14_x,
CONST_SL_8_uxn_device_h_l82_c84_5b14_return_output);

-- BIN_OP_OR_uxn_device_h_l82_c34_fe73
BIN_OP_OR_uxn_device_h_l82_c34_fe73 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l82_c34_fe73_left,
BIN_OP_OR_uxn_device_h_l82_c34_fe73_right,
BIN_OP_OR_uxn_device_h_l82_c34_fe73_return_output);

-- CONST_SR_1_uxn_device_h_l82_c139_03aa
CONST_SR_1_uxn_device_h_l82_c139_03aa : entity work.CONST_SR_1_uint16_t_0CLK_de264c78 port map (
CONST_SR_1_uxn_device_h_l82_c139_03aa_x,
CONST_SR_1_uxn_device_h_l82_c139_03aa_return_output);

-- MUX_uxn_device_h_l82_c7_ef55
MUX_uxn_device_h_l82_c7_ef55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l82_c7_ef55_cond,
MUX_uxn_device_h_l82_c7_ef55_iftrue,
MUX_uxn_device_h_l82_c7_ef55_iffalse,
MUX_uxn_device_h_l82_c7_ef55_return_output);

-- BIN_OP_EQ_uxn_device_h_l83_c7_833b
BIN_OP_EQ_uxn_device_h_l83_c7_833b : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l83_c7_833b_left,
BIN_OP_EQ_uxn_device_h_l83_c7_833b_right,
BIN_OP_EQ_uxn_device_h_l83_c7_833b_return_output);

-- BIN_OP_PLUS_uxn_device_h_l83_c35_4b52
BIN_OP_PLUS_uxn_device_h_l83_c35_4b52 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l83_c35_4b52_left,
BIN_OP_PLUS_uxn_device_h_l83_c35_4b52_right,
BIN_OP_PLUS_uxn_device_h_l83_c35_4b52_return_output);

-- BIN_OP_MINUS_uxn_device_h_l83_c55_e549
BIN_OP_MINUS_uxn_device_h_l83_c55_e549 : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l83_c55_e549_left,
BIN_OP_MINUS_uxn_device_h_l83_c55_e549_right,
BIN_OP_MINUS_uxn_device_h_l83_c55_e549_return_output);

-- BIN_OP_PLUS_uxn_device_h_l83_c65_cc82
BIN_OP_PLUS_uxn_device_h_l83_c65_cc82 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l83_c65_cc82_left,
BIN_OP_PLUS_uxn_device_h_l83_c65_cc82_right,
BIN_OP_PLUS_uxn_device_h_l83_c65_cc82_return_output);

-- MUX_uxn_device_h_l83_c49_2e92
MUX_uxn_device_h_l83_c49_2e92 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l83_c49_2e92_cond,
MUX_uxn_device_h_l83_c49_2e92_iftrue,
MUX_uxn_device_h_l83_c49_2e92_iffalse,
MUX_uxn_device_h_l83_c49_2e92_return_output);

-- MUX_uxn_device_h_l83_c7_c2e2
MUX_uxn_device_h_l83_c7_c2e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l83_c7_c2e2_cond,
MUX_uxn_device_h_l83_c7_c2e2_iftrue,
MUX_uxn_device_h_l83_c7_c2e2_iffalse,
MUX_uxn_device_h_l83_c7_c2e2_return_output);

-- CONST_SL_1_uxn_device_h_l85_c3_c1b1
CONST_SL_1_uxn_device_h_l85_c3_c1b1 : entity work.CONST_SL_1_uint2_t_0CLK_de264c78 port map (
CONST_SL_1_uxn_device_h_l85_c3_c1b1_x,
CONST_SL_1_uxn_device_h_l85_c3_c1b1_return_output);

-- BIN_OP_OR_uxn_device_h_l86_c3_3edb
BIN_OP_OR_uxn_device_h_l86_c3_3edb : entity work.BIN_OP_OR_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l86_c3_3edb_left,
BIN_OP_OR_uxn_device_h_l86_c3_3edb_right,
BIN_OP_OR_uxn_device_h_l86_c3_3edb_return_output);

-- CONST_SL_8_uxn_device_h_l87_c22_f93b
CONST_SL_8_uxn_device_h_l87_c22_f93b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_device_h_l87_c22_f93b_x,
CONST_SL_8_uxn_device_h_l87_c22_f93b_return_output);

-- BIN_OP_PLUS_uxn_device_h_l87_c22_462e
BIN_OP_PLUS_uxn_device_h_l87_c22_462e : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l87_c22_462e_left,
BIN_OP_PLUS_uxn_device_h_l87_c22_462e_right,
BIN_OP_PLUS_uxn_device_h_l87_c22_462e_return_output);

-- BIN_OP_EQ_uxn_device_h_l88_c36_b523
BIN_OP_EQ_uxn_device_h_l88_c36_b523 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l88_c36_b523_left,
BIN_OP_EQ_uxn_device_h_l88_c36_b523_right,
BIN_OP_EQ_uxn_device_h_l88_c36_b523_return_output);

-- MUX_uxn_device_h_l88_c36_eb03
MUX_uxn_device_h_l88_c36_eb03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l88_c36_eb03_cond,
MUX_uxn_device_h_l88_c36_eb03_iftrue,
MUX_uxn_device_h_l88_c36_eb03_iffalse,
MUX_uxn_device_h_l88_c36_eb03_return_output);

-- BIN_OP_OR_uxn_device_h_l88_c26_51f0
BIN_OP_OR_uxn_device_h_l88_c26_51f0 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l88_c26_51f0_left,
BIN_OP_OR_uxn_device_h_l88_c26_51f0_right,
BIN_OP_OR_uxn_device_h_l88_c26_51f0_return_output);

-- CONST_SL_4_uxn_device_h_l89_c41_8700
CONST_SL_4_uxn_device_h_l89_c41_8700 : entity work.CONST_SL_4_uint8_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_device_h_l89_c41_8700_x,
CONST_SL_4_uxn_device_h_l89_c41_8700_return_output);

-- BIN_OP_PLUS_uxn_device_h_l89_c30_bbd7
BIN_OP_PLUS_uxn_device_h_l89_c30_bbd7 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l89_c30_bbd7_left,
BIN_OP_PLUS_uxn_device_h_l89_c30_bbd7_right,
BIN_OP_PLUS_uxn_device_h_l89_c30_bbd7_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l89_c21_2756
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l89_c21_2756 : entity work.VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_0CLK_4b00ae23 port map (
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l89_c21_2756_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l89_c21_2756_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l89_c21_2756_return_output);

-- BIN_OP_EQ_uxn_device_h_l90_c7_ee46
BIN_OP_EQ_uxn_device_h_l90_c7_ee46 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l90_c7_ee46_left,
BIN_OP_EQ_uxn_device_h_l90_c7_ee46_right,
BIN_OP_EQ_uxn_device_h_l90_c7_ee46_return_output);

-- BIN_OP_MINUS_uxn_device_h_l90_c41_65de
BIN_OP_MINUS_uxn_device_h_l90_c41_65de : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l90_c41_65de_left,
BIN_OP_MINUS_uxn_device_h_l90_c41_65de_right,
BIN_OP_MINUS_uxn_device_h_l90_c41_65de_return_output);

-- BIN_OP_PLUS_uxn_device_h_l90_c51_8a1e
BIN_OP_PLUS_uxn_device_h_l90_c51_8a1e : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l90_c51_8a1e_left,
BIN_OP_PLUS_uxn_device_h_l90_c51_8a1e_right,
BIN_OP_PLUS_uxn_device_h_l90_c51_8a1e_return_output);

-- MUX_uxn_device_h_l90_c35_e79e
MUX_uxn_device_h_l90_c35_e79e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l90_c35_e79e_cond,
MUX_uxn_device_h_l90_c35_e79e_iftrue,
MUX_uxn_device_h_l90_c35_e79e_iffalse,
MUX_uxn_device_h_l90_c35_e79e_return_output);

-- MUX_uxn_device_h_l90_c7_9609
MUX_uxn_device_h_l90_c7_9609 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l90_c7_9609_cond,
MUX_uxn_device_h_l90_c7_9609_iftrue,
MUX_uxn_device_h_l90_c7_9609_iffalse,
MUX_uxn_device_h_l90_c7_9609_return_output);

-- BIN_OP_EQ_uxn_device_h_l91_c25_5cb1
BIN_OP_EQ_uxn_device_h_l91_c25_5cb1 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l91_c25_5cb1_left,
BIN_OP_EQ_uxn_device_h_l91_c25_5cb1_right,
BIN_OP_EQ_uxn_device_h_l91_c25_5cb1_return_output);

-- BIN_OP_EQ_uxn_device_h_l91_c53_989d
BIN_OP_EQ_uxn_device_h_l91_c53_989d : entity work.BIN_OP_EQ_uint5_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l91_c53_989d_left,
BIN_OP_EQ_uxn_device_h_l91_c53_989d_right,
BIN_OP_EQ_uxn_device_h_l91_c53_989d_return_output);

-- BIN_OP_AND_uxn_device_h_l91_c25_de0e
BIN_OP_AND_uxn_device_h_l91_c25_de0e : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l91_c25_de0e_left,
BIN_OP_AND_uxn_device_h_l91_c25_de0e_right,
BIN_OP_AND_uxn_device_h_l91_c25_de0e_return_output);

-- BIN_OP_EQ_uxn_device_h_l94_c6_c2cf
BIN_OP_EQ_uxn_device_h_l94_c6_c2cf : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l94_c6_c2cf_left,
BIN_OP_EQ_uxn_device_h_l94_c6_c2cf_right,
BIN_OP_EQ_uxn_device_h_l94_c6_c2cf_return_output);

-- sprite_rows_MUX_uxn_device_h_l94_c2_8a34
sprite_rows_MUX_uxn_device_h_l94_c2_8a34 : entity work.MUX_uint1_t_uint8_t_16_uint8_t_16_0CLK_de264c78 port map (
sprite_rows_MUX_uxn_device_h_l94_c2_8a34_cond,
sprite_rows_MUX_uxn_device_h_l94_c2_8a34_iftrue,
sprite_rows_MUX_uxn_device_h_l94_c2_8a34_iffalse,
sprite_rows_MUX_uxn_device_h_l94_c2_8a34_return_output);

-- VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l95_c3_e131
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l95_c3_e131 : entity work.VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_0CLK_6481cb28 port map (
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l95_c3_e131_elem_val,
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l95_c3_e131_ref_toks_0,
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l95_c3_e131_var_dim_0,
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l95_c3_e131_return_output);



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
 BIN_OP_MINUS_uxn_device_h_l67_c20_ade5_return_output,
 BIN_OP_EQ_uxn_device_h_l69_c6_336f_return_output,
 y_MUX_uxn_device_h_l69_c2_a805_return_output,
 xmod_MUX_uxn_device_h_l69_c2_a805_return_output,
 x_MUX_uxn_device_h_l69_c2_a805_return_output,
 opaque_MUX_uxn_device_h_l69_c2_a805_return_output,
 BIN_OP_PLUS_uxn_device_h_l70_c21_1201_return_output,
 VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l70_c12_e67f_return_output,
 MUX_uxn_device_h_l71_c10_f7bb_return_output,
 BIN_OP_PLUS_uxn_device_h_l72_c7_9b86_return_output,
 MUX_uxn_device_h_l73_c13_59cc_return_output,
 BIN_OP_PLUS_uxn_device_h_l73_c7_3a27_return_output,
 BIN_OP_EQ_uxn_device_h_l76_c6_de0f_return_output,
 ch_MUX_uxn_device_h_l76_c2_a131_return_output,
 y_MUX_uxn_device_h_l76_c2_a131_return_output,
 c_MUX_uxn_device_h_l76_c2_a131_return_output,
 x_MUX_uxn_device_h_l76_c2_a131_return_output,
 result_u16_addr_MUX_uxn_device_h_l76_c2_a131_return_output,
 result_u8_value_MUX_uxn_device_h_l76_c2_a131_return_output,
 result_is_vram_write_MUX_uxn_device_h_l76_c2_a131_return_output,
 result_is_blit_done_MUX_uxn_device_h_l76_c2_a131_return_output,
 BIN_OP_PLUS_uxn_device_h_l80_c21_88e6_return_output,
 BIN_OP_EQ_uxn_device_h_l82_c7_c020_return_output,
 BIN_OP_MINUS_uxn_device_h_l82_c46_18e2_return_output,
 VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c34_8431_return_output,
 BIN_OP_PLUS_uxn_device_h_l82_c96_b468_return_output,
 VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c84_6531_return_output,
 CONST_SL_8_uxn_device_h_l82_c84_5b14_return_output,
 BIN_OP_OR_uxn_device_h_l82_c34_fe73_return_output,
 CONST_SR_1_uxn_device_h_l82_c139_03aa_return_output,
 MUX_uxn_device_h_l82_c7_ef55_return_output,
 BIN_OP_EQ_uxn_device_h_l83_c7_833b_return_output,
 BIN_OP_PLUS_uxn_device_h_l83_c35_4b52_return_output,
 BIN_OP_MINUS_uxn_device_h_l83_c55_e549_return_output,
 BIN_OP_PLUS_uxn_device_h_l83_c65_cc82_return_output,
 MUX_uxn_device_h_l83_c49_2e92_return_output,
 MUX_uxn_device_h_l83_c7_c2e2_return_output,
 CONST_SL_1_uxn_device_h_l85_c3_c1b1_return_output,
 BIN_OP_OR_uxn_device_h_l86_c3_3edb_return_output,
 CONST_SL_8_uxn_device_h_l87_c22_f93b_return_output,
 BIN_OP_PLUS_uxn_device_h_l87_c22_462e_return_output,
 BIN_OP_EQ_uxn_device_h_l88_c36_b523_return_output,
 MUX_uxn_device_h_l88_c36_eb03_return_output,
 BIN_OP_OR_uxn_device_h_l88_c26_51f0_return_output,
 CONST_SL_4_uxn_device_h_l89_c41_8700_return_output,
 BIN_OP_PLUS_uxn_device_h_l89_c30_bbd7_return_output,
 VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l89_c21_2756_return_output,
 BIN_OP_EQ_uxn_device_h_l90_c7_ee46_return_output,
 BIN_OP_MINUS_uxn_device_h_l90_c41_65de_return_output,
 BIN_OP_PLUS_uxn_device_h_l90_c51_8a1e_return_output,
 MUX_uxn_device_h_l90_c35_e79e_return_output,
 MUX_uxn_device_h_l90_c7_9609_return_output,
 BIN_OP_EQ_uxn_device_h_l91_c25_5cb1_return_output,
 BIN_OP_EQ_uxn_device_h_l91_c53_989d_return_output,
 BIN_OP_AND_uxn_device_h_l91_c25_de0e_return_output,
 BIN_OP_EQ_uxn_device_h_l94_c6_c2cf_return_output,
 sprite_rows_MUX_uxn_device_h_l94_c2_8a34_return_output,
 VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l95_c3_e131_return_output)
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
 variable VAR_color8_uxn_device_h_l63_c2_cce9 : unsigned(7 downto 0);
 variable VAR_phase7_downto_4_uxn_device_h_l64_c2_588a : unsigned(4 downto 0);
 variable VAR_uint8_7_4_uxn_device_h_l64_c20_a3c7_return_output : unsigned(3 downto 0);
 variable VAR_uint8_7_3_uxn_device_h_l65_c20_c3cc_return_output : unsigned(4 downto 0);
 variable VAR_uint8_2_0_uxn_device_h_l66_c20_822a_return_output : unsigned(2 downto 0);
 variable VAR_phase_minus_two_uxn_device_h_l67_c2_eff9 : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l67_c20_ade5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l67_c20_ade5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l67_c20_ade5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l69_c6_336f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l69_c6_336f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l69_c6_336f_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l69_c2_a805_iftrue : unsigned(15 downto 0);
 variable VAR_y_uxn_device_h_l73_c3_6154 : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l69_c2_a805_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l69_c2_a805_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l69_c2_a805_cond : unsigned(0 downto 0);
 variable VAR_xmod_MUX_uxn_device_h_l69_c2_a805_iftrue : unsigned(7 downto 0);
 variable VAR_xmod_MUX_uxn_device_h_l69_c2_a805_iffalse : unsigned(7 downto 0);
 variable VAR_xmod_MUX_uxn_device_h_l69_c2_a805_return_output : unsigned(7 downto 0);
 variable VAR_xmod_MUX_uxn_device_h_l69_c2_a805_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l69_c2_a805_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l72_c3_1f53 : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l69_c2_a805_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l69_c2_a805_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l69_c2_a805_cond : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l69_c2_a805_iftrue : unsigned(0 downto 0);
 variable VAR_opaque_uxn_device_h_l70_c3_bad6 : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l69_c2_a805_iffalse : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l69_c2_a805_return_output : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l69_c2_a805_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l70_c21_1201_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l70_c21_1201_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l70_c21_1201_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l70_c12_e67f_var_dim_0 : unsigned(6 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l70_c12_e67f_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l70_c12_e67f_ref_toks_0 : uint8_t_80;
 variable VAR_MUX_uxn_device_h_l71_c10_f7bb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l71_c10_f7bb_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l71_c10_f7bb_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l71_c10_f7bb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l72_c7_9b86_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l72_c7_9b86_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l72_c7_9b86_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l73_c7_3a27_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l73_c13_59cc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l73_c13_59cc_iftrue : unsigned(2 downto 0);
 variable VAR_MUX_uxn_device_h_l73_c13_59cc_iffalse : unsigned(2 downto 0);
 variable VAR_MUX_uxn_device_h_l73_c13_59cc_return_output : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l73_c7_3a27_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l73_c7_3a27_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l76_c6_de0f_left : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l76_c6_de0f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l76_c6_de0f_return_output : unsigned(0 downto 0);
 variable VAR_ch_MUX_uxn_device_h_l76_c2_a131_iftrue : unsigned(1 downto 0);
 variable VAR_ch_MUX_uxn_device_h_l76_c2_a131_iffalse : unsigned(1 downto 0);
 variable VAR_ch_MUX_uxn_device_h_l76_c2_a131_return_output : unsigned(1 downto 0);
 variable VAR_ch_MUX_uxn_device_h_l76_c2_a131_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l76_c2_a131_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l76_c2_a131_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l76_c2_a131_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l76_c2_a131_cond : unsigned(0 downto 0);
 variable VAR_c_MUX_uxn_device_h_l76_c2_a131_iftrue : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l76_c2_a131_iffalse : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l76_c2_a131_return_output : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l76_c2_a131_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l76_c2_a131_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l76_c2_a131_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l76_c2_a131_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l76_c2_a131_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l76_c2_a131_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l80_c3_fc83 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l76_c2_a131_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l87_c3_23af : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l76_c2_a131_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l76_c2_a131_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l76_c2_a131_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l78_c3_0b05 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l76_c2_a131_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l76_c2_a131_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l76_c2_a131_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l76_c2_a131_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l76_c2_a131_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l76_c2_a131_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l76_c2_a131_cond : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l76_c2_a131_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l76_c2_a131_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l76_c2_a131_return_output : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l76_c2_a131_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l80_c21_88e6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l80_c21_88e6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l80_c21_88e6_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l82_c7_ef55_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_c020_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_c020_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_c020_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l82_c7_ef55_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l82_c7_ef55_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l82_c46_18e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l82_c46_18e2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l82_c46_18e2_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c34_8431_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c34_8431_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l82_c34_fe73_left : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c34_8431_ref_toks_0 : uint8_t_16;
 variable VAR_BIN_OP_PLUS_uxn_device_h_l82_c96_b468_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l82_c96_b468_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l82_c96_b468_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c84_6531_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c84_6531_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c84_6531_ref_toks_0 : uint8_t_16;
 variable VAR_CONST_SL_8_uxn_device_h_l82_c84_5b14_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l82_c34_fe73_right : unsigned(7 downto 0);
 variable VAR_CONST_SL_8_uxn_device_h_l82_c84_5b14_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l82_c34_fe73_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l82_c139_03aa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l82_c139_03aa_x : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l82_c7_ef55_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l83_c7_c2e2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l83_c7_833b_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l83_c7_833b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l83_c7_833b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l83_c7_c2e2_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l83_c7_c2e2_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l83_c35_4b52_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l83_c35_4b52_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l83_c35_4b52_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_device_h_l83_c49_2e92_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l83_c49_2e92_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l83_c49_2e92_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l83_c55_e549_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l83_c55_e549_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l83_c55_e549_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l83_c65_cc82_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l83_c65_cc82_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l83_c65_cc82_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l83_c49_2e92_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l83_c7_c2e2_return_output : unsigned(15 downto 0);
 variable VAR_ch_uxn_device_h_l84_c3_76da : unsigned(1 downto 0);
 variable VAR_uint16_7_7_uxn_device_h_l84_c8_4b21_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SL_1_uxn_device_h_l85_c3_c1b1_return_output : unsigned(1 downto 0);
 variable VAR_CONST_SL_1_uxn_device_h_l85_c3_c1b1_x : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l86_c3_3edb_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l86_c3_3edb_right : unsigned(0 downto 0);
 variable VAR_uint16_0_0_uxn_device_h_l86_c9_35b0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l86_c3_3edb_return_output : unsigned(1 downto 0);
 variable VAR_CONST_SL_8_uxn_device_h_l87_c22_f93b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l87_c22_462e_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_device_h_l87_c22_f93b_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l87_c22_462e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l87_c22_462e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l88_c26_51f0_left : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l88_c36_eb03_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c36_b523_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c36_b523_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c36_b523_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l88_c36_eb03_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l88_c36_eb03_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l88_c36_eb03_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l88_c26_51f0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l88_c26_51f0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l89_c30_bbd7_left : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l89_c41_76f6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SL_4_uxn_device_h_l89_c41_8700_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l89_c30_bbd7_right : unsigned(7 downto 0);
 variable VAR_CONST_SL_4_uxn_device_h_l89_c41_8700_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l89_c30_bbd7_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l89_c21_2756_var_dim_0 : unsigned(6 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l89_c21_2756_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l89_c21_2756_ref_toks_0 : uint8_t_80;
 variable VAR_MUX_uxn_device_h_l90_c7_9609_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c7_ee46_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c7_ee46_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c7_ee46_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c7_9609_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c7_9609_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c35_e79e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c35_e79e_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c35_e79e_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l90_c41_65de_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l90_c41_65de_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l90_c41_65de_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l90_c51_8a1e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l90_c51_8a1e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l90_c51_8a1e_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c35_e79e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c7_9609_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c25_5cb1_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c25_5cb1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c25_5cb1_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l91_c25_de0e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c53_989d_left : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c53_989d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c53_989d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l91_c25_de0e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l91_c25_de0e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l94_c6_c2cf_left : unsigned(3 downto 0);
 variable VAR_uint8_7_4_uxn_device_h_l94_c6_478e_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l94_c6_c2cf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l94_c6_c2cf_return_output : unsigned(0 downto 0);
 variable VAR_sprite_rows_MUX_uxn_device_h_l94_c2_8a34_iftrue : uint8_t_16;
 variable VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5_uxn_device_h_l94_c2_8a34_return_output : uint8_t_16;
 variable VAR_sprite_rows_MUX_uxn_device_h_l94_c2_8a34_iffalse : uint8_t_16;
 variable VAR_sprite_rows_MUX_uxn_device_h_l94_c2_8a34_return_output : uint8_t_16;
 variable VAR_sprite_rows_MUX_uxn_device_h_l94_c2_8a34_cond : unsigned(0 downto 0);
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l95_c3_e131_return_output : uint8_t_array_16_t;
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l95_c3_e131_elem_val : unsigned(7 downto 0);
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l95_c3_e131_ref_toks_0 : uint8_t_16;
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l95_c3_e131_var_dim_0 : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uint5_t_uxn_device_h_l82_DUPLICATE_1ec2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_cd45_uxn_device_h_l98_l42_DUPLICATE_c52a_return_output : screen_blit_result_t;
 -- State registers comb logic variables
variable REG_VAR_blending : uint8_t_80;
variable REG_VAR_x : unsigned(15 downto 0);
variable REG_VAR_y : unsigned(15 downto 0);
variable REG_VAR_xmod : unsigned(7 downto 0);
variable REG_VAR_opaque : unsigned(0 downto 0);
variable REG_VAR_c : unsigned(15 downto 0);
variable REG_VAR_ch : unsigned(1 downto 0);
variable REG_VAR_color8 : unsigned(7 downto 0);
variable REG_VAR_result : screen_blit_result_t;
variable REG_VAR_phase_minus_two : unsigned(7 downto 0);
variable REG_VAR_phase7_downto_4 : unsigned(4 downto 0);
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
     VAR_BIN_OP_PLUS_uxn_device_h_l83_c65_cc82_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l91_c53_989d_right := to_unsigned(9, 4);
     VAR_BIN_OP_MINUS_uxn_device_h_l82_c46_18e2_right := to_unsigned(2, 8);
     VAR_BIN_OP_MINUS_uxn_device_h_l67_c20_ade5_right := to_unsigned(2, 2);
     VAR_BIN_OP_MINUS_uxn_device_h_l83_c55_e549_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l90_c41_65de_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l69_c6_336f_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l71_c10_f7bb_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l91_c25_5cb1_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l88_c36_b523_right := to_unsigned(0, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l90_c7_ee46_right := to_unsigned(7, 3);
     VAR_BIN_OP_PLUS_uxn_device_h_l90_c51_8a1e_right := to_unsigned(1, 1);
     VAR_result_u8_value_uxn_device_h_l78_c3_0b05 := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l76_c2_a131_iftrue := VAR_result_u8_value_uxn_device_h_l78_c3_0b05;
     VAR_BIN_OP_EQ_uxn_device_h_l76_c6_de0f_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_c020_right := to_unsigned(0, 3);
     VAR_result_is_blit_done_MUX_uxn_device_h_l76_c2_a131_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l94_c6_c2cf_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l73_c13_59cc_iffalse := resize(to_unsigned(0, 1), 3);
     VAR_BIN_OP_PLUS_uxn_device_h_l82_c96_b468_right := to_unsigned(6, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l83_c7_833b_right := to_unsigned(0, 3);
     VAR_MUX_uxn_device_h_l88_c36_eb03_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l88_c36_eb03_iffalse := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l76_c2_a131_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l71_c10_f7bb_iftrue := resize(to_unsigned(7, 3), 8);
     VAR_BIN_OP_PLUS_uxn_device_h_l70_c21_1201_left := to_unsigned(64, 8);
     VAR_MUX_uxn_device_h_l73_c13_59cc_iftrue := to_unsigned(7, 3);

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
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l70_c12_e67f_ref_toks_0 := blending;
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l89_c21_2756_ref_toks_0 := blending;
     REG_VAR_blending := blending;
     VAR_CONST_SR_1_uxn_device_h_l82_c139_03aa_x := c;
     VAR_c_MUX_uxn_device_h_l76_c2_a131_iftrue := c;
     VAR_ch_MUX_uxn_device_h_l76_c2_a131_iftrue := ch;
     VAR_color8_uxn_device_h_l63_c2_cce9 := resize(VAR_color, 8);
     VAR_MUX_uxn_device_h_l71_c10_f7bb_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l83_c49_2e92_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l73_c13_59cc_cond := VAR_fy;
     VAR_MUX_uxn_device_h_l90_c35_e79e_cond := VAR_fy;
     VAR_opaque_MUX_uxn_device_h_l69_c2_a805_iffalse := opaque;
     VAR_BIN_OP_EQ_uxn_device_h_l69_c6_336f_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l67_c20_ade5_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_device_h_l80_c21_88e6_right := VAR_phase;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l95_c3_e131_elem_val := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_device_h_l80_c21_88e6_left := VAR_ram_addr;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l95_c3_e131_ref_toks_0 := sprite_rows;
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c34_8431_ref_toks_0 := sprite_rows;
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c84_6531_ref_toks_0 := sprite_rows;
     VAR_sprite_rows_MUX_uxn_device_h_l94_c2_8a34_iffalse := sprite_rows;
     VAR_x_MUX_uxn_device_h_l69_c2_a805_iffalse := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l72_c7_9b86_left := VAR_x1;
     VAR_BIN_OP_PLUS_uxn_device_h_l83_c35_4b52_left := VAR_x1;
     VAR_xmod_MUX_uxn_device_h_l69_c2_a805_iffalse := xmod;
     VAR_y_MUX_uxn_device_h_l69_c2_a805_iffalse := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l73_c7_3a27_left := VAR_y1;
     VAR_BIN_OP_PLUS_uxn_device_h_l70_c21_1201_right := VAR_color8_uxn_device_h_l63_c2_cce9;
     VAR_BIN_OP_PLUS_uxn_device_h_l89_c30_bbd7_left := VAR_color8_uxn_device_h_l63_c2_cce9;
     REG_VAR_color8 := VAR_color8_uxn_device_h_l63_c2_cce9;
     -- uint8_2_0[uxn_device_h_l66_c20_822a] LATENCY=0
     VAR_uint8_2_0_uxn_device_h_l66_c20_822a_return_output := uint8_2_0(
     VAR_phase);

     -- BIN_OP_MINUS[uxn_device_h_l67_c20_ade5] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l67_c20_ade5_left <= VAR_BIN_OP_MINUS_uxn_device_h_l67_c20_ade5_left;
     BIN_OP_MINUS_uxn_device_h_l67_c20_ade5_right <= VAR_BIN_OP_MINUS_uxn_device_h_l67_c20_ade5_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l67_c20_ade5_return_output := BIN_OP_MINUS_uxn_device_h_l67_c20_ade5_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l80_c21_88e6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l80_c21_88e6_left <= VAR_BIN_OP_PLUS_uxn_device_h_l80_c21_88e6_left;
     BIN_OP_PLUS_uxn_device_h_l80_c21_88e6_right <= VAR_BIN_OP_PLUS_uxn_device_h_l80_c21_88e6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l80_c21_88e6_return_output := BIN_OP_PLUS_uxn_device_h_l80_c21_88e6_return_output;

     -- uint8_7_4[uxn_device_h_l64_c20_a3c7] LATENCY=0
     VAR_uint8_7_4_uxn_device_h_l64_c20_a3c7_return_output := uint8_7_4(
     VAR_phase);

     -- MUX[uxn_device_h_l71_c10_f7bb] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l71_c10_f7bb_cond <= VAR_MUX_uxn_device_h_l71_c10_f7bb_cond;
     MUX_uxn_device_h_l71_c10_f7bb_iftrue <= VAR_MUX_uxn_device_h_l71_c10_f7bb_iftrue;
     MUX_uxn_device_h_l71_c10_f7bb_iffalse <= VAR_MUX_uxn_device_h_l71_c10_f7bb_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l71_c10_f7bb_return_output := MUX_uxn_device_h_l71_c10_f7bb_return_output;

     -- uint8_7_3[uxn_device_h_l65_c20_c3cc] LATENCY=0
     VAR_uint8_7_3_uxn_device_h_l65_c20_c3cc_return_output := uint8_7_3(
     VAR_phase);

     -- BIN_OP_EQ[uxn_device_h_l69_c6_336f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l69_c6_336f_left <= VAR_BIN_OP_EQ_uxn_device_h_l69_c6_336f_left;
     BIN_OP_EQ_uxn_device_h_l69_c6_336f_right <= VAR_BIN_OP_EQ_uxn_device_h_l69_c6_336f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l69_c6_336f_return_output := BIN_OP_EQ_uxn_device_h_l69_c6_336f_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l70_c21_1201] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l70_c21_1201_left <= VAR_BIN_OP_PLUS_uxn_device_h_l70_c21_1201_left;
     BIN_OP_PLUS_uxn_device_h_l70_c21_1201_right <= VAR_BIN_OP_PLUS_uxn_device_h_l70_c21_1201_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l70_c21_1201_return_output := BIN_OP_PLUS_uxn_device_h_l70_c21_1201_return_output;

     -- MUX[uxn_device_h_l73_c13_59cc] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l73_c13_59cc_cond <= VAR_MUX_uxn_device_h_l73_c13_59cc_cond;
     MUX_uxn_device_h_l73_c13_59cc_iftrue <= VAR_MUX_uxn_device_h_l73_c13_59cc_iftrue;
     MUX_uxn_device_h_l73_c13_59cc_iffalse <= VAR_MUX_uxn_device_h_l73_c13_59cc_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l73_c13_59cc_return_output := MUX_uxn_device_h_l73_c13_59cc_return_output;

     -- CONST_SR_1[uxn_device_h_l82_c139_03aa] LATENCY=0
     -- Inputs
     CONST_SR_1_uxn_device_h_l82_c139_03aa_x <= VAR_CONST_SR_1_uxn_device_h_l82_c139_03aa_x;
     -- Outputs
     VAR_CONST_SR_1_uxn_device_h_l82_c139_03aa_return_output := CONST_SR_1_uxn_device_h_l82_c139_03aa_return_output;

     -- Submodule level 1
     VAR_opaque_MUX_uxn_device_h_l69_c2_a805_cond := VAR_BIN_OP_EQ_uxn_device_h_l69_c6_336f_return_output;
     VAR_x_MUX_uxn_device_h_l69_c2_a805_cond := VAR_BIN_OP_EQ_uxn_device_h_l69_c6_336f_return_output;
     VAR_xmod_MUX_uxn_device_h_l69_c2_a805_cond := VAR_BIN_OP_EQ_uxn_device_h_l69_c6_336f_return_output;
     VAR_y_MUX_uxn_device_h_l69_c2_a805_cond := VAR_BIN_OP_EQ_uxn_device_h_l69_c6_336f_return_output;
     VAR_phase_minus_two_uxn_device_h_l67_c2_eff9 := VAR_BIN_OP_MINUS_uxn_device_h_l67_c20_ade5_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l70_c12_e67f_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l70_c21_1201_return_output, 7);
     VAR_result_u16_addr_uxn_device_h_l80_c3_fc83 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l80_c21_88e6_return_output, 16);
     VAR_MUX_uxn_device_h_l82_c7_ef55_iffalse := VAR_CONST_SR_1_uxn_device_h_l82_c139_03aa_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l72_c7_9b86_right := VAR_MUX_uxn_device_h_l71_c10_f7bb_return_output;
     VAR_xmod_MUX_uxn_device_h_l69_c2_a805_iftrue := VAR_MUX_uxn_device_h_l71_c10_f7bb_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l73_c7_3a27_right := VAR_MUX_uxn_device_h_l73_c13_59cc_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_c020_left := VAR_uint8_2_0_uxn_device_h_l66_c20_822a_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l83_c7_833b_left := VAR_uint8_2_0_uxn_device_h_l66_c20_822a_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l90_c7_ee46_left := VAR_uint8_2_0_uxn_device_h_l66_c20_822a_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l91_c25_5cb1_left := VAR_uint8_2_0_uxn_device_h_l66_c20_822a_return_output;
     REG_VAR_phase2_downto_0 := VAR_uint8_2_0_uxn_device_h_l66_c20_822a_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l91_c53_989d_left := VAR_uint8_7_3_uxn_device_h_l65_c20_c3cc_return_output;
     REG_VAR_phase7_downto_3 := VAR_uint8_7_3_uxn_device_h_l65_c20_c3cc_return_output;
     VAR_phase7_downto_4_uxn_device_h_l64_c2_588a := resize(VAR_uint8_7_4_uxn_device_h_l64_c20_a3c7_return_output, 5);
     VAR_BIN_OP_EQ_uxn_device_h_l76_c6_de0f_left := VAR_phase7_downto_4_uxn_device_h_l64_c2_588a;
     REG_VAR_phase7_downto_4 := VAR_phase7_downto_4_uxn_device_h_l64_c2_588a;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l95_c3_e131_var_dim_0 := resize(VAR_phase_minus_two_uxn_device_h_l67_c2_eff9, 4);
     REG_VAR_phase_minus_two := VAR_phase_minus_two_uxn_device_h_l67_c2_eff9;
     VAR_result_u16_addr_MUX_uxn_device_h_l76_c2_a131_iftrue := VAR_result_u16_addr_uxn_device_h_l80_c3_fc83;
     -- VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60[uxn_device_h_l95_c3_e131] LATENCY=0
     -- Inputs
     VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l95_c3_e131_elem_val <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l95_c3_e131_elem_val;
     VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l95_c3_e131_ref_toks_0 <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l95_c3_e131_ref_toks_0;
     VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l95_c3_e131_var_dim_0 <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l95_c3_e131_var_dim_0;
     -- Outputs
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l95_c3_e131_return_output := VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l95_c3_e131_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l72_c7_9b86] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l72_c7_9b86_left <= VAR_BIN_OP_PLUS_uxn_device_h_l72_c7_9b86_left;
     BIN_OP_PLUS_uxn_device_h_l72_c7_9b86_right <= VAR_BIN_OP_PLUS_uxn_device_h_l72_c7_9b86_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l72_c7_9b86_return_output := BIN_OP_PLUS_uxn_device_h_l72_c7_9b86_return_output;

     -- BIN_OP_EQ[uxn_device_h_l91_c53_989d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l91_c53_989d_left <= VAR_BIN_OP_EQ_uxn_device_h_l91_c53_989d_left;
     BIN_OP_EQ_uxn_device_h_l91_c53_989d_right <= VAR_BIN_OP_EQ_uxn_device_h_l91_c53_989d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l91_c53_989d_return_output := BIN_OP_EQ_uxn_device_h_l91_c53_989d_return_output;

     -- BIN_OP_EQ[uxn_device_h_l76_c6_de0f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l76_c6_de0f_left <= VAR_BIN_OP_EQ_uxn_device_h_l76_c6_de0f_left;
     BIN_OP_EQ_uxn_device_h_l76_c6_de0f_right <= VAR_BIN_OP_EQ_uxn_device_h_l76_c6_de0f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l76_c6_de0f_return_output := BIN_OP_EQ_uxn_device_h_l76_c6_de0f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l83_c7_833b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l83_c7_833b_left <= VAR_BIN_OP_EQ_uxn_device_h_l83_c7_833b_left;
     BIN_OP_EQ_uxn_device_h_l83_c7_833b_right <= VAR_BIN_OP_EQ_uxn_device_h_l83_c7_833b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l83_c7_833b_return_output := BIN_OP_EQ_uxn_device_h_l83_c7_833b_return_output;

     -- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d[uxn_device_h_l70_c12_e67f] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l70_c12_e67f_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l70_c12_e67f_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l70_c12_e67f_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l70_c12_e67f_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l70_c12_e67f_return_output := VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l70_c12_e67f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l90_c7_ee46] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l90_c7_ee46_left <= VAR_BIN_OP_EQ_uxn_device_h_l90_c7_ee46_left;
     BIN_OP_EQ_uxn_device_h_l90_c7_ee46_right <= VAR_BIN_OP_EQ_uxn_device_h_l90_c7_ee46_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l90_c7_ee46_return_output := BIN_OP_EQ_uxn_device_h_l90_c7_ee46_return_output;

     -- BIN_OP_EQ[uxn_device_h_l91_c25_5cb1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l91_c25_5cb1_left <= VAR_BIN_OP_EQ_uxn_device_h_l91_c25_5cb1_left;
     BIN_OP_EQ_uxn_device_h_l91_c25_5cb1_right <= VAR_BIN_OP_EQ_uxn_device_h_l91_c25_5cb1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l91_c25_5cb1_return_output := BIN_OP_EQ_uxn_device_h_l91_c25_5cb1_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l73_c7_3a27] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l73_c7_3a27_left <= VAR_BIN_OP_PLUS_uxn_device_h_l73_c7_3a27_left;
     BIN_OP_PLUS_uxn_device_h_l73_c7_3a27_right <= VAR_BIN_OP_PLUS_uxn_device_h_l73_c7_3a27_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l73_c7_3a27_return_output := BIN_OP_PLUS_uxn_device_h_l73_c7_3a27_return_output;

     -- xmod_MUX[uxn_device_h_l69_c2_a805] LATENCY=0
     -- Inputs
     xmod_MUX_uxn_device_h_l69_c2_a805_cond <= VAR_xmod_MUX_uxn_device_h_l69_c2_a805_cond;
     xmod_MUX_uxn_device_h_l69_c2_a805_iftrue <= VAR_xmod_MUX_uxn_device_h_l69_c2_a805_iftrue;
     xmod_MUX_uxn_device_h_l69_c2_a805_iffalse <= VAR_xmod_MUX_uxn_device_h_l69_c2_a805_iffalse;
     -- Outputs
     VAR_xmod_MUX_uxn_device_h_l69_c2_a805_return_output := xmod_MUX_uxn_device_h_l69_c2_a805_return_output;

     -- uint8_7_4[uxn_device_h_l94_c6_478e] LATENCY=0
     VAR_uint8_7_4_uxn_device_h_l94_c6_478e_return_output := uint8_7_4(
     VAR_phase_minus_two_uxn_device_h_l67_c2_eff9);

     -- CAST_TO_uint8_t_uint5_t_uxn_device_h_l82_DUPLICATE_1ec2 LATENCY=0
     VAR_CAST_TO_uint8_t_uint5_t_uxn_device_h_l82_DUPLICATE_1ec2_return_output := CAST_TO_uint8_t_uint5_t(
     VAR_uint8_7_3_uxn_device_h_l65_c20_c3cc_return_output);

     -- BIN_OP_EQ[uxn_device_h_l82_c7_c020] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l82_c7_c020_left <= VAR_BIN_OP_EQ_uxn_device_h_l82_c7_c020_left;
     BIN_OP_EQ_uxn_device_h_l82_c7_c020_right <= VAR_BIN_OP_EQ_uxn_device_h_l82_c7_c020_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_c020_return_output := BIN_OP_EQ_uxn_device_h_l82_c7_c020_return_output;

     -- Submodule level 2
     VAR_c_MUX_uxn_device_h_l76_c2_a131_cond := VAR_BIN_OP_EQ_uxn_device_h_l76_c6_de0f_return_output;
     VAR_ch_MUX_uxn_device_h_l76_c2_a131_cond := VAR_BIN_OP_EQ_uxn_device_h_l76_c6_de0f_return_output;
     VAR_result_is_blit_done_MUX_uxn_device_h_l76_c2_a131_cond := VAR_BIN_OP_EQ_uxn_device_h_l76_c6_de0f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l76_c2_a131_cond := VAR_BIN_OP_EQ_uxn_device_h_l76_c6_de0f_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l76_c2_a131_cond := VAR_BIN_OP_EQ_uxn_device_h_l76_c6_de0f_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l76_c2_a131_cond := VAR_BIN_OP_EQ_uxn_device_h_l76_c6_de0f_return_output;
     VAR_x_MUX_uxn_device_h_l76_c2_a131_cond := VAR_BIN_OP_EQ_uxn_device_h_l76_c6_de0f_return_output;
     VAR_y_MUX_uxn_device_h_l76_c2_a131_cond := VAR_BIN_OP_EQ_uxn_device_h_l76_c6_de0f_return_output;
     VAR_MUX_uxn_device_h_l82_c7_ef55_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_c020_return_output;
     VAR_MUX_uxn_device_h_l83_c7_c2e2_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c7_833b_return_output;
     VAR_MUX_uxn_device_h_l90_c7_9609_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c7_ee46_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l91_c25_de0e_left := VAR_BIN_OP_EQ_uxn_device_h_l91_c25_5cb1_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l91_c25_de0e_right := VAR_BIN_OP_EQ_uxn_device_h_l91_c53_989d_return_output;
     VAR_x_uxn_device_h_l72_c3_1f53 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l72_c7_9b86_return_output, 16);
     VAR_y_uxn_device_h_l73_c3_6154 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l73_c7_3a27_return_output, 16);
     VAR_BIN_OP_MINUS_uxn_device_h_l82_c46_18e2_left := VAR_CAST_TO_uint8_t_uint5_t_uxn_device_h_l82_DUPLICATE_1ec2_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l82_c96_b468_left := VAR_CAST_TO_uint8_t_uint5_t_uxn_device_h_l82_DUPLICATE_1ec2_return_output;
     VAR_opaque_uxn_device_h_l70_c3_bad6 := resize(VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l70_c12_e67f_return_output, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l94_c6_c2cf_left := VAR_uint8_7_4_uxn_device_h_l94_c6_478e_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l83_c35_4b52_right := VAR_xmod_MUX_uxn_device_h_l69_c2_a805_return_output;
     REG_VAR_xmod := VAR_xmod_MUX_uxn_device_h_l69_c2_a805_return_output;
     VAR_opaque_MUX_uxn_device_h_l69_c2_a805_iftrue := VAR_opaque_uxn_device_h_l70_c3_bad6;
     VAR_x_MUX_uxn_device_h_l69_c2_a805_iftrue := VAR_x_uxn_device_h_l72_c3_1f53;
     VAR_y_MUX_uxn_device_h_l69_c2_a805_iftrue := VAR_y_uxn_device_h_l73_c3_6154;
     -- BIN_OP_PLUS[uxn_device_h_l83_c35_4b52] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l83_c35_4b52_left <= VAR_BIN_OP_PLUS_uxn_device_h_l83_c35_4b52_left;
     BIN_OP_PLUS_uxn_device_h_l83_c35_4b52_right <= VAR_BIN_OP_PLUS_uxn_device_h_l83_c35_4b52_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l83_c35_4b52_return_output := BIN_OP_PLUS_uxn_device_h_l83_c35_4b52_return_output;

     -- BIN_OP_EQ[uxn_device_h_l94_c6_c2cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l94_c6_c2cf_left <= VAR_BIN_OP_EQ_uxn_device_h_l94_c6_c2cf_left;
     BIN_OP_EQ_uxn_device_h_l94_c6_c2cf_right <= VAR_BIN_OP_EQ_uxn_device_h_l94_c6_c2cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l94_c6_c2cf_return_output := BIN_OP_EQ_uxn_device_h_l94_c6_c2cf_return_output;

     -- opaque_MUX[uxn_device_h_l69_c2_a805] LATENCY=0
     -- Inputs
     opaque_MUX_uxn_device_h_l69_c2_a805_cond <= VAR_opaque_MUX_uxn_device_h_l69_c2_a805_cond;
     opaque_MUX_uxn_device_h_l69_c2_a805_iftrue <= VAR_opaque_MUX_uxn_device_h_l69_c2_a805_iftrue;
     opaque_MUX_uxn_device_h_l69_c2_a805_iffalse <= VAR_opaque_MUX_uxn_device_h_l69_c2_a805_iffalse;
     -- Outputs
     VAR_opaque_MUX_uxn_device_h_l69_c2_a805_return_output := opaque_MUX_uxn_device_h_l69_c2_a805_return_output;

     -- x_MUX[uxn_device_h_l69_c2_a805] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l69_c2_a805_cond <= VAR_x_MUX_uxn_device_h_l69_c2_a805_cond;
     x_MUX_uxn_device_h_l69_c2_a805_iftrue <= VAR_x_MUX_uxn_device_h_l69_c2_a805_iftrue;
     x_MUX_uxn_device_h_l69_c2_a805_iffalse <= VAR_x_MUX_uxn_device_h_l69_c2_a805_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l69_c2_a805_return_output := x_MUX_uxn_device_h_l69_c2_a805_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l82_c96_b468] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l82_c96_b468_left <= VAR_BIN_OP_PLUS_uxn_device_h_l82_c96_b468_left;
     BIN_OP_PLUS_uxn_device_h_l82_c96_b468_right <= VAR_BIN_OP_PLUS_uxn_device_h_l82_c96_b468_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l82_c96_b468_return_output := BIN_OP_PLUS_uxn_device_h_l82_c96_b468_return_output;

     -- BIN_OP_AND[uxn_device_h_l91_c25_de0e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l91_c25_de0e_left <= VAR_BIN_OP_AND_uxn_device_h_l91_c25_de0e_left;
     BIN_OP_AND_uxn_device_h_l91_c25_de0e_right <= VAR_BIN_OP_AND_uxn_device_h_l91_c25_de0e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l91_c25_de0e_return_output := BIN_OP_AND_uxn_device_h_l91_c25_de0e_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l82_c46_18e2] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l82_c46_18e2_left <= VAR_BIN_OP_MINUS_uxn_device_h_l82_c46_18e2_left;
     BIN_OP_MINUS_uxn_device_h_l82_c46_18e2_right <= VAR_BIN_OP_MINUS_uxn_device_h_l82_c46_18e2_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l82_c46_18e2_return_output := BIN_OP_MINUS_uxn_device_h_l82_c46_18e2_return_output;

     -- sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5[uxn_device_h_l94_c2_8a34] LATENCY=0
     VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5_uxn_device_h_l94_c2_8a34_return_output := CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5(
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l95_c3_e131_return_output);

     -- y_MUX[uxn_device_h_l69_c2_a805] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l69_c2_a805_cond <= VAR_y_MUX_uxn_device_h_l69_c2_a805_cond;
     y_MUX_uxn_device_h_l69_c2_a805_iftrue <= VAR_y_MUX_uxn_device_h_l69_c2_a805_iftrue;
     y_MUX_uxn_device_h_l69_c2_a805_iffalse <= VAR_y_MUX_uxn_device_h_l69_c2_a805_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l69_c2_a805_return_output := y_MUX_uxn_device_h_l69_c2_a805_return_output;

     -- Submodule level 3
     VAR_result_is_blit_done_MUX_uxn_device_h_l76_c2_a131_iffalse := VAR_BIN_OP_AND_uxn_device_h_l91_c25_de0e_return_output;
     VAR_sprite_rows_MUX_uxn_device_h_l94_c2_8a34_cond := VAR_BIN_OP_EQ_uxn_device_h_l94_c6_c2cf_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c34_8431_var_dim_0 := resize(VAR_BIN_OP_MINUS_uxn_device_h_l82_c46_18e2_return_output, 4);
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c84_6531_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l82_c96_b468_return_output, 4);
     VAR_MUX_uxn_device_h_l83_c7_c2e2_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l83_c35_4b52_return_output, 16);
     VAR_BIN_OP_OR_uxn_device_h_l88_c26_51f0_left := VAR_opaque_MUX_uxn_device_h_l69_c2_a805_return_output;
     REG_VAR_opaque := VAR_opaque_MUX_uxn_device_h_l69_c2_a805_return_output;
     VAR_sprite_rows_MUX_uxn_device_h_l94_c2_8a34_iftrue := VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5_uxn_device_h_l94_c2_8a34_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l83_c55_e549_left := VAR_x_MUX_uxn_device_h_l69_c2_a805_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l83_c65_cc82_left := VAR_x_MUX_uxn_device_h_l69_c2_a805_return_output;
     VAR_x_MUX_uxn_device_h_l76_c2_a131_iftrue := VAR_x_MUX_uxn_device_h_l69_c2_a805_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l90_c41_65de_left := VAR_y_MUX_uxn_device_h_l69_c2_a805_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l90_c51_8a1e_left := VAR_y_MUX_uxn_device_h_l69_c2_a805_return_output;
     VAR_CONST_SL_8_uxn_device_h_l87_c22_f93b_x := VAR_y_MUX_uxn_device_h_l69_c2_a805_return_output;
     VAR_MUX_uxn_device_h_l90_c7_9609_iffalse := VAR_y_MUX_uxn_device_h_l69_c2_a805_return_output;
     VAR_y_MUX_uxn_device_h_l76_c2_a131_iftrue := VAR_y_MUX_uxn_device_h_l69_c2_a805_return_output;
     -- sprite_rows_MUX[uxn_device_h_l94_c2_8a34] LATENCY=0
     -- Inputs
     sprite_rows_MUX_uxn_device_h_l94_c2_8a34_cond <= VAR_sprite_rows_MUX_uxn_device_h_l94_c2_8a34_cond;
     sprite_rows_MUX_uxn_device_h_l94_c2_8a34_iftrue <= VAR_sprite_rows_MUX_uxn_device_h_l94_c2_8a34_iftrue;
     sprite_rows_MUX_uxn_device_h_l94_c2_8a34_iffalse <= VAR_sprite_rows_MUX_uxn_device_h_l94_c2_8a34_iffalse;
     -- Outputs
     VAR_sprite_rows_MUX_uxn_device_h_l94_c2_8a34_return_output := sprite_rows_MUX_uxn_device_h_l94_c2_8a34_return_output;

     -- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d[uxn_device_h_l82_c84_6531] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c84_6531_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c84_6531_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c84_6531_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c84_6531_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c84_6531_return_output := VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c84_6531_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l90_c41_65de] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l90_c41_65de_left <= VAR_BIN_OP_MINUS_uxn_device_h_l90_c41_65de_left;
     BIN_OP_MINUS_uxn_device_h_l90_c41_65de_right <= VAR_BIN_OP_MINUS_uxn_device_h_l90_c41_65de_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l90_c41_65de_return_output := BIN_OP_MINUS_uxn_device_h_l90_c41_65de_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l83_c65_cc82] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l83_c65_cc82_left <= VAR_BIN_OP_PLUS_uxn_device_h_l83_c65_cc82_left;
     BIN_OP_PLUS_uxn_device_h_l83_c65_cc82_right <= VAR_BIN_OP_PLUS_uxn_device_h_l83_c65_cc82_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l83_c65_cc82_return_output := BIN_OP_PLUS_uxn_device_h_l83_c65_cc82_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l83_c55_e549] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l83_c55_e549_left <= VAR_BIN_OP_MINUS_uxn_device_h_l83_c55_e549_left;
     BIN_OP_MINUS_uxn_device_h_l83_c55_e549_right <= VAR_BIN_OP_MINUS_uxn_device_h_l83_c55_e549_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l83_c55_e549_return_output := BIN_OP_MINUS_uxn_device_h_l83_c55_e549_return_output;

     -- result_is_blit_done_MUX[uxn_device_h_l76_c2_a131] LATENCY=0
     -- Inputs
     result_is_blit_done_MUX_uxn_device_h_l76_c2_a131_cond <= VAR_result_is_blit_done_MUX_uxn_device_h_l76_c2_a131_cond;
     result_is_blit_done_MUX_uxn_device_h_l76_c2_a131_iftrue <= VAR_result_is_blit_done_MUX_uxn_device_h_l76_c2_a131_iftrue;
     result_is_blit_done_MUX_uxn_device_h_l76_c2_a131_iffalse <= VAR_result_is_blit_done_MUX_uxn_device_h_l76_c2_a131_iffalse;
     -- Outputs
     VAR_result_is_blit_done_MUX_uxn_device_h_l76_c2_a131_return_output := result_is_blit_done_MUX_uxn_device_h_l76_c2_a131_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l90_c51_8a1e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l90_c51_8a1e_left <= VAR_BIN_OP_PLUS_uxn_device_h_l90_c51_8a1e_left;
     BIN_OP_PLUS_uxn_device_h_l90_c51_8a1e_right <= VAR_BIN_OP_PLUS_uxn_device_h_l90_c51_8a1e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l90_c51_8a1e_return_output := BIN_OP_PLUS_uxn_device_h_l90_c51_8a1e_return_output;

     -- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d[uxn_device_h_l82_c34_8431] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c34_8431_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c34_8431_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c34_8431_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c34_8431_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c34_8431_return_output := VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c34_8431_return_output;

     -- CONST_SL_8[uxn_device_h_l87_c22_f93b] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_device_h_l87_c22_f93b_x <= VAR_CONST_SL_8_uxn_device_h_l87_c22_f93b_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_device_h_l87_c22_f93b_return_output := CONST_SL_8_uxn_device_h_l87_c22_f93b_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l83_c49_2e92_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l83_c55_e549_return_output;
     VAR_MUX_uxn_device_h_l90_c35_e79e_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l90_c41_65de_return_output;
     VAR_MUX_uxn_device_h_l83_c49_2e92_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l83_c65_cc82_return_output, 16);
     VAR_MUX_uxn_device_h_l90_c35_e79e_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l90_c51_8a1e_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_device_h_l87_c22_462e_left := VAR_CONST_SL_8_uxn_device_h_l87_c22_f93b_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l82_c34_fe73_left := VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c34_8431_return_output;
     VAR_CONST_SL_8_uxn_device_h_l82_c84_5b14_x := VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l82_c84_6531_return_output;
     REG_VAR_sprite_rows := VAR_sprite_rows_MUX_uxn_device_h_l94_c2_8a34_return_output;
     -- CONST_SL_8[uxn_device_h_l82_c84_5b14] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_device_h_l82_c84_5b14_x <= VAR_CONST_SL_8_uxn_device_h_l82_c84_5b14_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_device_h_l82_c84_5b14_return_output := CONST_SL_8_uxn_device_h_l82_c84_5b14_return_output;

     -- MUX[uxn_device_h_l90_c35_e79e] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l90_c35_e79e_cond <= VAR_MUX_uxn_device_h_l90_c35_e79e_cond;
     MUX_uxn_device_h_l90_c35_e79e_iftrue <= VAR_MUX_uxn_device_h_l90_c35_e79e_iftrue;
     MUX_uxn_device_h_l90_c35_e79e_iffalse <= VAR_MUX_uxn_device_h_l90_c35_e79e_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l90_c35_e79e_return_output := MUX_uxn_device_h_l90_c35_e79e_return_output;

     -- MUX[uxn_device_h_l83_c49_2e92] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l83_c49_2e92_cond <= VAR_MUX_uxn_device_h_l83_c49_2e92_cond;
     MUX_uxn_device_h_l83_c49_2e92_iftrue <= VAR_MUX_uxn_device_h_l83_c49_2e92_iftrue;
     MUX_uxn_device_h_l83_c49_2e92_iffalse <= VAR_MUX_uxn_device_h_l83_c49_2e92_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l83_c49_2e92_return_output := MUX_uxn_device_h_l83_c49_2e92_return_output;

     -- Submodule level 5
     VAR_BIN_OP_OR_uxn_device_h_l82_c34_fe73_right := VAR_CONST_SL_8_uxn_device_h_l82_c84_5b14_return_output;
     VAR_MUX_uxn_device_h_l83_c7_c2e2_iffalse := VAR_MUX_uxn_device_h_l83_c49_2e92_return_output;
     VAR_MUX_uxn_device_h_l90_c7_9609_iftrue := VAR_MUX_uxn_device_h_l90_c35_e79e_return_output;
     -- BIN_OP_OR[uxn_device_h_l82_c34_fe73] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l82_c34_fe73_left <= VAR_BIN_OP_OR_uxn_device_h_l82_c34_fe73_left;
     BIN_OP_OR_uxn_device_h_l82_c34_fe73_right <= VAR_BIN_OP_OR_uxn_device_h_l82_c34_fe73_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l82_c34_fe73_return_output := BIN_OP_OR_uxn_device_h_l82_c34_fe73_return_output;

     -- MUX[uxn_device_h_l90_c7_9609] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l90_c7_9609_cond <= VAR_MUX_uxn_device_h_l90_c7_9609_cond;
     MUX_uxn_device_h_l90_c7_9609_iftrue <= VAR_MUX_uxn_device_h_l90_c7_9609_iftrue;
     MUX_uxn_device_h_l90_c7_9609_iffalse <= VAR_MUX_uxn_device_h_l90_c7_9609_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l90_c7_9609_return_output := MUX_uxn_device_h_l90_c7_9609_return_output;

     -- MUX[uxn_device_h_l83_c7_c2e2] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l83_c7_c2e2_cond <= VAR_MUX_uxn_device_h_l83_c7_c2e2_cond;
     MUX_uxn_device_h_l83_c7_c2e2_iftrue <= VAR_MUX_uxn_device_h_l83_c7_c2e2_iftrue;
     MUX_uxn_device_h_l83_c7_c2e2_iffalse <= VAR_MUX_uxn_device_h_l83_c7_c2e2_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l83_c7_c2e2_return_output := MUX_uxn_device_h_l83_c7_c2e2_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_device_h_l82_c7_ef55_iftrue := resize(VAR_BIN_OP_OR_uxn_device_h_l82_c34_fe73_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_device_h_l87_c22_462e_right := VAR_MUX_uxn_device_h_l83_c7_c2e2_return_output;
     VAR_x_MUX_uxn_device_h_l76_c2_a131_iffalse := VAR_MUX_uxn_device_h_l83_c7_c2e2_return_output;
     VAR_y_MUX_uxn_device_h_l76_c2_a131_iffalse := VAR_MUX_uxn_device_h_l90_c7_9609_return_output;
     -- x_MUX[uxn_device_h_l76_c2_a131] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l76_c2_a131_cond <= VAR_x_MUX_uxn_device_h_l76_c2_a131_cond;
     x_MUX_uxn_device_h_l76_c2_a131_iftrue <= VAR_x_MUX_uxn_device_h_l76_c2_a131_iftrue;
     x_MUX_uxn_device_h_l76_c2_a131_iffalse <= VAR_x_MUX_uxn_device_h_l76_c2_a131_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l76_c2_a131_return_output := x_MUX_uxn_device_h_l76_c2_a131_return_output;

     -- y_MUX[uxn_device_h_l76_c2_a131] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l76_c2_a131_cond <= VAR_y_MUX_uxn_device_h_l76_c2_a131_cond;
     y_MUX_uxn_device_h_l76_c2_a131_iftrue <= VAR_y_MUX_uxn_device_h_l76_c2_a131_iftrue;
     y_MUX_uxn_device_h_l76_c2_a131_iffalse <= VAR_y_MUX_uxn_device_h_l76_c2_a131_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l76_c2_a131_return_output := y_MUX_uxn_device_h_l76_c2_a131_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l87_c22_462e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l87_c22_462e_left <= VAR_BIN_OP_PLUS_uxn_device_h_l87_c22_462e_left;
     BIN_OP_PLUS_uxn_device_h_l87_c22_462e_right <= VAR_BIN_OP_PLUS_uxn_device_h_l87_c22_462e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l87_c22_462e_return_output := BIN_OP_PLUS_uxn_device_h_l87_c22_462e_return_output;

     -- MUX[uxn_device_h_l82_c7_ef55] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l82_c7_ef55_cond <= VAR_MUX_uxn_device_h_l82_c7_ef55_cond;
     MUX_uxn_device_h_l82_c7_ef55_iftrue <= VAR_MUX_uxn_device_h_l82_c7_ef55_iftrue;
     MUX_uxn_device_h_l82_c7_ef55_iffalse <= VAR_MUX_uxn_device_h_l82_c7_ef55_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l82_c7_ef55_return_output := MUX_uxn_device_h_l82_c7_ef55_return_output;

     -- Submodule level 7
     VAR_result_u16_addr_uxn_device_h_l87_c3_23af := resize(VAR_BIN_OP_PLUS_uxn_device_h_l87_c22_462e_return_output, 16);
     VAR_c_MUX_uxn_device_h_l76_c2_a131_iffalse := VAR_MUX_uxn_device_h_l82_c7_ef55_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l76_c2_a131_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l76_c2_a131_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l76_c2_a131_iffalse := VAR_result_u16_addr_uxn_device_h_l87_c3_23af;
     -- result_u16_addr_MUX[uxn_device_h_l76_c2_a131] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l76_c2_a131_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l76_c2_a131_cond;
     result_u16_addr_MUX_uxn_device_h_l76_c2_a131_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l76_c2_a131_iftrue;
     result_u16_addr_MUX_uxn_device_h_l76_c2_a131_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l76_c2_a131_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l76_c2_a131_return_output := result_u16_addr_MUX_uxn_device_h_l76_c2_a131_return_output;

     -- c_MUX[uxn_device_h_l76_c2_a131] LATENCY=0
     -- Inputs
     c_MUX_uxn_device_h_l76_c2_a131_cond <= VAR_c_MUX_uxn_device_h_l76_c2_a131_cond;
     c_MUX_uxn_device_h_l76_c2_a131_iftrue <= VAR_c_MUX_uxn_device_h_l76_c2_a131_iftrue;
     c_MUX_uxn_device_h_l76_c2_a131_iffalse <= VAR_c_MUX_uxn_device_h_l76_c2_a131_iffalse;
     -- Outputs
     VAR_c_MUX_uxn_device_h_l76_c2_a131_return_output := c_MUX_uxn_device_h_l76_c2_a131_return_output;

     -- uint16_0_0[uxn_device_h_l86_c9_35b0] LATENCY=0
     VAR_uint16_0_0_uxn_device_h_l86_c9_35b0_return_output := uint16_0_0(
     VAR_MUX_uxn_device_h_l82_c7_ef55_return_output);

     -- uint16_7_7[uxn_device_h_l84_c8_4b21] LATENCY=0
     VAR_uint16_7_7_uxn_device_h_l84_c8_4b21_return_output := uint16_7_7(
     VAR_MUX_uxn_device_h_l82_c7_ef55_return_output);

     -- Submodule level 8
     REG_VAR_c := VAR_c_MUX_uxn_device_h_l76_c2_a131_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l86_c3_3edb_right := VAR_uint16_0_0_uxn_device_h_l86_c9_35b0_return_output;
     VAR_ch_uxn_device_h_l84_c3_76da := resize(VAR_uint16_7_7_uxn_device_h_l84_c8_4b21_return_output, 2);
     VAR_CONST_SL_1_uxn_device_h_l85_c3_c1b1_x := VAR_ch_uxn_device_h_l84_c3_76da;
     -- CONST_SL_1[uxn_device_h_l85_c3_c1b1] LATENCY=0
     -- Inputs
     CONST_SL_1_uxn_device_h_l85_c3_c1b1_x <= VAR_CONST_SL_1_uxn_device_h_l85_c3_c1b1_x;
     -- Outputs
     VAR_CONST_SL_1_uxn_device_h_l85_c3_c1b1_return_output := CONST_SL_1_uxn_device_h_l85_c3_c1b1_return_output;

     -- Submodule level 9
     VAR_BIN_OP_OR_uxn_device_h_l86_c3_3edb_left := VAR_CONST_SL_1_uxn_device_h_l85_c3_c1b1_return_output;
     -- BIN_OP_OR[uxn_device_h_l86_c3_3edb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l86_c3_3edb_left <= VAR_BIN_OP_OR_uxn_device_h_l86_c3_3edb_left;
     BIN_OP_OR_uxn_device_h_l86_c3_3edb_right <= VAR_BIN_OP_OR_uxn_device_h_l86_c3_3edb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l86_c3_3edb_return_output := BIN_OP_OR_uxn_device_h_l86_c3_3edb_return_output;

     -- Submodule level 10
     VAR_BIN_OP_EQ_uxn_device_h_l88_c36_b523_left := VAR_BIN_OP_OR_uxn_device_h_l86_c3_3edb_return_output;
     VAR_ch_MUX_uxn_device_h_l76_c2_a131_iffalse := VAR_BIN_OP_OR_uxn_device_h_l86_c3_3edb_return_output;
     -- ch_MUX[uxn_device_h_l76_c2_a131] LATENCY=0
     -- Inputs
     ch_MUX_uxn_device_h_l76_c2_a131_cond <= VAR_ch_MUX_uxn_device_h_l76_c2_a131_cond;
     ch_MUX_uxn_device_h_l76_c2_a131_iftrue <= VAR_ch_MUX_uxn_device_h_l76_c2_a131_iftrue;
     ch_MUX_uxn_device_h_l76_c2_a131_iffalse <= VAR_ch_MUX_uxn_device_h_l76_c2_a131_iffalse;
     -- Outputs
     VAR_ch_MUX_uxn_device_h_l76_c2_a131_return_output := ch_MUX_uxn_device_h_l76_c2_a131_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l89_c41_76f6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l89_c41_76f6_return_output := CAST_TO_uint8_t_uint2_t(
     VAR_BIN_OP_OR_uxn_device_h_l86_c3_3edb_return_output);

     -- BIN_OP_EQ[uxn_device_h_l88_c36_b523] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l88_c36_b523_left <= VAR_BIN_OP_EQ_uxn_device_h_l88_c36_b523_left;
     BIN_OP_EQ_uxn_device_h_l88_c36_b523_right <= VAR_BIN_OP_EQ_uxn_device_h_l88_c36_b523_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l88_c36_b523_return_output := BIN_OP_EQ_uxn_device_h_l88_c36_b523_return_output;

     -- Submodule level 11
     VAR_MUX_uxn_device_h_l88_c36_eb03_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c36_b523_return_output;
     VAR_CONST_SL_4_uxn_device_h_l89_c41_8700_x := VAR_CAST_TO_uint8_t_uxn_device_h_l89_c41_76f6_return_output;
     REG_VAR_ch := VAR_ch_MUX_uxn_device_h_l76_c2_a131_return_output;
     -- CONST_SL_4[uxn_device_h_l89_c41_8700] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_device_h_l89_c41_8700_x <= VAR_CONST_SL_4_uxn_device_h_l89_c41_8700_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_device_h_l89_c41_8700_return_output := CONST_SL_4_uxn_device_h_l89_c41_8700_return_output;

     -- MUX[uxn_device_h_l88_c36_eb03] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l88_c36_eb03_cond <= VAR_MUX_uxn_device_h_l88_c36_eb03_cond;
     MUX_uxn_device_h_l88_c36_eb03_iftrue <= VAR_MUX_uxn_device_h_l88_c36_eb03_iftrue;
     MUX_uxn_device_h_l88_c36_eb03_iffalse <= VAR_MUX_uxn_device_h_l88_c36_eb03_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l88_c36_eb03_return_output := MUX_uxn_device_h_l88_c36_eb03_return_output;

     -- Submodule level 12
     VAR_BIN_OP_PLUS_uxn_device_h_l89_c30_bbd7_right := VAR_CONST_SL_4_uxn_device_h_l89_c41_8700_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l88_c26_51f0_right := VAR_MUX_uxn_device_h_l88_c36_eb03_return_output;
     -- BIN_OP_PLUS[uxn_device_h_l89_c30_bbd7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l89_c30_bbd7_left <= VAR_BIN_OP_PLUS_uxn_device_h_l89_c30_bbd7_left;
     BIN_OP_PLUS_uxn_device_h_l89_c30_bbd7_right <= VAR_BIN_OP_PLUS_uxn_device_h_l89_c30_bbd7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l89_c30_bbd7_return_output := BIN_OP_PLUS_uxn_device_h_l89_c30_bbd7_return_output;

     -- BIN_OP_OR[uxn_device_h_l88_c26_51f0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l88_c26_51f0_left <= VAR_BIN_OP_OR_uxn_device_h_l88_c26_51f0_left;
     BIN_OP_OR_uxn_device_h_l88_c26_51f0_right <= VAR_BIN_OP_OR_uxn_device_h_l88_c26_51f0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l88_c26_51f0_return_output := BIN_OP_OR_uxn_device_h_l88_c26_51f0_return_output;

     -- Submodule level 13
     VAR_result_is_vram_write_MUX_uxn_device_h_l76_c2_a131_iffalse := VAR_BIN_OP_OR_uxn_device_h_l88_c26_51f0_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l89_c21_2756_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l89_c30_bbd7_return_output, 7);
     -- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d[uxn_device_h_l89_c21_2756] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l89_c21_2756_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l89_c21_2756_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l89_c21_2756_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l89_c21_2756_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l89_c21_2756_return_output := VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l89_c21_2756_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l76_c2_a131] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l76_c2_a131_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l76_c2_a131_cond;
     result_is_vram_write_MUX_uxn_device_h_l76_c2_a131_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l76_c2_a131_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l76_c2_a131_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l76_c2_a131_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l76_c2_a131_return_output := result_is_vram_write_MUX_uxn_device_h_l76_c2_a131_return_output;

     -- Submodule level 14
     VAR_result_u8_value_MUX_uxn_device_h_l76_c2_a131_iffalse := VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l89_c21_2756_return_output;
     -- result_u8_value_MUX[uxn_device_h_l76_c2_a131] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l76_c2_a131_cond <= VAR_result_u8_value_MUX_uxn_device_h_l76_c2_a131_cond;
     result_u8_value_MUX_uxn_device_h_l76_c2_a131_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l76_c2_a131_iftrue;
     result_u8_value_MUX_uxn_device_h_l76_c2_a131_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l76_c2_a131_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l76_c2_a131_return_output := result_u8_value_MUX_uxn_device_h_l76_c2_a131_return_output;

     -- Submodule level 15
     -- CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_cd45_uxn_device_h_l98_l42_DUPLICATE_c52a LATENCY=0
     VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_cd45_uxn_device_h_l98_l42_DUPLICATE_c52a_return_output := CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_cd45(
     result,
     VAR_result_u16_addr_MUX_uxn_device_h_l76_c2_a131_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l76_c2_a131_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l76_c2_a131_return_output,
     VAR_result_is_blit_done_MUX_uxn_device_h_l76_c2_a131_return_output);

     -- Submodule level 16
     REG_VAR_result := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_cd45_uxn_device_h_l98_l42_DUPLICATE_c52a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_cd45_uxn_device_h_l98_l42_DUPLICATE_c52a_return_output;
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
