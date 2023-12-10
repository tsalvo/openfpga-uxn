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
-- Submodules: 84
entity palette_snoop_0CLK_26f67814 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_ram_address : in unsigned(7 downto 0);
 device_ram_value : in unsigned(7 downto 0);
 is_device_ram_write : in unsigned(0 downto 0);
 gpu_step_color : in unsigned(1 downto 0);
 return_output : out unsigned(15 downto 0));
end palette_snoop_0CLK_26f67814;
architecture arch of palette_snoop_0CLK_26f67814 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal color0 : unsigned(11 downto 0) := to_unsigned(4095, 12);
signal color1 : unsigned(11 downto 0) := to_unsigned(0, 12);
signal color2 : unsigned(11 downto 0) := to_unsigned(2011, 12);
signal color3 : unsigned(11 downto 0) := to_unsigned(3938, 12);
signal color_cmp_0 : unsigned(3 downto 0) := to_unsigned(0, 4);
signal color_cmp_1 : unsigned(3 downto 0) := to_unsigned(0, 4);
signal tmp12 : unsigned(11 downto 0) := to_unsigned(0, 12);
signal result : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_color0 : unsigned(11 downto 0);
signal REG_COMB_color1 : unsigned(11 downto 0);
signal REG_COMB_color2 : unsigned(11 downto 0);
signal REG_COMB_color3 : unsigned(11 downto 0);
signal REG_COMB_color_cmp_0 : unsigned(3 downto 0);
signal REG_COMB_color_cmp_1 : unsigned(3 downto 0);
signal REG_COMB_tmp12 : unsigned(11 downto 0);
signal REG_COMB_result : unsigned(15 downto 0);

-- Each function instance gets signals
-- color0_MUX[uxn_c_l212_c2_95b0]
signal color0_MUX_uxn_c_l212_c2_95b0_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l212_c2_95b0_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l212_c2_95b0_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l212_c2_95b0_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l212_c2_95b0]
signal tmp12_MUX_uxn_c_l212_c2_95b0_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l212_c2_95b0_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l212_c2_95b0_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l212_c2_95b0_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l212_c2_95b0]
signal color3_MUX_uxn_c_l212_c2_95b0_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l212_c2_95b0_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l212_c2_95b0_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l212_c2_95b0_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l212_c2_95b0]
signal color2_MUX_uxn_c_l212_c2_95b0_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l212_c2_95b0_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l212_c2_95b0_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l212_c2_95b0_return_output : unsigned(11 downto 0);

-- color_cmp_0_MUX[uxn_c_l212_c2_95b0]
signal color_cmp_0_MUX_uxn_c_l212_c2_95b0_cond : unsigned(0 downto 0);
signal color_cmp_0_MUX_uxn_c_l212_c2_95b0_iftrue : unsigned(3 downto 0);
signal color_cmp_0_MUX_uxn_c_l212_c2_95b0_iffalse : unsigned(3 downto 0);
signal color_cmp_0_MUX_uxn_c_l212_c2_95b0_return_output : unsigned(3 downto 0);

-- color_cmp_1_MUX[uxn_c_l212_c2_95b0]
signal color_cmp_1_MUX_uxn_c_l212_c2_95b0_cond : unsigned(0 downto 0);
signal color_cmp_1_MUX_uxn_c_l212_c2_95b0_iftrue : unsigned(3 downto 0);
signal color_cmp_1_MUX_uxn_c_l212_c2_95b0_iffalse : unsigned(3 downto 0);
signal color_cmp_1_MUX_uxn_c_l212_c2_95b0_return_output : unsigned(3 downto 0);

-- color1_MUX[uxn_c_l212_c2_95b0]
signal color1_MUX_uxn_c_l212_c2_95b0_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l212_c2_95b0_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l212_c2_95b0_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l212_c2_95b0_return_output : unsigned(11 downto 0);

-- CONST_SR_4[uxn_c_l213_c27_e3be]
signal CONST_SR_4_uxn_c_l213_c27_e3be_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l213_c27_e3be_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l215_c7_0508]
signal BIN_OP_EQ_uxn_c_l215_c7_0508_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l215_c7_0508_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l215_c7_0508_return_output : unsigned(0 downto 0);

-- color0_MUX[uxn_c_l215_c3_a654]
signal color0_MUX_uxn_c_l215_c3_a654_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l215_c3_a654_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l215_c3_a654_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l215_c3_a654_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l215_c3_a654]
signal tmp12_MUX_uxn_c_l215_c3_a654_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l215_c3_a654_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l215_c3_a654_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l215_c3_a654_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l215_c3_a654]
signal color3_MUX_uxn_c_l215_c3_a654_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l215_c3_a654_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l215_c3_a654_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l215_c3_a654_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l215_c3_a654]
signal color2_MUX_uxn_c_l215_c3_a654_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l215_c3_a654_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l215_c3_a654_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l215_c3_a654_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l215_c3_a654]
signal color1_MUX_uxn_c_l215_c3_a654_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l215_c3_a654_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l215_c3_a654_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l215_c3_a654_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l217_c4_3f78]
signal CONST_SL_8_uxn_c_l217_c4_3f78_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l217_c4_3f78_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l218_c4_3567]
signal BIN_OP_AND_uxn_c_l218_c4_3567_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l218_c4_3567_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l218_c4_3567_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l219_c4_a63e]
signal BIN_OP_OR_uxn_c_l219_c4_a63e_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l219_c4_a63e_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l219_c4_a63e_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l222_c4_4251]
signal CONST_SL_8_uxn_c_l222_c4_4251_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l222_c4_4251_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l223_c4_abfd]
signal BIN_OP_AND_uxn_c_l223_c4_abfd_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l223_c4_abfd_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l223_c4_abfd_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l224_c4_c208]
signal BIN_OP_OR_uxn_c_l224_c4_c208_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l224_c4_c208_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l224_c4_c208_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l226_c12_5fd1]
signal BIN_OP_EQ_uxn_c_l226_c12_5fd1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l226_c12_5fd1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l226_c12_5fd1_return_output : unsigned(0 downto 0);

-- color0_MUX[uxn_c_l226_c8_7a2b]
signal color0_MUX_uxn_c_l226_c8_7a2b_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l226_c8_7a2b_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l226_c8_7a2b_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l226_c8_7a2b_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l226_c8_7a2b]
signal tmp12_MUX_uxn_c_l226_c8_7a2b_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l226_c8_7a2b_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l226_c8_7a2b_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l226_c8_7a2b_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l226_c8_7a2b]
signal color3_MUX_uxn_c_l226_c8_7a2b_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l226_c8_7a2b_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l226_c8_7a2b_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l226_c8_7a2b_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l226_c8_7a2b]
signal color2_MUX_uxn_c_l226_c8_7a2b_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l226_c8_7a2b_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l226_c8_7a2b_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l226_c8_7a2b_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l226_c8_7a2b]
signal color1_MUX_uxn_c_l226_c8_7a2b_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l226_c8_7a2b_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l226_c8_7a2b_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l226_c8_7a2b_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l228_c4_17bc]
signal CONST_SL_8_uxn_c_l228_c4_17bc_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l228_c4_17bc_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l229_c4_ab44]
signal BIN_OP_AND_uxn_c_l229_c4_ab44_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l229_c4_ab44_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l229_c4_ab44_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l230_c4_2597]
signal BIN_OP_OR_uxn_c_l230_c4_2597_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l230_c4_2597_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l230_c4_2597_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l233_c4_3661]
signal CONST_SL_8_uxn_c_l233_c4_3661_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l233_c4_3661_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l234_c4_09f6]
signal BIN_OP_AND_uxn_c_l234_c4_09f6_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l234_c4_09f6_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l234_c4_09f6_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l235_c4_b0ec]
signal BIN_OP_OR_uxn_c_l235_c4_b0ec_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l235_c4_b0ec_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l235_c4_b0ec_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l237_c12_d08f]
signal BIN_OP_EQ_uxn_c_l237_c12_d08f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l237_c12_d08f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l237_c12_d08f_return_output : unsigned(0 downto 0);

-- color0_MUX[uxn_c_l237_c8_a0d5]
signal color0_MUX_uxn_c_l237_c8_a0d5_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l237_c8_a0d5_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l237_c8_a0d5_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l237_c8_a0d5_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l237_c8_a0d5]
signal tmp12_MUX_uxn_c_l237_c8_a0d5_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l237_c8_a0d5_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l237_c8_a0d5_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l237_c8_a0d5_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l237_c8_a0d5]
signal color3_MUX_uxn_c_l237_c8_a0d5_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l237_c8_a0d5_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l237_c8_a0d5_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l237_c8_a0d5_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l237_c8_a0d5]
signal color2_MUX_uxn_c_l237_c8_a0d5_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l237_c8_a0d5_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l237_c8_a0d5_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l237_c8_a0d5_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l237_c8_a0d5]
signal color1_MUX_uxn_c_l237_c8_a0d5_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l237_c8_a0d5_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l237_c8_a0d5_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l237_c8_a0d5_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l239_c4_4cb6]
signal CONST_SL_4_uxn_c_l239_c4_4cb6_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l239_c4_4cb6_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l240_c4_2f30]
signal BIN_OP_AND_uxn_c_l240_c4_2f30_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l240_c4_2f30_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l240_c4_2f30_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l241_c4_ea03]
signal BIN_OP_OR_uxn_c_l241_c4_ea03_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l241_c4_ea03_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l241_c4_ea03_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l244_c4_3ad0]
signal CONST_SL_4_uxn_c_l244_c4_3ad0_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l244_c4_3ad0_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l245_c4_504d]
signal BIN_OP_AND_uxn_c_l245_c4_504d_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l245_c4_504d_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l245_c4_504d_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l246_c4_6f41]
signal BIN_OP_OR_uxn_c_l246_c4_6f41_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l246_c4_6f41_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l246_c4_6f41_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l248_c12_f8de]
signal BIN_OP_EQ_uxn_c_l248_c12_f8de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l248_c12_f8de_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l248_c12_f8de_return_output : unsigned(0 downto 0);

-- color0_MUX[uxn_c_l248_c8_4853]
signal color0_MUX_uxn_c_l248_c8_4853_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l248_c8_4853_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l248_c8_4853_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l248_c8_4853_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l248_c8_4853]
signal tmp12_MUX_uxn_c_l248_c8_4853_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l248_c8_4853_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l248_c8_4853_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l248_c8_4853_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l248_c8_4853]
signal color3_MUX_uxn_c_l248_c8_4853_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l248_c8_4853_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l248_c8_4853_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l248_c8_4853_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l248_c8_4853]
signal color2_MUX_uxn_c_l248_c8_4853_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l248_c8_4853_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l248_c8_4853_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l248_c8_4853_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l248_c8_4853]
signal color1_MUX_uxn_c_l248_c8_4853_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l248_c8_4853_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l248_c8_4853_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l248_c8_4853_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l250_c4_9e96]
signal CONST_SL_4_uxn_c_l250_c4_9e96_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l250_c4_9e96_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l251_c4_9935]
signal BIN_OP_AND_uxn_c_l251_c4_9935_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l251_c4_9935_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l251_c4_9935_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l252_c4_9c1c]
signal BIN_OP_OR_uxn_c_l252_c4_9c1c_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l252_c4_9c1c_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l252_c4_9c1c_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l255_c4_8e8d]
signal CONST_SL_4_uxn_c_l255_c4_8e8d_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l255_c4_8e8d_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l256_c4_5435]
signal BIN_OP_AND_uxn_c_l256_c4_5435_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l256_c4_5435_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l256_c4_5435_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l257_c4_6b1a]
signal BIN_OP_OR_uxn_c_l257_c4_6b1a_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l257_c4_6b1a_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l257_c4_6b1a_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l259_c12_b8ba]
signal BIN_OP_EQ_uxn_c_l259_c12_b8ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l259_c12_b8ba_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l259_c12_b8ba_return_output : unsigned(0 downto 0);

-- color0_MUX[uxn_c_l259_c8_3ae0]
signal color0_MUX_uxn_c_l259_c8_3ae0_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l259_c8_3ae0_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l259_c8_3ae0_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l259_c8_3ae0_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l259_c8_3ae0]
signal tmp12_MUX_uxn_c_l259_c8_3ae0_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l259_c8_3ae0_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l259_c8_3ae0_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l259_c8_3ae0_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l259_c8_3ae0]
signal color3_MUX_uxn_c_l259_c8_3ae0_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l259_c8_3ae0_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l259_c8_3ae0_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l259_c8_3ae0_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l259_c8_3ae0]
signal color2_MUX_uxn_c_l259_c8_3ae0_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l259_c8_3ae0_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l259_c8_3ae0_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l259_c8_3ae0_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l259_c8_3ae0]
signal color1_MUX_uxn_c_l259_c8_3ae0_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l259_c8_3ae0_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l259_c8_3ae0_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l259_c8_3ae0_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l261_c4_4229]
signal BIN_OP_AND_uxn_c_l261_c4_4229_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l261_c4_4229_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l261_c4_4229_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l262_c4_b53c]
signal BIN_OP_OR_uxn_c_l262_c4_b53c_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l262_c4_b53c_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l262_c4_b53c_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l265_c4_eeee]
signal BIN_OP_AND_uxn_c_l265_c4_eeee_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l265_c4_eeee_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l265_c4_eeee_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l266_c4_1209]
signal BIN_OP_OR_uxn_c_l266_c4_1209_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l266_c4_1209_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l266_c4_1209_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l268_c12_d740]
signal BIN_OP_EQ_uxn_c_l268_c12_d740_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l268_c12_d740_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l268_c12_d740_return_output : unsigned(0 downto 0);

-- tmp12_MUX[uxn_c_l268_c8_8143]
signal tmp12_MUX_uxn_c_l268_c8_8143_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l268_c8_8143_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l268_c8_8143_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l268_c8_8143_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l268_c8_8143]
signal color3_MUX_uxn_c_l268_c8_8143_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l268_c8_8143_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l268_c8_8143_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l268_c8_8143_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l268_c8_8143]
signal color2_MUX_uxn_c_l268_c8_8143_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l268_c8_8143_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l268_c8_8143_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l268_c8_8143_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l270_c4_d5e5]
signal BIN_OP_AND_uxn_c_l270_c4_d5e5_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l270_c4_d5e5_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l270_c4_d5e5_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l271_c4_bc8c]
signal BIN_OP_OR_uxn_c_l271_c4_bc8c_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l271_c4_bc8c_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l271_c4_bc8c_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l274_c4_f3af]
signal BIN_OP_AND_uxn_c_l274_c4_f3af_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l274_c4_f3af_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l274_c4_f3af_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l275_c4_f4de]
signal BIN_OP_OR_uxn_c_l275_c4_f4de_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l275_c4_f4de_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l275_c4_f4de_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l279_c6_6681]
signal BIN_OP_EQ_uxn_c_l279_c6_6681_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l279_c6_6681_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l279_c6_6681_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l279_c2_352d]
signal result_MUX_uxn_c_l279_c2_352d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l279_c2_352d_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l279_c2_352d_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l279_c2_352d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l281_c13_3611]
signal BIN_OP_EQ_uxn_c_l281_c13_3611_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l281_c13_3611_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l281_c13_3611_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l281_c9_8bd2]
signal result_MUX_uxn_c_l281_c9_8bd2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l281_c9_8bd2_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l281_c9_8bd2_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l281_c9_8bd2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l283_c13_034c]
signal BIN_OP_EQ_uxn_c_l283_c13_034c_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l283_c13_034c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l283_c13_034c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l283_c9_5923]
signal result_MUX_uxn_c_l283_c9_5923_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l283_c9_5923_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l283_c9_5923_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l283_c9_5923_return_output : unsigned(15 downto 0);

function CAST_TO_uint4_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
    return return_output;
end function;

function CAST_TO_uint12_t_uint4_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(3 downto 0);
  variable return_output : unsigned(11 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,12)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- color0_MUX_uxn_c_l212_c2_95b0
color0_MUX_uxn_c_l212_c2_95b0 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l212_c2_95b0_cond,
color0_MUX_uxn_c_l212_c2_95b0_iftrue,
color0_MUX_uxn_c_l212_c2_95b0_iffalse,
color0_MUX_uxn_c_l212_c2_95b0_return_output);

-- tmp12_MUX_uxn_c_l212_c2_95b0
tmp12_MUX_uxn_c_l212_c2_95b0 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l212_c2_95b0_cond,
tmp12_MUX_uxn_c_l212_c2_95b0_iftrue,
tmp12_MUX_uxn_c_l212_c2_95b0_iffalse,
tmp12_MUX_uxn_c_l212_c2_95b0_return_output);

-- color3_MUX_uxn_c_l212_c2_95b0
color3_MUX_uxn_c_l212_c2_95b0 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l212_c2_95b0_cond,
color3_MUX_uxn_c_l212_c2_95b0_iftrue,
color3_MUX_uxn_c_l212_c2_95b0_iffalse,
color3_MUX_uxn_c_l212_c2_95b0_return_output);

-- color2_MUX_uxn_c_l212_c2_95b0
color2_MUX_uxn_c_l212_c2_95b0 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l212_c2_95b0_cond,
color2_MUX_uxn_c_l212_c2_95b0_iftrue,
color2_MUX_uxn_c_l212_c2_95b0_iffalse,
color2_MUX_uxn_c_l212_c2_95b0_return_output);

-- color_cmp_0_MUX_uxn_c_l212_c2_95b0
color_cmp_0_MUX_uxn_c_l212_c2_95b0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_cmp_0_MUX_uxn_c_l212_c2_95b0_cond,
color_cmp_0_MUX_uxn_c_l212_c2_95b0_iftrue,
color_cmp_0_MUX_uxn_c_l212_c2_95b0_iffalse,
color_cmp_0_MUX_uxn_c_l212_c2_95b0_return_output);

-- color_cmp_1_MUX_uxn_c_l212_c2_95b0
color_cmp_1_MUX_uxn_c_l212_c2_95b0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_cmp_1_MUX_uxn_c_l212_c2_95b0_cond,
color_cmp_1_MUX_uxn_c_l212_c2_95b0_iftrue,
color_cmp_1_MUX_uxn_c_l212_c2_95b0_iffalse,
color_cmp_1_MUX_uxn_c_l212_c2_95b0_return_output);

-- color1_MUX_uxn_c_l212_c2_95b0
color1_MUX_uxn_c_l212_c2_95b0 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l212_c2_95b0_cond,
color1_MUX_uxn_c_l212_c2_95b0_iftrue,
color1_MUX_uxn_c_l212_c2_95b0_iffalse,
color1_MUX_uxn_c_l212_c2_95b0_return_output);

-- CONST_SR_4_uxn_c_l213_c27_e3be
CONST_SR_4_uxn_c_l213_c27_e3be : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l213_c27_e3be_x,
CONST_SR_4_uxn_c_l213_c27_e3be_return_output);

-- BIN_OP_EQ_uxn_c_l215_c7_0508
BIN_OP_EQ_uxn_c_l215_c7_0508 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l215_c7_0508_left,
BIN_OP_EQ_uxn_c_l215_c7_0508_right,
BIN_OP_EQ_uxn_c_l215_c7_0508_return_output);

-- color0_MUX_uxn_c_l215_c3_a654
color0_MUX_uxn_c_l215_c3_a654 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l215_c3_a654_cond,
color0_MUX_uxn_c_l215_c3_a654_iftrue,
color0_MUX_uxn_c_l215_c3_a654_iffalse,
color0_MUX_uxn_c_l215_c3_a654_return_output);

-- tmp12_MUX_uxn_c_l215_c3_a654
tmp12_MUX_uxn_c_l215_c3_a654 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l215_c3_a654_cond,
tmp12_MUX_uxn_c_l215_c3_a654_iftrue,
tmp12_MUX_uxn_c_l215_c3_a654_iffalse,
tmp12_MUX_uxn_c_l215_c3_a654_return_output);

-- color3_MUX_uxn_c_l215_c3_a654
color3_MUX_uxn_c_l215_c3_a654 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l215_c3_a654_cond,
color3_MUX_uxn_c_l215_c3_a654_iftrue,
color3_MUX_uxn_c_l215_c3_a654_iffalse,
color3_MUX_uxn_c_l215_c3_a654_return_output);

-- color2_MUX_uxn_c_l215_c3_a654
color2_MUX_uxn_c_l215_c3_a654 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l215_c3_a654_cond,
color2_MUX_uxn_c_l215_c3_a654_iftrue,
color2_MUX_uxn_c_l215_c3_a654_iffalse,
color2_MUX_uxn_c_l215_c3_a654_return_output);

-- color1_MUX_uxn_c_l215_c3_a654
color1_MUX_uxn_c_l215_c3_a654 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l215_c3_a654_cond,
color1_MUX_uxn_c_l215_c3_a654_iftrue,
color1_MUX_uxn_c_l215_c3_a654_iffalse,
color1_MUX_uxn_c_l215_c3_a654_return_output);

-- CONST_SL_8_uxn_c_l217_c4_3f78
CONST_SL_8_uxn_c_l217_c4_3f78 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l217_c4_3f78_x,
CONST_SL_8_uxn_c_l217_c4_3f78_return_output);

-- BIN_OP_AND_uxn_c_l218_c4_3567
BIN_OP_AND_uxn_c_l218_c4_3567 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l218_c4_3567_left,
BIN_OP_AND_uxn_c_l218_c4_3567_right,
BIN_OP_AND_uxn_c_l218_c4_3567_return_output);

-- BIN_OP_OR_uxn_c_l219_c4_a63e
BIN_OP_OR_uxn_c_l219_c4_a63e : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l219_c4_a63e_left,
BIN_OP_OR_uxn_c_l219_c4_a63e_right,
BIN_OP_OR_uxn_c_l219_c4_a63e_return_output);

-- CONST_SL_8_uxn_c_l222_c4_4251
CONST_SL_8_uxn_c_l222_c4_4251 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l222_c4_4251_x,
CONST_SL_8_uxn_c_l222_c4_4251_return_output);

-- BIN_OP_AND_uxn_c_l223_c4_abfd
BIN_OP_AND_uxn_c_l223_c4_abfd : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l223_c4_abfd_left,
BIN_OP_AND_uxn_c_l223_c4_abfd_right,
BIN_OP_AND_uxn_c_l223_c4_abfd_return_output);

-- BIN_OP_OR_uxn_c_l224_c4_c208
BIN_OP_OR_uxn_c_l224_c4_c208 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l224_c4_c208_left,
BIN_OP_OR_uxn_c_l224_c4_c208_right,
BIN_OP_OR_uxn_c_l224_c4_c208_return_output);

-- BIN_OP_EQ_uxn_c_l226_c12_5fd1
BIN_OP_EQ_uxn_c_l226_c12_5fd1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l226_c12_5fd1_left,
BIN_OP_EQ_uxn_c_l226_c12_5fd1_right,
BIN_OP_EQ_uxn_c_l226_c12_5fd1_return_output);

-- color0_MUX_uxn_c_l226_c8_7a2b
color0_MUX_uxn_c_l226_c8_7a2b : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l226_c8_7a2b_cond,
color0_MUX_uxn_c_l226_c8_7a2b_iftrue,
color0_MUX_uxn_c_l226_c8_7a2b_iffalse,
color0_MUX_uxn_c_l226_c8_7a2b_return_output);

-- tmp12_MUX_uxn_c_l226_c8_7a2b
tmp12_MUX_uxn_c_l226_c8_7a2b : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l226_c8_7a2b_cond,
tmp12_MUX_uxn_c_l226_c8_7a2b_iftrue,
tmp12_MUX_uxn_c_l226_c8_7a2b_iffalse,
tmp12_MUX_uxn_c_l226_c8_7a2b_return_output);

-- color3_MUX_uxn_c_l226_c8_7a2b
color3_MUX_uxn_c_l226_c8_7a2b : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l226_c8_7a2b_cond,
color3_MUX_uxn_c_l226_c8_7a2b_iftrue,
color3_MUX_uxn_c_l226_c8_7a2b_iffalse,
color3_MUX_uxn_c_l226_c8_7a2b_return_output);

-- color2_MUX_uxn_c_l226_c8_7a2b
color2_MUX_uxn_c_l226_c8_7a2b : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l226_c8_7a2b_cond,
color2_MUX_uxn_c_l226_c8_7a2b_iftrue,
color2_MUX_uxn_c_l226_c8_7a2b_iffalse,
color2_MUX_uxn_c_l226_c8_7a2b_return_output);

-- color1_MUX_uxn_c_l226_c8_7a2b
color1_MUX_uxn_c_l226_c8_7a2b : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l226_c8_7a2b_cond,
color1_MUX_uxn_c_l226_c8_7a2b_iftrue,
color1_MUX_uxn_c_l226_c8_7a2b_iffalse,
color1_MUX_uxn_c_l226_c8_7a2b_return_output);

-- CONST_SL_8_uxn_c_l228_c4_17bc
CONST_SL_8_uxn_c_l228_c4_17bc : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l228_c4_17bc_x,
CONST_SL_8_uxn_c_l228_c4_17bc_return_output);

-- BIN_OP_AND_uxn_c_l229_c4_ab44
BIN_OP_AND_uxn_c_l229_c4_ab44 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l229_c4_ab44_left,
BIN_OP_AND_uxn_c_l229_c4_ab44_right,
BIN_OP_AND_uxn_c_l229_c4_ab44_return_output);

-- BIN_OP_OR_uxn_c_l230_c4_2597
BIN_OP_OR_uxn_c_l230_c4_2597 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l230_c4_2597_left,
BIN_OP_OR_uxn_c_l230_c4_2597_right,
BIN_OP_OR_uxn_c_l230_c4_2597_return_output);

-- CONST_SL_8_uxn_c_l233_c4_3661
CONST_SL_8_uxn_c_l233_c4_3661 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l233_c4_3661_x,
CONST_SL_8_uxn_c_l233_c4_3661_return_output);

-- BIN_OP_AND_uxn_c_l234_c4_09f6
BIN_OP_AND_uxn_c_l234_c4_09f6 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l234_c4_09f6_left,
BIN_OP_AND_uxn_c_l234_c4_09f6_right,
BIN_OP_AND_uxn_c_l234_c4_09f6_return_output);

-- BIN_OP_OR_uxn_c_l235_c4_b0ec
BIN_OP_OR_uxn_c_l235_c4_b0ec : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l235_c4_b0ec_left,
BIN_OP_OR_uxn_c_l235_c4_b0ec_right,
BIN_OP_OR_uxn_c_l235_c4_b0ec_return_output);

-- BIN_OP_EQ_uxn_c_l237_c12_d08f
BIN_OP_EQ_uxn_c_l237_c12_d08f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l237_c12_d08f_left,
BIN_OP_EQ_uxn_c_l237_c12_d08f_right,
BIN_OP_EQ_uxn_c_l237_c12_d08f_return_output);

-- color0_MUX_uxn_c_l237_c8_a0d5
color0_MUX_uxn_c_l237_c8_a0d5 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l237_c8_a0d5_cond,
color0_MUX_uxn_c_l237_c8_a0d5_iftrue,
color0_MUX_uxn_c_l237_c8_a0d5_iffalse,
color0_MUX_uxn_c_l237_c8_a0d5_return_output);

-- tmp12_MUX_uxn_c_l237_c8_a0d5
tmp12_MUX_uxn_c_l237_c8_a0d5 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l237_c8_a0d5_cond,
tmp12_MUX_uxn_c_l237_c8_a0d5_iftrue,
tmp12_MUX_uxn_c_l237_c8_a0d5_iffalse,
tmp12_MUX_uxn_c_l237_c8_a0d5_return_output);

-- color3_MUX_uxn_c_l237_c8_a0d5
color3_MUX_uxn_c_l237_c8_a0d5 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l237_c8_a0d5_cond,
color3_MUX_uxn_c_l237_c8_a0d5_iftrue,
color3_MUX_uxn_c_l237_c8_a0d5_iffalse,
color3_MUX_uxn_c_l237_c8_a0d5_return_output);

-- color2_MUX_uxn_c_l237_c8_a0d5
color2_MUX_uxn_c_l237_c8_a0d5 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l237_c8_a0d5_cond,
color2_MUX_uxn_c_l237_c8_a0d5_iftrue,
color2_MUX_uxn_c_l237_c8_a0d5_iffalse,
color2_MUX_uxn_c_l237_c8_a0d5_return_output);

-- color1_MUX_uxn_c_l237_c8_a0d5
color1_MUX_uxn_c_l237_c8_a0d5 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l237_c8_a0d5_cond,
color1_MUX_uxn_c_l237_c8_a0d5_iftrue,
color1_MUX_uxn_c_l237_c8_a0d5_iffalse,
color1_MUX_uxn_c_l237_c8_a0d5_return_output);

-- CONST_SL_4_uxn_c_l239_c4_4cb6
CONST_SL_4_uxn_c_l239_c4_4cb6 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l239_c4_4cb6_x,
CONST_SL_4_uxn_c_l239_c4_4cb6_return_output);

-- BIN_OP_AND_uxn_c_l240_c4_2f30
BIN_OP_AND_uxn_c_l240_c4_2f30 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l240_c4_2f30_left,
BIN_OP_AND_uxn_c_l240_c4_2f30_right,
BIN_OP_AND_uxn_c_l240_c4_2f30_return_output);

-- BIN_OP_OR_uxn_c_l241_c4_ea03
BIN_OP_OR_uxn_c_l241_c4_ea03 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l241_c4_ea03_left,
BIN_OP_OR_uxn_c_l241_c4_ea03_right,
BIN_OP_OR_uxn_c_l241_c4_ea03_return_output);

-- CONST_SL_4_uxn_c_l244_c4_3ad0
CONST_SL_4_uxn_c_l244_c4_3ad0 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l244_c4_3ad0_x,
CONST_SL_4_uxn_c_l244_c4_3ad0_return_output);

-- BIN_OP_AND_uxn_c_l245_c4_504d
BIN_OP_AND_uxn_c_l245_c4_504d : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l245_c4_504d_left,
BIN_OP_AND_uxn_c_l245_c4_504d_right,
BIN_OP_AND_uxn_c_l245_c4_504d_return_output);

-- BIN_OP_OR_uxn_c_l246_c4_6f41
BIN_OP_OR_uxn_c_l246_c4_6f41 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l246_c4_6f41_left,
BIN_OP_OR_uxn_c_l246_c4_6f41_right,
BIN_OP_OR_uxn_c_l246_c4_6f41_return_output);

-- BIN_OP_EQ_uxn_c_l248_c12_f8de
BIN_OP_EQ_uxn_c_l248_c12_f8de : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l248_c12_f8de_left,
BIN_OP_EQ_uxn_c_l248_c12_f8de_right,
BIN_OP_EQ_uxn_c_l248_c12_f8de_return_output);

-- color0_MUX_uxn_c_l248_c8_4853
color0_MUX_uxn_c_l248_c8_4853 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l248_c8_4853_cond,
color0_MUX_uxn_c_l248_c8_4853_iftrue,
color0_MUX_uxn_c_l248_c8_4853_iffalse,
color0_MUX_uxn_c_l248_c8_4853_return_output);

-- tmp12_MUX_uxn_c_l248_c8_4853
tmp12_MUX_uxn_c_l248_c8_4853 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l248_c8_4853_cond,
tmp12_MUX_uxn_c_l248_c8_4853_iftrue,
tmp12_MUX_uxn_c_l248_c8_4853_iffalse,
tmp12_MUX_uxn_c_l248_c8_4853_return_output);

-- color3_MUX_uxn_c_l248_c8_4853
color3_MUX_uxn_c_l248_c8_4853 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l248_c8_4853_cond,
color3_MUX_uxn_c_l248_c8_4853_iftrue,
color3_MUX_uxn_c_l248_c8_4853_iffalse,
color3_MUX_uxn_c_l248_c8_4853_return_output);

-- color2_MUX_uxn_c_l248_c8_4853
color2_MUX_uxn_c_l248_c8_4853 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l248_c8_4853_cond,
color2_MUX_uxn_c_l248_c8_4853_iftrue,
color2_MUX_uxn_c_l248_c8_4853_iffalse,
color2_MUX_uxn_c_l248_c8_4853_return_output);

-- color1_MUX_uxn_c_l248_c8_4853
color1_MUX_uxn_c_l248_c8_4853 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l248_c8_4853_cond,
color1_MUX_uxn_c_l248_c8_4853_iftrue,
color1_MUX_uxn_c_l248_c8_4853_iffalse,
color1_MUX_uxn_c_l248_c8_4853_return_output);

-- CONST_SL_4_uxn_c_l250_c4_9e96
CONST_SL_4_uxn_c_l250_c4_9e96 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l250_c4_9e96_x,
CONST_SL_4_uxn_c_l250_c4_9e96_return_output);

-- BIN_OP_AND_uxn_c_l251_c4_9935
BIN_OP_AND_uxn_c_l251_c4_9935 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l251_c4_9935_left,
BIN_OP_AND_uxn_c_l251_c4_9935_right,
BIN_OP_AND_uxn_c_l251_c4_9935_return_output);

-- BIN_OP_OR_uxn_c_l252_c4_9c1c
BIN_OP_OR_uxn_c_l252_c4_9c1c : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l252_c4_9c1c_left,
BIN_OP_OR_uxn_c_l252_c4_9c1c_right,
BIN_OP_OR_uxn_c_l252_c4_9c1c_return_output);

-- CONST_SL_4_uxn_c_l255_c4_8e8d
CONST_SL_4_uxn_c_l255_c4_8e8d : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l255_c4_8e8d_x,
CONST_SL_4_uxn_c_l255_c4_8e8d_return_output);

-- BIN_OP_AND_uxn_c_l256_c4_5435
BIN_OP_AND_uxn_c_l256_c4_5435 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l256_c4_5435_left,
BIN_OP_AND_uxn_c_l256_c4_5435_right,
BIN_OP_AND_uxn_c_l256_c4_5435_return_output);

-- BIN_OP_OR_uxn_c_l257_c4_6b1a
BIN_OP_OR_uxn_c_l257_c4_6b1a : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l257_c4_6b1a_left,
BIN_OP_OR_uxn_c_l257_c4_6b1a_right,
BIN_OP_OR_uxn_c_l257_c4_6b1a_return_output);

-- BIN_OP_EQ_uxn_c_l259_c12_b8ba
BIN_OP_EQ_uxn_c_l259_c12_b8ba : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l259_c12_b8ba_left,
BIN_OP_EQ_uxn_c_l259_c12_b8ba_right,
BIN_OP_EQ_uxn_c_l259_c12_b8ba_return_output);

-- color0_MUX_uxn_c_l259_c8_3ae0
color0_MUX_uxn_c_l259_c8_3ae0 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l259_c8_3ae0_cond,
color0_MUX_uxn_c_l259_c8_3ae0_iftrue,
color0_MUX_uxn_c_l259_c8_3ae0_iffalse,
color0_MUX_uxn_c_l259_c8_3ae0_return_output);

-- tmp12_MUX_uxn_c_l259_c8_3ae0
tmp12_MUX_uxn_c_l259_c8_3ae0 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l259_c8_3ae0_cond,
tmp12_MUX_uxn_c_l259_c8_3ae0_iftrue,
tmp12_MUX_uxn_c_l259_c8_3ae0_iffalse,
tmp12_MUX_uxn_c_l259_c8_3ae0_return_output);

-- color3_MUX_uxn_c_l259_c8_3ae0
color3_MUX_uxn_c_l259_c8_3ae0 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l259_c8_3ae0_cond,
color3_MUX_uxn_c_l259_c8_3ae0_iftrue,
color3_MUX_uxn_c_l259_c8_3ae0_iffalse,
color3_MUX_uxn_c_l259_c8_3ae0_return_output);

-- color2_MUX_uxn_c_l259_c8_3ae0
color2_MUX_uxn_c_l259_c8_3ae0 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l259_c8_3ae0_cond,
color2_MUX_uxn_c_l259_c8_3ae0_iftrue,
color2_MUX_uxn_c_l259_c8_3ae0_iffalse,
color2_MUX_uxn_c_l259_c8_3ae0_return_output);

-- color1_MUX_uxn_c_l259_c8_3ae0
color1_MUX_uxn_c_l259_c8_3ae0 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l259_c8_3ae0_cond,
color1_MUX_uxn_c_l259_c8_3ae0_iftrue,
color1_MUX_uxn_c_l259_c8_3ae0_iffalse,
color1_MUX_uxn_c_l259_c8_3ae0_return_output);

-- BIN_OP_AND_uxn_c_l261_c4_4229
BIN_OP_AND_uxn_c_l261_c4_4229 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l261_c4_4229_left,
BIN_OP_AND_uxn_c_l261_c4_4229_right,
BIN_OP_AND_uxn_c_l261_c4_4229_return_output);

-- BIN_OP_OR_uxn_c_l262_c4_b53c
BIN_OP_OR_uxn_c_l262_c4_b53c : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l262_c4_b53c_left,
BIN_OP_OR_uxn_c_l262_c4_b53c_right,
BIN_OP_OR_uxn_c_l262_c4_b53c_return_output);

-- BIN_OP_AND_uxn_c_l265_c4_eeee
BIN_OP_AND_uxn_c_l265_c4_eeee : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l265_c4_eeee_left,
BIN_OP_AND_uxn_c_l265_c4_eeee_right,
BIN_OP_AND_uxn_c_l265_c4_eeee_return_output);

-- BIN_OP_OR_uxn_c_l266_c4_1209
BIN_OP_OR_uxn_c_l266_c4_1209 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l266_c4_1209_left,
BIN_OP_OR_uxn_c_l266_c4_1209_right,
BIN_OP_OR_uxn_c_l266_c4_1209_return_output);

-- BIN_OP_EQ_uxn_c_l268_c12_d740
BIN_OP_EQ_uxn_c_l268_c12_d740 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l268_c12_d740_left,
BIN_OP_EQ_uxn_c_l268_c12_d740_right,
BIN_OP_EQ_uxn_c_l268_c12_d740_return_output);

-- tmp12_MUX_uxn_c_l268_c8_8143
tmp12_MUX_uxn_c_l268_c8_8143 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l268_c8_8143_cond,
tmp12_MUX_uxn_c_l268_c8_8143_iftrue,
tmp12_MUX_uxn_c_l268_c8_8143_iffalse,
tmp12_MUX_uxn_c_l268_c8_8143_return_output);

-- color3_MUX_uxn_c_l268_c8_8143
color3_MUX_uxn_c_l268_c8_8143 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l268_c8_8143_cond,
color3_MUX_uxn_c_l268_c8_8143_iftrue,
color3_MUX_uxn_c_l268_c8_8143_iffalse,
color3_MUX_uxn_c_l268_c8_8143_return_output);

-- color2_MUX_uxn_c_l268_c8_8143
color2_MUX_uxn_c_l268_c8_8143 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l268_c8_8143_cond,
color2_MUX_uxn_c_l268_c8_8143_iftrue,
color2_MUX_uxn_c_l268_c8_8143_iffalse,
color2_MUX_uxn_c_l268_c8_8143_return_output);

-- BIN_OP_AND_uxn_c_l270_c4_d5e5
BIN_OP_AND_uxn_c_l270_c4_d5e5 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l270_c4_d5e5_left,
BIN_OP_AND_uxn_c_l270_c4_d5e5_right,
BIN_OP_AND_uxn_c_l270_c4_d5e5_return_output);

-- BIN_OP_OR_uxn_c_l271_c4_bc8c
BIN_OP_OR_uxn_c_l271_c4_bc8c : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l271_c4_bc8c_left,
BIN_OP_OR_uxn_c_l271_c4_bc8c_right,
BIN_OP_OR_uxn_c_l271_c4_bc8c_return_output);

-- BIN_OP_AND_uxn_c_l274_c4_f3af
BIN_OP_AND_uxn_c_l274_c4_f3af : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l274_c4_f3af_left,
BIN_OP_AND_uxn_c_l274_c4_f3af_right,
BIN_OP_AND_uxn_c_l274_c4_f3af_return_output);

-- BIN_OP_OR_uxn_c_l275_c4_f4de
BIN_OP_OR_uxn_c_l275_c4_f4de : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l275_c4_f4de_left,
BIN_OP_OR_uxn_c_l275_c4_f4de_right,
BIN_OP_OR_uxn_c_l275_c4_f4de_return_output);

-- BIN_OP_EQ_uxn_c_l279_c6_6681
BIN_OP_EQ_uxn_c_l279_c6_6681 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l279_c6_6681_left,
BIN_OP_EQ_uxn_c_l279_c6_6681_right,
BIN_OP_EQ_uxn_c_l279_c6_6681_return_output);

-- result_MUX_uxn_c_l279_c2_352d
result_MUX_uxn_c_l279_c2_352d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l279_c2_352d_cond,
result_MUX_uxn_c_l279_c2_352d_iftrue,
result_MUX_uxn_c_l279_c2_352d_iffalse,
result_MUX_uxn_c_l279_c2_352d_return_output);

-- BIN_OP_EQ_uxn_c_l281_c13_3611
BIN_OP_EQ_uxn_c_l281_c13_3611 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l281_c13_3611_left,
BIN_OP_EQ_uxn_c_l281_c13_3611_right,
BIN_OP_EQ_uxn_c_l281_c13_3611_return_output);

-- result_MUX_uxn_c_l281_c9_8bd2
result_MUX_uxn_c_l281_c9_8bd2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l281_c9_8bd2_cond,
result_MUX_uxn_c_l281_c9_8bd2_iftrue,
result_MUX_uxn_c_l281_c9_8bd2_iffalse,
result_MUX_uxn_c_l281_c9_8bd2_return_output);

-- BIN_OP_EQ_uxn_c_l283_c13_034c
BIN_OP_EQ_uxn_c_l283_c13_034c : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l283_c13_034c_left,
BIN_OP_EQ_uxn_c_l283_c13_034c_right,
BIN_OP_EQ_uxn_c_l283_c13_034c_return_output);

-- result_MUX_uxn_c_l283_c9_5923
result_MUX_uxn_c_l283_c9_5923 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l283_c9_5923_cond,
result_MUX_uxn_c_l283_c9_5923_iftrue,
result_MUX_uxn_c_l283_c9_5923_iffalse,
result_MUX_uxn_c_l283_c9_5923_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_ram_address,
 device_ram_value,
 is_device_ram_write,
 gpu_step_color,
 -- Registers
 color0,
 color1,
 color2,
 color3,
 color_cmp_0,
 color_cmp_1,
 tmp12,
 result,
 -- All submodule outputs
 color0_MUX_uxn_c_l212_c2_95b0_return_output,
 tmp12_MUX_uxn_c_l212_c2_95b0_return_output,
 color3_MUX_uxn_c_l212_c2_95b0_return_output,
 color2_MUX_uxn_c_l212_c2_95b0_return_output,
 color_cmp_0_MUX_uxn_c_l212_c2_95b0_return_output,
 color_cmp_1_MUX_uxn_c_l212_c2_95b0_return_output,
 color1_MUX_uxn_c_l212_c2_95b0_return_output,
 CONST_SR_4_uxn_c_l213_c27_e3be_return_output,
 BIN_OP_EQ_uxn_c_l215_c7_0508_return_output,
 color0_MUX_uxn_c_l215_c3_a654_return_output,
 tmp12_MUX_uxn_c_l215_c3_a654_return_output,
 color3_MUX_uxn_c_l215_c3_a654_return_output,
 color2_MUX_uxn_c_l215_c3_a654_return_output,
 color1_MUX_uxn_c_l215_c3_a654_return_output,
 CONST_SL_8_uxn_c_l217_c4_3f78_return_output,
 BIN_OP_AND_uxn_c_l218_c4_3567_return_output,
 BIN_OP_OR_uxn_c_l219_c4_a63e_return_output,
 CONST_SL_8_uxn_c_l222_c4_4251_return_output,
 BIN_OP_AND_uxn_c_l223_c4_abfd_return_output,
 BIN_OP_OR_uxn_c_l224_c4_c208_return_output,
 BIN_OP_EQ_uxn_c_l226_c12_5fd1_return_output,
 color0_MUX_uxn_c_l226_c8_7a2b_return_output,
 tmp12_MUX_uxn_c_l226_c8_7a2b_return_output,
 color3_MUX_uxn_c_l226_c8_7a2b_return_output,
 color2_MUX_uxn_c_l226_c8_7a2b_return_output,
 color1_MUX_uxn_c_l226_c8_7a2b_return_output,
 CONST_SL_8_uxn_c_l228_c4_17bc_return_output,
 BIN_OP_AND_uxn_c_l229_c4_ab44_return_output,
 BIN_OP_OR_uxn_c_l230_c4_2597_return_output,
 CONST_SL_8_uxn_c_l233_c4_3661_return_output,
 BIN_OP_AND_uxn_c_l234_c4_09f6_return_output,
 BIN_OP_OR_uxn_c_l235_c4_b0ec_return_output,
 BIN_OP_EQ_uxn_c_l237_c12_d08f_return_output,
 color0_MUX_uxn_c_l237_c8_a0d5_return_output,
 tmp12_MUX_uxn_c_l237_c8_a0d5_return_output,
 color3_MUX_uxn_c_l237_c8_a0d5_return_output,
 color2_MUX_uxn_c_l237_c8_a0d5_return_output,
 color1_MUX_uxn_c_l237_c8_a0d5_return_output,
 CONST_SL_4_uxn_c_l239_c4_4cb6_return_output,
 BIN_OP_AND_uxn_c_l240_c4_2f30_return_output,
 BIN_OP_OR_uxn_c_l241_c4_ea03_return_output,
 CONST_SL_4_uxn_c_l244_c4_3ad0_return_output,
 BIN_OP_AND_uxn_c_l245_c4_504d_return_output,
 BIN_OP_OR_uxn_c_l246_c4_6f41_return_output,
 BIN_OP_EQ_uxn_c_l248_c12_f8de_return_output,
 color0_MUX_uxn_c_l248_c8_4853_return_output,
 tmp12_MUX_uxn_c_l248_c8_4853_return_output,
 color3_MUX_uxn_c_l248_c8_4853_return_output,
 color2_MUX_uxn_c_l248_c8_4853_return_output,
 color1_MUX_uxn_c_l248_c8_4853_return_output,
 CONST_SL_4_uxn_c_l250_c4_9e96_return_output,
 BIN_OP_AND_uxn_c_l251_c4_9935_return_output,
 BIN_OP_OR_uxn_c_l252_c4_9c1c_return_output,
 CONST_SL_4_uxn_c_l255_c4_8e8d_return_output,
 BIN_OP_AND_uxn_c_l256_c4_5435_return_output,
 BIN_OP_OR_uxn_c_l257_c4_6b1a_return_output,
 BIN_OP_EQ_uxn_c_l259_c12_b8ba_return_output,
 color0_MUX_uxn_c_l259_c8_3ae0_return_output,
 tmp12_MUX_uxn_c_l259_c8_3ae0_return_output,
 color3_MUX_uxn_c_l259_c8_3ae0_return_output,
 color2_MUX_uxn_c_l259_c8_3ae0_return_output,
 color1_MUX_uxn_c_l259_c8_3ae0_return_output,
 BIN_OP_AND_uxn_c_l261_c4_4229_return_output,
 BIN_OP_OR_uxn_c_l262_c4_b53c_return_output,
 BIN_OP_AND_uxn_c_l265_c4_eeee_return_output,
 BIN_OP_OR_uxn_c_l266_c4_1209_return_output,
 BIN_OP_EQ_uxn_c_l268_c12_d740_return_output,
 tmp12_MUX_uxn_c_l268_c8_8143_return_output,
 color3_MUX_uxn_c_l268_c8_8143_return_output,
 color2_MUX_uxn_c_l268_c8_8143_return_output,
 BIN_OP_AND_uxn_c_l270_c4_d5e5_return_output,
 BIN_OP_OR_uxn_c_l271_c4_bc8c_return_output,
 BIN_OP_AND_uxn_c_l274_c4_f3af_return_output,
 BIN_OP_OR_uxn_c_l275_c4_f4de_return_output,
 BIN_OP_EQ_uxn_c_l279_c6_6681_return_output,
 result_MUX_uxn_c_l279_c2_352d_return_output,
 BIN_OP_EQ_uxn_c_l281_c13_3611_return_output,
 result_MUX_uxn_c_l281_c9_8bd2_return_output,
 BIN_OP_EQ_uxn_c_l283_c13_034c_return_output,
 result_MUX_uxn_c_l283_c9_5923_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_gpu_step_color : unsigned(1 downto 0);
 variable VAR_color0_MUX_uxn_c_l212_c2_95b0_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l215_c3_a654_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l212_c2_95b0_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l212_c2_95b0_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l212_c2_95b0_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l212_c2_95b0_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l215_c3_a654_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l212_c2_95b0_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l212_c2_95b0_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l212_c2_95b0_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l212_c2_95b0_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l215_c3_a654_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l212_c2_95b0_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l212_c2_95b0_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l212_c2_95b0_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l212_c2_95b0_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l215_c3_a654_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l212_c2_95b0_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l212_c2_95b0_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l212_c2_95b0_cond : unsigned(0 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l212_c2_95b0_iftrue : unsigned(3 downto 0);
 variable VAR_color_cmp_0_uxn_c_l213_c3_39e5 : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l212_c2_95b0_iffalse : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l212_c2_95b0_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l212_c2_95b0_cond : unsigned(0 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l212_c2_95b0_iftrue : unsigned(3 downto 0);
 variable VAR_color_cmp_1_uxn_c_l214_c3_fa35 : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l212_c2_95b0_iffalse : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l212_c2_95b0_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l212_c2_95b0_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l212_c2_95b0_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l215_c3_a654_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l212_c2_95b0_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l212_c2_95b0_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l212_c2_95b0_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l213_c27_e3be_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l213_c27_e3be_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l213_c17_b59e_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l214_c17_cd77_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l215_c7_0508_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l215_c7_0508_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l215_c7_0508_return_output : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l215_c3_a654_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l215_c3_a654_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l226_c8_7a2b_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l215_c3_a654_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l215_c3_a654_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l215_c3_a654_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l226_c8_7a2b_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l215_c3_a654_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l215_c3_a654_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l215_c3_a654_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l226_c8_7a2b_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l215_c3_a654_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l215_c3_a654_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l215_c3_a654_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l226_c8_7a2b_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l215_c3_a654_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l215_c3_a654_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l215_c3_a654_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l226_c8_7a2b_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l215_c3_a654_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l216_c4_7f1e : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l217_c4_3f78_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l217_c4_3f78_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l218_c4_3567_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l218_c4_3567_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l218_c4_3567_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l219_c4_a63e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l219_c4_a63e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l219_c4_a63e_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l221_c4_cd2d : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l222_c4_4251_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l222_c4_4251_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l223_c4_abfd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l223_c4_abfd_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l223_c4_abfd_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l224_c4_c208_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l224_c4_c208_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l224_c4_c208_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l226_c12_5fd1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l226_c12_5fd1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l226_c12_5fd1_return_output : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l226_c8_7a2b_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l226_c8_7a2b_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l237_c8_a0d5_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l226_c8_7a2b_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l226_c8_7a2b_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l226_c8_7a2b_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l237_c8_a0d5_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l226_c8_7a2b_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l226_c8_7a2b_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l226_c8_7a2b_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l237_c8_a0d5_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l226_c8_7a2b_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l226_c8_7a2b_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l226_c8_7a2b_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l237_c8_a0d5_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l226_c8_7a2b_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l226_c8_7a2b_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l226_c8_7a2b_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l237_c8_a0d5_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l226_c8_7a2b_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l227_c4_64ce : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l228_c4_17bc_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l228_c4_17bc_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l229_c4_ab44_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l229_c4_ab44_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l229_c4_ab44_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l230_c4_2597_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l230_c4_2597_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l230_c4_2597_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l232_c4_b5a1 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l233_c4_3661_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l233_c4_3661_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l234_c4_09f6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l234_c4_09f6_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l234_c4_09f6_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l235_c4_b0ec_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l235_c4_b0ec_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l235_c4_b0ec_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l237_c12_d08f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l237_c12_d08f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l237_c12_d08f_return_output : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l237_c8_a0d5_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l237_c8_a0d5_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l248_c8_4853_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l237_c8_a0d5_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l237_c8_a0d5_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l237_c8_a0d5_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l248_c8_4853_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l237_c8_a0d5_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l237_c8_a0d5_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l237_c8_a0d5_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l248_c8_4853_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l237_c8_a0d5_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l237_c8_a0d5_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l237_c8_a0d5_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l248_c8_4853_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l237_c8_a0d5_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l237_c8_a0d5_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l237_c8_a0d5_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l248_c8_4853_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l237_c8_a0d5_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l238_c4_0f68 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l239_c4_4cb6_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l239_c4_4cb6_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l240_c4_2f30_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l240_c4_2f30_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l240_c4_2f30_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l241_c4_ea03_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l241_c4_ea03_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l241_c4_ea03_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l243_c4_e5d0 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l244_c4_3ad0_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l244_c4_3ad0_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l245_c4_504d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l245_c4_504d_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l245_c4_504d_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l246_c4_6f41_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l246_c4_6f41_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l246_c4_6f41_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l248_c12_f8de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l248_c12_f8de_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l248_c12_f8de_return_output : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l248_c8_4853_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l248_c8_4853_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l259_c8_3ae0_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l248_c8_4853_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l248_c8_4853_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l248_c8_4853_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l259_c8_3ae0_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l248_c8_4853_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l248_c8_4853_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l248_c8_4853_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l259_c8_3ae0_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l248_c8_4853_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l248_c8_4853_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l248_c8_4853_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l259_c8_3ae0_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l248_c8_4853_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l248_c8_4853_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l248_c8_4853_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l259_c8_3ae0_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l248_c8_4853_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l249_c4_9b93 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l250_c4_9e96_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l250_c4_9e96_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l251_c4_9935_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l251_c4_9935_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l251_c4_9935_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l252_c4_9c1c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l252_c4_9c1c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l252_c4_9c1c_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l254_c4_b8b6 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l255_c4_8e8d_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l255_c4_8e8d_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l256_c4_5435_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l256_c4_5435_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l256_c4_5435_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l257_c4_6b1a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l257_c4_6b1a_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l257_c4_6b1a_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l259_c12_b8ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l259_c12_b8ba_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l259_c12_b8ba_return_output : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l259_c8_3ae0_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l259_c8_3ae0_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l259_c8_3ae0_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l259_c8_3ae0_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l259_c8_3ae0_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l268_c8_8143_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l259_c8_3ae0_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l259_c8_3ae0_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l259_c8_3ae0_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l268_c8_8143_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l259_c8_3ae0_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l259_c8_3ae0_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l259_c8_3ae0_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l268_c8_8143_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l259_c8_3ae0_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l259_c8_3ae0_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l259_c8_3ae0_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l259_c8_3ae0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l261_c4_4229_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l261_c4_4229_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l261_c4_4229_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l262_c4_b53c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l262_c4_b53c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l262_c4_b53c_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l265_c4_eeee_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l265_c4_eeee_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l265_c4_eeee_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l266_c4_1209_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l266_c4_1209_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l266_c4_1209_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l268_c12_d740_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l268_c12_d740_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l268_c12_d740_return_output : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l268_c8_8143_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l268_c8_8143_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l268_c8_8143_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l268_c8_8143_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l268_c8_8143_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l268_c8_8143_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l268_c8_8143_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l268_c8_8143_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l268_c8_8143_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l270_c4_d5e5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l270_c4_d5e5_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l270_c4_d5e5_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l271_c4_bc8c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l271_c4_bc8c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l271_c4_bc8c_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l274_c4_f3af_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l274_c4_f3af_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l274_c4_f3af_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l275_c4_f4de_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l275_c4_f4de_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l275_c4_f4de_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l279_c6_6681_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l279_c6_6681_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l279_c6_6681_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l279_c2_352d_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l280_c3_6ae7 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l279_c2_352d_iffalse : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l281_c9_8bd2_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l279_c2_352d_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l279_c2_352d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l281_c13_3611_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l281_c13_3611_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l281_c13_3611_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l281_c9_8bd2_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l282_c3_1be7 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l281_c9_8bd2_iffalse : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l283_c9_5923_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l281_c9_8bd2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l283_c13_034c_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l283_c13_034c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l283_c13_034c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l283_c9_5923_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l284_c3_f322 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l283_c9_5923_iffalse : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l286_c3_3f39 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l283_c9_5923_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l260_l269_DUPLICATE_a20b_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l273_l264_DUPLICATE_31fc_return_output : unsigned(11 downto 0);
 -- State registers comb logic variables
variable REG_VAR_color0 : unsigned(11 downto 0);
variable REG_VAR_color1 : unsigned(11 downto 0);
variable REG_VAR_color2 : unsigned(11 downto 0);
variable REG_VAR_color3 : unsigned(11 downto 0);
variable REG_VAR_color_cmp_0 : unsigned(3 downto 0);
variable REG_VAR_color_cmp_1 : unsigned(3 downto 0);
variable REG_VAR_tmp12 : unsigned(11 downto 0);
variable REG_VAR_result : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_color0 := color0;
  REG_VAR_color1 := color1;
  REG_VAR_color2 := color2;
  REG_VAR_color3 := color3;
  REG_VAR_color_cmp_0 := color_cmp_0;
  REG_VAR_color_cmp_1 := color_cmp_1;
  REG_VAR_tmp12 := tmp12;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_c_l270_c4_d5e5_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l268_c12_d740_right := to_unsigned(13, 8);
     VAR_BIN_OP_AND_uxn_c_l251_c4_9935_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l240_c4_2f30_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l234_c4_09f6_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l229_c4_ab44_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l265_c4_eeee_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l279_c6_6681_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l274_c4_f3af_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l281_c13_3611_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l261_c4_4229_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l259_c12_b8ba_right := to_unsigned(12, 8);
     VAR_BIN_OP_EQ_uxn_c_l283_c13_034c_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_c_l237_c12_d08f_right := to_unsigned(10, 8);
     VAR_BIN_OP_AND_uxn_c_l223_c4_abfd_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l256_c4_5435_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l215_c7_0508_right := to_unsigned(8, 8);
     VAR_BIN_OP_EQ_uxn_c_l226_c12_5fd1_right := to_unsigned(9, 8);
     VAR_BIN_OP_AND_uxn_c_l218_c4_3567_right := to_unsigned(255, 12);
     VAR_BIN_OP_EQ_uxn_c_l248_c12_f8de_right := to_unsigned(11, 8);
     VAR_BIN_OP_AND_uxn_c_l245_c4_504d_right := to_unsigned(3855, 12);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_ram_address := device_ram_address;
     VAR_device_ram_value := device_ram_value;
     VAR_is_device_ram_write := is_device_ram_write;
     VAR_gpu_step_color := gpu_step_color;

     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_c_l218_c4_3567_left := color0;
     VAR_BIN_OP_AND_uxn_c_l240_c4_2f30_left := color0;
     VAR_BIN_OP_AND_uxn_c_l261_c4_4229_left := color0;
     VAR_color0_MUX_uxn_c_l212_c2_95b0_iffalse := color0;
     VAR_color0_MUX_uxn_c_l226_c8_7a2b_iftrue := color0;
     VAR_color0_MUX_uxn_c_l248_c8_4853_iftrue := color0;
     VAR_color0_MUX_uxn_c_l259_c8_3ae0_iffalse := color0;
     VAR_BIN_OP_AND_uxn_c_l223_c4_abfd_left := color1;
     VAR_BIN_OP_AND_uxn_c_l245_c4_504d_left := color1;
     VAR_BIN_OP_AND_uxn_c_l265_c4_eeee_left := color1;
     VAR_color1_MUX_uxn_c_l212_c2_95b0_iffalse := color1;
     VAR_color1_MUX_uxn_c_l226_c8_7a2b_iftrue := color1;
     VAR_color1_MUX_uxn_c_l248_c8_4853_iftrue := color1;
     VAR_color1_MUX_uxn_c_l259_c8_3ae0_iffalse := color1;
     VAR_BIN_OP_AND_uxn_c_l229_c4_ab44_left := color2;
     VAR_BIN_OP_AND_uxn_c_l251_c4_9935_left := color2;
     VAR_BIN_OP_AND_uxn_c_l270_c4_d5e5_left := color2;
     VAR_color2_MUX_uxn_c_l212_c2_95b0_iffalse := color2;
     VAR_color2_MUX_uxn_c_l215_c3_a654_iftrue := color2;
     VAR_color2_MUX_uxn_c_l237_c8_a0d5_iftrue := color2;
     VAR_color2_MUX_uxn_c_l259_c8_3ae0_iftrue := color2;
     VAR_color2_MUX_uxn_c_l268_c8_8143_iffalse := color2;
     VAR_BIN_OP_AND_uxn_c_l234_c4_09f6_left := color3;
     VAR_BIN_OP_AND_uxn_c_l256_c4_5435_left := color3;
     VAR_BIN_OP_AND_uxn_c_l274_c4_f3af_left := color3;
     VAR_color3_MUX_uxn_c_l212_c2_95b0_iffalse := color3;
     VAR_color3_MUX_uxn_c_l215_c3_a654_iftrue := color3;
     VAR_color3_MUX_uxn_c_l237_c8_a0d5_iftrue := color3;
     VAR_color3_MUX_uxn_c_l259_c8_3ae0_iftrue := color3;
     VAR_color3_MUX_uxn_c_l268_c8_8143_iffalse := color3;
     VAR_color_cmp_0_MUX_uxn_c_l212_c2_95b0_iffalse := color_cmp_0;
     VAR_color_cmp_1_MUX_uxn_c_l212_c2_95b0_iffalse := color_cmp_1;
     VAR_BIN_OP_EQ_uxn_c_l215_c7_0508_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l226_c12_5fd1_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l237_c12_d08f_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l248_c12_f8de_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l259_c12_b8ba_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l268_c12_d740_left := VAR_device_ram_address;
     VAR_CONST_SR_4_uxn_c_l213_c27_e3be_x := VAR_device_ram_value;
     VAR_BIN_OP_EQ_uxn_c_l279_c6_6681_left := VAR_gpu_step_color;
     VAR_BIN_OP_EQ_uxn_c_l281_c13_3611_left := VAR_gpu_step_color;
     VAR_BIN_OP_EQ_uxn_c_l283_c13_034c_left := VAR_gpu_step_color;
     VAR_color0_MUX_uxn_c_l212_c2_95b0_cond := VAR_is_device_ram_write;
     VAR_color1_MUX_uxn_c_l212_c2_95b0_cond := VAR_is_device_ram_write;
     VAR_color2_MUX_uxn_c_l212_c2_95b0_cond := VAR_is_device_ram_write;
     VAR_color3_MUX_uxn_c_l212_c2_95b0_cond := VAR_is_device_ram_write;
     VAR_color_cmp_0_MUX_uxn_c_l212_c2_95b0_cond := VAR_is_device_ram_write;
     VAR_color_cmp_1_MUX_uxn_c_l212_c2_95b0_cond := VAR_is_device_ram_write;
     VAR_tmp12_MUX_uxn_c_l212_c2_95b0_cond := VAR_is_device_ram_write;
     VAR_tmp12_MUX_uxn_c_l212_c2_95b0_iffalse := tmp12;
     VAR_tmp12_MUX_uxn_c_l268_c8_8143_iffalse := tmp12;
     -- BIN_OP_AND[uxn_c_l218_c4_3567] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l218_c4_3567_left <= VAR_BIN_OP_AND_uxn_c_l218_c4_3567_left;
     BIN_OP_AND_uxn_c_l218_c4_3567_right <= VAR_BIN_OP_AND_uxn_c_l218_c4_3567_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l218_c4_3567_return_output := BIN_OP_AND_uxn_c_l218_c4_3567_return_output;

     -- BIN_OP_EQ[uxn_c_l268_c12_d740] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l268_c12_d740_left <= VAR_BIN_OP_EQ_uxn_c_l268_c12_d740_left;
     BIN_OP_EQ_uxn_c_l268_c12_d740_right <= VAR_BIN_OP_EQ_uxn_c_l268_c12_d740_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l268_c12_d740_return_output := BIN_OP_EQ_uxn_c_l268_c12_d740_return_output;

     -- BIN_OP_AND[uxn_c_l251_c4_9935] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l251_c4_9935_left <= VAR_BIN_OP_AND_uxn_c_l251_c4_9935_left;
     BIN_OP_AND_uxn_c_l251_c4_9935_right <= VAR_BIN_OP_AND_uxn_c_l251_c4_9935_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l251_c4_9935_return_output := BIN_OP_AND_uxn_c_l251_c4_9935_return_output;

     -- BIN_OP_EQ[uxn_c_l279_c6_6681] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l279_c6_6681_left <= VAR_BIN_OP_EQ_uxn_c_l279_c6_6681_left;
     BIN_OP_EQ_uxn_c_l279_c6_6681_right <= VAR_BIN_OP_EQ_uxn_c_l279_c6_6681_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l279_c6_6681_return_output := BIN_OP_EQ_uxn_c_l279_c6_6681_return_output;

     -- BIN_OP_EQ[uxn_c_l283_c13_034c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l283_c13_034c_left <= VAR_BIN_OP_EQ_uxn_c_l283_c13_034c_left;
     BIN_OP_EQ_uxn_c_l283_c13_034c_right <= VAR_BIN_OP_EQ_uxn_c_l283_c13_034c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l283_c13_034c_return_output := BIN_OP_EQ_uxn_c_l283_c13_034c_return_output;

     -- BIN_OP_AND[uxn_c_l229_c4_ab44] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l229_c4_ab44_left <= VAR_BIN_OP_AND_uxn_c_l229_c4_ab44_left;
     BIN_OP_AND_uxn_c_l229_c4_ab44_right <= VAR_BIN_OP_AND_uxn_c_l229_c4_ab44_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l229_c4_ab44_return_output := BIN_OP_AND_uxn_c_l229_c4_ab44_return_output;

     -- BIN_OP_AND[uxn_c_l240_c4_2f30] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l240_c4_2f30_left <= VAR_BIN_OP_AND_uxn_c_l240_c4_2f30_left;
     BIN_OP_AND_uxn_c_l240_c4_2f30_right <= VAR_BIN_OP_AND_uxn_c_l240_c4_2f30_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l240_c4_2f30_return_output := BIN_OP_AND_uxn_c_l240_c4_2f30_return_output;

     -- BIN_OP_EQ[uxn_c_l226_c12_5fd1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l226_c12_5fd1_left <= VAR_BIN_OP_EQ_uxn_c_l226_c12_5fd1_left;
     BIN_OP_EQ_uxn_c_l226_c12_5fd1_right <= VAR_BIN_OP_EQ_uxn_c_l226_c12_5fd1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l226_c12_5fd1_return_output := BIN_OP_EQ_uxn_c_l226_c12_5fd1_return_output;

     -- BIN_OP_EQ[uxn_c_l215_c7_0508] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l215_c7_0508_left <= VAR_BIN_OP_EQ_uxn_c_l215_c7_0508_left;
     BIN_OP_EQ_uxn_c_l215_c7_0508_right <= VAR_BIN_OP_EQ_uxn_c_l215_c7_0508_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l215_c7_0508_return_output := BIN_OP_EQ_uxn_c_l215_c7_0508_return_output;

     -- BIN_OP_EQ[uxn_c_l259_c12_b8ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l259_c12_b8ba_left <= VAR_BIN_OP_EQ_uxn_c_l259_c12_b8ba_left;
     BIN_OP_EQ_uxn_c_l259_c12_b8ba_right <= VAR_BIN_OP_EQ_uxn_c_l259_c12_b8ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l259_c12_b8ba_return_output := BIN_OP_EQ_uxn_c_l259_c12_b8ba_return_output;

     -- BIN_OP_AND[uxn_c_l245_c4_504d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l245_c4_504d_left <= VAR_BIN_OP_AND_uxn_c_l245_c4_504d_left;
     BIN_OP_AND_uxn_c_l245_c4_504d_right <= VAR_BIN_OP_AND_uxn_c_l245_c4_504d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l245_c4_504d_return_output := BIN_OP_AND_uxn_c_l245_c4_504d_return_output;

     -- BIN_OP_EQ[uxn_c_l248_c12_f8de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l248_c12_f8de_left <= VAR_BIN_OP_EQ_uxn_c_l248_c12_f8de_left;
     BIN_OP_EQ_uxn_c_l248_c12_f8de_right <= VAR_BIN_OP_EQ_uxn_c_l248_c12_f8de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l248_c12_f8de_return_output := BIN_OP_EQ_uxn_c_l248_c12_f8de_return_output;

     -- BIN_OP_EQ[uxn_c_l281_c13_3611] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l281_c13_3611_left <= VAR_BIN_OP_EQ_uxn_c_l281_c13_3611_left;
     BIN_OP_EQ_uxn_c_l281_c13_3611_right <= VAR_BIN_OP_EQ_uxn_c_l281_c13_3611_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l281_c13_3611_return_output := BIN_OP_EQ_uxn_c_l281_c13_3611_return_output;

     -- BIN_OP_AND[uxn_c_l265_c4_eeee] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l265_c4_eeee_left <= VAR_BIN_OP_AND_uxn_c_l265_c4_eeee_left;
     BIN_OP_AND_uxn_c_l265_c4_eeee_right <= VAR_BIN_OP_AND_uxn_c_l265_c4_eeee_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l265_c4_eeee_return_output := BIN_OP_AND_uxn_c_l265_c4_eeee_return_output;

     -- CAST_TO_uint4_t[uxn_c_l214_c17_cd77] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l214_c17_cd77_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_value);

     -- BIN_OP_AND[uxn_c_l234_c4_09f6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l234_c4_09f6_left <= VAR_BIN_OP_AND_uxn_c_l234_c4_09f6_left;
     BIN_OP_AND_uxn_c_l234_c4_09f6_right <= VAR_BIN_OP_AND_uxn_c_l234_c4_09f6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l234_c4_09f6_return_output := BIN_OP_AND_uxn_c_l234_c4_09f6_return_output;

     -- BIN_OP_AND[uxn_c_l223_c4_abfd] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l223_c4_abfd_left <= VAR_BIN_OP_AND_uxn_c_l223_c4_abfd_left;
     BIN_OP_AND_uxn_c_l223_c4_abfd_right <= VAR_BIN_OP_AND_uxn_c_l223_c4_abfd_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l223_c4_abfd_return_output := BIN_OP_AND_uxn_c_l223_c4_abfd_return_output;

     -- BIN_OP_AND[uxn_c_l274_c4_f3af] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l274_c4_f3af_left <= VAR_BIN_OP_AND_uxn_c_l274_c4_f3af_left;
     BIN_OP_AND_uxn_c_l274_c4_f3af_right <= VAR_BIN_OP_AND_uxn_c_l274_c4_f3af_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l274_c4_f3af_return_output := BIN_OP_AND_uxn_c_l274_c4_f3af_return_output;

     -- BIN_OP_AND[uxn_c_l261_c4_4229] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l261_c4_4229_left <= VAR_BIN_OP_AND_uxn_c_l261_c4_4229_left;
     BIN_OP_AND_uxn_c_l261_c4_4229_right <= VAR_BIN_OP_AND_uxn_c_l261_c4_4229_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l261_c4_4229_return_output := BIN_OP_AND_uxn_c_l261_c4_4229_return_output;

     -- BIN_OP_AND[uxn_c_l256_c4_5435] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l256_c4_5435_left <= VAR_BIN_OP_AND_uxn_c_l256_c4_5435_left;
     BIN_OP_AND_uxn_c_l256_c4_5435_right <= VAR_BIN_OP_AND_uxn_c_l256_c4_5435_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l256_c4_5435_return_output := BIN_OP_AND_uxn_c_l256_c4_5435_return_output;

     -- BIN_OP_EQ[uxn_c_l237_c12_d08f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l237_c12_d08f_left <= VAR_BIN_OP_EQ_uxn_c_l237_c12_d08f_left;
     BIN_OP_EQ_uxn_c_l237_c12_d08f_right <= VAR_BIN_OP_EQ_uxn_c_l237_c12_d08f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l237_c12_d08f_return_output := BIN_OP_EQ_uxn_c_l237_c12_d08f_return_output;

     -- CONST_SR_4[uxn_c_l213_c27_e3be] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l213_c27_e3be_x <= VAR_CONST_SR_4_uxn_c_l213_c27_e3be_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l213_c27_e3be_return_output := CONST_SR_4_uxn_c_l213_c27_e3be_return_output;

     -- BIN_OP_AND[uxn_c_l270_c4_d5e5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l270_c4_d5e5_left <= VAR_BIN_OP_AND_uxn_c_l270_c4_d5e5_left;
     BIN_OP_AND_uxn_c_l270_c4_d5e5_right <= VAR_BIN_OP_AND_uxn_c_l270_c4_d5e5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l270_c4_d5e5_return_output := BIN_OP_AND_uxn_c_l270_c4_d5e5_return_output;

     -- Submodule level 1
     VAR_BIN_OP_OR_uxn_c_l219_c4_a63e_left := VAR_BIN_OP_AND_uxn_c_l218_c4_3567_return_output;
     VAR_BIN_OP_OR_uxn_c_l224_c4_c208_left := VAR_BIN_OP_AND_uxn_c_l223_c4_abfd_return_output;
     VAR_BIN_OP_OR_uxn_c_l230_c4_2597_left := VAR_BIN_OP_AND_uxn_c_l229_c4_ab44_return_output;
     VAR_BIN_OP_OR_uxn_c_l235_c4_b0ec_left := VAR_BIN_OP_AND_uxn_c_l234_c4_09f6_return_output;
     VAR_BIN_OP_OR_uxn_c_l241_c4_ea03_left := VAR_BIN_OP_AND_uxn_c_l240_c4_2f30_return_output;
     VAR_BIN_OP_OR_uxn_c_l246_c4_6f41_left := VAR_BIN_OP_AND_uxn_c_l245_c4_504d_return_output;
     VAR_BIN_OP_OR_uxn_c_l252_c4_9c1c_left := VAR_BIN_OP_AND_uxn_c_l251_c4_9935_return_output;
     VAR_BIN_OP_OR_uxn_c_l257_c4_6b1a_left := VAR_BIN_OP_AND_uxn_c_l256_c4_5435_return_output;
     VAR_BIN_OP_OR_uxn_c_l262_c4_b53c_left := VAR_BIN_OP_AND_uxn_c_l261_c4_4229_return_output;
     VAR_BIN_OP_OR_uxn_c_l266_c4_1209_left := VAR_BIN_OP_AND_uxn_c_l265_c4_eeee_return_output;
     VAR_BIN_OP_OR_uxn_c_l271_c4_bc8c_left := VAR_BIN_OP_AND_uxn_c_l270_c4_d5e5_return_output;
     VAR_BIN_OP_OR_uxn_c_l275_c4_f4de_left := VAR_BIN_OP_AND_uxn_c_l274_c4_f3af_return_output;
     VAR_color0_MUX_uxn_c_l215_c3_a654_cond := VAR_BIN_OP_EQ_uxn_c_l215_c7_0508_return_output;
     VAR_color1_MUX_uxn_c_l215_c3_a654_cond := VAR_BIN_OP_EQ_uxn_c_l215_c7_0508_return_output;
     VAR_color2_MUX_uxn_c_l215_c3_a654_cond := VAR_BIN_OP_EQ_uxn_c_l215_c7_0508_return_output;
     VAR_color3_MUX_uxn_c_l215_c3_a654_cond := VAR_BIN_OP_EQ_uxn_c_l215_c7_0508_return_output;
     VAR_tmp12_MUX_uxn_c_l215_c3_a654_cond := VAR_BIN_OP_EQ_uxn_c_l215_c7_0508_return_output;
     VAR_color0_MUX_uxn_c_l226_c8_7a2b_cond := VAR_BIN_OP_EQ_uxn_c_l226_c12_5fd1_return_output;
     VAR_color1_MUX_uxn_c_l226_c8_7a2b_cond := VAR_BIN_OP_EQ_uxn_c_l226_c12_5fd1_return_output;
     VAR_color2_MUX_uxn_c_l226_c8_7a2b_cond := VAR_BIN_OP_EQ_uxn_c_l226_c12_5fd1_return_output;
     VAR_color3_MUX_uxn_c_l226_c8_7a2b_cond := VAR_BIN_OP_EQ_uxn_c_l226_c12_5fd1_return_output;
     VAR_tmp12_MUX_uxn_c_l226_c8_7a2b_cond := VAR_BIN_OP_EQ_uxn_c_l226_c12_5fd1_return_output;
     VAR_color0_MUX_uxn_c_l237_c8_a0d5_cond := VAR_BIN_OP_EQ_uxn_c_l237_c12_d08f_return_output;
     VAR_color1_MUX_uxn_c_l237_c8_a0d5_cond := VAR_BIN_OP_EQ_uxn_c_l237_c12_d08f_return_output;
     VAR_color2_MUX_uxn_c_l237_c8_a0d5_cond := VAR_BIN_OP_EQ_uxn_c_l237_c12_d08f_return_output;
     VAR_color3_MUX_uxn_c_l237_c8_a0d5_cond := VAR_BIN_OP_EQ_uxn_c_l237_c12_d08f_return_output;
     VAR_tmp12_MUX_uxn_c_l237_c8_a0d5_cond := VAR_BIN_OP_EQ_uxn_c_l237_c12_d08f_return_output;
     VAR_color0_MUX_uxn_c_l248_c8_4853_cond := VAR_BIN_OP_EQ_uxn_c_l248_c12_f8de_return_output;
     VAR_color1_MUX_uxn_c_l248_c8_4853_cond := VAR_BIN_OP_EQ_uxn_c_l248_c12_f8de_return_output;
     VAR_color2_MUX_uxn_c_l248_c8_4853_cond := VAR_BIN_OP_EQ_uxn_c_l248_c12_f8de_return_output;
     VAR_color3_MUX_uxn_c_l248_c8_4853_cond := VAR_BIN_OP_EQ_uxn_c_l248_c12_f8de_return_output;
     VAR_tmp12_MUX_uxn_c_l248_c8_4853_cond := VAR_BIN_OP_EQ_uxn_c_l248_c12_f8de_return_output;
     VAR_color0_MUX_uxn_c_l259_c8_3ae0_cond := VAR_BIN_OP_EQ_uxn_c_l259_c12_b8ba_return_output;
     VAR_color1_MUX_uxn_c_l259_c8_3ae0_cond := VAR_BIN_OP_EQ_uxn_c_l259_c12_b8ba_return_output;
     VAR_color2_MUX_uxn_c_l259_c8_3ae0_cond := VAR_BIN_OP_EQ_uxn_c_l259_c12_b8ba_return_output;
     VAR_color3_MUX_uxn_c_l259_c8_3ae0_cond := VAR_BIN_OP_EQ_uxn_c_l259_c12_b8ba_return_output;
     VAR_tmp12_MUX_uxn_c_l259_c8_3ae0_cond := VAR_BIN_OP_EQ_uxn_c_l259_c12_b8ba_return_output;
     VAR_color2_MUX_uxn_c_l268_c8_8143_cond := VAR_BIN_OP_EQ_uxn_c_l268_c12_d740_return_output;
     VAR_color3_MUX_uxn_c_l268_c8_8143_cond := VAR_BIN_OP_EQ_uxn_c_l268_c12_d740_return_output;
     VAR_tmp12_MUX_uxn_c_l268_c8_8143_cond := VAR_BIN_OP_EQ_uxn_c_l268_c12_d740_return_output;
     VAR_result_MUX_uxn_c_l279_c2_352d_cond := VAR_BIN_OP_EQ_uxn_c_l279_c6_6681_return_output;
     VAR_result_MUX_uxn_c_l281_c9_8bd2_cond := VAR_BIN_OP_EQ_uxn_c_l281_c13_3611_return_output;
     VAR_result_MUX_uxn_c_l283_c9_5923_cond := VAR_BIN_OP_EQ_uxn_c_l283_c13_034c_return_output;
     VAR_color_cmp_1_uxn_c_l214_c3_fa35 := VAR_CAST_TO_uint4_t_uxn_c_l214_c17_cd77_return_output;
     VAR_color_cmp_1_MUX_uxn_c_l212_c2_95b0_iftrue := VAR_color_cmp_1_uxn_c_l214_c3_fa35;
     VAR_tmp12_uxn_c_l221_c4_cd2d := resize(VAR_color_cmp_1_uxn_c_l214_c3_fa35, 12);
     VAR_tmp12_uxn_c_l232_c4_b5a1 := resize(VAR_color_cmp_1_uxn_c_l214_c3_fa35, 12);
     VAR_tmp12_uxn_c_l243_c4_e5d0 := resize(VAR_color_cmp_1_uxn_c_l214_c3_fa35, 12);
     VAR_tmp12_uxn_c_l254_c4_b8b6 := resize(VAR_color_cmp_1_uxn_c_l214_c3_fa35, 12);
     VAR_CONST_SL_8_uxn_c_l222_c4_4251_x := VAR_tmp12_uxn_c_l221_c4_cd2d;
     VAR_CONST_SL_8_uxn_c_l233_c4_3661_x := VAR_tmp12_uxn_c_l232_c4_b5a1;
     VAR_CONST_SL_4_uxn_c_l244_c4_3ad0_x := VAR_tmp12_uxn_c_l243_c4_e5d0;
     VAR_CONST_SL_4_uxn_c_l255_c4_8e8d_x := VAR_tmp12_uxn_c_l254_c4_b8b6;
     -- CONST_SL_4[uxn_c_l244_c4_3ad0] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l244_c4_3ad0_x <= VAR_CONST_SL_4_uxn_c_l244_c4_3ad0_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l244_c4_3ad0_return_output := CONST_SL_4_uxn_c_l244_c4_3ad0_return_output;

     -- CONST_SL_4[uxn_c_l255_c4_8e8d] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l255_c4_8e8d_x <= VAR_CONST_SL_4_uxn_c_l255_c4_8e8d_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l255_c4_8e8d_return_output := CONST_SL_4_uxn_c_l255_c4_8e8d_return_output;

     -- CAST_TO_uint4_t[uxn_c_l213_c17_b59e] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l213_c17_b59e_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l213_c27_e3be_return_output);

     -- color_cmp_1_MUX[uxn_c_l212_c2_95b0] LATENCY=0
     -- Inputs
     color_cmp_1_MUX_uxn_c_l212_c2_95b0_cond <= VAR_color_cmp_1_MUX_uxn_c_l212_c2_95b0_cond;
     color_cmp_1_MUX_uxn_c_l212_c2_95b0_iftrue <= VAR_color_cmp_1_MUX_uxn_c_l212_c2_95b0_iftrue;
     color_cmp_1_MUX_uxn_c_l212_c2_95b0_iffalse <= VAR_color_cmp_1_MUX_uxn_c_l212_c2_95b0_iffalse;
     -- Outputs
     VAR_color_cmp_1_MUX_uxn_c_l212_c2_95b0_return_output := color_cmp_1_MUX_uxn_c_l212_c2_95b0_return_output;

     -- CONST_SL_8[uxn_c_l233_c4_3661] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l233_c4_3661_x <= VAR_CONST_SL_8_uxn_c_l233_c4_3661_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l233_c4_3661_return_output := CONST_SL_8_uxn_c_l233_c4_3661_return_output;

     -- CONST_SL_8[uxn_c_l222_c4_4251] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l222_c4_4251_x <= VAR_CONST_SL_8_uxn_c_l222_c4_4251_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l222_c4_4251_return_output := CONST_SL_8_uxn_c_l222_c4_4251_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l273_l264_DUPLICATE_31fc LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l273_l264_DUPLICATE_31fc_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_1_uxn_c_l214_c3_fa35);

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_c_l266_c4_1209_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l273_l264_DUPLICATE_31fc_return_output;
     VAR_BIN_OP_OR_uxn_c_l275_c4_f4de_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l273_l264_DUPLICATE_31fc_return_output;
     VAR_tmp12_MUX_uxn_c_l259_c8_3ae0_iftrue := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l273_l264_DUPLICATE_31fc_return_output;
     VAR_tmp12_MUX_uxn_c_l268_c8_8143_iftrue := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l273_l264_DUPLICATE_31fc_return_output;
     VAR_color_cmp_0_uxn_c_l213_c3_39e5 := VAR_CAST_TO_uint4_t_uxn_c_l213_c17_b59e_return_output;
     VAR_BIN_OP_OR_uxn_c_l246_c4_6f41_right := VAR_CONST_SL_4_uxn_c_l244_c4_3ad0_return_output;
     VAR_tmp12_MUX_uxn_c_l237_c8_a0d5_iftrue := VAR_CONST_SL_4_uxn_c_l244_c4_3ad0_return_output;
     VAR_BIN_OP_OR_uxn_c_l257_c4_6b1a_right := VAR_CONST_SL_4_uxn_c_l255_c4_8e8d_return_output;
     VAR_tmp12_MUX_uxn_c_l248_c8_4853_iftrue := VAR_CONST_SL_4_uxn_c_l255_c4_8e8d_return_output;
     VAR_BIN_OP_OR_uxn_c_l224_c4_c208_right := VAR_CONST_SL_8_uxn_c_l222_c4_4251_return_output;
     VAR_tmp12_MUX_uxn_c_l215_c3_a654_iftrue := VAR_CONST_SL_8_uxn_c_l222_c4_4251_return_output;
     VAR_BIN_OP_OR_uxn_c_l235_c4_b0ec_right := VAR_CONST_SL_8_uxn_c_l233_c4_3661_return_output;
     VAR_tmp12_MUX_uxn_c_l226_c8_7a2b_iftrue := VAR_CONST_SL_8_uxn_c_l233_c4_3661_return_output;
     REG_VAR_color_cmp_1 := VAR_color_cmp_1_MUX_uxn_c_l212_c2_95b0_return_output;
     VAR_color_cmp_0_MUX_uxn_c_l212_c2_95b0_iftrue := VAR_color_cmp_0_uxn_c_l213_c3_39e5;
     VAR_tmp12_uxn_c_l216_c4_7f1e := resize(VAR_color_cmp_0_uxn_c_l213_c3_39e5, 12);
     VAR_tmp12_uxn_c_l227_c4_64ce := resize(VAR_color_cmp_0_uxn_c_l213_c3_39e5, 12);
     VAR_tmp12_uxn_c_l238_c4_0f68 := resize(VAR_color_cmp_0_uxn_c_l213_c3_39e5, 12);
     VAR_tmp12_uxn_c_l249_c4_9b93 := resize(VAR_color_cmp_0_uxn_c_l213_c3_39e5, 12);
     VAR_CONST_SL_8_uxn_c_l217_c4_3f78_x := VAR_tmp12_uxn_c_l216_c4_7f1e;
     VAR_CONST_SL_8_uxn_c_l228_c4_17bc_x := VAR_tmp12_uxn_c_l227_c4_64ce;
     VAR_CONST_SL_4_uxn_c_l239_c4_4cb6_x := VAR_tmp12_uxn_c_l238_c4_0f68;
     VAR_CONST_SL_4_uxn_c_l250_c4_9e96_x := VAR_tmp12_uxn_c_l249_c4_9b93;
     -- BIN_OP_OR[uxn_c_l224_c4_c208] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l224_c4_c208_left <= VAR_BIN_OP_OR_uxn_c_l224_c4_c208_left;
     BIN_OP_OR_uxn_c_l224_c4_c208_right <= VAR_BIN_OP_OR_uxn_c_l224_c4_c208_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l224_c4_c208_return_output := BIN_OP_OR_uxn_c_l224_c4_c208_return_output;

     -- CONST_SL_8[uxn_c_l217_c4_3f78] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l217_c4_3f78_x <= VAR_CONST_SL_8_uxn_c_l217_c4_3f78_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l217_c4_3f78_return_output := CONST_SL_8_uxn_c_l217_c4_3f78_return_output;

     -- BIN_OP_OR[uxn_c_l266_c4_1209] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l266_c4_1209_left <= VAR_BIN_OP_OR_uxn_c_l266_c4_1209_left;
     BIN_OP_OR_uxn_c_l266_c4_1209_right <= VAR_BIN_OP_OR_uxn_c_l266_c4_1209_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l266_c4_1209_return_output := BIN_OP_OR_uxn_c_l266_c4_1209_return_output;

     -- tmp12_MUX[uxn_c_l268_c8_8143] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l268_c8_8143_cond <= VAR_tmp12_MUX_uxn_c_l268_c8_8143_cond;
     tmp12_MUX_uxn_c_l268_c8_8143_iftrue <= VAR_tmp12_MUX_uxn_c_l268_c8_8143_iftrue;
     tmp12_MUX_uxn_c_l268_c8_8143_iffalse <= VAR_tmp12_MUX_uxn_c_l268_c8_8143_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l268_c8_8143_return_output := tmp12_MUX_uxn_c_l268_c8_8143_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l260_l269_DUPLICATE_a20b LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l260_l269_DUPLICATE_a20b_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_0_uxn_c_l213_c3_39e5);

     -- BIN_OP_OR[uxn_c_l257_c4_6b1a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l257_c4_6b1a_left <= VAR_BIN_OP_OR_uxn_c_l257_c4_6b1a_left;
     BIN_OP_OR_uxn_c_l257_c4_6b1a_right <= VAR_BIN_OP_OR_uxn_c_l257_c4_6b1a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l257_c4_6b1a_return_output := BIN_OP_OR_uxn_c_l257_c4_6b1a_return_output;

     -- CONST_SL_8[uxn_c_l228_c4_17bc] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l228_c4_17bc_x <= VAR_CONST_SL_8_uxn_c_l228_c4_17bc_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l228_c4_17bc_return_output := CONST_SL_8_uxn_c_l228_c4_17bc_return_output;

     -- BIN_OP_OR[uxn_c_l235_c4_b0ec] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l235_c4_b0ec_left <= VAR_BIN_OP_OR_uxn_c_l235_c4_b0ec_left;
     BIN_OP_OR_uxn_c_l235_c4_b0ec_right <= VAR_BIN_OP_OR_uxn_c_l235_c4_b0ec_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l235_c4_b0ec_return_output := BIN_OP_OR_uxn_c_l235_c4_b0ec_return_output;

     -- CONST_SL_4[uxn_c_l250_c4_9e96] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l250_c4_9e96_x <= VAR_CONST_SL_4_uxn_c_l250_c4_9e96_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l250_c4_9e96_return_output := CONST_SL_4_uxn_c_l250_c4_9e96_return_output;

     -- CONST_SL_4[uxn_c_l239_c4_4cb6] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l239_c4_4cb6_x <= VAR_CONST_SL_4_uxn_c_l239_c4_4cb6_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l239_c4_4cb6_return_output := CONST_SL_4_uxn_c_l239_c4_4cb6_return_output;

     -- BIN_OP_OR[uxn_c_l246_c4_6f41] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l246_c4_6f41_left <= VAR_BIN_OP_OR_uxn_c_l246_c4_6f41_left;
     BIN_OP_OR_uxn_c_l246_c4_6f41_right <= VAR_BIN_OP_OR_uxn_c_l246_c4_6f41_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l246_c4_6f41_return_output := BIN_OP_OR_uxn_c_l246_c4_6f41_return_output;

     -- BIN_OP_OR[uxn_c_l275_c4_f4de] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l275_c4_f4de_left <= VAR_BIN_OP_OR_uxn_c_l275_c4_f4de_left;
     BIN_OP_OR_uxn_c_l275_c4_f4de_right <= VAR_BIN_OP_OR_uxn_c_l275_c4_f4de_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l275_c4_f4de_return_output := BIN_OP_OR_uxn_c_l275_c4_f4de_return_output;

     -- color_cmp_0_MUX[uxn_c_l212_c2_95b0] LATENCY=0
     -- Inputs
     color_cmp_0_MUX_uxn_c_l212_c2_95b0_cond <= VAR_color_cmp_0_MUX_uxn_c_l212_c2_95b0_cond;
     color_cmp_0_MUX_uxn_c_l212_c2_95b0_iftrue <= VAR_color_cmp_0_MUX_uxn_c_l212_c2_95b0_iftrue;
     color_cmp_0_MUX_uxn_c_l212_c2_95b0_iffalse <= VAR_color_cmp_0_MUX_uxn_c_l212_c2_95b0_iffalse;
     -- Outputs
     VAR_color_cmp_0_MUX_uxn_c_l212_c2_95b0_return_output := color_cmp_0_MUX_uxn_c_l212_c2_95b0_return_output;

     -- Submodule level 3
     VAR_color1_MUX_uxn_c_l215_c3_a654_iftrue := VAR_BIN_OP_OR_uxn_c_l224_c4_c208_return_output;
     VAR_color3_MUX_uxn_c_l226_c8_7a2b_iftrue := VAR_BIN_OP_OR_uxn_c_l235_c4_b0ec_return_output;
     VAR_color1_MUX_uxn_c_l237_c8_a0d5_iftrue := VAR_BIN_OP_OR_uxn_c_l246_c4_6f41_return_output;
     VAR_color3_MUX_uxn_c_l248_c8_4853_iftrue := VAR_BIN_OP_OR_uxn_c_l257_c4_6b1a_return_output;
     VAR_color1_MUX_uxn_c_l259_c8_3ae0_iftrue := VAR_BIN_OP_OR_uxn_c_l266_c4_1209_return_output;
     VAR_color3_MUX_uxn_c_l268_c8_8143_iftrue := VAR_BIN_OP_OR_uxn_c_l275_c4_f4de_return_output;
     VAR_BIN_OP_OR_uxn_c_l262_c4_b53c_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l260_l269_DUPLICATE_a20b_return_output;
     VAR_BIN_OP_OR_uxn_c_l271_c4_bc8c_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l260_l269_DUPLICATE_a20b_return_output;
     VAR_BIN_OP_OR_uxn_c_l241_c4_ea03_right := VAR_CONST_SL_4_uxn_c_l239_c4_4cb6_return_output;
     VAR_BIN_OP_OR_uxn_c_l252_c4_9c1c_right := VAR_CONST_SL_4_uxn_c_l250_c4_9e96_return_output;
     VAR_BIN_OP_OR_uxn_c_l219_c4_a63e_right := VAR_CONST_SL_8_uxn_c_l217_c4_3f78_return_output;
     VAR_BIN_OP_OR_uxn_c_l230_c4_2597_right := VAR_CONST_SL_8_uxn_c_l228_c4_17bc_return_output;
     REG_VAR_color_cmp_0 := VAR_color_cmp_0_MUX_uxn_c_l212_c2_95b0_return_output;
     VAR_tmp12_MUX_uxn_c_l259_c8_3ae0_iffalse := VAR_tmp12_MUX_uxn_c_l268_c8_8143_return_output;
     -- BIN_OP_OR[uxn_c_l262_c4_b53c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l262_c4_b53c_left <= VAR_BIN_OP_OR_uxn_c_l262_c4_b53c_left;
     BIN_OP_OR_uxn_c_l262_c4_b53c_right <= VAR_BIN_OP_OR_uxn_c_l262_c4_b53c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l262_c4_b53c_return_output := BIN_OP_OR_uxn_c_l262_c4_b53c_return_output;

     -- BIN_OP_OR[uxn_c_l230_c4_2597] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l230_c4_2597_left <= VAR_BIN_OP_OR_uxn_c_l230_c4_2597_left;
     BIN_OP_OR_uxn_c_l230_c4_2597_right <= VAR_BIN_OP_OR_uxn_c_l230_c4_2597_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l230_c4_2597_return_output := BIN_OP_OR_uxn_c_l230_c4_2597_return_output;

     -- BIN_OP_OR[uxn_c_l271_c4_bc8c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l271_c4_bc8c_left <= VAR_BIN_OP_OR_uxn_c_l271_c4_bc8c_left;
     BIN_OP_OR_uxn_c_l271_c4_bc8c_right <= VAR_BIN_OP_OR_uxn_c_l271_c4_bc8c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l271_c4_bc8c_return_output := BIN_OP_OR_uxn_c_l271_c4_bc8c_return_output;

     -- BIN_OP_OR[uxn_c_l241_c4_ea03] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l241_c4_ea03_left <= VAR_BIN_OP_OR_uxn_c_l241_c4_ea03_left;
     BIN_OP_OR_uxn_c_l241_c4_ea03_right <= VAR_BIN_OP_OR_uxn_c_l241_c4_ea03_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l241_c4_ea03_return_output := BIN_OP_OR_uxn_c_l241_c4_ea03_return_output;

     -- tmp12_MUX[uxn_c_l259_c8_3ae0] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l259_c8_3ae0_cond <= VAR_tmp12_MUX_uxn_c_l259_c8_3ae0_cond;
     tmp12_MUX_uxn_c_l259_c8_3ae0_iftrue <= VAR_tmp12_MUX_uxn_c_l259_c8_3ae0_iftrue;
     tmp12_MUX_uxn_c_l259_c8_3ae0_iffalse <= VAR_tmp12_MUX_uxn_c_l259_c8_3ae0_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l259_c8_3ae0_return_output := tmp12_MUX_uxn_c_l259_c8_3ae0_return_output;

     -- BIN_OP_OR[uxn_c_l252_c4_9c1c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l252_c4_9c1c_left <= VAR_BIN_OP_OR_uxn_c_l252_c4_9c1c_left;
     BIN_OP_OR_uxn_c_l252_c4_9c1c_right <= VAR_BIN_OP_OR_uxn_c_l252_c4_9c1c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l252_c4_9c1c_return_output := BIN_OP_OR_uxn_c_l252_c4_9c1c_return_output;

     -- BIN_OP_OR[uxn_c_l219_c4_a63e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l219_c4_a63e_left <= VAR_BIN_OP_OR_uxn_c_l219_c4_a63e_left;
     BIN_OP_OR_uxn_c_l219_c4_a63e_right <= VAR_BIN_OP_OR_uxn_c_l219_c4_a63e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l219_c4_a63e_return_output := BIN_OP_OR_uxn_c_l219_c4_a63e_return_output;

     -- color1_MUX[uxn_c_l259_c8_3ae0] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l259_c8_3ae0_cond <= VAR_color1_MUX_uxn_c_l259_c8_3ae0_cond;
     color1_MUX_uxn_c_l259_c8_3ae0_iftrue <= VAR_color1_MUX_uxn_c_l259_c8_3ae0_iftrue;
     color1_MUX_uxn_c_l259_c8_3ae0_iffalse <= VAR_color1_MUX_uxn_c_l259_c8_3ae0_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l259_c8_3ae0_return_output := color1_MUX_uxn_c_l259_c8_3ae0_return_output;

     -- color3_MUX[uxn_c_l268_c8_8143] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l268_c8_8143_cond <= VAR_color3_MUX_uxn_c_l268_c8_8143_cond;
     color3_MUX_uxn_c_l268_c8_8143_iftrue <= VAR_color3_MUX_uxn_c_l268_c8_8143_iftrue;
     color3_MUX_uxn_c_l268_c8_8143_iffalse <= VAR_color3_MUX_uxn_c_l268_c8_8143_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l268_c8_8143_return_output := color3_MUX_uxn_c_l268_c8_8143_return_output;

     -- Submodule level 4
     VAR_color0_MUX_uxn_c_l215_c3_a654_iftrue := VAR_BIN_OP_OR_uxn_c_l219_c4_a63e_return_output;
     VAR_color2_MUX_uxn_c_l226_c8_7a2b_iftrue := VAR_BIN_OP_OR_uxn_c_l230_c4_2597_return_output;
     VAR_color0_MUX_uxn_c_l237_c8_a0d5_iftrue := VAR_BIN_OP_OR_uxn_c_l241_c4_ea03_return_output;
     VAR_color2_MUX_uxn_c_l248_c8_4853_iftrue := VAR_BIN_OP_OR_uxn_c_l252_c4_9c1c_return_output;
     VAR_color0_MUX_uxn_c_l259_c8_3ae0_iftrue := VAR_BIN_OP_OR_uxn_c_l262_c4_b53c_return_output;
     VAR_color2_MUX_uxn_c_l268_c8_8143_iftrue := VAR_BIN_OP_OR_uxn_c_l271_c4_bc8c_return_output;
     VAR_color1_MUX_uxn_c_l248_c8_4853_iffalse := VAR_color1_MUX_uxn_c_l259_c8_3ae0_return_output;
     VAR_color3_MUX_uxn_c_l259_c8_3ae0_iffalse := VAR_color3_MUX_uxn_c_l268_c8_8143_return_output;
     VAR_tmp12_MUX_uxn_c_l248_c8_4853_iffalse := VAR_tmp12_MUX_uxn_c_l259_c8_3ae0_return_output;
     -- color0_MUX[uxn_c_l259_c8_3ae0] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l259_c8_3ae0_cond <= VAR_color0_MUX_uxn_c_l259_c8_3ae0_cond;
     color0_MUX_uxn_c_l259_c8_3ae0_iftrue <= VAR_color0_MUX_uxn_c_l259_c8_3ae0_iftrue;
     color0_MUX_uxn_c_l259_c8_3ae0_iffalse <= VAR_color0_MUX_uxn_c_l259_c8_3ae0_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l259_c8_3ae0_return_output := color0_MUX_uxn_c_l259_c8_3ae0_return_output;

     -- color3_MUX[uxn_c_l259_c8_3ae0] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l259_c8_3ae0_cond <= VAR_color3_MUX_uxn_c_l259_c8_3ae0_cond;
     color3_MUX_uxn_c_l259_c8_3ae0_iftrue <= VAR_color3_MUX_uxn_c_l259_c8_3ae0_iftrue;
     color3_MUX_uxn_c_l259_c8_3ae0_iffalse <= VAR_color3_MUX_uxn_c_l259_c8_3ae0_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l259_c8_3ae0_return_output := color3_MUX_uxn_c_l259_c8_3ae0_return_output;

     -- color1_MUX[uxn_c_l248_c8_4853] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l248_c8_4853_cond <= VAR_color1_MUX_uxn_c_l248_c8_4853_cond;
     color1_MUX_uxn_c_l248_c8_4853_iftrue <= VAR_color1_MUX_uxn_c_l248_c8_4853_iftrue;
     color1_MUX_uxn_c_l248_c8_4853_iffalse <= VAR_color1_MUX_uxn_c_l248_c8_4853_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l248_c8_4853_return_output := color1_MUX_uxn_c_l248_c8_4853_return_output;

     -- tmp12_MUX[uxn_c_l248_c8_4853] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l248_c8_4853_cond <= VAR_tmp12_MUX_uxn_c_l248_c8_4853_cond;
     tmp12_MUX_uxn_c_l248_c8_4853_iftrue <= VAR_tmp12_MUX_uxn_c_l248_c8_4853_iftrue;
     tmp12_MUX_uxn_c_l248_c8_4853_iffalse <= VAR_tmp12_MUX_uxn_c_l248_c8_4853_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l248_c8_4853_return_output := tmp12_MUX_uxn_c_l248_c8_4853_return_output;

     -- color2_MUX[uxn_c_l268_c8_8143] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l268_c8_8143_cond <= VAR_color2_MUX_uxn_c_l268_c8_8143_cond;
     color2_MUX_uxn_c_l268_c8_8143_iftrue <= VAR_color2_MUX_uxn_c_l268_c8_8143_iftrue;
     color2_MUX_uxn_c_l268_c8_8143_iffalse <= VAR_color2_MUX_uxn_c_l268_c8_8143_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l268_c8_8143_return_output := color2_MUX_uxn_c_l268_c8_8143_return_output;

     -- Submodule level 5
     VAR_color0_MUX_uxn_c_l248_c8_4853_iffalse := VAR_color0_MUX_uxn_c_l259_c8_3ae0_return_output;
     VAR_color1_MUX_uxn_c_l237_c8_a0d5_iffalse := VAR_color1_MUX_uxn_c_l248_c8_4853_return_output;
     VAR_color2_MUX_uxn_c_l259_c8_3ae0_iffalse := VAR_color2_MUX_uxn_c_l268_c8_8143_return_output;
     VAR_color3_MUX_uxn_c_l248_c8_4853_iffalse := VAR_color3_MUX_uxn_c_l259_c8_3ae0_return_output;
     VAR_tmp12_MUX_uxn_c_l237_c8_a0d5_iffalse := VAR_tmp12_MUX_uxn_c_l248_c8_4853_return_output;
     -- color2_MUX[uxn_c_l259_c8_3ae0] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l259_c8_3ae0_cond <= VAR_color2_MUX_uxn_c_l259_c8_3ae0_cond;
     color2_MUX_uxn_c_l259_c8_3ae0_iftrue <= VAR_color2_MUX_uxn_c_l259_c8_3ae0_iftrue;
     color2_MUX_uxn_c_l259_c8_3ae0_iffalse <= VAR_color2_MUX_uxn_c_l259_c8_3ae0_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l259_c8_3ae0_return_output := color2_MUX_uxn_c_l259_c8_3ae0_return_output;

     -- tmp12_MUX[uxn_c_l237_c8_a0d5] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l237_c8_a0d5_cond <= VAR_tmp12_MUX_uxn_c_l237_c8_a0d5_cond;
     tmp12_MUX_uxn_c_l237_c8_a0d5_iftrue <= VAR_tmp12_MUX_uxn_c_l237_c8_a0d5_iftrue;
     tmp12_MUX_uxn_c_l237_c8_a0d5_iffalse <= VAR_tmp12_MUX_uxn_c_l237_c8_a0d5_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l237_c8_a0d5_return_output := tmp12_MUX_uxn_c_l237_c8_a0d5_return_output;

     -- color0_MUX[uxn_c_l248_c8_4853] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l248_c8_4853_cond <= VAR_color0_MUX_uxn_c_l248_c8_4853_cond;
     color0_MUX_uxn_c_l248_c8_4853_iftrue <= VAR_color0_MUX_uxn_c_l248_c8_4853_iftrue;
     color0_MUX_uxn_c_l248_c8_4853_iffalse <= VAR_color0_MUX_uxn_c_l248_c8_4853_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l248_c8_4853_return_output := color0_MUX_uxn_c_l248_c8_4853_return_output;

     -- color3_MUX[uxn_c_l248_c8_4853] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l248_c8_4853_cond <= VAR_color3_MUX_uxn_c_l248_c8_4853_cond;
     color3_MUX_uxn_c_l248_c8_4853_iftrue <= VAR_color3_MUX_uxn_c_l248_c8_4853_iftrue;
     color3_MUX_uxn_c_l248_c8_4853_iffalse <= VAR_color3_MUX_uxn_c_l248_c8_4853_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l248_c8_4853_return_output := color3_MUX_uxn_c_l248_c8_4853_return_output;

     -- color1_MUX[uxn_c_l237_c8_a0d5] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l237_c8_a0d5_cond <= VAR_color1_MUX_uxn_c_l237_c8_a0d5_cond;
     color1_MUX_uxn_c_l237_c8_a0d5_iftrue <= VAR_color1_MUX_uxn_c_l237_c8_a0d5_iftrue;
     color1_MUX_uxn_c_l237_c8_a0d5_iffalse <= VAR_color1_MUX_uxn_c_l237_c8_a0d5_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l237_c8_a0d5_return_output := color1_MUX_uxn_c_l237_c8_a0d5_return_output;

     -- Submodule level 6
     VAR_color0_MUX_uxn_c_l237_c8_a0d5_iffalse := VAR_color0_MUX_uxn_c_l248_c8_4853_return_output;
     VAR_color1_MUX_uxn_c_l226_c8_7a2b_iffalse := VAR_color1_MUX_uxn_c_l237_c8_a0d5_return_output;
     VAR_color2_MUX_uxn_c_l248_c8_4853_iffalse := VAR_color2_MUX_uxn_c_l259_c8_3ae0_return_output;
     VAR_color3_MUX_uxn_c_l237_c8_a0d5_iffalse := VAR_color3_MUX_uxn_c_l248_c8_4853_return_output;
     VAR_tmp12_MUX_uxn_c_l226_c8_7a2b_iffalse := VAR_tmp12_MUX_uxn_c_l237_c8_a0d5_return_output;
     -- color3_MUX[uxn_c_l237_c8_a0d5] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l237_c8_a0d5_cond <= VAR_color3_MUX_uxn_c_l237_c8_a0d5_cond;
     color3_MUX_uxn_c_l237_c8_a0d5_iftrue <= VAR_color3_MUX_uxn_c_l237_c8_a0d5_iftrue;
     color3_MUX_uxn_c_l237_c8_a0d5_iffalse <= VAR_color3_MUX_uxn_c_l237_c8_a0d5_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l237_c8_a0d5_return_output := color3_MUX_uxn_c_l237_c8_a0d5_return_output;

     -- color2_MUX[uxn_c_l248_c8_4853] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l248_c8_4853_cond <= VAR_color2_MUX_uxn_c_l248_c8_4853_cond;
     color2_MUX_uxn_c_l248_c8_4853_iftrue <= VAR_color2_MUX_uxn_c_l248_c8_4853_iftrue;
     color2_MUX_uxn_c_l248_c8_4853_iffalse <= VAR_color2_MUX_uxn_c_l248_c8_4853_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l248_c8_4853_return_output := color2_MUX_uxn_c_l248_c8_4853_return_output;

     -- color0_MUX[uxn_c_l237_c8_a0d5] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l237_c8_a0d5_cond <= VAR_color0_MUX_uxn_c_l237_c8_a0d5_cond;
     color0_MUX_uxn_c_l237_c8_a0d5_iftrue <= VAR_color0_MUX_uxn_c_l237_c8_a0d5_iftrue;
     color0_MUX_uxn_c_l237_c8_a0d5_iffalse <= VAR_color0_MUX_uxn_c_l237_c8_a0d5_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l237_c8_a0d5_return_output := color0_MUX_uxn_c_l237_c8_a0d5_return_output;

     -- color1_MUX[uxn_c_l226_c8_7a2b] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l226_c8_7a2b_cond <= VAR_color1_MUX_uxn_c_l226_c8_7a2b_cond;
     color1_MUX_uxn_c_l226_c8_7a2b_iftrue <= VAR_color1_MUX_uxn_c_l226_c8_7a2b_iftrue;
     color1_MUX_uxn_c_l226_c8_7a2b_iffalse <= VAR_color1_MUX_uxn_c_l226_c8_7a2b_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l226_c8_7a2b_return_output := color1_MUX_uxn_c_l226_c8_7a2b_return_output;

     -- tmp12_MUX[uxn_c_l226_c8_7a2b] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l226_c8_7a2b_cond <= VAR_tmp12_MUX_uxn_c_l226_c8_7a2b_cond;
     tmp12_MUX_uxn_c_l226_c8_7a2b_iftrue <= VAR_tmp12_MUX_uxn_c_l226_c8_7a2b_iftrue;
     tmp12_MUX_uxn_c_l226_c8_7a2b_iffalse <= VAR_tmp12_MUX_uxn_c_l226_c8_7a2b_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l226_c8_7a2b_return_output := tmp12_MUX_uxn_c_l226_c8_7a2b_return_output;

     -- Submodule level 7
     VAR_color0_MUX_uxn_c_l226_c8_7a2b_iffalse := VAR_color0_MUX_uxn_c_l237_c8_a0d5_return_output;
     VAR_color1_MUX_uxn_c_l215_c3_a654_iffalse := VAR_color1_MUX_uxn_c_l226_c8_7a2b_return_output;
     VAR_color2_MUX_uxn_c_l237_c8_a0d5_iffalse := VAR_color2_MUX_uxn_c_l248_c8_4853_return_output;
     VAR_color3_MUX_uxn_c_l226_c8_7a2b_iffalse := VAR_color3_MUX_uxn_c_l237_c8_a0d5_return_output;
     VAR_tmp12_MUX_uxn_c_l215_c3_a654_iffalse := VAR_tmp12_MUX_uxn_c_l226_c8_7a2b_return_output;
     -- color2_MUX[uxn_c_l237_c8_a0d5] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l237_c8_a0d5_cond <= VAR_color2_MUX_uxn_c_l237_c8_a0d5_cond;
     color2_MUX_uxn_c_l237_c8_a0d5_iftrue <= VAR_color2_MUX_uxn_c_l237_c8_a0d5_iftrue;
     color2_MUX_uxn_c_l237_c8_a0d5_iffalse <= VAR_color2_MUX_uxn_c_l237_c8_a0d5_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l237_c8_a0d5_return_output := color2_MUX_uxn_c_l237_c8_a0d5_return_output;

     -- color0_MUX[uxn_c_l226_c8_7a2b] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l226_c8_7a2b_cond <= VAR_color0_MUX_uxn_c_l226_c8_7a2b_cond;
     color0_MUX_uxn_c_l226_c8_7a2b_iftrue <= VAR_color0_MUX_uxn_c_l226_c8_7a2b_iftrue;
     color0_MUX_uxn_c_l226_c8_7a2b_iffalse <= VAR_color0_MUX_uxn_c_l226_c8_7a2b_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l226_c8_7a2b_return_output := color0_MUX_uxn_c_l226_c8_7a2b_return_output;

     -- color3_MUX[uxn_c_l226_c8_7a2b] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l226_c8_7a2b_cond <= VAR_color3_MUX_uxn_c_l226_c8_7a2b_cond;
     color3_MUX_uxn_c_l226_c8_7a2b_iftrue <= VAR_color3_MUX_uxn_c_l226_c8_7a2b_iftrue;
     color3_MUX_uxn_c_l226_c8_7a2b_iffalse <= VAR_color3_MUX_uxn_c_l226_c8_7a2b_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l226_c8_7a2b_return_output := color3_MUX_uxn_c_l226_c8_7a2b_return_output;

     -- tmp12_MUX[uxn_c_l215_c3_a654] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l215_c3_a654_cond <= VAR_tmp12_MUX_uxn_c_l215_c3_a654_cond;
     tmp12_MUX_uxn_c_l215_c3_a654_iftrue <= VAR_tmp12_MUX_uxn_c_l215_c3_a654_iftrue;
     tmp12_MUX_uxn_c_l215_c3_a654_iffalse <= VAR_tmp12_MUX_uxn_c_l215_c3_a654_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l215_c3_a654_return_output := tmp12_MUX_uxn_c_l215_c3_a654_return_output;

     -- color1_MUX[uxn_c_l215_c3_a654] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l215_c3_a654_cond <= VAR_color1_MUX_uxn_c_l215_c3_a654_cond;
     color1_MUX_uxn_c_l215_c3_a654_iftrue <= VAR_color1_MUX_uxn_c_l215_c3_a654_iftrue;
     color1_MUX_uxn_c_l215_c3_a654_iffalse <= VAR_color1_MUX_uxn_c_l215_c3_a654_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l215_c3_a654_return_output := color1_MUX_uxn_c_l215_c3_a654_return_output;

     -- Submodule level 8
     VAR_color0_MUX_uxn_c_l215_c3_a654_iffalse := VAR_color0_MUX_uxn_c_l226_c8_7a2b_return_output;
     VAR_color1_MUX_uxn_c_l212_c2_95b0_iftrue := VAR_color1_MUX_uxn_c_l215_c3_a654_return_output;
     VAR_color2_MUX_uxn_c_l226_c8_7a2b_iffalse := VAR_color2_MUX_uxn_c_l237_c8_a0d5_return_output;
     VAR_color3_MUX_uxn_c_l215_c3_a654_iffalse := VAR_color3_MUX_uxn_c_l226_c8_7a2b_return_output;
     VAR_tmp12_MUX_uxn_c_l212_c2_95b0_iftrue := VAR_tmp12_MUX_uxn_c_l215_c3_a654_return_output;
     -- tmp12_MUX[uxn_c_l212_c2_95b0] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l212_c2_95b0_cond <= VAR_tmp12_MUX_uxn_c_l212_c2_95b0_cond;
     tmp12_MUX_uxn_c_l212_c2_95b0_iftrue <= VAR_tmp12_MUX_uxn_c_l212_c2_95b0_iftrue;
     tmp12_MUX_uxn_c_l212_c2_95b0_iffalse <= VAR_tmp12_MUX_uxn_c_l212_c2_95b0_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l212_c2_95b0_return_output := tmp12_MUX_uxn_c_l212_c2_95b0_return_output;

     -- color0_MUX[uxn_c_l215_c3_a654] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l215_c3_a654_cond <= VAR_color0_MUX_uxn_c_l215_c3_a654_cond;
     color0_MUX_uxn_c_l215_c3_a654_iftrue <= VAR_color0_MUX_uxn_c_l215_c3_a654_iftrue;
     color0_MUX_uxn_c_l215_c3_a654_iffalse <= VAR_color0_MUX_uxn_c_l215_c3_a654_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l215_c3_a654_return_output := color0_MUX_uxn_c_l215_c3_a654_return_output;

     -- color3_MUX[uxn_c_l215_c3_a654] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l215_c3_a654_cond <= VAR_color3_MUX_uxn_c_l215_c3_a654_cond;
     color3_MUX_uxn_c_l215_c3_a654_iftrue <= VAR_color3_MUX_uxn_c_l215_c3_a654_iftrue;
     color3_MUX_uxn_c_l215_c3_a654_iffalse <= VAR_color3_MUX_uxn_c_l215_c3_a654_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l215_c3_a654_return_output := color3_MUX_uxn_c_l215_c3_a654_return_output;

     -- color1_MUX[uxn_c_l212_c2_95b0] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l212_c2_95b0_cond <= VAR_color1_MUX_uxn_c_l212_c2_95b0_cond;
     color1_MUX_uxn_c_l212_c2_95b0_iftrue <= VAR_color1_MUX_uxn_c_l212_c2_95b0_iftrue;
     color1_MUX_uxn_c_l212_c2_95b0_iffalse <= VAR_color1_MUX_uxn_c_l212_c2_95b0_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l212_c2_95b0_return_output := color1_MUX_uxn_c_l212_c2_95b0_return_output;

     -- color2_MUX[uxn_c_l226_c8_7a2b] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l226_c8_7a2b_cond <= VAR_color2_MUX_uxn_c_l226_c8_7a2b_cond;
     color2_MUX_uxn_c_l226_c8_7a2b_iftrue <= VAR_color2_MUX_uxn_c_l226_c8_7a2b_iftrue;
     color2_MUX_uxn_c_l226_c8_7a2b_iffalse <= VAR_color2_MUX_uxn_c_l226_c8_7a2b_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l226_c8_7a2b_return_output := color2_MUX_uxn_c_l226_c8_7a2b_return_output;

     -- Submodule level 9
     VAR_color0_MUX_uxn_c_l212_c2_95b0_iftrue := VAR_color0_MUX_uxn_c_l215_c3_a654_return_output;
     REG_VAR_color1 := VAR_color1_MUX_uxn_c_l212_c2_95b0_return_output;
     VAR_result_uxn_c_l282_c3_1be7 := resize(VAR_color1_MUX_uxn_c_l212_c2_95b0_return_output, 16);
     VAR_color2_MUX_uxn_c_l215_c3_a654_iffalse := VAR_color2_MUX_uxn_c_l226_c8_7a2b_return_output;
     VAR_color3_MUX_uxn_c_l212_c2_95b0_iftrue := VAR_color3_MUX_uxn_c_l215_c3_a654_return_output;
     REG_VAR_tmp12 := VAR_tmp12_MUX_uxn_c_l212_c2_95b0_return_output;
     VAR_result_MUX_uxn_c_l281_c9_8bd2_iftrue := VAR_result_uxn_c_l282_c3_1be7;
     -- color0_MUX[uxn_c_l212_c2_95b0] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l212_c2_95b0_cond <= VAR_color0_MUX_uxn_c_l212_c2_95b0_cond;
     color0_MUX_uxn_c_l212_c2_95b0_iftrue <= VAR_color0_MUX_uxn_c_l212_c2_95b0_iftrue;
     color0_MUX_uxn_c_l212_c2_95b0_iffalse <= VAR_color0_MUX_uxn_c_l212_c2_95b0_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l212_c2_95b0_return_output := color0_MUX_uxn_c_l212_c2_95b0_return_output;

     -- color2_MUX[uxn_c_l215_c3_a654] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l215_c3_a654_cond <= VAR_color2_MUX_uxn_c_l215_c3_a654_cond;
     color2_MUX_uxn_c_l215_c3_a654_iftrue <= VAR_color2_MUX_uxn_c_l215_c3_a654_iftrue;
     color2_MUX_uxn_c_l215_c3_a654_iffalse <= VAR_color2_MUX_uxn_c_l215_c3_a654_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l215_c3_a654_return_output := color2_MUX_uxn_c_l215_c3_a654_return_output;

     -- color3_MUX[uxn_c_l212_c2_95b0] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l212_c2_95b0_cond <= VAR_color3_MUX_uxn_c_l212_c2_95b0_cond;
     color3_MUX_uxn_c_l212_c2_95b0_iftrue <= VAR_color3_MUX_uxn_c_l212_c2_95b0_iftrue;
     color3_MUX_uxn_c_l212_c2_95b0_iffalse <= VAR_color3_MUX_uxn_c_l212_c2_95b0_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l212_c2_95b0_return_output := color3_MUX_uxn_c_l212_c2_95b0_return_output;

     -- Submodule level 10
     REG_VAR_color0 := VAR_color0_MUX_uxn_c_l212_c2_95b0_return_output;
     VAR_result_uxn_c_l280_c3_6ae7 := resize(VAR_color0_MUX_uxn_c_l212_c2_95b0_return_output, 16);
     VAR_color2_MUX_uxn_c_l212_c2_95b0_iftrue := VAR_color2_MUX_uxn_c_l215_c3_a654_return_output;
     REG_VAR_color3 := VAR_color3_MUX_uxn_c_l212_c2_95b0_return_output;
     VAR_result_uxn_c_l286_c3_3f39 := resize(VAR_color3_MUX_uxn_c_l212_c2_95b0_return_output, 16);
     VAR_result_MUX_uxn_c_l279_c2_352d_iftrue := VAR_result_uxn_c_l280_c3_6ae7;
     VAR_result_MUX_uxn_c_l283_c9_5923_iffalse := VAR_result_uxn_c_l286_c3_3f39;
     -- color2_MUX[uxn_c_l212_c2_95b0] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l212_c2_95b0_cond <= VAR_color2_MUX_uxn_c_l212_c2_95b0_cond;
     color2_MUX_uxn_c_l212_c2_95b0_iftrue <= VAR_color2_MUX_uxn_c_l212_c2_95b0_iftrue;
     color2_MUX_uxn_c_l212_c2_95b0_iffalse <= VAR_color2_MUX_uxn_c_l212_c2_95b0_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l212_c2_95b0_return_output := color2_MUX_uxn_c_l212_c2_95b0_return_output;

     -- Submodule level 11
     REG_VAR_color2 := VAR_color2_MUX_uxn_c_l212_c2_95b0_return_output;
     VAR_result_uxn_c_l284_c3_f322 := resize(VAR_color2_MUX_uxn_c_l212_c2_95b0_return_output, 16);
     VAR_result_MUX_uxn_c_l283_c9_5923_iftrue := VAR_result_uxn_c_l284_c3_f322;
     -- result_MUX[uxn_c_l283_c9_5923] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l283_c9_5923_cond <= VAR_result_MUX_uxn_c_l283_c9_5923_cond;
     result_MUX_uxn_c_l283_c9_5923_iftrue <= VAR_result_MUX_uxn_c_l283_c9_5923_iftrue;
     result_MUX_uxn_c_l283_c9_5923_iffalse <= VAR_result_MUX_uxn_c_l283_c9_5923_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l283_c9_5923_return_output := result_MUX_uxn_c_l283_c9_5923_return_output;

     -- Submodule level 12
     VAR_result_MUX_uxn_c_l281_c9_8bd2_iffalse := VAR_result_MUX_uxn_c_l283_c9_5923_return_output;
     -- result_MUX[uxn_c_l281_c9_8bd2] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l281_c9_8bd2_cond <= VAR_result_MUX_uxn_c_l281_c9_8bd2_cond;
     result_MUX_uxn_c_l281_c9_8bd2_iftrue <= VAR_result_MUX_uxn_c_l281_c9_8bd2_iftrue;
     result_MUX_uxn_c_l281_c9_8bd2_iffalse <= VAR_result_MUX_uxn_c_l281_c9_8bd2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l281_c9_8bd2_return_output := result_MUX_uxn_c_l281_c9_8bd2_return_output;

     -- Submodule level 13
     VAR_result_MUX_uxn_c_l279_c2_352d_iffalse := VAR_result_MUX_uxn_c_l281_c9_8bd2_return_output;
     -- result_MUX[uxn_c_l279_c2_352d] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l279_c2_352d_cond <= VAR_result_MUX_uxn_c_l279_c2_352d_cond;
     result_MUX_uxn_c_l279_c2_352d_iftrue <= VAR_result_MUX_uxn_c_l279_c2_352d_iftrue;
     result_MUX_uxn_c_l279_c2_352d_iffalse <= VAR_result_MUX_uxn_c_l279_c2_352d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l279_c2_352d_return_output := result_MUX_uxn_c_l279_c2_352d_return_output;

     -- Submodule level 14
     REG_VAR_result := VAR_result_MUX_uxn_c_l279_c2_352d_return_output;
     VAR_return_output := VAR_result_MUX_uxn_c_l279_c2_352d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_color0 <= REG_VAR_color0;
REG_COMB_color1 <= REG_VAR_color1;
REG_COMB_color2 <= REG_VAR_color2;
REG_COMB_color3 <= REG_VAR_color3;
REG_COMB_color_cmp_0 <= REG_VAR_color_cmp_0;
REG_COMB_color_cmp_1 <= REG_VAR_color_cmp_1;
REG_COMB_tmp12 <= REG_VAR_tmp12;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     color0 <= REG_COMB_color0;
     color1 <= REG_COMB_color1;
     color2 <= REG_COMB_color2;
     color3 <= REG_COMB_color3;
     color_cmp_0 <= REG_COMB_color_cmp_0;
     color_cmp_1 <= REG_COMB_color_cmp_1;
     tmp12 <= REG_COMB_tmp12;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
