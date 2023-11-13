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
-- Submodules: 50
entity screen_blit_0CLK_b1675d32 is
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
end screen_blit_0CLK_b1675d32;
architecture arch of screen_blit_0CLK_b1675d32 is
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
-- BIN_OP_EQ[uxn_device_h_l60_c6_f4f0]
signal BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_return_output : unsigned(0 downto 0);

-- dyy_MUX[uxn_device_h_l60_c2_67f8]
signal dyy_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
signal dyy_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(15 downto 0);
signal dyy_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(15 downto 0);
signal dyy_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(15 downto 0);

-- dy_MUX[uxn_device_h_l60_c2_67f8]
signal dy_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
signal dy_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(15 downto 0);
signal dy_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(15 downto 0);
signal dy_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l60_c2_67f8]
signal flip_x_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l60_c2_67f8]
signal ctrl_mode_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(0 downto 0);

-- result_ram_address_MUX[uxn_device_h_l60_c2_67f8]
signal result_ram_address_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
signal result_ram_address_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(15 downto 0);
signal result_ram_address_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(15 downto 0);
signal result_ram_address_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(15 downto 0);

-- result_is_blit_done_MUX[uxn_device_h_l60_c2_67f8]
signal result_is_blit_done_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l60_c2_67f8]
signal result_is_vram_write_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l60_c2_67f8]
signal result_vram_address_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(31 downto 0);

-- dx_MUX[uxn_device_h_l60_c2_67f8]
signal dx_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
signal dx_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(15 downto 0);
signal dx_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(15 downto 0);
signal dx_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(15 downto 0);

-- dxy_MUX[uxn_device_h_l60_c2_67f8]
signal dxy_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
signal dxy_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(15 downto 0);
signal dxy_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(15 downto 0);
signal dxy_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(15 downto 0);

-- dyx_MUX[uxn_device_h_l60_c2_67f8]
signal dyx_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
signal dyx_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(15 downto 0);
signal dyx_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(15 downto 0);
signal dyx_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(15 downto 0);

-- i_phase_MUX[uxn_device_h_l60_c2_67f8]
signal i_phase_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
signal i_phase_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(11 downto 0);
signal i_phase_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(11 downto 0);
signal i_phase_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(11 downto 0);

-- dxx_MUX[uxn_device_h_l60_c2_67f8]
signal dxx_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
signal dxx_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(15 downto 0);
signal dxx_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(15 downto 0);
signal dxx_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(15 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l60_c2_67f8]
signal ram_addr_incr_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(15 downto 0);

-- layer_MUX[uxn_device_h_l60_c2_67f8]
signal layer_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(0 downto 0);

-- i_length_MUX[uxn_device_h_l60_c2_67f8]
signal i_length_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
signal i_length_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(3 downto 0);
signal i_length_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(3 downto 0);
signal i_length_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(3 downto 0);

-- length_MUX[uxn_device_h_l60_c2_67f8]
signal length_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
signal length_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(3 downto 0);
signal length_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(3 downto 0);
signal length_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(3 downto 0);

-- flip_y_MUX[uxn_device_h_l60_c2_67f8]
signal flip_y_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(0 downto 0);

-- CONST_SR_7[uxn_device_h_l61_c25_66b2]
signal CONST_SR_7_uxn_device_h_l61_c25_66b2_x : unsigned(7 downto 0);
signal CONST_SR_7_uxn_device_h_l61_c25_66b2_return_output : unsigned(7 downto 0);

-- CONST_SR_6[uxn_device_h_l62_c21_a2a1]
signal CONST_SR_6_uxn_device_h_l62_c21_a2a1_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_device_h_l62_c21_a2a1_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_device_h_l63_c22_aac8]
signal CONST_SR_5_uxn_device_h_l63_c22_aac8_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_device_h_l63_c22_aac8_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_device_h_l64_c22_e822]
signal CONST_SR_4_uxn_device_h_l64_c22_e822_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l64_c22_e822_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l65_c20_8d6d]
signal BIN_OP_AND_uxn_device_h_l65_c20_8d6d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l65_c20_8d6d_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l65_c20_8d6d_return_output : unsigned(7 downto 0);

-- CONST_SL_3[uxn_device_h_l65_c9_9025]
signal CONST_SL_3_uxn_device_h_l65_c9_9025_x : unsigned(15 downto 0);
signal CONST_SL_3_uxn_device_h_l65_c9_9025_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_device_h_l66_c20_14b8]
signal BIN_OP_AND_uxn_device_h_l66_c20_14b8_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l66_c20_14b8_right : unsigned(1 downto 0);
signal BIN_OP_AND_uxn_device_h_l66_c20_14b8_return_output : unsigned(7 downto 0);

-- CONST_SL_2[uxn_device_h_l66_c9_c4c2]
signal CONST_SL_2_uxn_device_h_l66_c9_c4c2_x : unsigned(15 downto 0);
signal CONST_SL_2_uxn_device_h_l66_c9_c4c2_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l67_c19_63d2]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l67_c19_63d2_left : signed(16 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l67_c19_63d2_right : signed(1 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l67_c19_63d2_return_output : signed(18 downto 0);

-- MUX[uxn_device_h_l67_c9_4751]
signal MUX_uxn_device_h_l67_c9_4751_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l67_c9_4751_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l67_c9_4751_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l67_c9_4751_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l68_c19_c468]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l68_c19_c468_left : signed(16 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l68_c19_c468_right : signed(1 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l68_c19_c468_return_output : signed(18 downto 0);

-- MUX[uxn_device_h_l68_c9_386e]
signal MUX_uxn_device_h_l68_c9_386e_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l68_c9_386e_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l68_c9_386e_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l68_c9_386e_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l69_c19_4f5c]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l69_c19_4f5c_left : signed(16 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l69_c19_4f5c_right : signed(1 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l69_c19_4f5c_return_output : signed(18 downto 0);

-- MUX[uxn_device_h_l69_c9_b595]
signal MUX_uxn_device_h_l69_c9_b595_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l69_c9_b595_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l69_c9_b595_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l69_c9_b595_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l70_c19_5972]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l70_c19_5972_left : signed(16 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l70_c19_5972_right : signed(1 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l70_c19_5972_return_output : signed(18 downto 0);

-- MUX[uxn_device_h_l70_c9_f678]
signal MUX_uxn_device_h_l70_c9_f678_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l70_c9_f678_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l70_c9_f678_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l70_c9_f678_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_device_h_l71_c20_feac]
signal BIN_OP_AND_uxn_device_h_l71_c20_feac_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l71_c20_feac_right : unsigned(2 downto 0);
signal BIN_OP_AND_uxn_device_h_l71_c20_feac_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l71_c51_76c6]
signal BIN_OP_AND_uxn_device_h_l71_c51_76c6_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l71_c51_76c6_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l71_c51_76c6_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_device_h_l71_c51_6ced]
signal BIN_OP_GT_uxn_device_h_l71_c51_6ced_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_device_h_l71_c51_6ced_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_device_h_l71_c51_6ced_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l71_c51_4c22]
signal MUX_uxn_device_h_l71_c51_4c22_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l71_c51_4c22_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l71_c51_4c22_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l71_c51_4c22_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l71_c45_5126]
signal BIN_OP_PLUS_uxn_device_h_l71_c45_5126_left : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l71_c45_5126_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l71_c45_5126_return_output : unsigned(1 downto 0);

-- BIN_OP_SL[uxn_device_h_l71_c20_ef4a]
signal BIN_OP_SL_uxn_device_h_l71_c20_ef4a_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_device_h_l71_c20_ef4a_right : unsigned(1 downto 0);
signal BIN_OP_SL_uxn_device_h_l71_c20_ef4a_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_device_h_l72_c22_c438]
signal CONST_SR_4_uxn_device_h_l72_c22_c438_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l72_c22_c438_return_output : unsigned(7 downto 0);

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

function CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_8b29( ref_toks_0 : screen_blit_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return screen_blit_result_t is
 
  variable base : screen_blit_result_t; 
  variable return_output : screen_blit_result_t;
begin
      base := ref_toks_0;
      base.ram_address := ref_toks_1;
      base.is_blit_done := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.vram_address := ref_toks_4;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_device_h_l60_c6_f4f0
BIN_OP_EQ_uxn_device_h_l60_c6_f4f0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_left,
BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_right,
BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_return_output);

-- dyy_MUX_uxn_device_h_l60_c2_67f8
dyy_MUX_uxn_device_h_l60_c2_67f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
dyy_MUX_uxn_device_h_l60_c2_67f8_cond,
dyy_MUX_uxn_device_h_l60_c2_67f8_iftrue,
dyy_MUX_uxn_device_h_l60_c2_67f8_iffalse,
dyy_MUX_uxn_device_h_l60_c2_67f8_return_output);

-- dy_MUX_uxn_device_h_l60_c2_67f8
dy_MUX_uxn_device_h_l60_c2_67f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
dy_MUX_uxn_device_h_l60_c2_67f8_cond,
dy_MUX_uxn_device_h_l60_c2_67f8_iftrue,
dy_MUX_uxn_device_h_l60_c2_67f8_iffalse,
dy_MUX_uxn_device_h_l60_c2_67f8_return_output);

-- flip_x_MUX_uxn_device_h_l60_c2_67f8
flip_x_MUX_uxn_device_h_l60_c2_67f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l60_c2_67f8_cond,
flip_x_MUX_uxn_device_h_l60_c2_67f8_iftrue,
flip_x_MUX_uxn_device_h_l60_c2_67f8_iffalse,
flip_x_MUX_uxn_device_h_l60_c2_67f8_return_output);

-- ctrl_mode_MUX_uxn_device_h_l60_c2_67f8
ctrl_mode_MUX_uxn_device_h_l60_c2_67f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l60_c2_67f8_cond,
ctrl_mode_MUX_uxn_device_h_l60_c2_67f8_iftrue,
ctrl_mode_MUX_uxn_device_h_l60_c2_67f8_iffalse,
ctrl_mode_MUX_uxn_device_h_l60_c2_67f8_return_output);

-- result_ram_address_MUX_uxn_device_h_l60_c2_67f8
result_ram_address_MUX_uxn_device_h_l60_c2_67f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_address_MUX_uxn_device_h_l60_c2_67f8_cond,
result_ram_address_MUX_uxn_device_h_l60_c2_67f8_iftrue,
result_ram_address_MUX_uxn_device_h_l60_c2_67f8_iffalse,
result_ram_address_MUX_uxn_device_h_l60_c2_67f8_return_output);

-- result_is_blit_done_MUX_uxn_device_h_l60_c2_67f8
result_is_blit_done_MUX_uxn_device_h_l60_c2_67f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_blit_done_MUX_uxn_device_h_l60_c2_67f8_cond,
result_is_blit_done_MUX_uxn_device_h_l60_c2_67f8_iftrue,
result_is_blit_done_MUX_uxn_device_h_l60_c2_67f8_iffalse,
result_is_blit_done_MUX_uxn_device_h_l60_c2_67f8_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l60_c2_67f8
result_is_vram_write_MUX_uxn_device_h_l60_c2_67f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l60_c2_67f8_cond,
result_is_vram_write_MUX_uxn_device_h_l60_c2_67f8_iftrue,
result_is_vram_write_MUX_uxn_device_h_l60_c2_67f8_iffalse,
result_is_vram_write_MUX_uxn_device_h_l60_c2_67f8_return_output);

-- result_vram_address_MUX_uxn_device_h_l60_c2_67f8
result_vram_address_MUX_uxn_device_h_l60_c2_67f8 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l60_c2_67f8_cond,
result_vram_address_MUX_uxn_device_h_l60_c2_67f8_iftrue,
result_vram_address_MUX_uxn_device_h_l60_c2_67f8_iffalse,
result_vram_address_MUX_uxn_device_h_l60_c2_67f8_return_output);

-- dx_MUX_uxn_device_h_l60_c2_67f8
dx_MUX_uxn_device_h_l60_c2_67f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
dx_MUX_uxn_device_h_l60_c2_67f8_cond,
dx_MUX_uxn_device_h_l60_c2_67f8_iftrue,
dx_MUX_uxn_device_h_l60_c2_67f8_iffalse,
dx_MUX_uxn_device_h_l60_c2_67f8_return_output);

-- dxy_MUX_uxn_device_h_l60_c2_67f8
dxy_MUX_uxn_device_h_l60_c2_67f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
dxy_MUX_uxn_device_h_l60_c2_67f8_cond,
dxy_MUX_uxn_device_h_l60_c2_67f8_iftrue,
dxy_MUX_uxn_device_h_l60_c2_67f8_iffalse,
dxy_MUX_uxn_device_h_l60_c2_67f8_return_output);

-- dyx_MUX_uxn_device_h_l60_c2_67f8
dyx_MUX_uxn_device_h_l60_c2_67f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
dyx_MUX_uxn_device_h_l60_c2_67f8_cond,
dyx_MUX_uxn_device_h_l60_c2_67f8_iftrue,
dyx_MUX_uxn_device_h_l60_c2_67f8_iffalse,
dyx_MUX_uxn_device_h_l60_c2_67f8_return_output);

-- i_phase_MUX_uxn_device_h_l60_c2_67f8
i_phase_MUX_uxn_device_h_l60_c2_67f8 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
i_phase_MUX_uxn_device_h_l60_c2_67f8_cond,
i_phase_MUX_uxn_device_h_l60_c2_67f8_iftrue,
i_phase_MUX_uxn_device_h_l60_c2_67f8_iffalse,
i_phase_MUX_uxn_device_h_l60_c2_67f8_return_output);

-- dxx_MUX_uxn_device_h_l60_c2_67f8
dxx_MUX_uxn_device_h_l60_c2_67f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
dxx_MUX_uxn_device_h_l60_c2_67f8_cond,
dxx_MUX_uxn_device_h_l60_c2_67f8_iftrue,
dxx_MUX_uxn_device_h_l60_c2_67f8_iffalse,
dxx_MUX_uxn_device_h_l60_c2_67f8_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l60_c2_67f8
ram_addr_incr_MUX_uxn_device_h_l60_c2_67f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l60_c2_67f8_cond,
ram_addr_incr_MUX_uxn_device_h_l60_c2_67f8_iftrue,
ram_addr_incr_MUX_uxn_device_h_l60_c2_67f8_iffalse,
ram_addr_incr_MUX_uxn_device_h_l60_c2_67f8_return_output);

-- layer_MUX_uxn_device_h_l60_c2_67f8
layer_MUX_uxn_device_h_l60_c2_67f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l60_c2_67f8_cond,
layer_MUX_uxn_device_h_l60_c2_67f8_iftrue,
layer_MUX_uxn_device_h_l60_c2_67f8_iffalse,
layer_MUX_uxn_device_h_l60_c2_67f8_return_output);

-- i_length_MUX_uxn_device_h_l60_c2_67f8
i_length_MUX_uxn_device_h_l60_c2_67f8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
i_length_MUX_uxn_device_h_l60_c2_67f8_cond,
i_length_MUX_uxn_device_h_l60_c2_67f8_iftrue,
i_length_MUX_uxn_device_h_l60_c2_67f8_iffalse,
i_length_MUX_uxn_device_h_l60_c2_67f8_return_output);

-- length_MUX_uxn_device_h_l60_c2_67f8
length_MUX_uxn_device_h_l60_c2_67f8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
length_MUX_uxn_device_h_l60_c2_67f8_cond,
length_MUX_uxn_device_h_l60_c2_67f8_iftrue,
length_MUX_uxn_device_h_l60_c2_67f8_iffalse,
length_MUX_uxn_device_h_l60_c2_67f8_return_output);

-- flip_y_MUX_uxn_device_h_l60_c2_67f8
flip_y_MUX_uxn_device_h_l60_c2_67f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l60_c2_67f8_cond,
flip_y_MUX_uxn_device_h_l60_c2_67f8_iftrue,
flip_y_MUX_uxn_device_h_l60_c2_67f8_iffalse,
flip_y_MUX_uxn_device_h_l60_c2_67f8_return_output);

-- CONST_SR_7_uxn_device_h_l61_c25_66b2
CONST_SR_7_uxn_device_h_l61_c25_66b2 : entity work.CONST_SR_7_uint8_t_0CLK_de264c78 port map (
CONST_SR_7_uxn_device_h_l61_c25_66b2_x,
CONST_SR_7_uxn_device_h_l61_c25_66b2_return_output);

-- CONST_SR_6_uxn_device_h_l62_c21_a2a1
CONST_SR_6_uxn_device_h_l62_c21_a2a1 : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_device_h_l62_c21_a2a1_x,
CONST_SR_6_uxn_device_h_l62_c21_a2a1_return_output);

-- CONST_SR_5_uxn_device_h_l63_c22_aac8
CONST_SR_5_uxn_device_h_l63_c22_aac8 : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_device_h_l63_c22_aac8_x,
CONST_SR_5_uxn_device_h_l63_c22_aac8_return_output);

-- CONST_SR_4_uxn_device_h_l64_c22_e822
CONST_SR_4_uxn_device_h_l64_c22_e822 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l64_c22_e822_x,
CONST_SR_4_uxn_device_h_l64_c22_e822_return_output);

-- BIN_OP_AND_uxn_device_h_l65_c20_8d6d
BIN_OP_AND_uxn_device_h_l65_c20_8d6d : entity work.BIN_OP_AND_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l65_c20_8d6d_left,
BIN_OP_AND_uxn_device_h_l65_c20_8d6d_right,
BIN_OP_AND_uxn_device_h_l65_c20_8d6d_return_output);

-- CONST_SL_3_uxn_device_h_l65_c9_9025
CONST_SL_3_uxn_device_h_l65_c9_9025 : entity work.CONST_SL_3_uint16_t_0CLK_de264c78 port map (
CONST_SL_3_uxn_device_h_l65_c9_9025_x,
CONST_SL_3_uxn_device_h_l65_c9_9025_return_output);

-- BIN_OP_AND_uxn_device_h_l66_c20_14b8
BIN_OP_AND_uxn_device_h_l66_c20_14b8 : entity work.BIN_OP_AND_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l66_c20_14b8_left,
BIN_OP_AND_uxn_device_h_l66_c20_14b8_right,
BIN_OP_AND_uxn_device_h_l66_c20_14b8_return_output);

-- CONST_SL_2_uxn_device_h_l66_c9_c4c2
CONST_SL_2_uxn_device_h_l66_c9_c4c2 : entity work.CONST_SL_2_uint16_t_0CLK_de264c78 port map (
CONST_SL_2_uxn_device_h_l66_c9_c4c2_x,
CONST_SL_2_uxn_device_h_l66_c9_c4c2_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l67_c19_63d2
BIN_OP_INFERRED_MULT_uxn_device_h_l67_c19_63d2 : entity work.BIN_OP_INFERRED_MULT_int17_t_int2_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l67_c19_63d2_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l67_c19_63d2_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l67_c19_63d2_return_output);

-- MUX_uxn_device_h_l67_c9_4751
MUX_uxn_device_h_l67_c9_4751 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l67_c9_4751_cond,
MUX_uxn_device_h_l67_c9_4751_iftrue,
MUX_uxn_device_h_l67_c9_4751_iffalse,
MUX_uxn_device_h_l67_c9_4751_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l68_c19_c468
BIN_OP_INFERRED_MULT_uxn_device_h_l68_c19_c468 : entity work.BIN_OP_INFERRED_MULT_int17_t_int2_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l68_c19_c468_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l68_c19_c468_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l68_c19_c468_return_output);

-- MUX_uxn_device_h_l68_c9_386e
MUX_uxn_device_h_l68_c9_386e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l68_c9_386e_cond,
MUX_uxn_device_h_l68_c9_386e_iftrue,
MUX_uxn_device_h_l68_c9_386e_iffalse,
MUX_uxn_device_h_l68_c9_386e_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l69_c19_4f5c
BIN_OP_INFERRED_MULT_uxn_device_h_l69_c19_4f5c : entity work.BIN_OP_INFERRED_MULT_int17_t_int2_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l69_c19_4f5c_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l69_c19_4f5c_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l69_c19_4f5c_return_output);

-- MUX_uxn_device_h_l69_c9_b595
MUX_uxn_device_h_l69_c9_b595 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l69_c9_b595_cond,
MUX_uxn_device_h_l69_c9_b595_iftrue,
MUX_uxn_device_h_l69_c9_b595_iffalse,
MUX_uxn_device_h_l69_c9_b595_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l70_c19_5972
BIN_OP_INFERRED_MULT_uxn_device_h_l70_c19_5972 : entity work.BIN_OP_INFERRED_MULT_int17_t_int2_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l70_c19_5972_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l70_c19_5972_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l70_c19_5972_return_output);

-- MUX_uxn_device_h_l70_c9_f678
MUX_uxn_device_h_l70_c9_f678 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l70_c9_f678_cond,
MUX_uxn_device_h_l70_c9_f678_iftrue,
MUX_uxn_device_h_l70_c9_f678_iffalse,
MUX_uxn_device_h_l70_c9_f678_return_output);

-- BIN_OP_AND_uxn_device_h_l71_c20_feac
BIN_OP_AND_uxn_device_h_l71_c20_feac : entity work.BIN_OP_AND_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l71_c20_feac_left,
BIN_OP_AND_uxn_device_h_l71_c20_feac_right,
BIN_OP_AND_uxn_device_h_l71_c20_feac_return_output);

-- BIN_OP_AND_uxn_device_h_l71_c51_76c6
BIN_OP_AND_uxn_device_h_l71_c51_76c6 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l71_c51_76c6_left,
BIN_OP_AND_uxn_device_h_l71_c51_76c6_right,
BIN_OP_AND_uxn_device_h_l71_c51_76c6_return_output);

-- BIN_OP_GT_uxn_device_h_l71_c51_6ced
BIN_OP_GT_uxn_device_h_l71_c51_6ced : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l71_c51_6ced_left,
BIN_OP_GT_uxn_device_h_l71_c51_6ced_right,
BIN_OP_GT_uxn_device_h_l71_c51_6ced_return_output);

-- MUX_uxn_device_h_l71_c51_4c22
MUX_uxn_device_h_l71_c51_4c22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l71_c51_4c22_cond,
MUX_uxn_device_h_l71_c51_4c22_iftrue,
MUX_uxn_device_h_l71_c51_4c22_iffalse,
MUX_uxn_device_h_l71_c51_4c22_return_output);

-- BIN_OP_PLUS_uxn_device_h_l71_c45_5126
BIN_OP_PLUS_uxn_device_h_l71_c45_5126 : entity work.BIN_OP_PLUS_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l71_c45_5126_left,
BIN_OP_PLUS_uxn_device_h_l71_c45_5126_right,
BIN_OP_PLUS_uxn_device_h_l71_c45_5126_return_output);

-- BIN_OP_SL_uxn_device_h_l71_c20_ef4a
BIN_OP_SL_uxn_device_h_l71_c20_ef4a : entity work.BIN_OP_SL_uint16_t_uint2_t_0CLK_5af1a430 port map (
BIN_OP_SL_uxn_device_h_l71_c20_ef4a_left,
BIN_OP_SL_uxn_device_h_l71_c20_ef4a_right,
BIN_OP_SL_uxn_device_h_l71_c20_ef4a_return_output);

-- CONST_SR_4_uxn_device_h_l72_c22_c438
CONST_SR_4_uxn_device_h_l72_c22_c438 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l72_c22_c438_x,
CONST_SR_4_uxn_device_h_l72_c22_c438_return_output);



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
 BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_return_output,
 dyy_MUX_uxn_device_h_l60_c2_67f8_return_output,
 dy_MUX_uxn_device_h_l60_c2_67f8_return_output,
 flip_x_MUX_uxn_device_h_l60_c2_67f8_return_output,
 ctrl_mode_MUX_uxn_device_h_l60_c2_67f8_return_output,
 result_ram_address_MUX_uxn_device_h_l60_c2_67f8_return_output,
 result_is_blit_done_MUX_uxn_device_h_l60_c2_67f8_return_output,
 result_is_vram_write_MUX_uxn_device_h_l60_c2_67f8_return_output,
 result_vram_address_MUX_uxn_device_h_l60_c2_67f8_return_output,
 dx_MUX_uxn_device_h_l60_c2_67f8_return_output,
 dxy_MUX_uxn_device_h_l60_c2_67f8_return_output,
 dyx_MUX_uxn_device_h_l60_c2_67f8_return_output,
 i_phase_MUX_uxn_device_h_l60_c2_67f8_return_output,
 dxx_MUX_uxn_device_h_l60_c2_67f8_return_output,
 ram_addr_incr_MUX_uxn_device_h_l60_c2_67f8_return_output,
 layer_MUX_uxn_device_h_l60_c2_67f8_return_output,
 i_length_MUX_uxn_device_h_l60_c2_67f8_return_output,
 length_MUX_uxn_device_h_l60_c2_67f8_return_output,
 flip_y_MUX_uxn_device_h_l60_c2_67f8_return_output,
 CONST_SR_7_uxn_device_h_l61_c25_66b2_return_output,
 CONST_SR_6_uxn_device_h_l62_c21_a2a1_return_output,
 CONST_SR_5_uxn_device_h_l63_c22_aac8_return_output,
 CONST_SR_4_uxn_device_h_l64_c22_e822_return_output,
 BIN_OP_AND_uxn_device_h_l65_c20_8d6d_return_output,
 CONST_SL_3_uxn_device_h_l65_c9_9025_return_output,
 BIN_OP_AND_uxn_device_h_l66_c20_14b8_return_output,
 CONST_SL_2_uxn_device_h_l66_c9_c4c2_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l67_c19_63d2_return_output,
 MUX_uxn_device_h_l67_c9_4751_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l68_c19_c468_return_output,
 MUX_uxn_device_h_l68_c9_386e_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l69_c19_4f5c_return_output,
 MUX_uxn_device_h_l69_c9_b595_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l70_c19_5972_return_output,
 MUX_uxn_device_h_l70_c9_f678_return_output,
 BIN_OP_AND_uxn_device_h_l71_c20_feac_return_output,
 BIN_OP_AND_uxn_device_h_l71_c51_76c6_return_output,
 BIN_OP_GT_uxn_device_h_l71_c51_6ced_return_output,
 MUX_uxn_device_h_l71_c51_4c22_return_output,
 BIN_OP_PLUS_uxn_device_h_l71_c45_5126_return_output,
 BIN_OP_SL_uxn_device_h_l71_c20_ef4a_return_output,
 CONST_SR_4_uxn_device_h_l72_c22_c438_return_output)
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
 variable VAR_BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_return_output : unsigned(0 downto 0);
 variable VAR_dyy_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(15 downto 0);
 variable VAR_dyy_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(15 downto 0);
 variable VAR_dyy_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(15 downto 0);
 variable VAR_dyy_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
 variable VAR_dy_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(15 downto 0);
 variable VAR_dy_uxn_device_h_l66_c3_8e3c : unsigned(15 downto 0);
 variable VAR_dy_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(15 downto 0);
 variable VAR_dy_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(15 downto 0);
 variable VAR_dy_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
 variable VAR_result_ram_address_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_address_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_screen_blit_result_t_ram_address_d41d_uxn_device_h_l60_c2_67f8_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_address_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_address_uxn_device_h_l79_c3_52b2 : unsigned(15 downto 0);
 variable VAR_result_ram_address_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_address_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l60_c2_67f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l60_c2_67f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_TRUE_INPUT_MUX_CONST_REF_RD_uint32_t_screen_blit_result_t_vram_address_d41d_uxn_device_h_l60_c2_67f8_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l80_c3_ab67 : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
 variable VAR_dx_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(15 downto 0);
 variable VAR_dx_uxn_device_h_l65_c3_c25c : unsigned(15 downto 0);
 variable VAR_dx_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(15 downto 0);
 variable VAR_dx_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(15 downto 0);
 variable VAR_dx_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
 variable VAR_dxy_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(15 downto 0);
 variable VAR_dxy_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(15 downto 0);
 variable VAR_dxy_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(15 downto 0);
 variable VAR_dxy_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
 variable VAR_dyx_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(15 downto 0);
 variable VAR_dyx_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(15 downto 0);
 variable VAR_dyx_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(15 downto 0);
 variable VAR_dyx_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
 variable VAR_i_phase_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(11 downto 0);
 variable VAR_i_phase_uxn_device_h_l73_c3_abb5 : unsigned(11 downto 0);
 variable VAR_i_phase_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(11 downto 0);
 variable VAR_i_phase_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(11 downto 0);
 variable VAR_i_phase_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
 variable VAR_dxx_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(15 downto 0);
 variable VAR_dxx_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(15 downto 0);
 variable VAR_dxx_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(15 downto 0);
 variable VAR_dxx_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
 variable VAR_i_length_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(3 downto 0);
 variable VAR_i_length_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(3 downto 0);
 variable VAR_i_length_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(3 downto 0);
 variable VAR_i_length_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
 variable VAR_length_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(3 downto 0);
 variable VAR_length_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(3 downto 0);
 variable VAR_length_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(3 downto 0);
 variable VAR_length_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l60_c2_67f8_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l60_c2_67f8_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l60_c2_67f8_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l60_c2_67f8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l61_c25_66b2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l61_c25_66b2_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l61_c15_0295_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l62_c21_a2a1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l62_c21_a2a1_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l62_c11_9bbd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l63_c22_aac8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l63_c22_aac8_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l63_c12_df96_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l64_c22_e822_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l64_c22_e822_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l64_c12_2f00_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l65_c20_8d6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l65_c20_8d6d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l65_c20_8d6d_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_device_h_l65_c9_9b36_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_3_uxn_device_h_l65_c9_9025_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_3_uxn_device_h_l65_c9_9025_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l66_c20_14b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l66_c20_14b8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l66_c20_14b8_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_device_h_l66_c9_2229_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_2_uxn_device_h_l66_c9_c4c2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_2_uxn_device_h_l66_c9_c4c2_x : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l67_c9_4751_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l67_c9_4751_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l67_c9_4751_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l67_c19_63d2_left : signed(16 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l67_c19_63d2_right : signed(1 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l67_c19_63d2_return_output : signed(18 downto 0);
 variable VAR_MUX_uxn_device_h_l67_c9_4751_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l68_c9_386e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l68_c9_386e_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l68_c9_386e_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l68_c19_c468_left : signed(16 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l68_c19_c468_right : signed(1 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l68_c19_c468_return_output : signed(18 downto 0);
 variable VAR_MUX_uxn_device_h_l68_c9_386e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l69_c9_b595_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l69_c9_b595_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l69_c9_b595_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l69_c19_4f5c_left : signed(16 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l69_c19_4f5c_right : signed(1 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l69_c19_4f5c_return_output : signed(18 downto 0);
 variable VAR_MUX_uxn_device_h_l69_c9_b595_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l70_c9_f678_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l70_c9_f678_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l70_c9_f678_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l70_c19_5972_left : signed(16 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l70_c19_5972_right : signed(1 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l70_c19_5972_return_output : signed(18 downto 0);
 variable VAR_MUX_uxn_device_h_l70_c9_f678_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l71_c20_feac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l71_c20_feac_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l71_c20_feac_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_device_h_l71_c20_ef4a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l71_c45_5126_left : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l71_c51_4c22_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l71_c51_76c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l71_c51_76c6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l71_c51_76c6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l71_c51_6ced_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l71_c51_6ced_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l71_c51_6ced_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l71_c51_4c22_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l71_c51_4c22_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l71_c51_4c22_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l71_c45_5126_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l71_c45_5126_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_SL_uxn_device_h_l71_c20_ef4a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_SL_uxn_device_h_l71_c20_ef4a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l72_c22_c438_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l72_c22_c438_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l72_c12_ac82_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_8b29_uxn_device_h_l84_l47_DUPLICATE_6f5a_return_output : screen_blit_result_t;
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
     VAR_result_is_blit_done_MUX_uxn_device_h_l60_c2_67f8_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l70_c19_5972_right := to_signed(-1, 2);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l67_c19_63d2_right := to_signed(-1, 2);
     VAR_MUX_uxn_device_h_l71_c51_4c22_iffalse := to_unsigned(0, 1);
     VAR_i_phase_uxn_device_h_l73_c3_abb5 := resize(to_unsigned(0, 1), 12);
     VAR_i_phase_MUX_uxn_device_h_l60_c2_67f8_iftrue := VAR_i_phase_uxn_device_h_l73_c3_abb5;
     VAR_BIN_OP_PLUS_uxn_device_h_l71_c45_5126_left := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_device_h_l71_c51_6ced_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l65_c20_8d6d_right := to_unsigned(1, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l68_c19_c468_right := to_signed(-1, 2);
     VAR_result_ram_address_uxn_device_h_l79_c3_52b2 := resize(to_unsigned(0, 1), 16);
     VAR_result_ram_address_MUX_uxn_device_h_l60_c2_67f8_iffalse := VAR_result_ram_address_uxn_device_h_l79_c3_52b2;
     VAR_result_vram_address_uxn_device_h_l80_c3_ab67 := resize(to_unsigned(0, 1), 32);
     VAR_result_vram_address_MUX_uxn_device_h_l60_c2_67f8_iffalse := VAR_result_vram_address_uxn_device_h_l80_c3_ab67;
     VAR_BIN_OP_AND_uxn_device_h_l71_c20_feac_right := to_unsigned(4, 3);
     VAR_BIN_OP_AND_uxn_device_h_l71_c51_76c6_right := to_unsigned(128, 8);
     VAR_BIN_OP_AND_uxn_device_h_l66_c20_14b8_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_right := to_unsigned(0, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l69_c19_4f5c_right := to_signed(-1, 2);
     VAR_result_is_vram_write_MUX_uxn_device_h_l60_c2_67f8_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l71_c51_4c22_iftrue := to_unsigned(1, 1);

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
     VAR_BIN_OP_AND_uxn_device_h_l65_c20_8d6d_left := VAR_auto_advance;
     VAR_BIN_OP_AND_uxn_device_h_l66_c20_14b8_left := VAR_auto_advance;
     VAR_BIN_OP_AND_uxn_device_h_l71_c20_feac_left := VAR_auto_advance;
     VAR_CONST_SR_4_uxn_device_h_l72_c22_c438_x := VAR_auto_advance;
     REG_VAR_blending := blending;
     VAR_BIN_OP_AND_uxn_device_h_l71_c51_76c6_left := VAR_ctrl;
     VAR_CONST_SR_4_uxn_device_h_l64_c22_e822_x := VAR_ctrl;
     VAR_CONST_SR_5_uxn_device_h_l63_c22_aac8_x := VAR_ctrl;
     VAR_CONST_SR_6_uxn_device_h_l62_c21_a2a1_x := VAR_ctrl;
     VAR_CONST_SR_7_uxn_device_h_l61_c25_66b2_x := VAR_ctrl;
     VAR_ctrl_mode_MUX_uxn_device_h_l60_c2_67f8_iffalse := ctrl_mode;
     VAR_dx_MUX_uxn_device_h_l60_c2_67f8_iffalse := dx;
     VAR_dxx_MUX_uxn_device_h_l60_c2_67f8_iffalse := dxx;
     VAR_dxy_MUX_uxn_device_h_l60_c2_67f8_iffalse := dxy;
     VAR_dy_MUX_uxn_device_h_l60_c2_67f8_iffalse := dy;
     VAR_dyx_MUX_uxn_device_h_l60_c2_67f8_iffalse := dyx;
     VAR_dyy_MUX_uxn_device_h_l60_c2_67f8_iffalse := dyy;
     VAR_flip_x_MUX_uxn_device_h_l60_c2_67f8_iffalse := flip_x;
     VAR_flip_y_MUX_uxn_device_h_l60_c2_67f8_iffalse := flip_y;
     VAR_i_length_MUX_uxn_device_h_l60_c2_67f8_iffalse := i_length;
     VAR_i_phase_MUX_uxn_device_h_l60_c2_67f8_iffalse := i_phase;
     VAR_layer_MUX_uxn_device_h_l60_c2_67f8_iffalse := layer;
     VAR_length_MUX_uxn_device_h_l60_c2_67f8_iffalse := length;
     VAR_BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_left := VAR_phase;
     VAR_ram_addr_incr_MUX_uxn_device_h_l60_c2_67f8_iffalse := ram_addr_incr;
     -- CONST_SR_6[uxn_device_h_l62_c21_a2a1] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_device_h_l62_c21_a2a1_x <= VAR_CONST_SR_6_uxn_device_h_l62_c21_a2a1_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_device_h_l62_c21_a2a1_return_output := CONST_SR_6_uxn_device_h_l62_c21_a2a1_return_output;

     -- result_vram_address_TRUE_INPUT_MUX_CONST_REF_RD_uint32_t_screen_blit_result_t_vram_address_d41d[uxn_device_h_l60_c2_67f8] LATENCY=0
     VAR_result_vram_address_TRUE_INPUT_MUX_CONST_REF_RD_uint32_t_screen_blit_result_t_vram_address_d41d_uxn_device_h_l60_c2_67f8_return_output := result.vram_address;

     -- BIN_OP_EQ[uxn_device_h_l60_c6_f4f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_left <= VAR_BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_left;
     BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_right <= VAR_BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_return_output := BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_return_output;

     -- CONST_SR_4[uxn_device_h_l64_c22_e822] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l64_c22_e822_x <= VAR_CONST_SR_4_uxn_device_h_l64_c22_e822_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l64_c22_e822_return_output := CONST_SR_4_uxn_device_h_l64_c22_e822_return_output;

     -- CONST_SR_7[uxn_device_h_l61_c25_66b2] LATENCY=0
     -- Inputs
     CONST_SR_7_uxn_device_h_l61_c25_66b2_x <= VAR_CONST_SR_7_uxn_device_h_l61_c25_66b2_x;
     -- Outputs
     VAR_CONST_SR_7_uxn_device_h_l61_c25_66b2_return_output := CONST_SR_7_uxn_device_h_l61_c25_66b2_return_output;

     -- BIN_OP_AND[uxn_device_h_l71_c51_76c6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l71_c51_76c6_left <= VAR_BIN_OP_AND_uxn_device_h_l71_c51_76c6_left;
     BIN_OP_AND_uxn_device_h_l71_c51_76c6_right <= VAR_BIN_OP_AND_uxn_device_h_l71_c51_76c6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l71_c51_76c6_return_output := BIN_OP_AND_uxn_device_h_l71_c51_76c6_return_output;

     -- result_ram_address_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_screen_blit_result_t_ram_address_d41d[uxn_device_h_l60_c2_67f8] LATENCY=0
     VAR_result_ram_address_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_screen_blit_result_t_ram_address_d41d_uxn_device_h_l60_c2_67f8_return_output := result.ram_address;

     -- CONST_SR_5[uxn_device_h_l63_c22_aac8] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_device_h_l63_c22_aac8_x <= VAR_CONST_SR_5_uxn_device_h_l63_c22_aac8_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_device_h_l63_c22_aac8_return_output := CONST_SR_5_uxn_device_h_l63_c22_aac8_return_output;

     -- BIN_OP_AND[uxn_device_h_l71_c20_feac] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l71_c20_feac_left <= VAR_BIN_OP_AND_uxn_device_h_l71_c20_feac_left;
     BIN_OP_AND_uxn_device_h_l71_c20_feac_right <= VAR_BIN_OP_AND_uxn_device_h_l71_c20_feac_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l71_c20_feac_return_output := BIN_OP_AND_uxn_device_h_l71_c20_feac_return_output;

     -- BIN_OP_AND[uxn_device_h_l65_c20_8d6d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l65_c20_8d6d_left <= VAR_BIN_OP_AND_uxn_device_h_l65_c20_8d6d_left;
     BIN_OP_AND_uxn_device_h_l65_c20_8d6d_right <= VAR_BIN_OP_AND_uxn_device_h_l65_c20_8d6d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l65_c20_8d6d_return_output := BIN_OP_AND_uxn_device_h_l65_c20_8d6d_return_output;

     -- CONST_SR_4[uxn_device_h_l72_c22_c438] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l72_c22_c438_x <= VAR_CONST_SR_4_uxn_device_h_l72_c22_c438_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l72_c22_c438_return_output := CONST_SR_4_uxn_device_h_l72_c22_c438_return_output;

     -- result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d[uxn_device_h_l60_c2_67f8] LATENCY=0
     VAR_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l60_c2_67f8_return_output := result.is_vram_write;

     -- result_is_blit_done_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d[uxn_device_h_l60_c2_67f8] LATENCY=0
     VAR_result_is_blit_done_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l60_c2_67f8_return_output := result.is_blit_done;

     -- BIN_OP_AND[uxn_device_h_l66_c20_14b8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l66_c20_14b8_left <= VAR_BIN_OP_AND_uxn_device_h_l66_c20_14b8_left;
     BIN_OP_AND_uxn_device_h_l66_c20_14b8_right <= VAR_BIN_OP_AND_uxn_device_h_l66_c20_14b8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l66_c20_14b8_return_output := BIN_OP_AND_uxn_device_h_l66_c20_14b8_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SL_uxn_device_h_l71_c20_ef4a_left := resize(VAR_BIN_OP_AND_uxn_device_h_l71_c20_feac_return_output, 16);
     VAR_BIN_OP_GT_uxn_device_h_l71_c51_6ced_left := VAR_BIN_OP_AND_uxn_device_h_l71_c51_76c6_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l60_c2_67f8_cond := VAR_BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_return_output;
     VAR_dx_MUX_uxn_device_h_l60_c2_67f8_cond := VAR_BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_return_output;
     VAR_dxx_MUX_uxn_device_h_l60_c2_67f8_cond := VAR_BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_return_output;
     VAR_dxy_MUX_uxn_device_h_l60_c2_67f8_cond := VAR_BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_return_output;
     VAR_dy_MUX_uxn_device_h_l60_c2_67f8_cond := VAR_BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_return_output;
     VAR_dyx_MUX_uxn_device_h_l60_c2_67f8_cond := VAR_BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_return_output;
     VAR_dyy_MUX_uxn_device_h_l60_c2_67f8_cond := VAR_BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_return_output;
     VAR_flip_x_MUX_uxn_device_h_l60_c2_67f8_cond := VAR_BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_return_output;
     VAR_flip_y_MUX_uxn_device_h_l60_c2_67f8_cond := VAR_BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_return_output;
     VAR_i_length_MUX_uxn_device_h_l60_c2_67f8_cond := VAR_BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_return_output;
     VAR_i_phase_MUX_uxn_device_h_l60_c2_67f8_cond := VAR_BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_return_output;
     VAR_layer_MUX_uxn_device_h_l60_c2_67f8_cond := VAR_BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_return_output;
     VAR_length_MUX_uxn_device_h_l60_c2_67f8_cond := VAR_BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l60_c2_67f8_cond := VAR_BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_return_output;
     VAR_result_is_blit_done_MUX_uxn_device_h_l60_c2_67f8_cond := VAR_BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l60_c2_67f8_cond := VAR_BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_return_output;
     VAR_result_ram_address_MUX_uxn_device_h_l60_c2_67f8_cond := VAR_BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l60_c2_67f8_cond := VAR_BIN_OP_EQ_uxn_device_h_l60_c6_f4f0_return_output;
     VAR_result_is_blit_done_MUX_uxn_device_h_l60_c2_67f8_iftrue := VAR_result_is_blit_done_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l60_c2_67f8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l60_c2_67f8_iftrue := VAR_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l60_c2_67f8_return_output;
     VAR_result_ram_address_MUX_uxn_device_h_l60_c2_67f8_iftrue := VAR_result_ram_address_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_screen_blit_result_t_ram_address_d41d_uxn_device_h_l60_c2_67f8_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l60_c2_67f8_iftrue := VAR_result_vram_address_TRUE_INPUT_MUX_CONST_REF_RD_uint32_t_screen_blit_result_t_vram_address_d41d_uxn_device_h_l60_c2_67f8_return_output;
     -- CAST_TO_uint1_t[uxn_device_h_l62_c11_9bbd] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l62_c11_9bbd_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_6_uxn_device_h_l62_c21_a2a1_return_output);

     -- CAST_TO_uint1_t[uxn_device_h_l61_c15_0295] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l61_c15_0295_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_7_uxn_device_h_l61_c25_66b2_return_output);

     -- result_vram_address_MUX[uxn_device_h_l60_c2_67f8] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l60_c2_67f8_cond <= VAR_result_vram_address_MUX_uxn_device_h_l60_c2_67f8_cond;
     result_vram_address_MUX_uxn_device_h_l60_c2_67f8_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l60_c2_67f8_iftrue;
     result_vram_address_MUX_uxn_device_h_l60_c2_67f8_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l60_c2_67f8_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l60_c2_67f8_return_output := result_vram_address_MUX_uxn_device_h_l60_c2_67f8_return_output;

     -- i_phase_MUX[uxn_device_h_l60_c2_67f8] LATENCY=0
     -- Inputs
     i_phase_MUX_uxn_device_h_l60_c2_67f8_cond <= VAR_i_phase_MUX_uxn_device_h_l60_c2_67f8_cond;
     i_phase_MUX_uxn_device_h_l60_c2_67f8_iftrue <= VAR_i_phase_MUX_uxn_device_h_l60_c2_67f8_iftrue;
     i_phase_MUX_uxn_device_h_l60_c2_67f8_iffalse <= VAR_i_phase_MUX_uxn_device_h_l60_c2_67f8_iffalse;
     -- Outputs
     VAR_i_phase_MUX_uxn_device_h_l60_c2_67f8_return_output := i_phase_MUX_uxn_device_h_l60_c2_67f8_return_output;

     -- BIN_OP_GT[uxn_device_h_l71_c51_6ced] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l71_c51_6ced_left <= VAR_BIN_OP_GT_uxn_device_h_l71_c51_6ced_left;
     BIN_OP_GT_uxn_device_h_l71_c51_6ced_right <= VAR_BIN_OP_GT_uxn_device_h_l71_c51_6ced_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l71_c51_6ced_return_output := BIN_OP_GT_uxn_device_h_l71_c51_6ced_return_output;

     -- CAST_TO_uint16_t[uxn_device_h_l66_c9_2229] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_device_h_l66_c9_2229_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_BIN_OP_AND_uxn_device_h_l66_c20_14b8_return_output);

     -- CAST_TO_uint1_t[uxn_device_h_l63_c12_df96] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l63_c12_df96_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_5_uxn_device_h_l63_c22_aac8_return_output);

     -- result_is_vram_write_MUX[uxn_device_h_l60_c2_67f8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l60_c2_67f8_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l60_c2_67f8_cond;
     result_is_vram_write_MUX_uxn_device_h_l60_c2_67f8_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l60_c2_67f8_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l60_c2_67f8_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l60_c2_67f8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l60_c2_67f8_return_output := result_is_vram_write_MUX_uxn_device_h_l60_c2_67f8_return_output;

     -- result_ram_address_MUX[uxn_device_h_l60_c2_67f8] LATENCY=0
     -- Inputs
     result_ram_address_MUX_uxn_device_h_l60_c2_67f8_cond <= VAR_result_ram_address_MUX_uxn_device_h_l60_c2_67f8_cond;
     result_ram_address_MUX_uxn_device_h_l60_c2_67f8_iftrue <= VAR_result_ram_address_MUX_uxn_device_h_l60_c2_67f8_iftrue;
     result_ram_address_MUX_uxn_device_h_l60_c2_67f8_iffalse <= VAR_result_ram_address_MUX_uxn_device_h_l60_c2_67f8_iffalse;
     -- Outputs
     VAR_result_ram_address_MUX_uxn_device_h_l60_c2_67f8_return_output := result_ram_address_MUX_uxn_device_h_l60_c2_67f8_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l72_c12_ac82] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l72_c12_ac82_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uxn_device_h_l72_c22_c438_return_output);

     -- CAST_TO_uint1_t[uxn_device_h_l64_c12_2f00] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l64_c12_2f00_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_device_h_l64_c22_e822_return_output);

     -- result_is_blit_done_MUX[uxn_device_h_l60_c2_67f8] LATENCY=0
     -- Inputs
     result_is_blit_done_MUX_uxn_device_h_l60_c2_67f8_cond <= VAR_result_is_blit_done_MUX_uxn_device_h_l60_c2_67f8_cond;
     result_is_blit_done_MUX_uxn_device_h_l60_c2_67f8_iftrue <= VAR_result_is_blit_done_MUX_uxn_device_h_l60_c2_67f8_iftrue;
     result_is_blit_done_MUX_uxn_device_h_l60_c2_67f8_iffalse <= VAR_result_is_blit_done_MUX_uxn_device_h_l60_c2_67f8_iffalse;
     -- Outputs
     VAR_result_is_blit_done_MUX_uxn_device_h_l60_c2_67f8_return_output := result_is_blit_done_MUX_uxn_device_h_l60_c2_67f8_return_output;

     -- CAST_TO_uint16_t[uxn_device_h_l65_c9_9b36] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_device_h_l65_c9_9b36_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_BIN_OP_AND_uxn_device_h_l65_c20_8d6d_return_output);

     -- Submodule level 2
     VAR_MUX_uxn_device_h_l71_c51_4c22_cond := VAR_BIN_OP_GT_uxn_device_h_l71_c51_6ced_return_output;
     VAR_CONST_SL_3_uxn_device_h_l65_c9_9025_x := VAR_CAST_TO_uint16_t_uxn_device_h_l65_c9_9b36_return_output;
     VAR_CONST_SL_2_uxn_device_h_l66_c9_c4c2_x := VAR_CAST_TO_uint16_t_uxn_device_h_l66_c9_2229_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l60_c2_67f8_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l61_c15_0295_return_output;
     VAR_layer_MUX_uxn_device_h_l60_c2_67f8_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l62_c11_9bbd_return_output;
     VAR_MUX_uxn_device_h_l67_c9_4751_cond := VAR_CAST_TO_uint1_t_uxn_device_h_l63_c12_df96_return_output;
     VAR_MUX_uxn_device_h_l70_c9_f678_cond := VAR_CAST_TO_uint1_t_uxn_device_h_l63_c12_df96_return_output;
     VAR_flip_y_MUX_uxn_device_h_l60_c2_67f8_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l63_c12_df96_return_output;
     VAR_MUX_uxn_device_h_l68_c9_386e_cond := VAR_CAST_TO_uint1_t_uxn_device_h_l64_c12_2f00_return_output;
     VAR_MUX_uxn_device_h_l69_c9_b595_cond := VAR_CAST_TO_uint1_t_uxn_device_h_l64_c12_2f00_return_output;
     VAR_flip_x_MUX_uxn_device_h_l60_c2_67f8_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l64_c12_2f00_return_output;
     VAR_i_length_MUX_uxn_device_h_l60_c2_67f8_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l72_c12_ac82_return_output;
     VAR_length_MUX_uxn_device_h_l60_c2_67f8_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l72_c12_ac82_return_output;
     REG_VAR_i_phase := VAR_i_phase_MUX_uxn_device_h_l60_c2_67f8_return_output;
     -- CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_8b29_uxn_device_h_l84_l47_DUPLICATE_6f5a LATENCY=0
     VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_8b29_uxn_device_h_l84_l47_DUPLICATE_6f5a_return_output := CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_8b29(
     result,
     VAR_result_ram_address_MUX_uxn_device_h_l60_c2_67f8_return_output,
     VAR_result_is_blit_done_MUX_uxn_device_h_l60_c2_67f8_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l60_c2_67f8_return_output,
     VAR_result_vram_address_MUX_uxn_device_h_l60_c2_67f8_return_output);

     -- MUX[uxn_device_h_l71_c51_4c22] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l71_c51_4c22_cond <= VAR_MUX_uxn_device_h_l71_c51_4c22_cond;
     MUX_uxn_device_h_l71_c51_4c22_iftrue <= VAR_MUX_uxn_device_h_l71_c51_4c22_iftrue;
     MUX_uxn_device_h_l71_c51_4c22_iffalse <= VAR_MUX_uxn_device_h_l71_c51_4c22_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l71_c51_4c22_return_output := MUX_uxn_device_h_l71_c51_4c22_return_output;

     -- flip_x_MUX[uxn_device_h_l60_c2_67f8] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l60_c2_67f8_cond <= VAR_flip_x_MUX_uxn_device_h_l60_c2_67f8_cond;
     flip_x_MUX_uxn_device_h_l60_c2_67f8_iftrue <= VAR_flip_x_MUX_uxn_device_h_l60_c2_67f8_iftrue;
     flip_x_MUX_uxn_device_h_l60_c2_67f8_iffalse <= VAR_flip_x_MUX_uxn_device_h_l60_c2_67f8_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l60_c2_67f8_return_output := flip_x_MUX_uxn_device_h_l60_c2_67f8_return_output;

     -- layer_MUX[uxn_device_h_l60_c2_67f8] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l60_c2_67f8_cond <= VAR_layer_MUX_uxn_device_h_l60_c2_67f8_cond;
     layer_MUX_uxn_device_h_l60_c2_67f8_iftrue <= VAR_layer_MUX_uxn_device_h_l60_c2_67f8_iftrue;
     layer_MUX_uxn_device_h_l60_c2_67f8_iffalse <= VAR_layer_MUX_uxn_device_h_l60_c2_67f8_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l60_c2_67f8_return_output := layer_MUX_uxn_device_h_l60_c2_67f8_return_output;

     -- flip_y_MUX[uxn_device_h_l60_c2_67f8] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l60_c2_67f8_cond <= VAR_flip_y_MUX_uxn_device_h_l60_c2_67f8_cond;
     flip_y_MUX_uxn_device_h_l60_c2_67f8_iftrue <= VAR_flip_y_MUX_uxn_device_h_l60_c2_67f8_iftrue;
     flip_y_MUX_uxn_device_h_l60_c2_67f8_iffalse <= VAR_flip_y_MUX_uxn_device_h_l60_c2_67f8_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l60_c2_67f8_return_output := flip_y_MUX_uxn_device_h_l60_c2_67f8_return_output;

     -- CONST_SL_2[uxn_device_h_l66_c9_c4c2] LATENCY=0
     -- Inputs
     CONST_SL_2_uxn_device_h_l66_c9_c4c2_x <= VAR_CONST_SL_2_uxn_device_h_l66_c9_c4c2_x;
     -- Outputs
     VAR_CONST_SL_2_uxn_device_h_l66_c9_c4c2_return_output := CONST_SL_2_uxn_device_h_l66_c9_c4c2_return_output;

     -- CONST_SL_3[uxn_device_h_l65_c9_9025] LATENCY=0
     -- Inputs
     CONST_SL_3_uxn_device_h_l65_c9_9025_x <= VAR_CONST_SL_3_uxn_device_h_l65_c9_9025_x;
     -- Outputs
     VAR_CONST_SL_3_uxn_device_h_l65_c9_9025_return_output := CONST_SL_3_uxn_device_h_l65_c9_9025_return_output;

     -- length_MUX[uxn_device_h_l60_c2_67f8] LATENCY=0
     -- Inputs
     length_MUX_uxn_device_h_l60_c2_67f8_cond <= VAR_length_MUX_uxn_device_h_l60_c2_67f8_cond;
     length_MUX_uxn_device_h_l60_c2_67f8_iftrue <= VAR_length_MUX_uxn_device_h_l60_c2_67f8_iftrue;
     length_MUX_uxn_device_h_l60_c2_67f8_iffalse <= VAR_length_MUX_uxn_device_h_l60_c2_67f8_iffalse;
     -- Outputs
     VAR_length_MUX_uxn_device_h_l60_c2_67f8_return_output := length_MUX_uxn_device_h_l60_c2_67f8_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l60_c2_67f8] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l60_c2_67f8_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l60_c2_67f8_cond;
     ctrl_mode_MUX_uxn_device_h_l60_c2_67f8_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l60_c2_67f8_iftrue;
     ctrl_mode_MUX_uxn_device_h_l60_c2_67f8_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l60_c2_67f8_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l60_c2_67f8_return_output := ctrl_mode_MUX_uxn_device_h_l60_c2_67f8_return_output;

     -- i_length_MUX[uxn_device_h_l60_c2_67f8] LATENCY=0
     -- Inputs
     i_length_MUX_uxn_device_h_l60_c2_67f8_cond <= VAR_i_length_MUX_uxn_device_h_l60_c2_67f8_cond;
     i_length_MUX_uxn_device_h_l60_c2_67f8_iftrue <= VAR_i_length_MUX_uxn_device_h_l60_c2_67f8_iftrue;
     i_length_MUX_uxn_device_h_l60_c2_67f8_iffalse <= VAR_i_length_MUX_uxn_device_h_l60_c2_67f8_iffalse;
     -- Outputs
     VAR_i_length_MUX_uxn_device_h_l60_c2_67f8_return_output := i_length_MUX_uxn_device_h_l60_c2_67f8_return_output;

     -- Submodule level 3
     REG_VAR_result := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_8b29_uxn_device_h_l84_l47_DUPLICATE_6f5a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_8b29_uxn_device_h_l84_l47_DUPLICATE_6f5a_return_output;
     VAR_dy_uxn_device_h_l66_c3_8e3c := VAR_CONST_SL_2_uxn_device_h_l66_c9_c4c2_return_output;
     VAR_dx_uxn_device_h_l65_c3_c25c := VAR_CONST_SL_3_uxn_device_h_l65_c9_9025_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l71_c45_5126_right := VAR_MUX_uxn_device_h_l71_c51_4c22_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l60_c2_67f8_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l60_c2_67f8_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l60_c2_67f8_return_output;
     REG_VAR_i_length := VAR_i_length_MUX_uxn_device_h_l60_c2_67f8_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l60_c2_67f8_return_output;
     REG_VAR_length := VAR_length_MUX_uxn_device_h_l60_c2_67f8_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l67_c19_63d2_left := signed(std_logic_vector(resize(VAR_dx_uxn_device_h_l65_c3_c25c, 17)));
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l69_c19_4f5c_left := signed(std_logic_vector(resize(VAR_dx_uxn_device_h_l65_c3_c25c, 17)));
     VAR_MUX_uxn_device_h_l67_c9_4751_iffalse := VAR_dx_uxn_device_h_l65_c3_c25c;
     VAR_MUX_uxn_device_h_l69_c9_b595_iffalse := VAR_dx_uxn_device_h_l65_c3_c25c;
     VAR_dx_MUX_uxn_device_h_l60_c2_67f8_iftrue := VAR_dx_uxn_device_h_l65_c3_c25c;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l68_c19_c468_left := signed(std_logic_vector(resize(VAR_dy_uxn_device_h_l66_c3_8e3c, 17)));
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l70_c19_5972_left := signed(std_logic_vector(resize(VAR_dy_uxn_device_h_l66_c3_8e3c, 17)));
     VAR_MUX_uxn_device_h_l68_c9_386e_iffalse := VAR_dy_uxn_device_h_l66_c3_8e3c;
     VAR_MUX_uxn_device_h_l70_c9_f678_iffalse := VAR_dy_uxn_device_h_l66_c3_8e3c;
     VAR_dy_MUX_uxn_device_h_l60_c2_67f8_iftrue := VAR_dy_uxn_device_h_l66_c3_8e3c;
     -- dx_MUX[uxn_device_h_l60_c2_67f8] LATENCY=0
     -- Inputs
     dx_MUX_uxn_device_h_l60_c2_67f8_cond <= VAR_dx_MUX_uxn_device_h_l60_c2_67f8_cond;
     dx_MUX_uxn_device_h_l60_c2_67f8_iftrue <= VAR_dx_MUX_uxn_device_h_l60_c2_67f8_iftrue;
     dx_MUX_uxn_device_h_l60_c2_67f8_iffalse <= VAR_dx_MUX_uxn_device_h_l60_c2_67f8_iffalse;
     -- Outputs
     VAR_dx_MUX_uxn_device_h_l60_c2_67f8_return_output := dx_MUX_uxn_device_h_l60_c2_67f8_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l69_c19_4f5c] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l69_c19_4f5c_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l69_c19_4f5c_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l69_c19_4f5c_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l69_c19_4f5c_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l69_c19_4f5c_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l69_c19_4f5c_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l68_c19_c468] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l68_c19_c468_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l68_c19_c468_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l68_c19_c468_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l68_c19_c468_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l68_c19_c468_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l68_c19_c468_return_output;

     -- dy_MUX[uxn_device_h_l60_c2_67f8] LATENCY=0
     -- Inputs
     dy_MUX_uxn_device_h_l60_c2_67f8_cond <= VAR_dy_MUX_uxn_device_h_l60_c2_67f8_cond;
     dy_MUX_uxn_device_h_l60_c2_67f8_iftrue <= VAR_dy_MUX_uxn_device_h_l60_c2_67f8_iftrue;
     dy_MUX_uxn_device_h_l60_c2_67f8_iffalse <= VAR_dy_MUX_uxn_device_h_l60_c2_67f8_iffalse;
     -- Outputs
     VAR_dy_MUX_uxn_device_h_l60_c2_67f8_return_output := dy_MUX_uxn_device_h_l60_c2_67f8_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l71_c45_5126] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l71_c45_5126_left <= VAR_BIN_OP_PLUS_uxn_device_h_l71_c45_5126_left;
     BIN_OP_PLUS_uxn_device_h_l71_c45_5126_right <= VAR_BIN_OP_PLUS_uxn_device_h_l71_c45_5126_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l71_c45_5126_return_output := BIN_OP_PLUS_uxn_device_h_l71_c45_5126_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l70_c19_5972] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l70_c19_5972_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l70_c19_5972_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l70_c19_5972_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l70_c19_5972_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l70_c19_5972_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l70_c19_5972_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l67_c19_63d2] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l67_c19_63d2_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l67_c19_63d2_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l67_c19_63d2_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l67_c19_63d2_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l67_c19_63d2_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l67_c19_63d2_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l67_c9_4751_iftrue := resize(unsigned(std_logic_vector(VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l67_c19_63d2_return_output)),16);
     VAR_MUX_uxn_device_h_l68_c9_386e_iftrue := resize(unsigned(std_logic_vector(VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l68_c19_c468_return_output)),16);
     VAR_MUX_uxn_device_h_l69_c9_b595_iftrue := resize(unsigned(std_logic_vector(VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l69_c19_4f5c_return_output)),16);
     VAR_MUX_uxn_device_h_l70_c9_f678_iftrue := resize(unsigned(std_logic_vector(VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l70_c19_5972_return_output)),16);
     VAR_BIN_OP_SL_uxn_device_h_l71_c20_ef4a_right := VAR_BIN_OP_PLUS_uxn_device_h_l71_c45_5126_return_output;
     REG_VAR_dx := VAR_dx_MUX_uxn_device_h_l60_c2_67f8_return_output;
     REG_VAR_dy := VAR_dy_MUX_uxn_device_h_l60_c2_67f8_return_output;
     -- MUX[uxn_device_h_l70_c9_f678] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l70_c9_f678_cond <= VAR_MUX_uxn_device_h_l70_c9_f678_cond;
     MUX_uxn_device_h_l70_c9_f678_iftrue <= VAR_MUX_uxn_device_h_l70_c9_f678_iftrue;
     MUX_uxn_device_h_l70_c9_f678_iffalse <= VAR_MUX_uxn_device_h_l70_c9_f678_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l70_c9_f678_return_output := MUX_uxn_device_h_l70_c9_f678_return_output;

     -- MUX[uxn_device_h_l68_c9_386e] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l68_c9_386e_cond <= VAR_MUX_uxn_device_h_l68_c9_386e_cond;
     MUX_uxn_device_h_l68_c9_386e_iftrue <= VAR_MUX_uxn_device_h_l68_c9_386e_iftrue;
     MUX_uxn_device_h_l68_c9_386e_iffalse <= VAR_MUX_uxn_device_h_l68_c9_386e_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l68_c9_386e_return_output := MUX_uxn_device_h_l68_c9_386e_return_output;

     -- MUX[uxn_device_h_l67_c9_4751] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l67_c9_4751_cond <= VAR_MUX_uxn_device_h_l67_c9_4751_cond;
     MUX_uxn_device_h_l67_c9_4751_iftrue <= VAR_MUX_uxn_device_h_l67_c9_4751_iftrue;
     MUX_uxn_device_h_l67_c9_4751_iffalse <= VAR_MUX_uxn_device_h_l67_c9_4751_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l67_c9_4751_return_output := MUX_uxn_device_h_l67_c9_4751_return_output;

     -- MUX[uxn_device_h_l69_c9_b595] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l69_c9_b595_cond <= VAR_MUX_uxn_device_h_l69_c9_b595_cond;
     MUX_uxn_device_h_l69_c9_b595_iftrue <= VAR_MUX_uxn_device_h_l69_c9_b595_iftrue;
     MUX_uxn_device_h_l69_c9_b595_iffalse <= VAR_MUX_uxn_device_h_l69_c9_b595_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l69_c9_b595_return_output := MUX_uxn_device_h_l69_c9_b595_return_output;

     -- BIN_OP_SL[uxn_device_h_l71_c20_ef4a] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_device_h_l71_c20_ef4a_left <= VAR_BIN_OP_SL_uxn_device_h_l71_c20_ef4a_left;
     BIN_OP_SL_uxn_device_h_l71_c20_ef4a_right <= VAR_BIN_OP_SL_uxn_device_h_l71_c20_ef4a_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_device_h_l71_c20_ef4a_return_output := BIN_OP_SL_uxn_device_h_l71_c20_ef4a_return_output;

     -- Submodule level 5
     VAR_ram_addr_incr_MUX_uxn_device_h_l60_c2_67f8_iftrue := VAR_BIN_OP_SL_uxn_device_h_l71_c20_ef4a_return_output;
     VAR_dxy_MUX_uxn_device_h_l60_c2_67f8_iftrue := VAR_MUX_uxn_device_h_l67_c9_4751_return_output;
     VAR_dyx_MUX_uxn_device_h_l60_c2_67f8_iftrue := VAR_MUX_uxn_device_h_l68_c9_386e_return_output;
     VAR_dxx_MUX_uxn_device_h_l60_c2_67f8_iftrue := VAR_MUX_uxn_device_h_l69_c9_b595_return_output;
     VAR_dyy_MUX_uxn_device_h_l60_c2_67f8_iftrue := VAR_MUX_uxn_device_h_l70_c9_f678_return_output;
     -- dyx_MUX[uxn_device_h_l60_c2_67f8] LATENCY=0
     -- Inputs
     dyx_MUX_uxn_device_h_l60_c2_67f8_cond <= VAR_dyx_MUX_uxn_device_h_l60_c2_67f8_cond;
     dyx_MUX_uxn_device_h_l60_c2_67f8_iftrue <= VAR_dyx_MUX_uxn_device_h_l60_c2_67f8_iftrue;
     dyx_MUX_uxn_device_h_l60_c2_67f8_iffalse <= VAR_dyx_MUX_uxn_device_h_l60_c2_67f8_iffalse;
     -- Outputs
     VAR_dyx_MUX_uxn_device_h_l60_c2_67f8_return_output := dyx_MUX_uxn_device_h_l60_c2_67f8_return_output;

     -- dxy_MUX[uxn_device_h_l60_c2_67f8] LATENCY=0
     -- Inputs
     dxy_MUX_uxn_device_h_l60_c2_67f8_cond <= VAR_dxy_MUX_uxn_device_h_l60_c2_67f8_cond;
     dxy_MUX_uxn_device_h_l60_c2_67f8_iftrue <= VAR_dxy_MUX_uxn_device_h_l60_c2_67f8_iftrue;
     dxy_MUX_uxn_device_h_l60_c2_67f8_iffalse <= VAR_dxy_MUX_uxn_device_h_l60_c2_67f8_iffalse;
     -- Outputs
     VAR_dxy_MUX_uxn_device_h_l60_c2_67f8_return_output := dxy_MUX_uxn_device_h_l60_c2_67f8_return_output;

     -- dyy_MUX[uxn_device_h_l60_c2_67f8] LATENCY=0
     -- Inputs
     dyy_MUX_uxn_device_h_l60_c2_67f8_cond <= VAR_dyy_MUX_uxn_device_h_l60_c2_67f8_cond;
     dyy_MUX_uxn_device_h_l60_c2_67f8_iftrue <= VAR_dyy_MUX_uxn_device_h_l60_c2_67f8_iftrue;
     dyy_MUX_uxn_device_h_l60_c2_67f8_iffalse <= VAR_dyy_MUX_uxn_device_h_l60_c2_67f8_iffalse;
     -- Outputs
     VAR_dyy_MUX_uxn_device_h_l60_c2_67f8_return_output := dyy_MUX_uxn_device_h_l60_c2_67f8_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l60_c2_67f8] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l60_c2_67f8_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l60_c2_67f8_cond;
     ram_addr_incr_MUX_uxn_device_h_l60_c2_67f8_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l60_c2_67f8_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l60_c2_67f8_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l60_c2_67f8_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l60_c2_67f8_return_output := ram_addr_incr_MUX_uxn_device_h_l60_c2_67f8_return_output;

     -- dxx_MUX[uxn_device_h_l60_c2_67f8] LATENCY=0
     -- Inputs
     dxx_MUX_uxn_device_h_l60_c2_67f8_cond <= VAR_dxx_MUX_uxn_device_h_l60_c2_67f8_cond;
     dxx_MUX_uxn_device_h_l60_c2_67f8_iftrue <= VAR_dxx_MUX_uxn_device_h_l60_c2_67f8_iftrue;
     dxx_MUX_uxn_device_h_l60_c2_67f8_iffalse <= VAR_dxx_MUX_uxn_device_h_l60_c2_67f8_iffalse;
     -- Outputs
     VAR_dxx_MUX_uxn_device_h_l60_c2_67f8_return_output := dxx_MUX_uxn_device_h_l60_c2_67f8_return_output;

     -- Submodule level 6
     REG_VAR_dxx := VAR_dxx_MUX_uxn_device_h_l60_c2_67f8_return_output;
     REG_VAR_dxy := VAR_dxy_MUX_uxn_device_h_l60_c2_67f8_return_output;
     REG_VAR_dyx := VAR_dyx_MUX_uxn_device_h_l60_c2_67f8_return_output;
     REG_VAR_dyy := VAR_dyy_MUX_uxn_device_h_l60_c2_67f8_return_output;
     REG_VAR_ram_addr_incr := VAR_ram_addr_incr_MUX_uxn_device_h_l60_c2_67f8_return_output;
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
