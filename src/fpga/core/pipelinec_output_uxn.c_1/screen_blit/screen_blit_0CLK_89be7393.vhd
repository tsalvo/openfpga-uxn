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
-- Submodules: 49
entity screen_blit_0CLK_89be7393 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ctrl : in unsigned(7 downto 0);
 auto_advance : in unsigned(7 downto 0);
 x : in unsigned(15 downto 0);
 y : in unsigned(15 downto 0);
 ram_addr : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out screen_blit_result_t);
end screen_blit_0CLK_89be7393;
architecture arch of screen_blit_0CLK_89be7393 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal blending : uint2_t_64 := (
0 => to_unsigned(0, 2),
1 => to_unsigned(0, 2),
2 => to_unsigned(0, 2),
3 => to_unsigned(0, 2),
4 => to_unsigned(1, 2),
5 => to_unsigned(0, 2),
6 => to_unsigned(1, 2),
7 => to_unsigned(1, 2),
8 => to_unsigned(2, 2),
9 => to_unsigned(2, 2),
10 => to_unsigned(0, 2),
11 => to_unsigned(2, 2),
12 => to_unsigned(3, 2),
13 => to_unsigned(3, 2),
14 => to_unsigned(3, 2),
15 => to_unsigned(0, 2),
16 => to_unsigned(0, 2),
17 => to_unsigned(1, 2),
18 => to_unsigned(2, 2),
19 => to_unsigned(3, 2),
20 => to_unsigned(0, 2),
21 => to_unsigned(1, 2),
22 => to_unsigned(2, 2),
23 => to_unsigned(3, 2),
24 => to_unsigned(0, 2),
25 => to_unsigned(1, 2),
26 => to_unsigned(2, 2),
27 => to_unsigned(3, 2),
28 => to_unsigned(0, 2),
29 => to_unsigned(1, 2),
30 => to_unsigned(2, 2),
31 => to_unsigned(3, 2),
32 => to_unsigned(1, 2),
33 => to_unsigned(2, 2),
34 => to_unsigned(3, 2),
35 => to_unsigned(1, 2),
36 => to_unsigned(1, 2),
37 => to_unsigned(2, 2),
38 => to_unsigned(3, 2),
39 => to_unsigned(1, 2),
40 => to_unsigned(1, 2),
41 => to_unsigned(2, 2),
42 => to_unsigned(3, 2),
43 => to_unsigned(1, 2),
44 => to_unsigned(1, 2),
45 => to_unsigned(2, 2),
46 => to_unsigned(3, 2),
47 => to_unsigned(1, 2),
48 => to_unsigned(2, 2),
49 => to_unsigned(3, 2),
50 => to_unsigned(1, 2),
51 => to_unsigned(2, 2),
52 => to_unsigned(2, 2),
53 => to_unsigned(3, 2),
54 => to_unsigned(1, 2),
55 => to_unsigned(2, 2),
56 => to_unsigned(2, 2),
57 => to_unsigned(3, 2),
58 => to_unsigned(1, 2),
59 => to_unsigned(2, 2),
60 => to_unsigned(2, 2),
61 => to_unsigned(3, 2),
62 => to_unsigned(1, 2),
63 => to_unsigned(2, 2),
others => to_unsigned(0, 2))
;
signal ctrl_mode : unsigned(0 downto 0) := to_unsigned(0, 1);
signal layer : unsigned(0 downto 0) := to_unsigned(0, 1);
signal flip_x : unsigned(0 downto 0) := to_unsigned(0, 1);
signal flip_y : unsigned(0 downto 0) := to_unsigned(0, 1);
signal dx : unsigned(15 downto 0) := to_unsigned(0, 16);
signal dy : unsigned(15 downto 0) := to_unsigned(0, 16);
signal dxy : unsigned(15 downto 0) := to_unsigned(0, 16);
signal dyx : unsigned(15 downto 0) := to_unsigned(0, 16);
signal dyy : unsigned(15 downto 0) := to_unsigned(0, 16);
signal dxx : unsigned(15 downto 0) := to_unsigned(0, 16);
signal ram_addr_incr : unsigned(15 downto 0) := to_unsigned(0, 16);
signal i_phase : unsigned(11 downto 0) := to_unsigned(0, 12);
signal length : unsigned(3 downto 0) := to_unsigned(0, 4);
signal i_length : unsigned(3 downto 0) := to_unsigned(0, 4);
signal result : screen_blit_result_t := screen_blit_result_t_NULL;
signal REG_COMB_blending : uint2_t_64;
signal REG_COMB_ctrl_mode : unsigned(0 downto 0);
signal REG_COMB_layer : unsigned(0 downto 0);
signal REG_COMB_flip_x : unsigned(0 downto 0);
signal REG_COMB_flip_y : unsigned(0 downto 0);
signal REG_COMB_dx : unsigned(15 downto 0);
signal REG_COMB_dy : unsigned(15 downto 0);
signal REG_COMB_dxy : unsigned(15 downto 0);
signal REG_COMB_dyx : unsigned(15 downto 0);
signal REG_COMB_dyy : unsigned(15 downto 0);
signal REG_COMB_dxx : unsigned(15 downto 0);
signal REG_COMB_ram_addr_incr : unsigned(15 downto 0);
signal REG_COMB_i_phase : unsigned(11 downto 0);
signal REG_COMB_length : unsigned(3 downto 0);
signal REG_COMB_i_length : unsigned(3 downto 0);
signal REG_COMB_result : screen_blit_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l55_c6_51d8]
signal BIN_OP_EQ_uxn_device_h_l55_c6_51d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l55_c6_51d8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l55_c6_51d8_return_output : unsigned(0 downto 0);

-- dy_MUX[uxn_device_h_l55_c2_e9f0]
signal dy_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
signal dy_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(15 downto 0);
signal dy_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(15 downto 0);
signal dy_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(15 downto 0);

-- dxx_MUX[uxn_device_h_l55_c2_e9f0]
signal dxx_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
signal dxx_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(15 downto 0);
signal dxx_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(15 downto 0);
signal dxx_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(15 downto 0);

-- i_phase_MUX[uxn_device_h_l55_c2_e9f0]
signal i_phase_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
signal i_phase_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(11 downto 0);
signal i_phase_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(11 downto 0);
signal i_phase_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(11 downto 0);

-- result_is_blit_done_MUX[uxn_device_h_l55_c2_e9f0]
signal result_is_blit_done_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l55_c2_e9f0]
signal result_is_vram_write_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l55_c2_e9f0]
signal result_u16_addr_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l55_c2_e9f0]
signal ctrl_mode_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(0 downto 0);

-- dyy_MUX[uxn_device_h_l55_c2_e9f0]
signal dyy_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
signal dyy_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(15 downto 0);
signal dyy_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(15 downto 0);
signal dyy_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(15 downto 0);

-- length_MUX[uxn_device_h_l55_c2_e9f0]
signal length_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
signal length_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(3 downto 0);
signal length_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(3 downto 0);
signal length_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(3 downto 0);

-- dyx_MUX[uxn_device_h_l55_c2_e9f0]
signal dyx_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
signal dyx_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(15 downto 0);
signal dyx_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(15 downto 0);
signal dyx_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(15 downto 0);

-- i_length_MUX[uxn_device_h_l55_c2_e9f0]
signal i_length_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
signal i_length_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(3 downto 0);
signal i_length_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(3 downto 0);
signal i_length_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(3 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l55_c2_e9f0]
signal ram_addr_incr_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(15 downto 0);

-- dx_MUX[uxn_device_h_l55_c2_e9f0]
signal dx_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
signal dx_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(15 downto 0);
signal dx_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(15 downto 0);
signal dx_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(15 downto 0);

-- dxy_MUX[uxn_device_h_l55_c2_e9f0]
signal dxy_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
signal dxy_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(15 downto 0);
signal dxy_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(15 downto 0);
signal dxy_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l55_c2_e9f0]
signal flip_x_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l55_c2_e9f0]
signal flip_y_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l55_c2_e9f0]
signal layer_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(0 downto 0);

-- CONST_SR_7[uxn_device_h_l56_c25_40f9]
signal CONST_SR_7_uxn_device_h_l56_c25_40f9_x : unsigned(7 downto 0);
signal CONST_SR_7_uxn_device_h_l56_c25_40f9_return_output : unsigned(7 downto 0);

-- CONST_SR_6[uxn_device_h_l57_c21_c0b9]
signal CONST_SR_6_uxn_device_h_l57_c21_c0b9_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_device_h_l57_c21_c0b9_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_device_h_l58_c22_5c25]
signal CONST_SR_5_uxn_device_h_l58_c22_5c25_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_device_h_l58_c22_5c25_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_device_h_l59_c22_4ff7]
signal CONST_SR_4_uxn_device_h_l59_c22_4ff7_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l59_c22_4ff7_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l60_c20_4829]
signal BIN_OP_AND_uxn_device_h_l60_c20_4829_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l60_c20_4829_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l60_c20_4829_return_output : unsigned(7 downto 0);

-- CONST_SL_3[uxn_device_h_l60_c9_5e63]
signal CONST_SL_3_uxn_device_h_l60_c9_5e63_x : unsigned(15 downto 0);
signal CONST_SL_3_uxn_device_h_l60_c9_5e63_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_device_h_l61_c20_a0ef]
signal BIN_OP_AND_uxn_device_h_l61_c20_a0ef_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l61_c20_a0ef_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l61_c20_a0ef_return_output : unsigned(7 downto 0);

-- CONST_SL_2[uxn_device_h_l61_c9_0ee1]
signal CONST_SL_2_uxn_device_h_l61_c9_0ee1_x : unsigned(15 downto 0);
signal CONST_SL_2_uxn_device_h_l61_c9_0ee1_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l62_c19_810c]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l62_c19_810c_left : signed(16 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l62_c19_810c_right : signed(1 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l62_c19_810c_return_output : signed(18 downto 0);

-- MUX[uxn_device_h_l62_c9_ae04]
signal MUX_uxn_device_h_l62_c9_ae04_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l62_c9_ae04_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l62_c9_ae04_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l62_c9_ae04_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l63_c19_fcc5]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l63_c19_fcc5_left : signed(16 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l63_c19_fcc5_right : signed(1 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l63_c19_fcc5_return_output : signed(18 downto 0);

-- MUX[uxn_device_h_l63_c9_ed06]
signal MUX_uxn_device_h_l63_c9_ed06_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l63_c9_ed06_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l63_c9_ed06_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l63_c9_ed06_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l64_c19_e1b0]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l64_c19_e1b0_left : signed(16 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l64_c19_e1b0_right : signed(1 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l64_c19_e1b0_return_output : signed(18 downto 0);

-- MUX[uxn_device_h_l64_c9_9276]
signal MUX_uxn_device_h_l64_c9_9276_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l64_c9_9276_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l64_c9_9276_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l64_c9_9276_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l65_c19_e3f4]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l65_c19_e3f4_left : signed(16 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l65_c19_e3f4_right : signed(1 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l65_c19_e3f4_return_output : signed(18 downto 0);

-- MUX[uxn_device_h_l65_c9_6762]
signal MUX_uxn_device_h_l65_c9_6762_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l65_c9_6762_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l65_c9_6762_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l65_c9_6762_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_device_h_l66_c20_8843]
signal BIN_OP_AND_uxn_device_h_l66_c20_8843_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l66_c20_8843_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l66_c20_8843_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l66_c51_52db]
signal BIN_OP_AND_uxn_device_h_l66_c51_52db_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l66_c51_52db_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l66_c51_52db_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_device_h_l66_c51_f387]
signal BIN_OP_GT_uxn_device_h_l66_c51_f387_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_device_h_l66_c51_f387_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_device_h_l66_c51_f387_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l66_c51_3a9b]
signal MUX_uxn_device_h_l66_c51_3a9b_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l66_c51_3a9b_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l66_c51_3a9b_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l66_c51_3a9b_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l66_c45_7e00]
signal BIN_OP_PLUS_uxn_device_h_l66_c45_7e00_left : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l66_c45_7e00_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l66_c45_7e00_return_output : unsigned(1 downto 0);

-- BIN_OP_SL[uxn_device_h_l66_c20_ecd1]
signal BIN_OP_SL_uxn_device_h_l66_c20_ecd1_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_device_h_l66_c20_ecd1_right : unsigned(1 downto 0);
signal BIN_OP_SL_uxn_device_h_l66_c20_ecd1_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_device_h_l67_c22_5dbf]
signal CONST_SR_4_uxn_device_h_l67_c22_5dbf_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l67_c22_5dbf_return_output : unsigned(7 downto 0);

function CAST_TO_uint1_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,1)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint4_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
    return return_output;
end function;

function CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_b1c0( ref_toks_0 : screen_blit_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned) return screen_blit_result_t is
 
  variable base : screen_blit_result_t; 
  variable return_output : screen_blit_result_t;
begin
      base := ref_toks_0;
      base.is_blit_done := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u16_addr := ref_toks_3;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_device_h_l55_c6_51d8
BIN_OP_EQ_uxn_device_h_l55_c6_51d8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l55_c6_51d8_left,
BIN_OP_EQ_uxn_device_h_l55_c6_51d8_right,
BIN_OP_EQ_uxn_device_h_l55_c6_51d8_return_output);

-- dy_MUX_uxn_device_h_l55_c2_e9f0
dy_MUX_uxn_device_h_l55_c2_e9f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
dy_MUX_uxn_device_h_l55_c2_e9f0_cond,
dy_MUX_uxn_device_h_l55_c2_e9f0_iftrue,
dy_MUX_uxn_device_h_l55_c2_e9f0_iffalse,
dy_MUX_uxn_device_h_l55_c2_e9f0_return_output);

-- dxx_MUX_uxn_device_h_l55_c2_e9f0
dxx_MUX_uxn_device_h_l55_c2_e9f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
dxx_MUX_uxn_device_h_l55_c2_e9f0_cond,
dxx_MUX_uxn_device_h_l55_c2_e9f0_iftrue,
dxx_MUX_uxn_device_h_l55_c2_e9f0_iffalse,
dxx_MUX_uxn_device_h_l55_c2_e9f0_return_output);

-- i_phase_MUX_uxn_device_h_l55_c2_e9f0
i_phase_MUX_uxn_device_h_l55_c2_e9f0 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
i_phase_MUX_uxn_device_h_l55_c2_e9f0_cond,
i_phase_MUX_uxn_device_h_l55_c2_e9f0_iftrue,
i_phase_MUX_uxn_device_h_l55_c2_e9f0_iffalse,
i_phase_MUX_uxn_device_h_l55_c2_e9f0_return_output);

-- result_is_blit_done_MUX_uxn_device_h_l55_c2_e9f0
result_is_blit_done_MUX_uxn_device_h_l55_c2_e9f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_blit_done_MUX_uxn_device_h_l55_c2_e9f0_cond,
result_is_blit_done_MUX_uxn_device_h_l55_c2_e9f0_iftrue,
result_is_blit_done_MUX_uxn_device_h_l55_c2_e9f0_iffalse,
result_is_blit_done_MUX_uxn_device_h_l55_c2_e9f0_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l55_c2_e9f0
result_is_vram_write_MUX_uxn_device_h_l55_c2_e9f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l55_c2_e9f0_cond,
result_is_vram_write_MUX_uxn_device_h_l55_c2_e9f0_iftrue,
result_is_vram_write_MUX_uxn_device_h_l55_c2_e9f0_iffalse,
result_is_vram_write_MUX_uxn_device_h_l55_c2_e9f0_return_output);

-- result_u16_addr_MUX_uxn_device_h_l55_c2_e9f0
result_u16_addr_MUX_uxn_device_h_l55_c2_e9f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l55_c2_e9f0_cond,
result_u16_addr_MUX_uxn_device_h_l55_c2_e9f0_iftrue,
result_u16_addr_MUX_uxn_device_h_l55_c2_e9f0_iffalse,
result_u16_addr_MUX_uxn_device_h_l55_c2_e9f0_return_output);

-- ctrl_mode_MUX_uxn_device_h_l55_c2_e9f0
ctrl_mode_MUX_uxn_device_h_l55_c2_e9f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l55_c2_e9f0_cond,
ctrl_mode_MUX_uxn_device_h_l55_c2_e9f0_iftrue,
ctrl_mode_MUX_uxn_device_h_l55_c2_e9f0_iffalse,
ctrl_mode_MUX_uxn_device_h_l55_c2_e9f0_return_output);

-- dyy_MUX_uxn_device_h_l55_c2_e9f0
dyy_MUX_uxn_device_h_l55_c2_e9f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
dyy_MUX_uxn_device_h_l55_c2_e9f0_cond,
dyy_MUX_uxn_device_h_l55_c2_e9f0_iftrue,
dyy_MUX_uxn_device_h_l55_c2_e9f0_iffalse,
dyy_MUX_uxn_device_h_l55_c2_e9f0_return_output);

-- length_MUX_uxn_device_h_l55_c2_e9f0
length_MUX_uxn_device_h_l55_c2_e9f0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
length_MUX_uxn_device_h_l55_c2_e9f0_cond,
length_MUX_uxn_device_h_l55_c2_e9f0_iftrue,
length_MUX_uxn_device_h_l55_c2_e9f0_iffalse,
length_MUX_uxn_device_h_l55_c2_e9f0_return_output);

-- dyx_MUX_uxn_device_h_l55_c2_e9f0
dyx_MUX_uxn_device_h_l55_c2_e9f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
dyx_MUX_uxn_device_h_l55_c2_e9f0_cond,
dyx_MUX_uxn_device_h_l55_c2_e9f0_iftrue,
dyx_MUX_uxn_device_h_l55_c2_e9f0_iffalse,
dyx_MUX_uxn_device_h_l55_c2_e9f0_return_output);

-- i_length_MUX_uxn_device_h_l55_c2_e9f0
i_length_MUX_uxn_device_h_l55_c2_e9f0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
i_length_MUX_uxn_device_h_l55_c2_e9f0_cond,
i_length_MUX_uxn_device_h_l55_c2_e9f0_iftrue,
i_length_MUX_uxn_device_h_l55_c2_e9f0_iffalse,
i_length_MUX_uxn_device_h_l55_c2_e9f0_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l55_c2_e9f0
ram_addr_incr_MUX_uxn_device_h_l55_c2_e9f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l55_c2_e9f0_cond,
ram_addr_incr_MUX_uxn_device_h_l55_c2_e9f0_iftrue,
ram_addr_incr_MUX_uxn_device_h_l55_c2_e9f0_iffalse,
ram_addr_incr_MUX_uxn_device_h_l55_c2_e9f0_return_output);

-- dx_MUX_uxn_device_h_l55_c2_e9f0
dx_MUX_uxn_device_h_l55_c2_e9f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
dx_MUX_uxn_device_h_l55_c2_e9f0_cond,
dx_MUX_uxn_device_h_l55_c2_e9f0_iftrue,
dx_MUX_uxn_device_h_l55_c2_e9f0_iffalse,
dx_MUX_uxn_device_h_l55_c2_e9f0_return_output);

-- dxy_MUX_uxn_device_h_l55_c2_e9f0
dxy_MUX_uxn_device_h_l55_c2_e9f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
dxy_MUX_uxn_device_h_l55_c2_e9f0_cond,
dxy_MUX_uxn_device_h_l55_c2_e9f0_iftrue,
dxy_MUX_uxn_device_h_l55_c2_e9f0_iffalse,
dxy_MUX_uxn_device_h_l55_c2_e9f0_return_output);

-- flip_x_MUX_uxn_device_h_l55_c2_e9f0
flip_x_MUX_uxn_device_h_l55_c2_e9f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l55_c2_e9f0_cond,
flip_x_MUX_uxn_device_h_l55_c2_e9f0_iftrue,
flip_x_MUX_uxn_device_h_l55_c2_e9f0_iffalse,
flip_x_MUX_uxn_device_h_l55_c2_e9f0_return_output);

-- flip_y_MUX_uxn_device_h_l55_c2_e9f0
flip_y_MUX_uxn_device_h_l55_c2_e9f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l55_c2_e9f0_cond,
flip_y_MUX_uxn_device_h_l55_c2_e9f0_iftrue,
flip_y_MUX_uxn_device_h_l55_c2_e9f0_iffalse,
flip_y_MUX_uxn_device_h_l55_c2_e9f0_return_output);

-- layer_MUX_uxn_device_h_l55_c2_e9f0
layer_MUX_uxn_device_h_l55_c2_e9f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l55_c2_e9f0_cond,
layer_MUX_uxn_device_h_l55_c2_e9f0_iftrue,
layer_MUX_uxn_device_h_l55_c2_e9f0_iffalse,
layer_MUX_uxn_device_h_l55_c2_e9f0_return_output);

-- CONST_SR_7_uxn_device_h_l56_c25_40f9
CONST_SR_7_uxn_device_h_l56_c25_40f9 : entity work.CONST_SR_7_uint8_t_0CLK_de264c78 port map (
CONST_SR_7_uxn_device_h_l56_c25_40f9_x,
CONST_SR_7_uxn_device_h_l56_c25_40f9_return_output);

-- CONST_SR_6_uxn_device_h_l57_c21_c0b9
CONST_SR_6_uxn_device_h_l57_c21_c0b9 : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_device_h_l57_c21_c0b9_x,
CONST_SR_6_uxn_device_h_l57_c21_c0b9_return_output);

-- CONST_SR_5_uxn_device_h_l58_c22_5c25
CONST_SR_5_uxn_device_h_l58_c22_5c25 : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_device_h_l58_c22_5c25_x,
CONST_SR_5_uxn_device_h_l58_c22_5c25_return_output);

-- CONST_SR_4_uxn_device_h_l59_c22_4ff7
CONST_SR_4_uxn_device_h_l59_c22_4ff7 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l59_c22_4ff7_x,
CONST_SR_4_uxn_device_h_l59_c22_4ff7_return_output);

-- BIN_OP_AND_uxn_device_h_l60_c20_4829
BIN_OP_AND_uxn_device_h_l60_c20_4829 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l60_c20_4829_left,
BIN_OP_AND_uxn_device_h_l60_c20_4829_right,
BIN_OP_AND_uxn_device_h_l60_c20_4829_return_output);

-- CONST_SL_3_uxn_device_h_l60_c9_5e63
CONST_SL_3_uxn_device_h_l60_c9_5e63 : entity work.CONST_SL_3_uint16_t_0CLK_de264c78 port map (
CONST_SL_3_uxn_device_h_l60_c9_5e63_x,
CONST_SL_3_uxn_device_h_l60_c9_5e63_return_output);

-- BIN_OP_AND_uxn_device_h_l61_c20_a0ef
BIN_OP_AND_uxn_device_h_l61_c20_a0ef : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l61_c20_a0ef_left,
BIN_OP_AND_uxn_device_h_l61_c20_a0ef_right,
BIN_OP_AND_uxn_device_h_l61_c20_a0ef_return_output);

-- CONST_SL_2_uxn_device_h_l61_c9_0ee1
CONST_SL_2_uxn_device_h_l61_c9_0ee1 : entity work.CONST_SL_2_uint16_t_0CLK_de264c78 port map (
CONST_SL_2_uxn_device_h_l61_c9_0ee1_x,
CONST_SL_2_uxn_device_h_l61_c9_0ee1_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l62_c19_810c
BIN_OP_INFERRED_MULT_uxn_device_h_l62_c19_810c : entity work.BIN_OP_INFERRED_MULT_int17_t_int2_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l62_c19_810c_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l62_c19_810c_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l62_c19_810c_return_output);

-- MUX_uxn_device_h_l62_c9_ae04
MUX_uxn_device_h_l62_c9_ae04 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l62_c9_ae04_cond,
MUX_uxn_device_h_l62_c9_ae04_iftrue,
MUX_uxn_device_h_l62_c9_ae04_iffalse,
MUX_uxn_device_h_l62_c9_ae04_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l63_c19_fcc5
BIN_OP_INFERRED_MULT_uxn_device_h_l63_c19_fcc5 : entity work.BIN_OP_INFERRED_MULT_int17_t_int2_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l63_c19_fcc5_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l63_c19_fcc5_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l63_c19_fcc5_return_output);

-- MUX_uxn_device_h_l63_c9_ed06
MUX_uxn_device_h_l63_c9_ed06 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l63_c9_ed06_cond,
MUX_uxn_device_h_l63_c9_ed06_iftrue,
MUX_uxn_device_h_l63_c9_ed06_iffalse,
MUX_uxn_device_h_l63_c9_ed06_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l64_c19_e1b0
BIN_OP_INFERRED_MULT_uxn_device_h_l64_c19_e1b0 : entity work.BIN_OP_INFERRED_MULT_int17_t_int2_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l64_c19_e1b0_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l64_c19_e1b0_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l64_c19_e1b0_return_output);

-- MUX_uxn_device_h_l64_c9_9276
MUX_uxn_device_h_l64_c9_9276 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l64_c9_9276_cond,
MUX_uxn_device_h_l64_c9_9276_iftrue,
MUX_uxn_device_h_l64_c9_9276_iffalse,
MUX_uxn_device_h_l64_c9_9276_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l65_c19_e3f4
BIN_OP_INFERRED_MULT_uxn_device_h_l65_c19_e3f4 : entity work.BIN_OP_INFERRED_MULT_int17_t_int2_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l65_c19_e3f4_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l65_c19_e3f4_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l65_c19_e3f4_return_output);

-- MUX_uxn_device_h_l65_c9_6762
MUX_uxn_device_h_l65_c9_6762 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l65_c9_6762_cond,
MUX_uxn_device_h_l65_c9_6762_iftrue,
MUX_uxn_device_h_l65_c9_6762_iffalse,
MUX_uxn_device_h_l65_c9_6762_return_output);

-- BIN_OP_AND_uxn_device_h_l66_c20_8843
BIN_OP_AND_uxn_device_h_l66_c20_8843 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l66_c20_8843_left,
BIN_OP_AND_uxn_device_h_l66_c20_8843_right,
BIN_OP_AND_uxn_device_h_l66_c20_8843_return_output);

-- BIN_OP_AND_uxn_device_h_l66_c51_52db
BIN_OP_AND_uxn_device_h_l66_c51_52db : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l66_c51_52db_left,
BIN_OP_AND_uxn_device_h_l66_c51_52db_right,
BIN_OP_AND_uxn_device_h_l66_c51_52db_return_output);

-- BIN_OP_GT_uxn_device_h_l66_c51_f387
BIN_OP_GT_uxn_device_h_l66_c51_f387 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l66_c51_f387_left,
BIN_OP_GT_uxn_device_h_l66_c51_f387_right,
BIN_OP_GT_uxn_device_h_l66_c51_f387_return_output);

-- MUX_uxn_device_h_l66_c51_3a9b
MUX_uxn_device_h_l66_c51_3a9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l66_c51_3a9b_cond,
MUX_uxn_device_h_l66_c51_3a9b_iftrue,
MUX_uxn_device_h_l66_c51_3a9b_iffalse,
MUX_uxn_device_h_l66_c51_3a9b_return_output);

-- BIN_OP_PLUS_uxn_device_h_l66_c45_7e00
BIN_OP_PLUS_uxn_device_h_l66_c45_7e00 : entity work.BIN_OP_PLUS_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l66_c45_7e00_left,
BIN_OP_PLUS_uxn_device_h_l66_c45_7e00_right,
BIN_OP_PLUS_uxn_device_h_l66_c45_7e00_return_output);

-- BIN_OP_SL_uxn_device_h_l66_c20_ecd1
BIN_OP_SL_uxn_device_h_l66_c20_ecd1 : entity work.BIN_OP_SL_uint16_t_uint2_t_0CLK_5af1a430 port map (
BIN_OP_SL_uxn_device_h_l66_c20_ecd1_left,
BIN_OP_SL_uxn_device_h_l66_c20_ecd1_right,
BIN_OP_SL_uxn_device_h_l66_c20_ecd1_return_output);

-- CONST_SR_4_uxn_device_h_l67_c22_5dbf
CONST_SR_4_uxn_device_h_l67_c22_5dbf : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l67_c22_5dbf_x,
CONST_SR_4_uxn_device_h_l67_c22_5dbf_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ctrl,
 auto_advance,
 x,
 y,
 ram_addr,
 previous_ram_read,
 -- Registers
 blending,
 ctrl_mode,
 layer,
 flip_x,
 flip_y,
 dx,
 dy,
 dxy,
 dyx,
 dyy,
 dxx,
 ram_addr_incr,
 i_phase,
 length,
 i_length,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l55_c6_51d8_return_output,
 dy_MUX_uxn_device_h_l55_c2_e9f0_return_output,
 dxx_MUX_uxn_device_h_l55_c2_e9f0_return_output,
 i_phase_MUX_uxn_device_h_l55_c2_e9f0_return_output,
 result_is_blit_done_MUX_uxn_device_h_l55_c2_e9f0_return_output,
 result_is_vram_write_MUX_uxn_device_h_l55_c2_e9f0_return_output,
 result_u16_addr_MUX_uxn_device_h_l55_c2_e9f0_return_output,
 ctrl_mode_MUX_uxn_device_h_l55_c2_e9f0_return_output,
 dyy_MUX_uxn_device_h_l55_c2_e9f0_return_output,
 length_MUX_uxn_device_h_l55_c2_e9f0_return_output,
 dyx_MUX_uxn_device_h_l55_c2_e9f0_return_output,
 i_length_MUX_uxn_device_h_l55_c2_e9f0_return_output,
 ram_addr_incr_MUX_uxn_device_h_l55_c2_e9f0_return_output,
 dx_MUX_uxn_device_h_l55_c2_e9f0_return_output,
 dxy_MUX_uxn_device_h_l55_c2_e9f0_return_output,
 flip_x_MUX_uxn_device_h_l55_c2_e9f0_return_output,
 flip_y_MUX_uxn_device_h_l55_c2_e9f0_return_output,
 layer_MUX_uxn_device_h_l55_c2_e9f0_return_output,
 CONST_SR_7_uxn_device_h_l56_c25_40f9_return_output,
 CONST_SR_6_uxn_device_h_l57_c21_c0b9_return_output,
 CONST_SR_5_uxn_device_h_l58_c22_5c25_return_output,
 CONST_SR_4_uxn_device_h_l59_c22_4ff7_return_output,
 BIN_OP_AND_uxn_device_h_l60_c20_4829_return_output,
 CONST_SL_3_uxn_device_h_l60_c9_5e63_return_output,
 BIN_OP_AND_uxn_device_h_l61_c20_a0ef_return_output,
 CONST_SL_2_uxn_device_h_l61_c9_0ee1_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l62_c19_810c_return_output,
 MUX_uxn_device_h_l62_c9_ae04_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l63_c19_fcc5_return_output,
 MUX_uxn_device_h_l63_c9_ed06_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l64_c19_e1b0_return_output,
 MUX_uxn_device_h_l64_c9_9276_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l65_c19_e3f4_return_output,
 MUX_uxn_device_h_l65_c9_6762_return_output,
 BIN_OP_AND_uxn_device_h_l66_c20_8843_return_output,
 BIN_OP_AND_uxn_device_h_l66_c51_52db_return_output,
 BIN_OP_GT_uxn_device_h_l66_c51_f387_return_output,
 MUX_uxn_device_h_l66_c51_3a9b_return_output,
 BIN_OP_PLUS_uxn_device_h_l66_c45_7e00_return_output,
 BIN_OP_SL_uxn_device_h_l66_c20_ecd1_return_output,
 CONST_SR_4_uxn_device_h_l67_c22_5dbf_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : screen_blit_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ctrl : unsigned(7 downto 0);
 variable VAR_auto_advance : unsigned(7 downto 0);
 variable VAR_x : unsigned(15 downto 0);
 variable VAR_y : unsigned(15 downto 0);
 variable VAR_ram_addr : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l55_c6_51d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l55_c6_51d8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l55_c6_51d8_return_output : unsigned(0 downto 0);
 variable VAR_dy_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(15 downto 0);
 variable VAR_dy_uxn_device_h_l61_c3_9eeb : unsigned(15 downto 0);
 variable VAR_dy_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(15 downto 0);
 variable VAR_dy_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(15 downto 0);
 variable VAR_dy_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
 variable VAR_dxx_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(15 downto 0);
 variable VAR_dxx_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(15 downto 0);
 variable VAR_dxx_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(15 downto 0);
 variable VAR_dxx_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
 variable VAR_i_phase_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(11 downto 0);
 variable VAR_i_phase_uxn_device_h_l68_c3_f73a : unsigned(11 downto 0);
 variable VAR_i_phase_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(11 downto 0);
 variable VAR_i_phase_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(11 downto 0);
 variable VAR_i_phase_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l55_c2_e9f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l55_c2_e9f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l55_c2_e9f0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l74_c3_1ba1 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
 variable VAR_dyy_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(15 downto 0);
 variable VAR_dyy_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(15 downto 0);
 variable VAR_dyy_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(15 downto 0);
 variable VAR_dyy_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
 variable VAR_length_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(3 downto 0);
 variable VAR_length_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(3 downto 0);
 variable VAR_length_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(3 downto 0);
 variable VAR_length_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
 variable VAR_dyx_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(15 downto 0);
 variable VAR_dyx_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(15 downto 0);
 variable VAR_dyx_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(15 downto 0);
 variable VAR_dyx_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
 variable VAR_i_length_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(3 downto 0);
 variable VAR_i_length_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(3 downto 0);
 variable VAR_i_length_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(3 downto 0);
 variable VAR_i_length_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
 variable VAR_dx_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(15 downto 0);
 variable VAR_dx_uxn_device_h_l60_c3_9356 : unsigned(15 downto 0);
 variable VAR_dx_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(15 downto 0);
 variable VAR_dx_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(15 downto 0);
 variable VAR_dx_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
 variable VAR_dxy_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(15 downto 0);
 variable VAR_dxy_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(15 downto 0);
 variable VAR_dxy_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(15 downto 0);
 variable VAR_dxy_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l55_c2_e9f0_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l55_c2_e9f0_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l55_c2_e9f0_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l55_c2_e9f0_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l56_c25_40f9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l56_c25_40f9_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l56_c15_1013_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l57_c21_c0b9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l57_c21_c0b9_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l57_c11_d258_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l58_c22_5c25_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l58_c22_5c25_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l58_c12_8418_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l59_c22_4ff7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l59_c22_4ff7_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l59_c12_4b74_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l60_c20_4829_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l60_c20_4829_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l60_c20_4829_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_device_h_l60_c9_2621_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_3_uxn_device_h_l60_c9_5e63_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_3_uxn_device_h_l60_c9_5e63_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l61_c20_a0ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l61_c20_a0ef_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l61_c20_a0ef_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_device_h_l61_c9_3650_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_2_uxn_device_h_l61_c9_0ee1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_2_uxn_device_h_l61_c9_0ee1_x : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l62_c9_ae04_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l62_c9_ae04_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l62_c9_ae04_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l62_c19_810c_left : signed(16 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l62_c19_810c_right : signed(1 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l62_c19_810c_return_output : signed(18 downto 0);
 variable VAR_MUX_uxn_device_h_l62_c9_ae04_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l63_c9_ed06_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l63_c9_ed06_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l63_c9_ed06_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l63_c19_fcc5_left : signed(16 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l63_c19_fcc5_right : signed(1 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l63_c19_fcc5_return_output : signed(18 downto 0);
 variable VAR_MUX_uxn_device_h_l63_c9_ed06_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l64_c9_9276_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l64_c9_9276_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l64_c9_9276_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l64_c19_e1b0_left : signed(16 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l64_c19_e1b0_right : signed(1 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l64_c19_e1b0_return_output : signed(18 downto 0);
 variable VAR_MUX_uxn_device_h_l64_c9_9276_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l65_c9_6762_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l65_c9_6762_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l65_c9_6762_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l65_c19_e3f4_left : signed(16 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l65_c19_e3f4_right : signed(1 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l65_c19_e3f4_return_output : signed(18 downto 0);
 variable VAR_MUX_uxn_device_h_l65_c9_6762_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l66_c20_8843_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l66_c20_8843_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l66_c20_8843_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_device_h_l66_c20_ecd1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l66_c45_7e00_left : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l66_c51_3a9b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l66_c51_52db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l66_c51_52db_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l66_c51_52db_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l66_c51_f387_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l66_c51_f387_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l66_c51_f387_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l66_c51_3a9b_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l66_c51_3a9b_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l66_c51_3a9b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l66_c45_7e00_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l66_c45_7e00_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_SL_uxn_device_h_l66_c20_ecd1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_SL_uxn_device_h_l66_c20_ecd1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l67_c22_5dbf_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l67_c22_5dbf_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l67_c12_589c_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_b1c0_uxn_device_h_l42_l78_DUPLICATE_a5ad_return_output : screen_blit_result_t;
 -- State registers comb logic variables
variable REG_VAR_blending : uint2_t_64;
variable REG_VAR_ctrl_mode : unsigned(0 downto 0);
variable REG_VAR_layer : unsigned(0 downto 0);
variable REG_VAR_flip_x : unsigned(0 downto 0);
variable REG_VAR_flip_y : unsigned(0 downto 0);
variable REG_VAR_dx : unsigned(15 downto 0);
variable REG_VAR_dy : unsigned(15 downto 0);
variable REG_VAR_dxy : unsigned(15 downto 0);
variable REG_VAR_dyx : unsigned(15 downto 0);
variable REG_VAR_dyy : unsigned(15 downto 0);
variable REG_VAR_dxx : unsigned(15 downto 0);
variable REG_VAR_ram_addr_incr : unsigned(15 downto 0);
variable REG_VAR_i_phase : unsigned(11 downto 0);
variable REG_VAR_length : unsigned(3 downto 0);
variable REG_VAR_i_length : unsigned(3 downto 0);
variable REG_VAR_result : screen_blit_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_blending := blending;
  REG_VAR_ctrl_mode := ctrl_mode;
  REG_VAR_layer := layer;
  REG_VAR_flip_x := flip_x;
  REG_VAR_flip_y := flip_y;
  REG_VAR_dx := dx;
  REG_VAR_dy := dy;
  REG_VAR_dxy := dxy;
  REG_VAR_dyx := dyx;
  REG_VAR_dyy := dyy;
  REG_VAR_dxx := dxx;
  REG_VAR_ram_addr_incr := ram_addr_incr;
  REG_VAR_i_phase := i_phase;
  REG_VAR_length := length;
  REG_VAR_i_length := i_length;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l64_c19_e1b0_right := to_signed(-1, 2);
     VAR_MUX_uxn_device_h_l66_c51_3a9b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l66_c51_52db_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l55_c6_51d8_right := to_unsigned(0, 1);
     VAR_i_phase_uxn_device_h_l68_c3_f73a := resize(to_unsigned(0, 1), 12);
     VAR_i_phase_MUX_uxn_device_h_l55_c2_e9f0_iftrue := VAR_i_phase_uxn_device_h_l68_c3_f73a;
     VAR_BIN_OP_GT_uxn_device_h_l66_c51_f387_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l66_c20_8843_right := to_unsigned(4, 8);
     VAR_result_is_vram_write_MUX_uxn_device_h_l55_c2_e9f0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l61_c20_a0ef_right := to_unsigned(2, 8);
     VAR_BIN_OP_AND_uxn_device_h_l60_c20_4829_right := to_unsigned(1, 8);
     VAR_MUX_uxn_device_h_l66_c51_3a9b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l63_c19_fcc5_right := to_signed(-1, 2);
     VAR_result_u16_addr_uxn_device_h_l74_c3_1ba1 := resize(to_unsigned(0, 1), 16);
     VAR_result_u16_addr_MUX_uxn_device_h_l55_c2_e9f0_iffalse := VAR_result_u16_addr_uxn_device_h_l74_c3_1ba1;
     VAR_result_is_blit_done_MUX_uxn_device_h_l55_c2_e9f0_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l62_c19_810c_right := to_signed(-1, 2);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l65_c19_e3f4_right := to_signed(-1, 2);
     VAR_BIN_OP_PLUS_uxn_device_h_l66_c45_7e00_left := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ctrl := ctrl;
     VAR_auto_advance := auto_advance;
     VAR_x := x;
     VAR_y := y;
     VAR_ram_addr := ram_addr;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_device_h_l60_c20_4829_left := VAR_auto_advance;
     VAR_BIN_OP_AND_uxn_device_h_l61_c20_a0ef_left := VAR_auto_advance;
     VAR_BIN_OP_AND_uxn_device_h_l66_c20_8843_left := VAR_auto_advance;
     VAR_CONST_SR_4_uxn_device_h_l67_c22_5dbf_x := VAR_auto_advance;
     REG_VAR_blending := blending;
     VAR_BIN_OP_AND_uxn_device_h_l66_c51_52db_left := VAR_ctrl;
     VAR_CONST_SR_4_uxn_device_h_l59_c22_4ff7_x := VAR_ctrl;
     VAR_CONST_SR_5_uxn_device_h_l58_c22_5c25_x := VAR_ctrl;
     VAR_CONST_SR_6_uxn_device_h_l57_c21_c0b9_x := VAR_ctrl;
     VAR_CONST_SR_7_uxn_device_h_l56_c25_40f9_x := VAR_ctrl;
     VAR_ctrl_mode_MUX_uxn_device_h_l55_c2_e9f0_iffalse := ctrl_mode;
     VAR_dx_MUX_uxn_device_h_l55_c2_e9f0_iffalse := dx;
     VAR_dxx_MUX_uxn_device_h_l55_c2_e9f0_iffalse := dxx;
     VAR_dxy_MUX_uxn_device_h_l55_c2_e9f0_iffalse := dxy;
     VAR_dy_MUX_uxn_device_h_l55_c2_e9f0_iffalse := dy;
     VAR_dyx_MUX_uxn_device_h_l55_c2_e9f0_iffalse := dyx;
     VAR_dyy_MUX_uxn_device_h_l55_c2_e9f0_iffalse := dyy;
     VAR_flip_x_MUX_uxn_device_h_l55_c2_e9f0_iffalse := flip_x;
     VAR_flip_y_MUX_uxn_device_h_l55_c2_e9f0_iffalse := flip_y;
     VAR_i_length_MUX_uxn_device_h_l55_c2_e9f0_iffalse := i_length;
     VAR_i_phase_MUX_uxn_device_h_l55_c2_e9f0_iffalse := i_phase;
     VAR_layer_MUX_uxn_device_h_l55_c2_e9f0_iffalse := layer;
     VAR_length_MUX_uxn_device_h_l55_c2_e9f0_iffalse := length;
     VAR_BIN_OP_EQ_uxn_device_h_l55_c6_51d8_left := VAR_phase;
     VAR_ram_addr_incr_MUX_uxn_device_h_l55_c2_e9f0_iffalse := ram_addr_incr;
     -- BIN_OP_AND[uxn_device_h_l66_c51_52db] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l66_c51_52db_left <= VAR_BIN_OP_AND_uxn_device_h_l66_c51_52db_left;
     BIN_OP_AND_uxn_device_h_l66_c51_52db_right <= VAR_BIN_OP_AND_uxn_device_h_l66_c51_52db_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l66_c51_52db_return_output := BIN_OP_AND_uxn_device_h_l66_c51_52db_return_output;

     -- CONST_SR_4[uxn_device_h_l59_c22_4ff7] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l59_c22_4ff7_x <= VAR_CONST_SR_4_uxn_device_h_l59_c22_4ff7_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l59_c22_4ff7_return_output := CONST_SR_4_uxn_device_h_l59_c22_4ff7_return_output;

     -- CONST_SR_6[uxn_device_h_l57_c21_c0b9] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_device_h_l57_c21_c0b9_x <= VAR_CONST_SR_6_uxn_device_h_l57_c21_c0b9_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_device_h_l57_c21_c0b9_return_output := CONST_SR_6_uxn_device_h_l57_c21_c0b9_return_output;

     -- result_is_blit_done_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d[uxn_device_h_l55_c2_e9f0] LATENCY=0
     VAR_result_is_blit_done_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l55_c2_e9f0_return_output := result.is_blit_done;

     -- CONST_SR_7[uxn_device_h_l56_c25_40f9] LATENCY=0
     -- Inputs
     CONST_SR_7_uxn_device_h_l56_c25_40f9_x <= VAR_CONST_SR_7_uxn_device_h_l56_c25_40f9_x;
     -- Outputs
     VAR_CONST_SR_7_uxn_device_h_l56_c25_40f9_return_output := CONST_SR_7_uxn_device_h_l56_c25_40f9_return_output;

     -- BIN_OP_EQ[uxn_device_h_l55_c6_51d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l55_c6_51d8_left <= VAR_BIN_OP_EQ_uxn_device_h_l55_c6_51d8_left;
     BIN_OP_EQ_uxn_device_h_l55_c6_51d8_right <= VAR_BIN_OP_EQ_uxn_device_h_l55_c6_51d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l55_c6_51d8_return_output := BIN_OP_EQ_uxn_device_h_l55_c6_51d8_return_output;

     -- BIN_OP_AND[uxn_device_h_l60_c20_4829] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l60_c20_4829_left <= VAR_BIN_OP_AND_uxn_device_h_l60_c20_4829_left;
     BIN_OP_AND_uxn_device_h_l60_c20_4829_right <= VAR_BIN_OP_AND_uxn_device_h_l60_c20_4829_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l60_c20_4829_return_output := BIN_OP_AND_uxn_device_h_l60_c20_4829_return_output;

     -- BIN_OP_AND[uxn_device_h_l66_c20_8843] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l66_c20_8843_left <= VAR_BIN_OP_AND_uxn_device_h_l66_c20_8843_left;
     BIN_OP_AND_uxn_device_h_l66_c20_8843_right <= VAR_BIN_OP_AND_uxn_device_h_l66_c20_8843_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l66_c20_8843_return_output := BIN_OP_AND_uxn_device_h_l66_c20_8843_return_output;

     -- BIN_OP_AND[uxn_device_h_l61_c20_a0ef] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l61_c20_a0ef_left <= VAR_BIN_OP_AND_uxn_device_h_l61_c20_a0ef_left;
     BIN_OP_AND_uxn_device_h_l61_c20_a0ef_right <= VAR_BIN_OP_AND_uxn_device_h_l61_c20_a0ef_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l61_c20_a0ef_return_output := BIN_OP_AND_uxn_device_h_l61_c20_a0ef_return_output;

     -- result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d[uxn_device_h_l55_c2_e9f0] LATENCY=0
     VAR_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l55_c2_e9f0_return_output := result.u16_addr;

     -- CONST_SR_5[uxn_device_h_l58_c22_5c25] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_device_h_l58_c22_5c25_x <= VAR_CONST_SR_5_uxn_device_h_l58_c22_5c25_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_device_h_l58_c22_5c25_return_output := CONST_SR_5_uxn_device_h_l58_c22_5c25_return_output;

     -- result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d[uxn_device_h_l55_c2_e9f0] LATENCY=0
     VAR_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l55_c2_e9f0_return_output := result.is_vram_write;

     -- CONST_SR_4[uxn_device_h_l67_c22_5dbf] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l67_c22_5dbf_x <= VAR_CONST_SR_4_uxn_device_h_l67_c22_5dbf_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l67_c22_5dbf_return_output := CONST_SR_4_uxn_device_h_l67_c22_5dbf_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SL_uxn_device_h_l66_c20_ecd1_left := resize(VAR_BIN_OP_AND_uxn_device_h_l66_c20_8843_return_output, 16);
     VAR_BIN_OP_GT_uxn_device_h_l66_c51_f387_left := VAR_BIN_OP_AND_uxn_device_h_l66_c51_52db_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l55_c2_e9f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l55_c6_51d8_return_output;
     VAR_dx_MUX_uxn_device_h_l55_c2_e9f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l55_c6_51d8_return_output;
     VAR_dxx_MUX_uxn_device_h_l55_c2_e9f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l55_c6_51d8_return_output;
     VAR_dxy_MUX_uxn_device_h_l55_c2_e9f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l55_c6_51d8_return_output;
     VAR_dy_MUX_uxn_device_h_l55_c2_e9f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l55_c6_51d8_return_output;
     VAR_dyx_MUX_uxn_device_h_l55_c2_e9f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l55_c6_51d8_return_output;
     VAR_dyy_MUX_uxn_device_h_l55_c2_e9f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l55_c6_51d8_return_output;
     VAR_flip_x_MUX_uxn_device_h_l55_c2_e9f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l55_c6_51d8_return_output;
     VAR_flip_y_MUX_uxn_device_h_l55_c2_e9f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l55_c6_51d8_return_output;
     VAR_i_length_MUX_uxn_device_h_l55_c2_e9f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l55_c6_51d8_return_output;
     VAR_i_phase_MUX_uxn_device_h_l55_c2_e9f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l55_c6_51d8_return_output;
     VAR_layer_MUX_uxn_device_h_l55_c2_e9f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l55_c6_51d8_return_output;
     VAR_length_MUX_uxn_device_h_l55_c2_e9f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l55_c6_51d8_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l55_c2_e9f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l55_c6_51d8_return_output;
     VAR_result_is_blit_done_MUX_uxn_device_h_l55_c2_e9f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l55_c6_51d8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l55_c2_e9f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l55_c6_51d8_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l55_c2_e9f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l55_c6_51d8_return_output;
     VAR_result_is_blit_done_MUX_uxn_device_h_l55_c2_e9f0_iftrue := VAR_result_is_blit_done_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l55_c2_e9f0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l55_c2_e9f0_iftrue := VAR_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l55_c2_e9f0_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l55_c2_e9f0_iftrue := VAR_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l55_c2_e9f0_return_output;
     -- CAST_TO_uint1_t[uxn_device_h_l57_c11_d258] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l57_c11_d258_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_6_uxn_device_h_l57_c21_c0b9_return_output);

     -- CAST_TO_uint4_t[uxn_device_h_l67_c12_589c] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l67_c12_589c_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uxn_device_h_l67_c22_5dbf_return_output);

     -- result_is_vram_write_MUX[uxn_device_h_l55_c2_e9f0] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l55_c2_e9f0_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l55_c2_e9f0_cond;
     result_is_vram_write_MUX_uxn_device_h_l55_c2_e9f0_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l55_c2_e9f0_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l55_c2_e9f0_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l55_c2_e9f0_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l55_c2_e9f0_return_output := result_is_vram_write_MUX_uxn_device_h_l55_c2_e9f0_return_output;

     -- result_is_blit_done_MUX[uxn_device_h_l55_c2_e9f0] LATENCY=0
     -- Inputs
     result_is_blit_done_MUX_uxn_device_h_l55_c2_e9f0_cond <= VAR_result_is_blit_done_MUX_uxn_device_h_l55_c2_e9f0_cond;
     result_is_blit_done_MUX_uxn_device_h_l55_c2_e9f0_iftrue <= VAR_result_is_blit_done_MUX_uxn_device_h_l55_c2_e9f0_iftrue;
     result_is_blit_done_MUX_uxn_device_h_l55_c2_e9f0_iffalse <= VAR_result_is_blit_done_MUX_uxn_device_h_l55_c2_e9f0_iffalse;
     -- Outputs
     VAR_result_is_blit_done_MUX_uxn_device_h_l55_c2_e9f0_return_output := result_is_blit_done_MUX_uxn_device_h_l55_c2_e9f0_return_output;

     -- BIN_OP_GT[uxn_device_h_l66_c51_f387] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l66_c51_f387_left <= VAR_BIN_OP_GT_uxn_device_h_l66_c51_f387_left;
     BIN_OP_GT_uxn_device_h_l66_c51_f387_right <= VAR_BIN_OP_GT_uxn_device_h_l66_c51_f387_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l66_c51_f387_return_output := BIN_OP_GT_uxn_device_h_l66_c51_f387_return_output;

     -- CAST_TO_uint16_t[uxn_device_h_l61_c9_3650] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_device_h_l61_c9_3650_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_BIN_OP_AND_uxn_device_h_l61_c20_a0ef_return_output);

     -- i_phase_MUX[uxn_device_h_l55_c2_e9f0] LATENCY=0
     -- Inputs
     i_phase_MUX_uxn_device_h_l55_c2_e9f0_cond <= VAR_i_phase_MUX_uxn_device_h_l55_c2_e9f0_cond;
     i_phase_MUX_uxn_device_h_l55_c2_e9f0_iftrue <= VAR_i_phase_MUX_uxn_device_h_l55_c2_e9f0_iftrue;
     i_phase_MUX_uxn_device_h_l55_c2_e9f0_iffalse <= VAR_i_phase_MUX_uxn_device_h_l55_c2_e9f0_iffalse;
     -- Outputs
     VAR_i_phase_MUX_uxn_device_h_l55_c2_e9f0_return_output := i_phase_MUX_uxn_device_h_l55_c2_e9f0_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l58_c12_8418] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l58_c12_8418_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_5_uxn_device_h_l58_c22_5c25_return_output);

     -- CAST_TO_uint16_t[uxn_device_h_l60_c9_2621] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_device_h_l60_c9_2621_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_BIN_OP_AND_uxn_device_h_l60_c20_4829_return_output);

     -- result_u16_addr_MUX[uxn_device_h_l55_c2_e9f0] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l55_c2_e9f0_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l55_c2_e9f0_cond;
     result_u16_addr_MUX_uxn_device_h_l55_c2_e9f0_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l55_c2_e9f0_iftrue;
     result_u16_addr_MUX_uxn_device_h_l55_c2_e9f0_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l55_c2_e9f0_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l55_c2_e9f0_return_output := result_u16_addr_MUX_uxn_device_h_l55_c2_e9f0_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l56_c15_1013] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l56_c15_1013_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_7_uxn_device_h_l56_c25_40f9_return_output);

     -- CAST_TO_uint1_t[uxn_device_h_l59_c12_4b74] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l59_c12_4b74_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_device_h_l59_c22_4ff7_return_output);

     -- Submodule level 2
     VAR_MUX_uxn_device_h_l66_c51_3a9b_cond := VAR_BIN_OP_GT_uxn_device_h_l66_c51_f387_return_output;
     VAR_CONST_SL_3_uxn_device_h_l60_c9_5e63_x := VAR_CAST_TO_uint16_t_uxn_device_h_l60_c9_2621_return_output;
     VAR_CONST_SL_2_uxn_device_h_l61_c9_0ee1_x := VAR_CAST_TO_uint16_t_uxn_device_h_l61_c9_3650_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l55_c2_e9f0_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l56_c15_1013_return_output;
     VAR_layer_MUX_uxn_device_h_l55_c2_e9f0_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l57_c11_d258_return_output;
     VAR_MUX_uxn_device_h_l62_c9_ae04_cond := VAR_CAST_TO_uint1_t_uxn_device_h_l58_c12_8418_return_output;
     VAR_MUX_uxn_device_h_l65_c9_6762_cond := VAR_CAST_TO_uint1_t_uxn_device_h_l58_c12_8418_return_output;
     VAR_flip_y_MUX_uxn_device_h_l55_c2_e9f0_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l58_c12_8418_return_output;
     VAR_MUX_uxn_device_h_l63_c9_ed06_cond := VAR_CAST_TO_uint1_t_uxn_device_h_l59_c12_4b74_return_output;
     VAR_MUX_uxn_device_h_l64_c9_9276_cond := VAR_CAST_TO_uint1_t_uxn_device_h_l59_c12_4b74_return_output;
     VAR_flip_x_MUX_uxn_device_h_l55_c2_e9f0_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l59_c12_4b74_return_output;
     VAR_i_length_MUX_uxn_device_h_l55_c2_e9f0_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l67_c12_589c_return_output;
     VAR_length_MUX_uxn_device_h_l55_c2_e9f0_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l67_c12_589c_return_output;
     REG_VAR_i_phase := VAR_i_phase_MUX_uxn_device_h_l55_c2_e9f0_return_output;
     -- i_length_MUX[uxn_device_h_l55_c2_e9f0] LATENCY=0
     -- Inputs
     i_length_MUX_uxn_device_h_l55_c2_e9f0_cond <= VAR_i_length_MUX_uxn_device_h_l55_c2_e9f0_cond;
     i_length_MUX_uxn_device_h_l55_c2_e9f0_iftrue <= VAR_i_length_MUX_uxn_device_h_l55_c2_e9f0_iftrue;
     i_length_MUX_uxn_device_h_l55_c2_e9f0_iffalse <= VAR_i_length_MUX_uxn_device_h_l55_c2_e9f0_iffalse;
     -- Outputs
     VAR_i_length_MUX_uxn_device_h_l55_c2_e9f0_return_output := i_length_MUX_uxn_device_h_l55_c2_e9f0_return_output;

     -- flip_y_MUX[uxn_device_h_l55_c2_e9f0] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l55_c2_e9f0_cond <= VAR_flip_y_MUX_uxn_device_h_l55_c2_e9f0_cond;
     flip_y_MUX_uxn_device_h_l55_c2_e9f0_iftrue <= VAR_flip_y_MUX_uxn_device_h_l55_c2_e9f0_iftrue;
     flip_y_MUX_uxn_device_h_l55_c2_e9f0_iffalse <= VAR_flip_y_MUX_uxn_device_h_l55_c2_e9f0_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l55_c2_e9f0_return_output := flip_y_MUX_uxn_device_h_l55_c2_e9f0_return_output;

     -- CONST_SL_2[uxn_device_h_l61_c9_0ee1] LATENCY=0
     -- Inputs
     CONST_SL_2_uxn_device_h_l61_c9_0ee1_x <= VAR_CONST_SL_2_uxn_device_h_l61_c9_0ee1_x;
     -- Outputs
     VAR_CONST_SL_2_uxn_device_h_l61_c9_0ee1_return_output := CONST_SL_2_uxn_device_h_l61_c9_0ee1_return_output;

     -- layer_MUX[uxn_device_h_l55_c2_e9f0] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l55_c2_e9f0_cond <= VAR_layer_MUX_uxn_device_h_l55_c2_e9f0_cond;
     layer_MUX_uxn_device_h_l55_c2_e9f0_iftrue <= VAR_layer_MUX_uxn_device_h_l55_c2_e9f0_iftrue;
     layer_MUX_uxn_device_h_l55_c2_e9f0_iffalse <= VAR_layer_MUX_uxn_device_h_l55_c2_e9f0_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l55_c2_e9f0_return_output := layer_MUX_uxn_device_h_l55_c2_e9f0_return_output;

     -- length_MUX[uxn_device_h_l55_c2_e9f0] LATENCY=0
     -- Inputs
     length_MUX_uxn_device_h_l55_c2_e9f0_cond <= VAR_length_MUX_uxn_device_h_l55_c2_e9f0_cond;
     length_MUX_uxn_device_h_l55_c2_e9f0_iftrue <= VAR_length_MUX_uxn_device_h_l55_c2_e9f0_iftrue;
     length_MUX_uxn_device_h_l55_c2_e9f0_iffalse <= VAR_length_MUX_uxn_device_h_l55_c2_e9f0_iffalse;
     -- Outputs
     VAR_length_MUX_uxn_device_h_l55_c2_e9f0_return_output := length_MUX_uxn_device_h_l55_c2_e9f0_return_output;

     -- flip_x_MUX[uxn_device_h_l55_c2_e9f0] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l55_c2_e9f0_cond <= VAR_flip_x_MUX_uxn_device_h_l55_c2_e9f0_cond;
     flip_x_MUX_uxn_device_h_l55_c2_e9f0_iftrue <= VAR_flip_x_MUX_uxn_device_h_l55_c2_e9f0_iftrue;
     flip_x_MUX_uxn_device_h_l55_c2_e9f0_iffalse <= VAR_flip_x_MUX_uxn_device_h_l55_c2_e9f0_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l55_c2_e9f0_return_output := flip_x_MUX_uxn_device_h_l55_c2_e9f0_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l55_c2_e9f0] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l55_c2_e9f0_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l55_c2_e9f0_cond;
     ctrl_mode_MUX_uxn_device_h_l55_c2_e9f0_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l55_c2_e9f0_iftrue;
     ctrl_mode_MUX_uxn_device_h_l55_c2_e9f0_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l55_c2_e9f0_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l55_c2_e9f0_return_output := ctrl_mode_MUX_uxn_device_h_l55_c2_e9f0_return_output;

     -- CONST_SL_3[uxn_device_h_l60_c9_5e63] LATENCY=0
     -- Inputs
     CONST_SL_3_uxn_device_h_l60_c9_5e63_x <= VAR_CONST_SL_3_uxn_device_h_l60_c9_5e63_x;
     -- Outputs
     VAR_CONST_SL_3_uxn_device_h_l60_c9_5e63_return_output := CONST_SL_3_uxn_device_h_l60_c9_5e63_return_output;

     -- CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_b1c0_uxn_device_h_l42_l78_DUPLICATE_a5ad LATENCY=0
     VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_b1c0_uxn_device_h_l42_l78_DUPLICATE_a5ad_return_output := CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_b1c0(
     result,
     VAR_result_is_blit_done_MUX_uxn_device_h_l55_c2_e9f0_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l55_c2_e9f0_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l55_c2_e9f0_return_output);

     -- MUX[uxn_device_h_l66_c51_3a9b] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l66_c51_3a9b_cond <= VAR_MUX_uxn_device_h_l66_c51_3a9b_cond;
     MUX_uxn_device_h_l66_c51_3a9b_iftrue <= VAR_MUX_uxn_device_h_l66_c51_3a9b_iftrue;
     MUX_uxn_device_h_l66_c51_3a9b_iffalse <= VAR_MUX_uxn_device_h_l66_c51_3a9b_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l66_c51_3a9b_return_output := MUX_uxn_device_h_l66_c51_3a9b_return_output;

     -- Submodule level 3
     REG_VAR_result := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_b1c0_uxn_device_h_l42_l78_DUPLICATE_a5ad_return_output;
     VAR_return_output := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_b1c0_uxn_device_h_l42_l78_DUPLICATE_a5ad_return_output;
     VAR_dy_uxn_device_h_l61_c3_9eeb := VAR_CONST_SL_2_uxn_device_h_l61_c9_0ee1_return_output;
     VAR_dx_uxn_device_h_l60_c3_9356 := VAR_CONST_SL_3_uxn_device_h_l60_c9_5e63_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l66_c45_7e00_right := VAR_MUX_uxn_device_h_l66_c51_3a9b_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l55_c2_e9f0_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l55_c2_e9f0_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l55_c2_e9f0_return_output;
     REG_VAR_i_length := VAR_i_length_MUX_uxn_device_h_l55_c2_e9f0_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l55_c2_e9f0_return_output;
     REG_VAR_length := VAR_length_MUX_uxn_device_h_l55_c2_e9f0_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l62_c19_810c_left := signed(std_logic_vector(resize(VAR_dx_uxn_device_h_l60_c3_9356, 17)));
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l64_c19_e1b0_left := signed(std_logic_vector(resize(VAR_dx_uxn_device_h_l60_c3_9356, 17)));
     VAR_MUX_uxn_device_h_l62_c9_ae04_iffalse := VAR_dx_uxn_device_h_l60_c3_9356;
     VAR_MUX_uxn_device_h_l64_c9_9276_iffalse := VAR_dx_uxn_device_h_l60_c3_9356;
     VAR_dx_MUX_uxn_device_h_l55_c2_e9f0_iftrue := VAR_dx_uxn_device_h_l60_c3_9356;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l63_c19_fcc5_left := signed(std_logic_vector(resize(VAR_dy_uxn_device_h_l61_c3_9eeb, 17)));
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l65_c19_e3f4_left := signed(std_logic_vector(resize(VAR_dy_uxn_device_h_l61_c3_9eeb, 17)));
     VAR_MUX_uxn_device_h_l63_c9_ed06_iffalse := VAR_dy_uxn_device_h_l61_c3_9eeb;
     VAR_MUX_uxn_device_h_l65_c9_6762_iffalse := VAR_dy_uxn_device_h_l61_c3_9eeb;
     VAR_dy_MUX_uxn_device_h_l55_c2_e9f0_iftrue := VAR_dy_uxn_device_h_l61_c3_9eeb;
     -- BIN_OP_PLUS[uxn_device_h_l66_c45_7e00] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l66_c45_7e00_left <= VAR_BIN_OP_PLUS_uxn_device_h_l66_c45_7e00_left;
     BIN_OP_PLUS_uxn_device_h_l66_c45_7e00_right <= VAR_BIN_OP_PLUS_uxn_device_h_l66_c45_7e00_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l66_c45_7e00_return_output := BIN_OP_PLUS_uxn_device_h_l66_c45_7e00_return_output;

     -- dx_MUX[uxn_device_h_l55_c2_e9f0] LATENCY=0
     -- Inputs
     dx_MUX_uxn_device_h_l55_c2_e9f0_cond <= VAR_dx_MUX_uxn_device_h_l55_c2_e9f0_cond;
     dx_MUX_uxn_device_h_l55_c2_e9f0_iftrue <= VAR_dx_MUX_uxn_device_h_l55_c2_e9f0_iftrue;
     dx_MUX_uxn_device_h_l55_c2_e9f0_iffalse <= VAR_dx_MUX_uxn_device_h_l55_c2_e9f0_iffalse;
     -- Outputs
     VAR_dx_MUX_uxn_device_h_l55_c2_e9f0_return_output := dx_MUX_uxn_device_h_l55_c2_e9f0_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l64_c19_e1b0] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l64_c19_e1b0_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l64_c19_e1b0_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l64_c19_e1b0_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l64_c19_e1b0_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l64_c19_e1b0_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l64_c19_e1b0_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l62_c19_810c] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l62_c19_810c_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l62_c19_810c_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l62_c19_810c_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l62_c19_810c_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l62_c19_810c_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l62_c19_810c_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l63_c19_fcc5] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l63_c19_fcc5_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l63_c19_fcc5_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l63_c19_fcc5_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l63_c19_fcc5_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l63_c19_fcc5_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l63_c19_fcc5_return_output;

     -- dy_MUX[uxn_device_h_l55_c2_e9f0] LATENCY=0
     -- Inputs
     dy_MUX_uxn_device_h_l55_c2_e9f0_cond <= VAR_dy_MUX_uxn_device_h_l55_c2_e9f0_cond;
     dy_MUX_uxn_device_h_l55_c2_e9f0_iftrue <= VAR_dy_MUX_uxn_device_h_l55_c2_e9f0_iftrue;
     dy_MUX_uxn_device_h_l55_c2_e9f0_iffalse <= VAR_dy_MUX_uxn_device_h_l55_c2_e9f0_iffalse;
     -- Outputs
     VAR_dy_MUX_uxn_device_h_l55_c2_e9f0_return_output := dy_MUX_uxn_device_h_l55_c2_e9f0_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l65_c19_e3f4] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l65_c19_e3f4_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l65_c19_e3f4_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l65_c19_e3f4_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l65_c19_e3f4_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l65_c19_e3f4_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l65_c19_e3f4_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l62_c9_ae04_iftrue := resize(unsigned(std_logic_vector(VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l62_c19_810c_return_output)),16);
     VAR_MUX_uxn_device_h_l63_c9_ed06_iftrue := resize(unsigned(std_logic_vector(VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l63_c19_fcc5_return_output)),16);
     VAR_MUX_uxn_device_h_l64_c9_9276_iftrue := resize(unsigned(std_logic_vector(VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l64_c19_e1b0_return_output)),16);
     VAR_MUX_uxn_device_h_l65_c9_6762_iftrue := resize(unsigned(std_logic_vector(VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l65_c19_e3f4_return_output)),16);
     VAR_BIN_OP_SL_uxn_device_h_l66_c20_ecd1_right := VAR_BIN_OP_PLUS_uxn_device_h_l66_c45_7e00_return_output;
     REG_VAR_dx := VAR_dx_MUX_uxn_device_h_l55_c2_e9f0_return_output;
     REG_VAR_dy := VAR_dy_MUX_uxn_device_h_l55_c2_e9f0_return_output;
     -- MUX[uxn_device_h_l64_c9_9276] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l64_c9_9276_cond <= VAR_MUX_uxn_device_h_l64_c9_9276_cond;
     MUX_uxn_device_h_l64_c9_9276_iftrue <= VAR_MUX_uxn_device_h_l64_c9_9276_iftrue;
     MUX_uxn_device_h_l64_c9_9276_iffalse <= VAR_MUX_uxn_device_h_l64_c9_9276_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l64_c9_9276_return_output := MUX_uxn_device_h_l64_c9_9276_return_output;

     -- MUX[uxn_device_h_l62_c9_ae04] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l62_c9_ae04_cond <= VAR_MUX_uxn_device_h_l62_c9_ae04_cond;
     MUX_uxn_device_h_l62_c9_ae04_iftrue <= VAR_MUX_uxn_device_h_l62_c9_ae04_iftrue;
     MUX_uxn_device_h_l62_c9_ae04_iffalse <= VAR_MUX_uxn_device_h_l62_c9_ae04_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l62_c9_ae04_return_output := MUX_uxn_device_h_l62_c9_ae04_return_output;

     -- BIN_OP_SL[uxn_device_h_l66_c20_ecd1] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_device_h_l66_c20_ecd1_left <= VAR_BIN_OP_SL_uxn_device_h_l66_c20_ecd1_left;
     BIN_OP_SL_uxn_device_h_l66_c20_ecd1_right <= VAR_BIN_OP_SL_uxn_device_h_l66_c20_ecd1_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_device_h_l66_c20_ecd1_return_output := BIN_OP_SL_uxn_device_h_l66_c20_ecd1_return_output;

     -- MUX[uxn_device_h_l65_c9_6762] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l65_c9_6762_cond <= VAR_MUX_uxn_device_h_l65_c9_6762_cond;
     MUX_uxn_device_h_l65_c9_6762_iftrue <= VAR_MUX_uxn_device_h_l65_c9_6762_iftrue;
     MUX_uxn_device_h_l65_c9_6762_iffalse <= VAR_MUX_uxn_device_h_l65_c9_6762_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l65_c9_6762_return_output := MUX_uxn_device_h_l65_c9_6762_return_output;

     -- MUX[uxn_device_h_l63_c9_ed06] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l63_c9_ed06_cond <= VAR_MUX_uxn_device_h_l63_c9_ed06_cond;
     MUX_uxn_device_h_l63_c9_ed06_iftrue <= VAR_MUX_uxn_device_h_l63_c9_ed06_iftrue;
     MUX_uxn_device_h_l63_c9_ed06_iffalse <= VAR_MUX_uxn_device_h_l63_c9_ed06_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l63_c9_ed06_return_output := MUX_uxn_device_h_l63_c9_ed06_return_output;

     -- Submodule level 5
     VAR_ram_addr_incr_MUX_uxn_device_h_l55_c2_e9f0_iftrue := VAR_BIN_OP_SL_uxn_device_h_l66_c20_ecd1_return_output;
     VAR_dxy_MUX_uxn_device_h_l55_c2_e9f0_iftrue := VAR_MUX_uxn_device_h_l62_c9_ae04_return_output;
     VAR_dyx_MUX_uxn_device_h_l55_c2_e9f0_iftrue := VAR_MUX_uxn_device_h_l63_c9_ed06_return_output;
     VAR_dxx_MUX_uxn_device_h_l55_c2_e9f0_iftrue := VAR_MUX_uxn_device_h_l64_c9_9276_return_output;
     VAR_dyy_MUX_uxn_device_h_l55_c2_e9f0_iftrue := VAR_MUX_uxn_device_h_l65_c9_6762_return_output;
     -- ram_addr_incr_MUX[uxn_device_h_l55_c2_e9f0] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l55_c2_e9f0_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l55_c2_e9f0_cond;
     ram_addr_incr_MUX_uxn_device_h_l55_c2_e9f0_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l55_c2_e9f0_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l55_c2_e9f0_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l55_c2_e9f0_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l55_c2_e9f0_return_output := ram_addr_incr_MUX_uxn_device_h_l55_c2_e9f0_return_output;

     -- dyy_MUX[uxn_device_h_l55_c2_e9f0] LATENCY=0
     -- Inputs
     dyy_MUX_uxn_device_h_l55_c2_e9f0_cond <= VAR_dyy_MUX_uxn_device_h_l55_c2_e9f0_cond;
     dyy_MUX_uxn_device_h_l55_c2_e9f0_iftrue <= VAR_dyy_MUX_uxn_device_h_l55_c2_e9f0_iftrue;
     dyy_MUX_uxn_device_h_l55_c2_e9f0_iffalse <= VAR_dyy_MUX_uxn_device_h_l55_c2_e9f0_iffalse;
     -- Outputs
     VAR_dyy_MUX_uxn_device_h_l55_c2_e9f0_return_output := dyy_MUX_uxn_device_h_l55_c2_e9f0_return_output;

     -- dxx_MUX[uxn_device_h_l55_c2_e9f0] LATENCY=0
     -- Inputs
     dxx_MUX_uxn_device_h_l55_c2_e9f0_cond <= VAR_dxx_MUX_uxn_device_h_l55_c2_e9f0_cond;
     dxx_MUX_uxn_device_h_l55_c2_e9f0_iftrue <= VAR_dxx_MUX_uxn_device_h_l55_c2_e9f0_iftrue;
     dxx_MUX_uxn_device_h_l55_c2_e9f0_iffalse <= VAR_dxx_MUX_uxn_device_h_l55_c2_e9f0_iffalse;
     -- Outputs
     VAR_dxx_MUX_uxn_device_h_l55_c2_e9f0_return_output := dxx_MUX_uxn_device_h_l55_c2_e9f0_return_output;

     -- dyx_MUX[uxn_device_h_l55_c2_e9f0] LATENCY=0
     -- Inputs
     dyx_MUX_uxn_device_h_l55_c2_e9f0_cond <= VAR_dyx_MUX_uxn_device_h_l55_c2_e9f0_cond;
     dyx_MUX_uxn_device_h_l55_c2_e9f0_iftrue <= VAR_dyx_MUX_uxn_device_h_l55_c2_e9f0_iftrue;
     dyx_MUX_uxn_device_h_l55_c2_e9f0_iffalse <= VAR_dyx_MUX_uxn_device_h_l55_c2_e9f0_iffalse;
     -- Outputs
     VAR_dyx_MUX_uxn_device_h_l55_c2_e9f0_return_output := dyx_MUX_uxn_device_h_l55_c2_e9f0_return_output;

     -- dxy_MUX[uxn_device_h_l55_c2_e9f0] LATENCY=0
     -- Inputs
     dxy_MUX_uxn_device_h_l55_c2_e9f0_cond <= VAR_dxy_MUX_uxn_device_h_l55_c2_e9f0_cond;
     dxy_MUX_uxn_device_h_l55_c2_e9f0_iftrue <= VAR_dxy_MUX_uxn_device_h_l55_c2_e9f0_iftrue;
     dxy_MUX_uxn_device_h_l55_c2_e9f0_iffalse <= VAR_dxy_MUX_uxn_device_h_l55_c2_e9f0_iffalse;
     -- Outputs
     VAR_dxy_MUX_uxn_device_h_l55_c2_e9f0_return_output := dxy_MUX_uxn_device_h_l55_c2_e9f0_return_output;

     -- Submodule level 6
     REG_VAR_dxx := VAR_dxx_MUX_uxn_device_h_l55_c2_e9f0_return_output;
     REG_VAR_dxy := VAR_dxy_MUX_uxn_device_h_l55_c2_e9f0_return_output;
     REG_VAR_dyx := VAR_dyx_MUX_uxn_device_h_l55_c2_e9f0_return_output;
     REG_VAR_dyy := VAR_dyy_MUX_uxn_device_h_l55_c2_e9f0_return_output;
     REG_VAR_ram_addr_incr := VAR_ram_addr_incr_MUX_uxn_device_h_l55_c2_e9f0_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_blending <= REG_VAR_blending;
REG_COMB_ctrl_mode <= REG_VAR_ctrl_mode;
REG_COMB_layer <= REG_VAR_layer;
REG_COMB_flip_x <= REG_VAR_flip_x;
REG_COMB_flip_y <= REG_VAR_flip_y;
REG_COMB_dx <= REG_VAR_dx;
REG_COMB_dy <= REG_VAR_dy;
REG_COMB_dxy <= REG_VAR_dxy;
REG_COMB_dyx <= REG_VAR_dyx;
REG_COMB_dyy <= REG_VAR_dyy;
REG_COMB_dxx <= REG_VAR_dxx;
REG_COMB_ram_addr_incr <= REG_VAR_ram_addr_incr;
REG_COMB_i_phase <= REG_VAR_i_phase;
REG_COMB_length <= REG_VAR_length;
REG_COMB_i_length <= REG_VAR_i_length;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     blending <= REG_COMB_blending;
     ctrl_mode <= REG_COMB_ctrl_mode;
     layer <= REG_COMB_layer;
     flip_x <= REG_COMB_flip_x;
     flip_y <= REG_COMB_flip_y;
     dx <= REG_COMB_dx;
     dy <= REG_COMB_dy;
     dxy <= REG_COMB_dxy;
     dyx <= REG_COMB_dyx;
     dyy <= REG_COMB_dyy;
     dxx <= REG_COMB_dxx;
     ram_addr_incr <= REG_COMB_ram_addr_incr;
     i_phase <= REG_COMB_i_phase;
     length <= REG_COMB_length;
     i_length <= REG_COMB_i_length;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
