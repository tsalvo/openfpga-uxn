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
-- color_cmp_0_MUX[uxn_c_l220_c2_a2e2]
signal color_cmp_0_MUX_uxn_c_l220_c2_a2e2_cond : unsigned(0 downto 0);
signal color_cmp_0_MUX_uxn_c_l220_c2_a2e2_iftrue : unsigned(3 downto 0);
signal color_cmp_0_MUX_uxn_c_l220_c2_a2e2_iffalse : unsigned(3 downto 0);
signal color_cmp_0_MUX_uxn_c_l220_c2_a2e2_return_output : unsigned(3 downto 0);

-- color2_MUX[uxn_c_l220_c2_a2e2]
signal color2_MUX_uxn_c_l220_c2_a2e2_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l220_c2_a2e2_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l220_c2_a2e2_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l220_c2_a2e2_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l220_c2_a2e2]
signal tmp12_MUX_uxn_c_l220_c2_a2e2_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l220_c2_a2e2_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l220_c2_a2e2_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l220_c2_a2e2_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l220_c2_a2e2]
signal color1_MUX_uxn_c_l220_c2_a2e2_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l220_c2_a2e2_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l220_c2_a2e2_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l220_c2_a2e2_return_output : unsigned(11 downto 0);

-- color_cmp_1_MUX[uxn_c_l220_c2_a2e2]
signal color_cmp_1_MUX_uxn_c_l220_c2_a2e2_cond : unsigned(0 downto 0);
signal color_cmp_1_MUX_uxn_c_l220_c2_a2e2_iftrue : unsigned(3 downto 0);
signal color_cmp_1_MUX_uxn_c_l220_c2_a2e2_iffalse : unsigned(3 downto 0);
signal color_cmp_1_MUX_uxn_c_l220_c2_a2e2_return_output : unsigned(3 downto 0);

-- color3_MUX[uxn_c_l220_c2_a2e2]
signal color3_MUX_uxn_c_l220_c2_a2e2_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l220_c2_a2e2_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l220_c2_a2e2_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l220_c2_a2e2_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l220_c2_a2e2]
signal color0_MUX_uxn_c_l220_c2_a2e2_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l220_c2_a2e2_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l220_c2_a2e2_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l220_c2_a2e2_return_output : unsigned(11 downto 0);

-- CONST_SR_4[uxn_c_l221_c27_6990]
signal CONST_SR_4_uxn_c_l221_c27_6990_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l221_c27_6990_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l223_c7_816e]
signal BIN_OP_EQ_uxn_c_l223_c7_816e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l223_c7_816e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l223_c7_816e_return_output : unsigned(0 downto 0);

-- color2_MUX[uxn_c_l223_c3_1674]
signal color2_MUX_uxn_c_l223_c3_1674_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l223_c3_1674_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l223_c3_1674_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l223_c3_1674_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l223_c3_1674]
signal tmp12_MUX_uxn_c_l223_c3_1674_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l223_c3_1674_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l223_c3_1674_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l223_c3_1674_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l223_c3_1674]
signal color1_MUX_uxn_c_l223_c3_1674_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l223_c3_1674_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l223_c3_1674_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l223_c3_1674_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l223_c3_1674]
signal color3_MUX_uxn_c_l223_c3_1674_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l223_c3_1674_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l223_c3_1674_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l223_c3_1674_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l223_c3_1674]
signal color0_MUX_uxn_c_l223_c3_1674_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l223_c3_1674_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l223_c3_1674_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l223_c3_1674_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l225_c4_ccbe]
signal CONST_SL_8_uxn_c_l225_c4_ccbe_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l225_c4_ccbe_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l226_c4_cb2c]
signal BIN_OP_AND_uxn_c_l226_c4_cb2c_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l226_c4_cb2c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l226_c4_cb2c_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l227_c4_8212]
signal BIN_OP_OR_uxn_c_l227_c4_8212_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l227_c4_8212_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l227_c4_8212_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l230_c4_477c]
signal CONST_SL_8_uxn_c_l230_c4_477c_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l230_c4_477c_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l231_c4_a313]
signal BIN_OP_AND_uxn_c_l231_c4_a313_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l231_c4_a313_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l231_c4_a313_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l232_c4_6a2b]
signal BIN_OP_OR_uxn_c_l232_c4_6a2b_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l232_c4_6a2b_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l232_c4_6a2b_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l234_c12_801b]
signal BIN_OP_EQ_uxn_c_l234_c12_801b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l234_c12_801b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l234_c12_801b_return_output : unsigned(0 downto 0);

-- color2_MUX[uxn_c_l234_c8_9034]
signal color2_MUX_uxn_c_l234_c8_9034_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l234_c8_9034_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l234_c8_9034_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l234_c8_9034_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l234_c8_9034]
signal tmp12_MUX_uxn_c_l234_c8_9034_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l234_c8_9034_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l234_c8_9034_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l234_c8_9034_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l234_c8_9034]
signal color1_MUX_uxn_c_l234_c8_9034_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l234_c8_9034_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l234_c8_9034_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l234_c8_9034_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l234_c8_9034]
signal color3_MUX_uxn_c_l234_c8_9034_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l234_c8_9034_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l234_c8_9034_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l234_c8_9034_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l234_c8_9034]
signal color0_MUX_uxn_c_l234_c8_9034_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l234_c8_9034_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l234_c8_9034_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l234_c8_9034_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l236_c4_1845]
signal CONST_SL_8_uxn_c_l236_c4_1845_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l236_c4_1845_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l237_c4_ce84]
signal BIN_OP_AND_uxn_c_l237_c4_ce84_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l237_c4_ce84_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l237_c4_ce84_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l238_c4_cb31]
signal BIN_OP_OR_uxn_c_l238_c4_cb31_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l238_c4_cb31_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l238_c4_cb31_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l241_c4_c5ed]
signal CONST_SL_8_uxn_c_l241_c4_c5ed_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l241_c4_c5ed_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l242_c4_78dd]
signal BIN_OP_AND_uxn_c_l242_c4_78dd_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l242_c4_78dd_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l242_c4_78dd_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l243_c4_8ce0]
signal BIN_OP_OR_uxn_c_l243_c4_8ce0_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l243_c4_8ce0_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l243_c4_8ce0_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l245_c12_c614]
signal BIN_OP_EQ_uxn_c_l245_c12_c614_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l245_c12_c614_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l245_c12_c614_return_output : unsigned(0 downto 0);

-- color2_MUX[uxn_c_l245_c8_fe83]
signal color2_MUX_uxn_c_l245_c8_fe83_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l245_c8_fe83_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l245_c8_fe83_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l245_c8_fe83_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l245_c8_fe83]
signal tmp12_MUX_uxn_c_l245_c8_fe83_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l245_c8_fe83_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l245_c8_fe83_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l245_c8_fe83_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l245_c8_fe83]
signal color1_MUX_uxn_c_l245_c8_fe83_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l245_c8_fe83_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l245_c8_fe83_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l245_c8_fe83_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l245_c8_fe83]
signal color3_MUX_uxn_c_l245_c8_fe83_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l245_c8_fe83_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l245_c8_fe83_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l245_c8_fe83_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l245_c8_fe83]
signal color0_MUX_uxn_c_l245_c8_fe83_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l245_c8_fe83_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l245_c8_fe83_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l245_c8_fe83_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l247_c4_ab5f]
signal CONST_SL_4_uxn_c_l247_c4_ab5f_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l247_c4_ab5f_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l248_c4_9a16]
signal BIN_OP_AND_uxn_c_l248_c4_9a16_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l248_c4_9a16_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l248_c4_9a16_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l249_c4_c19e]
signal BIN_OP_OR_uxn_c_l249_c4_c19e_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l249_c4_c19e_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l249_c4_c19e_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l252_c4_d347]
signal CONST_SL_4_uxn_c_l252_c4_d347_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l252_c4_d347_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l253_c4_6e74]
signal BIN_OP_AND_uxn_c_l253_c4_6e74_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l253_c4_6e74_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l253_c4_6e74_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l254_c4_b55c]
signal BIN_OP_OR_uxn_c_l254_c4_b55c_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l254_c4_b55c_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l254_c4_b55c_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l256_c12_02bf]
signal BIN_OP_EQ_uxn_c_l256_c12_02bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l256_c12_02bf_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l256_c12_02bf_return_output : unsigned(0 downto 0);

-- color2_MUX[uxn_c_l256_c8_6a03]
signal color2_MUX_uxn_c_l256_c8_6a03_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l256_c8_6a03_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l256_c8_6a03_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l256_c8_6a03_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l256_c8_6a03]
signal tmp12_MUX_uxn_c_l256_c8_6a03_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l256_c8_6a03_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l256_c8_6a03_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l256_c8_6a03_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l256_c8_6a03]
signal color1_MUX_uxn_c_l256_c8_6a03_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l256_c8_6a03_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l256_c8_6a03_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l256_c8_6a03_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l256_c8_6a03]
signal color3_MUX_uxn_c_l256_c8_6a03_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l256_c8_6a03_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l256_c8_6a03_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l256_c8_6a03_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l256_c8_6a03]
signal color0_MUX_uxn_c_l256_c8_6a03_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l256_c8_6a03_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l256_c8_6a03_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l256_c8_6a03_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l258_c4_d139]
signal CONST_SL_4_uxn_c_l258_c4_d139_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l258_c4_d139_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l259_c4_a4f7]
signal BIN_OP_AND_uxn_c_l259_c4_a4f7_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l259_c4_a4f7_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l259_c4_a4f7_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l260_c4_e87c]
signal BIN_OP_OR_uxn_c_l260_c4_e87c_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l260_c4_e87c_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l260_c4_e87c_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l263_c4_4c39]
signal CONST_SL_4_uxn_c_l263_c4_4c39_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l263_c4_4c39_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l264_c4_bef5]
signal BIN_OP_AND_uxn_c_l264_c4_bef5_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l264_c4_bef5_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l264_c4_bef5_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l265_c4_aa0d]
signal BIN_OP_OR_uxn_c_l265_c4_aa0d_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l265_c4_aa0d_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l265_c4_aa0d_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l267_c12_ed36]
signal BIN_OP_EQ_uxn_c_l267_c12_ed36_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l267_c12_ed36_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l267_c12_ed36_return_output : unsigned(0 downto 0);

-- color2_MUX[uxn_c_l267_c8_792e]
signal color2_MUX_uxn_c_l267_c8_792e_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l267_c8_792e_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l267_c8_792e_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l267_c8_792e_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l267_c8_792e]
signal tmp12_MUX_uxn_c_l267_c8_792e_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l267_c8_792e_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l267_c8_792e_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l267_c8_792e_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l267_c8_792e]
signal color1_MUX_uxn_c_l267_c8_792e_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l267_c8_792e_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l267_c8_792e_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l267_c8_792e_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l267_c8_792e]
signal color3_MUX_uxn_c_l267_c8_792e_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l267_c8_792e_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l267_c8_792e_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l267_c8_792e_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l267_c8_792e]
signal color0_MUX_uxn_c_l267_c8_792e_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l267_c8_792e_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l267_c8_792e_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l267_c8_792e_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l269_c4_d938]
signal BIN_OP_AND_uxn_c_l269_c4_d938_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l269_c4_d938_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l269_c4_d938_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l270_c4_aea5]
signal BIN_OP_OR_uxn_c_l270_c4_aea5_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l270_c4_aea5_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l270_c4_aea5_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l273_c4_bccd]
signal BIN_OP_AND_uxn_c_l273_c4_bccd_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l273_c4_bccd_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l273_c4_bccd_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l274_c4_2ac0]
signal BIN_OP_OR_uxn_c_l274_c4_2ac0_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l274_c4_2ac0_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l274_c4_2ac0_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l276_c12_ff2d]
signal BIN_OP_EQ_uxn_c_l276_c12_ff2d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l276_c12_ff2d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l276_c12_ff2d_return_output : unsigned(0 downto 0);

-- color2_MUX[uxn_c_l276_c8_e582]
signal color2_MUX_uxn_c_l276_c8_e582_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l276_c8_e582_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l276_c8_e582_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l276_c8_e582_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l276_c8_e582]
signal tmp12_MUX_uxn_c_l276_c8_e582_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l276_c8_e582_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l276_c8_e582_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l276_c8_e582_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l276_c8_e582]
signal color3_MUX_uxn_c_l276_c8_e582_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l276_c8_e582_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l276_c8_e582_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l276_c8_e582_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l278_c4_2f59]
signal BIN_OP_AND_uxn_c_l278_c4_2f59_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l278_c4_2f59_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l278_c4_2f59_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l279_c4_670d]
signal BIN_OP_OR_uxn_c_l279_c4_670d_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l279_c4_670d_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l279_c4_670d_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l282_c4_591c]
signal BIN_OP_AND_uxn_c_l282_c4_591c_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l282_c4_591c_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l282_c4_591c_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l283_c4_a20f]
signal BIN_OP_OR_uxn_c_l283_c4_a20f_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l283_c4_a20f_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l283_c4_a20f_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l287_c6_15a8]
signal BIN_OP_EQ_uxn_c_l287_c6_15a8_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l287_c6_15a8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l287_c6_15a8_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l287_c2_a9f0]
signal result_MUX_uxn_c_l287_c2_a9f0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l287_c2_a9f0_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l287_c2_a9f0_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l287_c2_a9f0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l289_c13_1ff6]
signal BIN_OP_EQ_uxn_c_l289_c13_1ff6_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l289_c13_1ff6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l289_c13_1ff6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l289_c9_d68f]
signal result_MUX_uxn_c_l289_c9_d68f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l289_c9_d68f_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l289_c9_d68f_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l289_c9_d68f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l291_c13_3976]
signal BIN_OP_EQ_uxn_c_l291_c13_3976_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l291_c13_3976_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l291_c13_3976_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l291_c9_0a78]
signal result_MUX_uxn_c_l291_c9_0a78_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l291_c9_0a78_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l291_c9_0a78_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l291_c9_0a78_return_output : unsigned(15 downto 0);

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
-- color_cmp_0_MUX_uxn_c_l220_c2_a2e2
color_cmp_0_MUX_uxn_c_l220_c2_a2e2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_cmp_0_MUX_uxn_c_l220_c2_a2e2_cond,
color_cmp_0_MUX_uxn_c_l220_c2_a2e2_iftrue,
color_cmp_0_MUX_uxn_c_l220_c2_a2e2_iffalse,
color_cmp_0_MUX_uxn_c_l220_c2_a2e2_return_output);

-- color2_MUX_uxn_c_l220_c2_a2e2
color2_MUX_uxn_c_l220_c2_a2e2 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l220_c2_a2e2_cond,
color2_MUX_uxn_c_l220_c2_a2e2_iftrue,
color2_MUX_uxn_c_l220_c2_a2e2_iffalse,
color2_MUX_uxn_c_l220_c2_a2e2_return_output);

-- tmp12_MUX_uxn_c_l220_c2_a2e2
tmp12_MUX_uxn_c_l220_c2_a2e2 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l220_c2_a2e2_cond,
tmp12_MUX_uxn_c_l220_c2_a2e2_iftrue,
tmp12_MUX_uxn_c_l220_c2_a2e2_iffalse,
tmp12_MUX_uxn_c_l220_c2_a2e2_return_output);

-- color1_MUX_uxn_c_l220_c2_a2e2
color1_MUX_uxn_c_l220_c2_a2e2 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l220_c2_a2e2_cond,
color1_MUX_uxn_c_l220_c2_a2e2_iftrue,
color1_MUX_uxn_c_l220_c2_a2e2_iffalse,
color1_MUX_uxn_c_l220_c2_a2e2_return_output);

-- color_cmp_1_MUX_uxn_c_l220_c2_a2e2
color_cmp_1_MUX_uxn_c_l220_c2_a2e2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_cmp_1_MUX_uxn_c_l220_c2_a2e2_cond,
color_cmp_1_MUX_uxn_c_l220_c2_a2e2_iftrue,
color_cmp_1_MUX_uxn_c_l220_c2_a2e2_iffalse,
color_cmp_1_MUX_uxn_c_l220_c2_a2e2_return_output);

-- color3_MUX_uxn_c_l220_c2_a2e2
color3_MUX_uxn_c_l220_c2_a2e2 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l220_c2_a2e2_cond,
color3_MUX_uxn_c_l220_c2_a2e2_iftrue,
color3_MUX_uxn_c_l220_c2_a2e2_iffalse,
color3_MUX_uxn_c_l220_c2_a2e2_return_output);

-- color0_MUX_uxn_c_l220_c2_a2e2
color0_MUX_uxn_c_l220_c2_a2e2 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l220_c2_a2e2_cond,
color0_MUX_uxn_c_l220_c2_a2e2_iftrue,
color0_MUX_uxn_c_l220_c2_a2e2_iffalse,
color0_MUX_uxn_c_l220_c2_a2e2_return_output);

-- CONST_SR_4_uxn_c_l221_c27_6990
CONST_SR_4_uxn_c_l221_c27_6990 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l221_c27_6990_x,
CONST_SR_4_uxn_c_l221_c27_6990_return_output);

-- BIN_OP_EQ_uxn_c_l223_c7_816e
BIN_OP_EQ_uxn_c_l223_c7_816e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l223_c7_816e_left,
BIN_OP_EQ_uxn_c_l223_c7_816e_right,
BIN_OP_EQ_uxn_c_l223_c7_816e_return_output);

-- color2_MUX_uxn_c_l223_c3_1674
color2_MUX_uxn_c_l223_c3_1674 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l223_c3_1674_cond,
color2_MUX_uxn_c_l223_c3_1674_iftrue,
color2_MUX_uxn_c_l223_c3_1674_iffalse,
color2_MUX_uxn_c_l223_c3_1674_return_output);

-- tmp12_MUX_uxn_c_l223_c3_1674
tmp12_MUX_uxn_c_l223_c3_1674 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l223_c3_1674_cond,
tmp12_MUX_uxn_c_l223_c3_1674_iftrue,
tmp12_MUX_uxn_c_l223_c3_1674_iffalse,
tmp12_MUX_uxn_c_l223_c3_1674_return_output);

-- color1_MUX_uxn_c_l223_c3_1674
color1_MUX_uxn_c_l223_c3_1674 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l223_c3_1674_cond,
color1_MUX_uxn_c_l223_c3_1674_iftrue,
color1_MUX_uxn_c_l223_c3_1674_iffalse,
color1_MUX_uxn_c_l223_c3_1674_return_output);

-- color3_MUX_uxn_c_l223_c3_1674
color3_MUX_uxn_c_l223_c3_1674 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l223_c3_1674_cond,
color3_MUX_uxn_c_l223_c3_1674_iftrue,
color3_MUX_uxn_c_l223_c3_1674_iffalse,
color3_MUX_uxn_c_l223_c3_1674_return_output);

-- color0_MUX_uxn_c_l223_c3_1674
color0_MUX_uxn_c_l223_c3_1674 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l223_c3_1674_cond,
color0_MUX_uxn_c_l223_c3_1674_iftrue,
color0_MUX_uxn_c_l223_c3_1674_iffalse,
color0_MUX_uxn_c_l223_c3_1674_return_output);

-- CONST_SL_8_uxn_c_l225_c4_ccbe
CONST_SL_8_uxn_c_l225_c4_ccbe : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l225_c4_ccbe_x,
CONST_SL_8_uxn_c_l225_c4_ccbe_return_output);

-- BIN_OP_AND_uxn_c_l226_c4_cb2c
BIN_OP_AND_uxn_c_l226_c4_cb2c : entity work.BIN_OP_AND_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l226_c4_cb2c_left,
BIN_OP_AND_uxn_c_l226_c4_cb2c_right,
BIN_OP_AND_uxn_c_l226_c4_cb2c_return_output);

-- BIN_OP_OR_uxn_c_l227_c4_8212
BIN_OP_OR_uxn_c_l227_c4_8212 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l227_c4_8212_left,
BIN_OP_OR_uxn_c_l227_c4_8212_right,
BIN_OP_OR_uxn_c_l227_c4_8212_return_output);

-- CONST_SL_8_uxn_c_l230_c4_477c
CONST_SL_8_uxn_c_l230_c4_477c : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l230_c4_477c_x,
CONST_SL_8_uxn_c_l230_c4_477c_return_output);

-- BIN_OP_AND_uxn_c_l231_c4_a313
BIN_OP_AND_uxn_c_l231_c4_a313 : entity work.BIN_OP_AND_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l231_c4_a313_left,
BIN_OP_AND_uxn_c_l231_c4_a313_right,
BIN_OP_AND_uxn_c_l231_c4_a313_return_output);

-- BIN_OP_OR_uxn_c_l232_c4_6a2b
BIN_OP_OR_uxn_c_l232_c4_6a2b : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l232_c4_6a2b_left,
BIN_OP_OR_uxn_c_l232_c4_6a2b_right,
BIN_OP_OR_uxn_c_l232_c4_6a2b_return_output);

-- BIN_OP_EQ_uxn_c_l234_c12_801b
BIN_OP_EQ_uxn_c_l234_c12_801b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l234_c12_801b_left,
BIN_OP_EQ_uxn_c_l234_c12_801b_right,
BIN_OP_EQ_uxn_c_l234_c12_801b_return_output);

-- color2_MUX_uxn_c_l234_c8_9034
color2_MUX_uxn_c_l234_c8_9034 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l234_c8_9034_cond,
color2_MUX_uxn_c_l234_c8_9034_iftrue,
color2_MUX_uxn_c_l234_c8_9034_iffalse,
color2_MUX_uxn_c_l234_c8_9034_return_output);

-- tmp12_MUX_uxn_c_l234_c8_9034
tmp12_MUX_uxn_c_l234_c8_9034 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l234_c8_9034_cond,
tmp12_MUX_uxn_c_l234_c8_9034_iftrue,
tmp12_MUX_uxn_c_l234_c8_9034_iffalse,
tmp12_MUX_uxn_c_l234_c8_9034_return_output);

-- color1_MUX_uxn_c_l234_c8_9034
color1_MUX_uxn_c_l234_c8_9034 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l234_c8_9034_cond,
color1_MUX_uxn_c_l234_c8_9034_iftrue,
color1_MUX_uxn_c_l234_c8_9034_iffalse,
color1_MUX_uxn_c_l234_c8_9034_return_output);

-- color3_MUX_uxn_c_l234_c8_9034
color3_MUX_uxn_c_l234_c8_9034 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l234_c8_9034_cond,
color3_MUX_uxn_c_l234_c8_9034_iftrue,
color3_MUX_uxn_c_l234_c8_9034_iffalse,
color3_MUX_uxn_c_l234_c8_9034_return_output);

-- color0_MUX_uxn_c_l234_c8_9034
color0_MUX_uxn_c_l234_c8_9034 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l234_c8_9034_cond,
color0_MUX_uxn_c_l234_c8_9034_iftrue,
color0_MUX_uxn_c_l234_c8_9034_iffalse,
color0_MUX_uxn_c_l234_c8_9034_return_output);

-- CONST_SL_8_uxn_c_l236_c4_1845
CONST_SL_8_uxn_c_l236_c4_1845 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l236_c4_1845_x,
CONST_SL_8_uxn_c_l236_c4_1845_return_output);

-- BIN_OP_AND_uxn_c_l237_c4_ce84
BIN_OP_AND_uxn_c_l237_c4_ce84 : entity work.BIN_OP_AND_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l237_c4_ce84_left,
BIN_OP_AND_uxn_c_l237_c4_ce84_right,
BIN_OP_AND_uxn_c_l237_c4_ce84_return_output);

-- BIN_OP_OR_uxn_c_l238_c4_cb31
BIN_OP_OR_uxn_c_l238_c4_cb31 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l238_c4_cb31_left,
BIN_OP_OR_uxn_c_l238_c4_cb31_right,
BIN_OP_OR_uxn_c_l238_c4_cb31_return_output);

-- CONST_SL_8_uxn_c_l241_c4_c5ed
CONST_SL_8_uxn_c_l241_c4_c5ed : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l241_c4_c5ed_x,
CONST_SL_8_uxn_c_l241_c4_c5ed_return_output);

-- BIN_OP_AND_uxn_c_l242_c4_78dd
BIN_OP_AND_uxn_c_l242_c4_78dd : entity work.BIN_OP_AND_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l242_c4_78dd_left,
BIN_OP_AND_uxn_c_l242_c4_78dd_right,
BIN_OP_AND_uxn_c_l242_c4_78dd_return_output);

-- BIN_OP_OR_uxn_c_l243_c4_8ce0
BIN_OP_OR_uxn_c_l243_c4_8ce0 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l243_c4_8ce0_left,
BIN_OP_OR_uxn_c_l243_c4_8ce0_right,
BIN_OP_OR_uxn_c_l243_c4_8ce0_return_output);

-- BIN_OP_EQ_uxn_c_l245_c12_c614
BIN_OP_EQ_uxn_c_l245_c12_c614 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l245_c12_c614_left,
BIN_OP_EQ_uxn_c_l245_c12_c614_right,
BIN_OP_EQ_uxn_c_l245_c12_c614_return_output);

-- color2_MUX_uxn_c_l245_c8_fe83
color2_MUX_uxn_c_l245_c8_fe83 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l245_c8_fe83_cond,
color2_MUX_uxn_c_l245_c8_fe83_iftrue,
color2_MUX_uxn_c_l245_c8_fe83_iffalse,
color2_MUX_uxn_c_l245_c8_fe83_return_output);

-- tmp12_MUX_uxn_c_l245_c8_fe83
tmp12_MUX_uxn_c_l245_c8_fe83 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l245_c8_fe83_cond,
tmp12_MUX_uxn_c_l245_c8_fe83_iftrue,
tmp12_MUX_uxn_c_l245_c8_fe83_iffalse,
tmp12_MUX_uxn_c_l245_c8_fe83_return_output);

-- color1_MUX_uxn_c_l245_c8_fe83
color1_MUX_uxn_c_l245_c8_fe83 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l245_c8_fe83_cond,
color1_MUX_uxn_c_l245_c8_fe83_iftrue,
color1_MUX_uxn_c_l245_c8_fe83_iffalse,
color1_MUX_uxn_c_l245_c8_fe83_return_output);

-- color3_MUX_uxn_c_l245_c8_fe83
color3_MUX_uxn_c_l245_c8_fe83 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l245_c8_fe83_cond,
color3_MUX_uxn_c_l245_c8_fe83_iftrue,
color3_MUX_uxn_c_l245_c8_fe83_iffalse,
color3_MUX_uxn_c_l245_c8_fe83_return_output);

-- color0_MUX_uxn_c_l245_c8_fe83
color0_MUX_uxn_c_l245_c8_fe83 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l245_c8_fe83_cond,
color0_MUX_uxn_c_l245_c8_fe83_iftrue,
color0_MUX_uxn_c_l245_c8_fe83_iffalse,
color0_MUX_uxn_c_l245_c8_fe83_return_output);

-- CONST_SL_4_uxn_c_l247_c4_ab5f
CONST_SL_4_uxn_c_l247_c4_ab5f : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l247_c4_ab5f_x,
CONST_SL_4_uxn_c_l247_c4_ab5f_return_output);

-- BIN_OP_AND_uxn_c_l248_c4_9a16
BIN_OP_AND_uxn_c_l248_c4_9a16 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l248_c4_9a16_left,
BIN_OP_AND_uxn_c_l248_c4_9a16_right,
BIN_OP_AND_uxn_c_l248_c4_9a16_return_output);

-- BIN_OP_OR_uxn_c_l249_c4_c19e
BIN_OP_OR_uxn_c_l249_c4_c19e : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l249_c4_c19e_left,
BIN_OP_OR_uxn_c_l249_c4_c19e_right,
BIN_OP_OR_uxn_c_l249_c4_c19e_return_output);

-- CONST_SL_4_uxn_c_l252_c4_d347
CONST_SL_4_uxn_c_l252_c4_d347 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l252_c4_d347_x,
CONST_SL_4_uxn_c_l252_c4_d347_return_output);

-- BIN_OP_AND_uxn_c_l253_c4_6e74
BIN_OP_AND_uxn_c_l253_c4_6e74 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l253_c4_6e74_left,
BIN_OP_AND_uxn_c_l253_c4_6e74_right,
BIN_OP_AND_uxn_c_l253_c4_6e74_return_output);

-- BIN_OP_OR_uxn_c_l254_c4_b55c
BIN_OP_OR_uxn_c_l254_c4_b55c : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l254_c4_b55c_left,
BIN_OP_OR_uxn_c_l254_c4_b55c_right,
BIN_OP_OR_uxn_c_l254_c4_b55c_return_output);

-- BIN_OP_EQ_uxn_c_l256_c12_02bf
BIN_OP_EQ_uxn_c_l256_c12_02bf : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l256_c12_02bf_left,
BIN_OP_EQ_uxn_c_l256_c12_02bf_right,
BIN_OP_EQ_uxn_c_l256_c12_02bf_return_output);

-- color2_MUX_uxn_c_l256_c8_6a03
color2_MUX_uxn_c_l256_c8_6a03 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l256_c8_6a03_cond,
color2_MUX_uxn_c_l256_c8_6a03_iftrue,
color2_MUX_uxn_c_l256_c8_6a03_iffalse,
color2_MUX_uxn_c_l256_c8_6a03_return_output);

-- tmp12_MUX_uxn_c_l256_c8_6a03
tmp12_MUX_uxn_c_l256_c8_6a03 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l256_c8_6a03_cond,
tmp12_MUX_uxn_c_l256_c8_6a03_iftrue,
tmp12_MUX_uxn_c_l256_c8_6a03_iffalse,
tmp12_MUX_uxn_c_l256_c8_6a03_return_output);

-- color1_MUX_uxn_c_l256_c8_6a03
color1_MUX_uxn_c_l256_c8_6a03 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l256_c8_6a03_cond,
color1_MUX_uxn_c_l256_c8_6a03_iftrue,
color1_MUX_uxn_c_l256_c8_6a03_iffalse,
color1_MUX_uxn_c_l256_c8_6a03_return_output);

-- color3_MUX_uxn_c_l256_c8_6a03
color3_MUX_uxn_c_l256_c8_6a03 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l256_c8_6a03_cond,
color3_MUX_uxn_c_l256_c8_6a03_iftrue,
color3_MUX_uxn_c_l256_c8_6a03_iffalse,
color3_MUX_uxn_c_l256_c8_6a03_return_output);

-- color0_MUX_uxn_c_l256_c8_6a03
color0_MUX_uxn_c_l256_c8_6a03 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l256_c8_6a03_cond,
color0_MUX_uxn_c_l256_c8_6a03_iftrue,
color0_MUX_uxn_c_l256_c8_6a03_iffalse,
color0_MUX_uxn_c_l256_c8_6a03_return_output);

-- CONST_SL_4_uxn_c_l258_c4_d139
CONST_SL_4_uxn_c_l258_c4_d139 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l258_c4_d139_x,
CONST_SL_4_uxn_c_l258_c4_d139_return_output);

-- BIN_OP_AND_uxn_c_l259_c4_a4f7
BIN_OP_AND_uxn_c_l259_c4_a4f7 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l259_c4_a4f7_left,
BIN_OP_AND_uxn_c_l259_c4_a4f7_right,
BIN_OP_AND_uxn_c_l259_c4_a4f7_return_output);

-- BIN_OP_OR_uxn_c_l260_c4_e87c
BIN_OP_OR_uxn_c_l260_c4_e87c : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l260_c4_e87c_left,
BIN_OP_OR_uxn_c_l260_c4_e87c_right,
BIN_OP_OR_uxn_c_l260_c4_e87c_return_output);

-- CONST_SL_4_uxn_c_l263_c4_4c39
CONST_SL_4_uxn_c_l263_c4_4c39 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l263_c4_4c39_x,
CONST_SL_4_uxn_c_l263_c4_4c39_return_output);

-- BIN_OP_AND_uxn_c_l264_c4_bef5
BIN_OP_AND_uxn_c_l264_c4_bef5 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l264_c4_bef5_left,
BIN_OP_AND_uxn_c_l264_c4_bef5_right,
BIN_OP_AND_uxn_c_l264_c4_bef5_return_output);

-- BIN_OP_OR_uxn_c_l265_c4_aa0d
BIN_OP_OR_uxn_c_l265_c4_aa0d : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l265_c4_aa0d_left,
BIN_OP_OR_uxn_c_l265_c4_aa0d_right,
BIN_OP_OR_uxn_c_l265_c4_aa0d_return_output);

-- BIN_OP_EQ_uxn_c_l267_c12_ed36
BIN_OP_EQ_uxn_c_l267_c12_ed36 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l267_c12_ed36_left,
BIN_OP_EQ_uxn_c_l267_c12_ed36_right,
BIN_OP_EQ_uxn_c_l267_c12_ed36_return_output);

-- color2_MUX_uxn_c_l267_c8_792e
color2_MUX_uxn_c_l267_c8_792e : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l267_c8_792e_cond,
color2_MUX_uxn_c_l267_c8_792e_iftrue,
color2_MUX_uxn_c_l267_c8_792e_iffalse,
color2_MUX_uxn_c_l267_c8_792e_return_output);

-- tmp12_MUX_uxn_c_l267_c8_792e
tmp12_MUX_uxn_c_l267_c8_792e : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l267_c8_792e_cond,
tmp12_MUX_uxn_c_l267_c8_792e_iftrue,
tmp12_MUX_uxn_c_l267_c8_792e_iffalse,
tmp12_MUX_uxn_c_l267_c8_792e_return_output);

-- color1_MUX_uxn_c_l267_c8_792e
color1_MUX_uxn_c_l267_c8_792e : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l267_c8_792e_cond,
color1_MUX_uxn_c_l267_c8_792e_iftrue,
color1_MUX_uxn_c_l267_c8_792e_iffalse,
color1_MUX_uxn_c_l267_c8_792e_return_output);

-- color3_MUX_uxn_c_l267_c8_792e
color3_MUX_uxn_c_l267_c8_792e : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l267_c8_792e_cond,
color3_MUX_uxn_c_l267_c8_792e_iftrue,
color3_MUX_uxn_c_l267_c8_792e_iffalse,
color3_MUX_uxn_c_l267_c8_792e_return_output);

-- color0_MUX_uxn_c_l267_c8_792e
color0_MUX_uxn_c_l267_c8_792e : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l267_c8_792e_cond,
color0_MUX_uxn_c_l267_c8_792e_iftrue,
color0_MUX_uxn_c_l267_c8_792e_iffalse,
color0_MUX_uxn_c_l267_c8_792e_return_output);

-- BIN_OP_AND_uxn_c_l269_c4_d938
BIN_OP_AND_uxn_c_l269_c4_d938 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l269_c4_d938_left,
BIN_OP_AND_uxn_c_l269_c4_d938_right,
BIN_OP_AND_uxn_c_l269_c4_d938_return_output);

-- BIN_OP_OR_uxn_c_l270_c4_aea5
BIN_OP_OR_uxn_c_l270_c4_aea5 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l270_c4_aea5_left,
BIN_OP_OR_uxn_c_l270_c4_aea5_right,
BIN_OP_OR_uxn_c_l270_c4_aea5_return_output);

-- BIN_OP_AND_uxn_c_l273_c4_bccd
BIN_OP_AND_uxn_c_l273_c4_bccd : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l273_c4_bccd_left,
BIN_OP_AND_uxn_c_l273_c4_bccd_right,
BIN_OP_AND_uxn_c_l273_c4_bccd_return_output);

-- BIN_OP_OR_uxn_c_l274_c4_2ac0
BIN_OP_OR_uxn_c_l274_c4_2ac0 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l274_c4_2ac0_left,
BIN_OP_OR_uxn_c_l274_c4_2ac0_right,
BIN_OP_OR_uxn_c_l274_c4_2ac0_return_output);

-- BIN_OP_EQ_uxn_c_l276_c12_ff2d
BIN_OP_EQ_uxn_c_l276_c12_ff2d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l276_c12_ff2d_left,
BIN_OP_EQ_uxn_c_l276_c12_ff2d_right,
BIN_OP_EQ_uxn_c_l276_c12_ff2d_return_output);

-- color2_MUX_uxn_c_l276_c8_e582
color2_MUX_uxn_c_l276_c8_e582 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l276_c8_e582_cond,
color2_MUX_uxn_c_l276_c8_e582_iftrue,
color2_MUX_uxn_c_l276_c8_e582_iffalse,
color2_MUX_uxn_c_l276_c8_e582_return_output);

-- tmp12_MUX_uxn_c_l276_c8_e582
tmp12_MUX_uxn_c_l276_c8_e582 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l276_c8_e582_cond,
tmp12_MUX_uxn_c_l276_c8_e582_iftrue,
tmp12_MUX_uxn_c_l276_c8_e582_iffalse,
tmp12_MUX_uxn_c_l276_c8_e582_return_output);

-- color3_MUX_uxn_c_l276_c8_e582
color3_MUX_uxn_c_l276_c8_e582 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l276_c8_e582_cond,
color3_MUX_uxn_c_l276_c8_e582_iftrue,
color3_MUX_uxn_c_l276_c8_e582_iffalse,
color3_MUX_uxn_c_l276_c8_e582_return_output);

-- BIN_OP_AND_uxn_c_l278_c4_2f59
BIN_OP_AND_uxn_c_l278_c4_2f59 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l278_c4_2f59_left,
BIN_OP_AND_uxn_c_l278_c4_2f59_right,
BIN_OP_AND_uxn_c_l278_c4_2f59_return_output);

-- BIN_OP_OR_uxn_c_l279_c4_670d
BIN_OP_OR_uxn_c_l279_c4_670d : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l279_c4_670d_left,
BIN_OP_OR_uxn_c_l279_c4_670d_right,
BIN_OP_OR_uxn_c_l279_c4_670d_return_output);

-- BIN_OP_AND_uxn_c_l282_c4_591c
BIN_OP_AND_uxn_c_l282_c4_591c : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l282_c4_591c_left,
BIN_OP_AND_uxn_c_l282_c4_591c_right,
BIN_OP_AND_uxn_c_l282_c4_591c_return_output);

-- BIN_OP_OR_uxn_c_l283_c4_a20f
BIN_OP_OR_uxn_c_l283_c4_a20f : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l283_c4_a20f_left,
BIN_OP_OR_uxn_c_l283_c4_a20f_right,
BIN_OP_OR_uxn_c_l283_c4_a20f_return_output);

-- BIN_OP_EQ_uxn_c_l287_c6_15a8
BIN_OP_EQ_uxn_c_l287_c6_15a8 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l287_c6_15a8_left,
BIN_OP_EQ_uxn_c_l287_c6_15a8_right,
BIN_OP_EQ_uxn_c_l287_c6_15a8_return_output);

-- result_MUX_uxn_c_l287_c2_a9f0
result_MUX_uxn_c_l287_c2_a9f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l287_c2_a9f0_cond,
result_MUX_uxn_c_l287_c2_a9f0_iftrue,
result_MUX_uxn_c_l287_c2_a9f0_iffalse,
result_MUX_uxn_c_l287_c2_a9f0_return_output);

-- BIN_OP_EQ_uxn_c_l289_c13_1ff6
BIN_OP_EQ_uxn_c_l289_c13_1ff6 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l289_c13_1ff6_left,
BIN_OP_EQ_uxn_c_l289_c13_1ff6_right,
BIN_OP_EQ_uxn_c_l289_c13_1ff6_return_output);

-- result_MUX_uxn_c_l289_c9_d68f
result_MUX_uxn_c_l289_c9_d68f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l289_c9_d68f_cond,
result_MUX_uxn_c_l289_c9_d68f_iftrue,
result_MUX_uxn_c_l289_c9_d68f_iffalse,
result_MUX_uxn_c_l289_c9_d68f_return_output);

-- BIN_OP_EQ_uxn_c_l291_c13_3976
BIN_OP_EQ_uxn_c_l291_c13_3976 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l291_c13_3976_left,
BIN_OP_EQ_uxn_c_l291_c13_3976_right,
BIN_OP_EQ_uxn_c_l291_c13_3976_return_output);

-- result_MUX_uxn_c_l291_c9_0a78
result_MUX_uxn_c_l291_c9_0a78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l291_c9_0a78_cond,
result_MUX_uxn_c_l291_c9_0a78_iftrue,
result_MUX_uxn_c_l291_c9_0a78_iffalse,
result_MUX_uxn_c_l291_c9_0a78_return_output);



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
 color_cmp_0_MUX_uxn_c_l220_c2_a2e2_return_output,
 color2_MUX_uxn_c_l220_c2_a2e2_return_output,
 tmp12_MUX_uxn_c_l220_c2_a2e2_return_output,
 color1_MUX_uxn_c_l220_c2_a2e2_return_output,
 color_cmp_1_MUX_uxn_c_l220_c2_a2e2_return_output,
 color3_MUX_uxn_c_l220_c2_a2e2_return_output,
 color0_MUX_uxn_c_l220_c2_a2e2_return_output,
 CONST_SR_4_uxn_c_l221_c27_6990_return_output,
 BIN_OP_EQ_uxn_c_l223_c7_816e_return_output,
 color2_MUX_uxn_c_l223_c3_1674_return_output,
 tmp12_MUX_uxn_c_l223_c3_1674_return_output,
 color1_MUX_uxn_c_l223_c3_1674_return_output,
 color3_MUX_uxn_c_l223_c3_1674_return_output,
 color0_MUX_uxn_c_l223_c3_1674_return_output,
 CONST_SL_8_uxn_c_l225_c4_ccbe_return_output,
 BIN_OP_AND_uxn_c_l226_c4_cb2c_return_output,
 BIN_OP_OR_uxn_c_l227_c4_8212_return_output,
 CONST_SL_8_uxn_c_l230_c4_477c_return_output,
 BIN_OP_AND_uxn_c_l231_c4_a313_return_output,
 BIN_OP_OR_uxn_c_l232_c4_6a2b_return_output,
 BIN_OP_EQ_uxn_c_l234_c12_801b_return_output,
 color2_MUX_uxn_c_l234_c8_9034_return_output,
 tmp12_MUX_uxn_c_l234_c8_9034_return_output,
 color1_MUX_uxn_c_l234_c8_9034_return_output,
 color3_MUX_uxn_c_l234_c8_9034_return_output,
 color0_MUX_uxn_c_l234_c8_9034_return_output,
 CONST_SL_8_uxn_c_l236_c4_1845_return_output,
 BIN_OP_AND_uxn_c_l237_c4_ce84_return_output,
 BIN_OP_OR_uxn_c_l238_c4_cb31_return_output,
 CONST_SL_8_uxn_c_l241_c4_c5ed_return_output,
 BIN_OP_AND_uxn_c_l242_c4_78dd_return_output,
 BIN_OP_OR_uxn_c_l243_c4_8ce0_return_output,
 BIN_OP_EQ_uxn_c_l245_c12_c614_return_output,
 color2_MUX_uxn_c_l245_c8_fe83_return_output,
 tmp12_MUX_uxn_c_l245_c8_fe83_return_output,
 color1_MUX_uxn_c_l245_c8_fe83_return_output,
 color3_MUX_uxn_c_l245_c8_fe83_return_output,
 color0_MUX_uxn_c_l245_c8_fe83_return_output,
 CONST_SL_4_uxn_c_l247_c4_ab5f_return_output,
 BIN_OP_AND_uxn_c_l248_c4_9a16_return_output,
 BIN_OP_OR_uxn_c_l249_c4_c19e_return_output,
 CONST_SL_4_uxn_c_l252_c4_d347_return_output,
 BIN_OP_AND_uxn_c_l253_c4_6e74_return_output,
 BIN_OP_OR_uxn_c_l254_c4_b55c_return_output,
 BIN_OP_EQ_uxn_c_l256_c12_02bf_return_output,
 color2_MUX_uxn_c_l256_c8_6a03_return_output,
 tmp12_MUX_uxn_c_l256_c8_6a03_return_output,
 color1_MUX_uxn_c_l256_c8_6a03_return_output,
 color3_MUX_uxn_c_l256_c8_6a03_return_output,
 color0_MUX_uxn_c_l256_c8_6a03_return_output,
 CONST_SL_4_uxn_c_l258_c4_d139_return_output,
 BIN_OP_AND_uxn_c_l259_c4_a4f7_return_output,
 BIN_OP_OR_uxn_c_l260_c4_e87c_return_output,
 CONST_SL_4_uxn_c_l263_c4_4c39_return_output,
 BIN_OP_AND_uxn_c_l264_c4_bef5_return_output,
 BIN_OP_OR_uxn_c_l265_c4_aa0d_return_output,
 BIN_OP_EQ_uxn_c_l267_c12_ed36_return_output,
 color2_MUX_uxn_c_l267_c8_792e_return_output,
 tmp12_MUX_uxn_c_l267_c8_792e_return_output,
 color1_MUX_uxn_c_l267_c8_792e_return_output,
 color3_MUX_uxn_c_l267_c8_792e_return_output,
 color0_MUX_uxn_c_l267_c8_792e_return_output,
 BIN_OP_AND_uxn_c_l269_c4_d938_return_output,
 BIN_OP_OR_uxn_c_l270_c4_aea5_return_output,
 BIN_OP_AND_uxn_c_l273_c4_bccd_return_output,
 BIN_OP_OR_uxn_c_l274_c4_2ac0_return_output,
 BIN_OP_EQ_uxn_c_l276_c12_ff2d_return_output,
 color2_MUX_uxn_c_l276_c8_e582_return_output,
 tmp12_MUX_uxn_c_l276_c8_e582_return_output,
 color3_MUX_uxn_c_l276_c8_e582_return_output,
 BIN_OP_AND_uxn_c_l278_c4_2f59_return_output,
 BIN_OP_OR_uxn_c_l279_c4_670d_return_output,
 BIN_OP_AND_uxn_c_l282_c4_591c_return_output,
 BIN_OP_OR_uxn_c_l283_c4_a20f_return_output,
 BIN_OP_EQ_uxn_c_l287_c6_15a8_return_output,
 result_MUX_uxn_c_l287_c2_a9f0_return_output,
 BIN_OP_EQ_uxn_c_l289_c13_1ff6_return_output,
 result_MUX_uxn_c_l289_c9_d68f_return_output,
 BIN_OP_EQ_uxn_c_l291_c13_3976_return_output,
 result_MUX_uxn_c_l291_c9_0a78_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_gpu_step_color : unsigned(1 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l220_c2_a2e2_iftrue : unsigned(3 downto 0);
 variable VAR_color_cmp_0_uxn_c_l221_c3_1f0a : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l220_c2_a2e2_iffalse : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l220_c2_a2e2_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l220_c2_a2e2_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l220_c2_a2e2_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l223_c3_1674_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l220_c2_a2e2_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l220_c2_a2e2_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l220_c2_a2e2_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l220_c2_a2e2_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l223_c3_1674_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l220_c2_a2e2_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l220_c2_a2e2_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l220_c2_a2e2_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l220_c2_a2e2_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l223_c3_1674_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l220_c2_a2e2_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l220_c2_a2e2_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l220_c2_a2e2_cond : unsigned(0 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l220_c2_a2e2_iftrue : unsigned(3 downto 0);
 variable VAR_color_cmp_1_uxn_c_l222_c3_a11a : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l220_c2_a2e2_iffalse : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l220_c2_a2e2_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l220_c2_a2e2_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l220_c2_a2e2_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l223_c3_1674_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l220_c2_a2e2_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l220_c2_a2e2_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l220_c2_a2e2_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l220_c2_a2e2_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l223_c3_1674_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l220_c2_a2e2_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l220_c2_a2e2_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l220_c2_a2e2_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l221_c27_6990_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l221_c27_6990_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l221_c17_4cb5_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l222_c17_3431_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l223_c7_816e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l223_c7_816e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l223_c7_816e_return_output : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l223_c3_1674_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l223_c3_1674_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l234_c8_9034_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l223_c3_1674_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l223_c3_1674_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l223_c3_1674_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l234_c8_9034_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l223_c3_1674_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l223_c3_1674_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l223_c3_1674_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l234_c8_9034_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l223_c3_1674_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l223_c3_1674_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l223_c3_1674_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l234_c8_9034_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l223_c3_1674_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l223_c3_1674_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l223_c3_1674_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l234_c8_9034_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l223_c3_1674_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l224_c4_b7b4 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l225_c4_ccbe_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l225_c4_ccbe_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l226_c4_cb2c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l226_c4_cb2c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l226_c4_cb2c_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l227_c4_8212_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l227_c4_8212_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l227_c4_8212_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l229_c4_f648 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l230_c4_477c_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l230_c4_477c_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l231_c4_a313_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l231_c4_a313_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l231_c4_a313_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l232_c4_6a2b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l232_c4_6a2b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l232_c4_6a2b_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l234_c12_801b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l234_c12_801b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l234_c12_801b_return_output : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l234_c8_9034_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l234_c8_9034_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l245_c8_fe83_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l234_c8_9034_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l234_c8_9034_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l234_c8_9034_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l245_c8_fe83_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l234_c8_9034_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l234_c8_9034_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l234_c8_9034_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l245_c8_fe83_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l234_c8_9034_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l234_c8_9034_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l234_c8_9034_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l245_c8_fe83_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l234_c8_9034_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l234_c8_9034_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l234_c8_9034_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l245_c8_fe83_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l234_c8_9034_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l235_c4_e373 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l236_c4_1845_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l236_c4_1845_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l237_c4_ce84_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l237_c4_ce84_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l237_c4_ce84_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l238_c4_cb31_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l238_c4_cb31_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l238_c4_cb31_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l240_c4_9599 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l241_c4_c5ed_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l241_c4_c5ed_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l242_c4_78dd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l242_c4_78dd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l242_c4_78dd_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l243_c4_8ce0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l243_c4_8ce0_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l243_c4_8ce0_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l245_c12_c614_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l245_c12_c614_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l245_c12_c614_return_output : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l245_c8_fe83_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l245_c8_fe83_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l256_c8_6a03_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l245_c8_fe83_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l245_c8_fe83_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l245_c8_fe83_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l256_c8_6a03_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l245_c8_fe83_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l245_c8_fe83_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l245_c8_fe83_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l256_c8_6a03_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l245_c8_fe83_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l245_c8_fe83_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l245_c8_fe83_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l256_c8_6a03_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l245_c8_fe83_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l245_c8_fe83_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l245_c8_fe83_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l256_c8_6a03_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l245_c8_fe83_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l246_c4_5238 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l247_c4_ab5f_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l247_c4_ab5f_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l248_c4_9a16_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l248_c4_9a16_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l248_c4_9a16_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l249_c4_c19e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l249_c4_c19e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l249_c4_c19e_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l251_c4_3cc3 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l252_c4_d347_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l252_c4_d347_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l253_c4_6e74_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l253_c4_6e74_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l253_c4_6e74_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l254_c4_b55c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l254_c4_b55c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l254_c4_b55c_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l256_c12_02bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l256_c12_02bf_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l256_c12_02bf_return_output : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l256_c8_6a03_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l256_c8_6a03_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l267_c8_792e_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l256_c8_6a03_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l256_c8_6a03_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l256_c8_6a03_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l267_c8_792e_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l256_c8_6a03_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l256_c8_6a03_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l256_c8_6a03_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l267_c8_792e_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l256_c8_6a03_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l256_c8_6a03_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l256_c8_6a03_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l267_c8_792e_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l256_c8_6a03_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l256_c8_6a03_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l256_c8_6a03_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l267_c8_792e_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l256_c8_6a03_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l257_c4_3711 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l258_c4_d139_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l258_c4_d139_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l259_c4_a4f7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l259_c4_a4f7_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l259_c4_a4f7_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l260_c4_e87c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l260_c4_e87c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l260_c4_e87c_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l262_c4_03af : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l263_c4_4c39_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l263_c4_4c39_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l264_c4_bef5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l264_c4_bef5_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l264_c4_bef5_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l265_c4_aa0d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l265_c4_aa0d_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l265_c4_aa0d_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l267_c12_ed36_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l267_c12_ed36_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l267_c12_ed36_return_output : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l267_c8_792e_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l267_c8_792e_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l276_c8_e582_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l267_c8_792e_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l267_c8_792e_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l267_c8_792e_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l276_c8_e582_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l267_c8_792e_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l267_c8_792e_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l267_c8_792e_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l267_c8_792e_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l267_c8_792e_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l267_c8_792e_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l276_c8_e582_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l267_c8_792e_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l267_c8_792e_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l267_c8_792e_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l267_c8_792e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l269_c4_d938_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l269_c4_d938_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l269_c4_d938_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l270_c4_aea5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l270_c4_aea5_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l270_c4_aea5_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l273_c4_bccd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l273_c4_bccd_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l273_c4_bccd_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l274_c4_2ac0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l274_c4_2ac0_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l274_c4_2ac0_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l276_c12_ff2d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l276_c12_ff2d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l276_c12_ff2d_return_output : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l276_c8_e582_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l276_c8_e582_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l276_c8_e582_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l276_c8_e582_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l276_c8_e582_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l276_c8_e582_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l276_c8_e582_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l276_c8_e582_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l276_c8_e582_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l278_c4_2f59_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l278_c4_2f59_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l278_c4_2f59_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l279_c4_670d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l279_c4_670d_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l279_c4_670d_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l282_c4_591c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l282_c4_591c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l282_c4_591c_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l283_c4_a20f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l283_c4_a20f_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l283_c4_a20f_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l287_c6_15a8_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l287_c6_15a8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l287_c6_15a8_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l287_c2_a9f0_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l288_c3_831b : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l287_c2_a9f0_iffalse : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l289_c9_d68f_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l287_c2_a9f0_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l287_c2_a9f0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l289_c13_1ff6_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l289_c13_1ff6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l289_c13_1ff6_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l289_c9_d68f_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l290_c3_71ff : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l289_c9_d68f_iffalse : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l291_c9_0a78_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l289_c9_d68f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l291_c13_3976_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l291_c13_3976_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l291_c13_3976_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l291_c9_0a78_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l292_c3_4845 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l291_c9_0a78_iffalse : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l294_c3_3e20 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l291_c9_0a78_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l268_l277_DUPLICATE_2f67_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l272_l281_DUPLICATE_75e4_return_output : unsigned(11 downto 0);
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
     VAR_BIN_OP_AND_uxn_c_l242_c4_78dd_right := to_unsigned(255, 8);
     VAR_BIN_OP_AND_uxn_c_l259_c4_a4f7_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l291_c13_3976_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_c_l234_c12_801b_right := to_unsigned(9, 4);
     VAR_BIN_OP_AND_uxn_c_l248_c4_9a16_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l226_c4_cb2c_right := to_unsigned(255, 8);
     VAR_BIN_OP_AND_uxn_c_l278_c4_2f59_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l267_c12_ed36_right := to_unsigned(12, 4);
     VAR_BIN_OP_AND_uxn_c_l269_c4_d938_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l256_c12_02bf_right := to_unsigned(11, 4);
     VAR_BIN_OP_AND_uxn_c_l237_c4_ce84_right := to_unsigned(255, 8);
     VAR_BIN_OP_AND_uxn_c_l273_c4_bccd_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l253_c4_6e74_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l231_c4_a313_right := to_unsigned(255, 8);
     VAR_BIN_OP_EQ_uxn_c_l223_c7_816e_right := to_unsigned(8, 4);
     VAR_BIN_OP_AND_uxn_c_l282_c4_591c_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l276_c12_ff2d_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_c_l287_c6_15a8_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l245_c12_c614_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_c_l289_c13_1ff6_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l264_c4_bef5_right := to_unsigned(3855, 12);

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
     VAR_BIN_OP_AND_uxn_c_l226_c4_cb2c_left := color0;
     VAR_BIN_OP_AND_uxn_c_l248_c4_9a16_left := color0;
     VAR_BIN_OP_AND_uxn_c_l269_c4_d938_left := color0;
     VAR_color0_MUX_uxn_c_l220_c2_a2e2_iffalse := color0;
     VAR_color0_MUX_uxn_c_l234_c8_9034_iftrue := color0;
     VAR_color0_MUX_uxn_c_l256_c8_6a03_iftrue := color0;
     VAR_color0_MUX_uxn_c_l267_c8_792e_iffalse := color0;
     VAR_BIN_OP_AND_uxn_c_l231_c4_a313_left := color1;
     VAR_BIN_OP_AND_uxn_c_l253_c4_6e74_left := color1;
     VAR_BIN_OP_AND_uxn_c_l273_c4_bccd_left := color1;
     VAR_color1_MUX_uxn_c_l220_c2_a2e2_iffalse := color1;
     VAR_color1_MUX_uxn_c_l234_c8_9034_iftrue := color1;
     VAR_color1_MUX_uxn_c_l256_c8_6a03_iftrue := color1;
     VAR_color1_MUX_uxn_c_l267_c8_792e_iffalse := color1;
     VAR_BIN_OP_AND_uxn_c_l237_c4_ce84_left := color2;
     VAR_BIN_OP_AND_uxn_c_l259_c4_a4f7_left := color2;
     VAR_BIN_OP_AND_uxn_c_l278_c4_2f59_left := color2;
     VAR_color2_MUX_uxn_c_l220_c2_a2e2_iffalse := color2;
     VAR_color2_MUX_uxn_c_l223_c3_1674_iftrue := color2;
     VAR_color2_MUX_uxn_c_l245_c8_fe83_iftrue := color2;
     VAR_color2_MUX_uxn_c_l267_c8_792e_iftrue := color2;
     VAR_color2_MUX_uxn_c_l276_c8_e582_iffalse := color2;
     VAR_BIN_OP_AND_uxn_c_l242_c4_78dd_left := color3;
     VAR_BIN_OP_AND_uxn_c_l264_c4_bef5_left := color3;
     VAR_BIN_OP_AND_uxn_c_l282_c4_591c_left := color3;
     VAR_color3_MUX_uxn_c_l220_c2_a2e2_iffalse := color3;
     VAR_color3_MUX_uxn_c_l223_c3_1674_iftrue := color3;
     VAR_color3_MUX_uxn_c_l245_c8_fe83_iftrue := color3;
     VAR_color3_MUX_uxn_c_l267_c8_792e_iftrue := color3;
     VAR_color3_MUX_uxn_c_l276_c8_e582_iffalse := color3;
     VAR_color_cmp_0_MUX_uxn_c_l220_c2_a2e2_iffalse := color_cmp_0;
     VAR_color_cmp_1_MUX_uxn_c_l220_c2_a2e2_iffalse := color_cmp_1;
     VAR_BIN_OP_EQ_uxn_c_l223_c7_816e_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l234_c12_801b_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l245_c12_c614_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l256_c12_02bf_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l267_c12_ed36_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l276_c12_ff2d_left := VAR_device_ram_address;
     VAR_CONST_SR_4_uxn_c_l221_c27_6990_x := VAR_device_ram_value;
     VAR_BIN_OP_EQ_uxn_c_l287_c6_15a8_left := VAR_gpu_step_color;
     VAR_BIN_OP_EQ_uxn_c_l289_c13_1ff6_left := VAR_gpu_step_color;
     VAR_BIN_OP_EQ_uxn_c_l291_c13_3976_left := VAR_gpu_step_color;
     VAR_color0_MUX_uxn_c_l220_c2_a2e2_cond := VAR_is_device_ram_write;
     VAR_color1_MUX_uxn_c_l220_c2_a2e2_cond := VAR_is_device_ram_write;
     VAR_color2_MUX_uxn_c_l220_c2_a2e2_cond := VAR_is_device_ram_write;
     VAR_color3_MUX_uxn_c_l220_c2_a2e2_cond := VAR_is_device_ram_write;
     VAR_color_cmp_0_MUX_uxn_c_l220_c2_a2e2_cond := VAR_is_device_ram_write;
     VAR_color_cmp_1_MUX_uxn_c_l220_c2_a2e2_cond := VAR_is_device_ram_write;
     VAR_tmp12_MUX_uxn_c_l220_c2_a2e2_cond := VAR_is_device_ram_write;
     VAR_tmp12_MUX_uxn_c_l220_c2_a2e2_iffalse := tmp12;
     VAR_tmp12_MUX_uxn_c_l276_c8_e582_iffalse := tmp12;
     -- BIN_OP_EQ[uxn_c_l289_c13_1ff6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l289_c13_1ff6_left <= VAR_BIN_OP_EQ_uxn_c_l289_c13_1ff6_left;
     BIN_OP_EQ_uxn_c_l289_c13_1ff6_right <= VAR_BIN_OP_EQ_uxn_c_l289_c13_1ff6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l289_c13_1ff6_return_output := BIN_OP_EQ_uxn_c_l289_c13_1ff6_return_output;

     -- BIN_OP_EQ[uxn_c_l256_c12_02bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l256_c12_02bf_left <= VAR_BIN_OP_EQ_uxn_c_l256_c12_02bf_left;
     BIN_OP_EQ_uxn_c_l256_c12_02bf_right <= VAR_BIN_OP_EQ_uxn_c_l256_c12_02bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l256_c12_02bf_return_output := BIN_OP_EQ_uxn_c_l256_c12_02bf_return_output;

     -- BIN_OP_AND[uxn_c_l259_c4_a4f7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l259_c4_a4f7_left <= VAR_BIN_OP_AND_uxn_c_l259_c4_a4f7_left;
     BIN_OP_AND_uxn_c_l259_c4_a4f7_right <= VAR_BIN_OP_AND_uxn_c_l259_c4_a4f7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l259_c4_a4f7_return_output := BIN_OP_AND_uxn_c_l259_c4_a4f7_return_output;

     -- BIN_OP_EQ[uxn_c_l287_c6_15a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l287_c6_15a8_left <= VAR_BIN_OP_EQ_uxn_c_l287_c6_15a8_left;
     BIN_OP_EQ_uxn_c_l287_c6_15a8_right <= VAR_BIN_OP_EQ_uxn_c_l287_c6_15a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l287_c6_15a8_return_output := BIN_OP_EQ_uxn_c_l287_c6_15a8_return_output;

     -- BIN_OP_EQ[uxn_c_l245_c12_c614] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l245_c12_c614_left <= VAR_BIN_OP_EQ_uxn_c_l245_c12_c614_left;
     BIN_OP_EQ_uxn_c_l245_c12_c614_right <= VAR_BIN_OP_EQ_uxn_c_l245_c12_c614_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l245_c12_c614_return_output := BIN_OP_EQ_uxn_c_l245_c12_c614_return_output;

     -- BIN_OP_AND[uxn_c_l226_c4_cb2c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l226_c4_cb2c_left <= VAR_BIN_OP_AND_uxn_c_l226_c4_cb2c_left;
     BIN_OP_AND_uxn_c_l226_c4_cb2c_right <= VAR_BIN_OP_AND_uxn_c_l226_c4_cb2c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l226_c4_cb2c_return_output := BIN_OP_AND_uxn_c_l226_c4_cb2c_return_output;

     -- BIN_OP_AND[uxn_c_l269_c4_d938] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l269_c4_d938_left <= VAR_BIN_OP_AND_uxn_c_l269_c4_d938_left;
     BIN_OP_AND_uxn_c_l269_c4_d938_right <= VAR_BIN_OP_AND_uxn_c_l269_c4_d938_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l269_c4_d938_return_output := BIN_OP_AND_uxn_c_l269_c4_d938_return_output;

     -- BIN_OP_AND[uxn_c_l248_c4_9a16] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l248_c4_9a16_left <= VAR_BIN_OP_AND_uxn_c_l248_c4_9a16_left;
     BIN_OP_AND_uxn_c_l248_c4_9a16_right <= VAR_BIN_OP_AND_uxn_c_l248_c4_9a16_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l248_c4_9a16_return_output := BIN_OP_AND_uxn_c_l248_c4_9a16_return_output;

     -- BIN_OP_EQ[uxn_c_l276_c12_ff2d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l276_c12_ff2d_left <= VAR_BIN_OP_EQ_uxn_c_l276_c12_ff2d_left;
     BIN_OP_EQ_uxn_c_l276_c12_ff2d_right <= VAR_BIN_OP_EQ_uxn_c_l276_c12_ff2d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l276_c12_ff2d_return_output := BIN_OP_EQ_uxn_c_l276_c12_ff2d_return_output;

     -- BIN_OP_AND[uxn_c_l253_c4_6e74] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l253_c4_6e74_left <= VAR_BIN_OP_AND_uxn_c_l253_c4_6e74_left;
     BIN_OP_AND_uxn_c_l253_c4_6e74_right <= VAR_BIN_OP_AND_uxn_c_l253_c4_6e74_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l253_c4_6e74_return_output := BIN_OP_AND_uxn_c_l253_c4_6e74_return_output;

     -- CONST_SR_4[uxn_c_l221_c27_6990] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l221_c27_6990_x <= VAR_CONST_SR_4_uxn_c_l221_c27_6990_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l221_c27_6990_return_output := CONST_SR_4_uxn_c_l221_c27_6990_return_output;

     -- BIN_OP_AND[uxn_c_l273_c4_bccd] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l273_c4_bccd_left <= VAR_BIN_OP_AND_uxn_c_l273_c4_bccd_left;
     BIN_OP_AND_uxn_c_l273_c4_bccd_right <= VAR_BIN_OP_AND_uxn_c_l273_c4_bccd_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l273_c4_bccd_return_output := BIN_OP_AND_uxn_c_l273_c4_bccd_return_output;

     -- BIN_OP_AND[uxn_c_l264_c4_bef5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l264_c4_bef5_left <= VAR_BIN_OP_AND_uxn_c_l264_c4_bef5_left;
     BIN_OP_AND_uxn_c_l264_c4_bef5_right <= VAR_BIN_OP_AND_uxn_c_l264_c4_bef5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l264_c4_bef5_return_output := BIN_OP_AND_uxn_c_l264_c4_bef5_return_output;

     -- BIN_OP_AND[uxn_c_l231_c4_a313] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l231_c4_a313_left <= VAR_BIN_OP_AND_uxn_c_l231_c4_a313_left;
     BIN_OP_AND_uxn_c_l231_c4_a313_right <= VAR_BIN_OP_AND_uxn_c_l231_c4_a313_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l231_c4_a313_return_output := BIN_OP_AND_uxn_c_l231_c4_a313_return_output;

     -- CAST_TO_uint4_t[uxn_c_l222_c17_3431] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l222_c17_3431_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_value);

     -- BIN_OP_EQ[uxn_c_l234_c12_801b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l234_c12_801b_left <= VAR_BIN_OP_EQ_uxn_c_l234_c12_801b_left;
     BIN_OP_EQ_uxn_c_l234_c12_801b_right <= VAR_BIN_OP_EQ_uxn_c_l234_c12_801b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l234_c12_801b_return_output := BIN_OP_EQ_uxn_c_l234_c12_801b_return_output;

     -- BIN_OP_EQ[uxn_c_l267_c12_ed36] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l267_c12_ed36_left <= VAR_BIN_OP_EQ_uxn_c_l267_c12_ed36_left;
     BIN_OP_EQ_uxn_c_l267_c12_ed36_right <= VAR_BIN_OP_EQ_uxn_c_l267_c12_ed36_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l267_c12_ed36_return_output := BIN_OP_EQ_uxn_c_l267_c12_ed36_return_output;

     -- BIN_OP_EQ[uxn_c_l223_c7_816e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l223_c7_816e_left <= VAR_BIN_OP_EQ_uxn_c_l223_c7_816e_left;
     BIN_OP_EQ_uxn_c_l223_c7_816e_right <= VAR_BIN_OP_EQ_uxn_c_l223_c7_816e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l223_c7_816e_return_output := BIN_OP_EQ_uxn_c_l223_c7_816e_return_output;

     -- BIN_OP_AND[uxn_c_l237_c4_ce84] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l237_c4_ce84_left <= VAR_BIN_OP_AND_uxn_c_l237_c4_ce84_left;
     BIN_OP_AND_uxn_c_l237_c4_ce84_right <= VAR_BIN_OP_AND_uxn_c_l237_c4_ce84_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l237_c4_ce84_return_output := BIN_OP_AND_uxn_c_l237_c4_ce84_return_output;

     -- BIN_OP_AND[uxn_c_l242_c4_78dd] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l242_c4_78dd_left <= VAR_BIN_OP_AND_uxn_c_l242_c4_78dd_left;
     BIN_OP_AND_uxn_c_l242_c4_78dd_right <= VAR_BIN_OP_AND_uxn_c_l242_c4_78dd_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l242_c4_78dd_return_output := BIN_OP_AND_uxn_c_l242_c4_78dd_return_output;

     -- BIN_OP_AND[uxn_c_l282_c4_591c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l282_c4_591c_left <= VAR_BIN_OP_AND_uxn_c_l282_c4_591c_left;
     BIN_OP_AND_uxn_c_l282_c4_591c_right <= VAR_BIN_OP_AND_uxn_c_l282_c4_591c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l282_c4_591c_return_output := BIN_OP_AND_uxn_c_l282_c4_591c_return_output;

     -- BIN_OP_AND[uxn_c_l278_c4_2f59] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l278_c4_2f59_left <= VAR_BIN_OP_AND_uxn_c_l278_c4_2f59_left;
     BIN_OP_AND_uxn_c_l278_c4_2f59_right <= VAR_BIN_OP_AND_uxn_c_l278_c4_2f59_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l278_c4_2f59_return_output := BIN_OP_AND_uxn_c_l278_c4_2f59_return_output;

     -- BIN_OP_EQ[uxn_c_l291_c13_3976] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l291_c13_3976_left <= VAR_BIN_OP_EQ_uxn_c_l291_c13_3976_left;
     BIN_OP_EQ_uxn_c_l291_c13_3976_right <= VAR_BIN_OP_EQ_uxn_c_l291_c13_3976_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l291_c13_3976_return_output := BIN_OP_EQ_uxn_c_l291_c13_3976_return_output;

     -- Submodule level 1
     VAR_BIN_OP_OR_uxn_c_l227_c4_8212_left := VAR_BIN_OP_AND_uxn_c_l226_c4_cb2c_return_output;
     VAR_BIN_OP_OR_uxn_c_l232_c4_6a2b_left := VAR_BIN_OP_AND_uxn_c_l231_c4_a313_return_output;
     VAR_BIN_OP_OR_uxn_c_l238_c4_cb31_left := VAR_BIN_OP_AND_uxn_c_l237_c4_ce84_return_output;
     VAR_BIN_OP_OR_uxn_c_l243_c4_8ce0_left := VAR_BIN_OP_AND_uxn_c_l242_c4_78dd_return_output;
     VAR_BIN_OP_OR_uxn_c_l249_c4_c19e_left := VAR_BIN_OP_AND_uxn_c_l248_c4_9a16_return_output;
     VAR_BIN_OP_OR_uxn_c_l254_c4_b55c_left := VAR_BIN_OP_AND_uxn_c_l253_c4_6e74_return_output;
     VAR_BIN_OP_OR_uxn_c_l260_c4_e87c_left := VAR_BIN_OP_AND_uxn_c_l259_c4_a4f7_return_output;
     VAR_BIN_OP_OR_uxn_c_l265_c4_aa0d_left := VAR_BIN_OP_AND_uxn_c_l264_c4_bef5_return_output;
     VAR_BIN_OP_OR_uxn_c_l270_c4_aea5_left := VAR_BIN_OP_AND_uxn_c_l269_c4_d938_return_output;
     VAR_BIN_OP_OR_uxn_c_l274_c4_2ac0_left := VAR_BIN_OP_AND_uxn_c_l273_c4_bccd_return_output;
     VAR_BIN_OP_OR_uxn_c_l279_c4_670d_left := VAR_BIN_OP_AND_uxn_c_l278_c4_2f59_return_output;
     VAR_BIN_OP_OR_uxn_c_l283_c4_a20f_left := VAR_BIN_OP_AND_uxn_c_l282_c4_591c_return_output;
     VAR_color0_MUX_uxn_c_l223_c3_1674_cond := VAR_BIN_OP_EQ_uxn_c_l223_c7_816e_return_output;
     VAR_color1_MUX_uxn_c_l223_c3_1674_cond := VAR_BIN_OP_EQ_uxn_c_l223_c7_816e_return_output;
     VAR_color2_MUX_uxn_c_l223_c3_1674_cond := VAR_BIN_OP_EQ_uxn_c_l223_c7_816e_return_output;
     VAR_color3_MUX_uxn_c_l223_c3_1674_cond := VAR_BIN_OP_EQ_uxn_c_l223_c7_816e_return_output;
     VAR_tmp12_MUX_uxn_c_l223_c3_1674_cond := VAR_BIN_OP_EQ_uxn_c_l223_c7_816e_return_output;
     VAR_color0_MUX_uxn_c_l234_c8_9034_cond := VAR_BIN_OP_EQ_uxn_c_l234_c12_801b_return_output;
     VAR_color1_MUX_uxn_c_l234_c8_9034_cond := VAR_BIN_OP_EQ_uxn_c_l234_c12_801b_return_output;
     VAR_color2_MUX_uxn_c_l234_c8_9034_cond := VAR_BIN_OP_EQ_uxn_c_l234_c12_801b_return_output;
     VAR_color3_MUX_uxn_c_l234_c8_9034_cond := VAR_BIN_OP_EQ_uxn_c_l234_c12_801b_return_output;
     VAR_tmp12_MUX_uxn_c_l234_c8_9034_cond := VAR_BIN_OP_EQ_uxn_c_l234_c12_801b_return_output;
     VAR_color0_MUX_uxn_c_l245_c8_fe83_cond := VAR_BIN_OP_EQ_uxn_c_l245_c12_c614_return_output;
     VAR_color1_MUX_uxn_c_l245_c8_fe83_cond := VAR_BIN_OP_EQ_uxn_c_l245_c12_c614_return_output;
     VAR_color2_MUX_uxn_c_l245_c8_fe83_cond := VAR_BIN_OP_EQ_uxn_c_l245_c12_c614_return_output;
     VAR_color3_MUX_uxn_c_l245_c8_fe83_cond := VAR_BIN_OP_EQ_uxn_c_l245_c12_c614_return_output;
     VAR_tmp12_MUX_uxn_c_l245_c8_fe83_cond := VAR_BIN_OP_EQ_uxn_c_l245_c12_c614_return_output;
     VAR_color0_MUX_uxn_c_l256_c8_6a03_cond := VAR_BIN_OP_EQ_uxn_c_l256_c12_02bf_return_output;
     VAR_color1_MUX_uxn_c_l256_c8_6a03_cond := VAR_BIN_OP_EQ_uxn_c_l256_c12_02bf_return_output;
     VAR_color2_MUX_uxn_c_l256_c8_6a03_cond := VAR_BIN_OP_EQ_uxn_c_l256_c12_02bf_return_output;
     VAR_color3_MUX_uxn_c_l256_c8_6a03_cond := VAR_BIN_OP_EQ_uxn_c_l256_c12_02bf_return_output;
     VAR_tmp12_MUX_uxn_c_l256_c8_6a03_cond := VAR_BIN_OP_EQ_uxn_c_l256_c12_02bf_return_output;
     VAR_color0_MUX_uxn_c_l267_c8_792e_cond := VAR_BIN_OP_EQ_uxn_c_l267_c12_ed36_return_output;
     VAR_color1_MUX_uxn_c_l267_c8_792e_cond := VAR_BIN_OP_EQ_uxn_c_l267_c12_ed36_return_output;
     VAR_color2_MUX_uxn_c_l267_c8_792e_cond := VAR_BIN_OP_EQ_uxn_c_l267_c12_ed36_return_output;
     VAR_color3_MUX_uxn_c_l267_c8_792e_cond := VAR_BIN_OP_EQ_uxn_c_l267_c12_ed36_return_output;
     VAR_tmp12_MUX_uxn_c_l267_c8_792e_cond := VAR_BIN_OP_EQ_uxn_c_l267_c12_ed36_return_output;
     VAR_color2_MUX_uxn_c_l276_c8_e582_cond := VAR_BIN_OP_EQ_uxn_c_l276_c12_ff2d_return_output;
     VAR_color3_MUX_uxn_c_l276_c8_e582_cond := VAR_BIN_OP_EQ_uxn_c_l276_c12_ff2d_return_output;
     VAR_tmp12_MUX_uxn_c_l276_c8_e582_cond := VAR_BIN_OP_EQ_uxn_c_l276_c12_ff2d_return_output;
     VAR_result_MUX_uxn_c_l287_c2_a9f0_cond := VAR_BIN_OP_EQ_uxn_c_l287_c6_15a8_return_output;
     VAR_result_MUX_uxn_c_l289_c9_d68f_cond := VAR_BIN_OP_EQ_uxn_c_l289_c13_1ff6_return_output;
     VAR_result_MUX_uxn_c_l291_c9_0a78_cond := VAR_BIN_OP_EQ_uxn_c_l291_c13_3976_return_output;
     VAR_color_cmp_1_uxn_c_l222_c3_a11a := VAR_CAST_TO_uint4_t_uxn_c_l222_c17_3431_return_output;
     VAR_color_cmp_1_MUX_uxn_c_l220_c2_a2e2_iftrue := VAR_color_cmp_1_uxn_c_l222_c3_a11a;
     VAR_tmp12_uxn_c_l229_c4_f648 := resize(VAR_color_cmp_1_uxn_c_l222_c3_a11a, 12);
     VAR_tmp12_uxn_c_l240_c4_9599 := resize(VAR_color_cmp_1_uxn_c_l222_c3_a11a, 12);
     VAR_tmp12_uxn_c_l251_c4_3cc3 := resize(VAR_color_cmp_1_uxn_c_l222_c3_a11a, 12);
     VAR_tmp12_uxn_c_l262_c4_03af := resize(VAR_color_cmp_1_uxn_c_l222_c3_a11a, 12);
     VAR_CONST_SL_8_uxn_c_l230_c4_477c_x := VAR_tmp12_uxn_c_l229_c4_f648;
     VAR_CONST_SL_8_uxn_c_l241_c4_c5ed_x := VAR_tmp12_uxn_c_l240_c4_9599;
     VAR_CONST_SL_4_uxn_c_l252_c4_d347_x := VAR_tmp12_uxn_c_l251_c4_3cc3;
     VAR_CONST_SL_4_uxn_c_l263_c4_4c39_x := VAR_tmp12_uxn_c_l262_c4_03af;
     -- CAST_TO_uint12_t_uint4_t_uxn_c_l272_l281_DUPLICATE_75e4 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l272_l281_DUPLICATE_75e4_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_1_uxn_c_l222_c3_a11a);

     -- CONST_SL_8[uxn_c_l230_c4_477c] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l230_c4_477c_x <= VAR_CONST_SL_8_uxn_c_l230_c4_477c_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l230_c4_477c_return_output := CONST_SL_8_uxn_c_l230_c4_477c_return_output;

     -- CONST_SL_4[uxn_c_l252_c4_d347] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l252_c4_d347_x <= VAR_CONST_SL_4_uxn_c_l252_c4_d347_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l252_c4_d347_return_output := CONST_SL_4_uxn_c_l252_c4_d347_return_output;

     -- CONST_SL_8[uxn_c_l241_c4_c5ed] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l241_c4_c5ed_x <= VAR_CONST_SL_8_uxn_c_l241_c4_c5ed_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l241_c4_c5ed_return_output := CONST_SL_8_uxn_c_l241_c4_c5ed_return_output;

     -- CAST_TO_uint4_t[uxn_c_l221_c17_4cb5] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l221_c17_4cb5_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l221_c27_6990_return_output);

     -- color_cmp_1_MUX[uxn_c_l220_c2_a2e2] LATENCY=0
     -- Inputs
     color_cmp_1_MUX_uxn_c_l220_c2_a2e2_cond <= VAR_color_cmp_1_MUX_uxn_c_l220_c2_a2e2_cond;
     color_cmp_1_MUX_uxn_c_l220_c2_a2e2_iftrue <= VAR_color_cmp_1_MUX_uxn_c_l220_c2_a2e2_iftrue;
     color_cmp_1_MUX_uxn_c_l220_c2_a2e2_iffalse <= VAR_color_cmp_1_MUX_uxn_c_l220_c2_a2e2_iffalse;
     -- Outputs
     VAR_color_cmp_1_MUX_uxn_c_l220_c2_a2e2_return_output := color_cmp_1_MUX_uxn_c_l220_c2_a2e2_return_output;

     -- CONST_SL_4[uxn_c_l263_c4_4c39] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l263_c4_4c39_x <= VAR_CONST_SL_4_uxn_c_l263_c4_4c39_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l263_c4_4c39_return_output := CONST_SL_4_uxn_c_l263_c4_4c39_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_c_l274_c4_2ac0_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l272_l281_DUPLICATE_75e4_return_output;
     VAR_BIN_OP_OR_uxn_c_l283_c4_a20f_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l272_l281_DUPLICATE_75e4_return_output;
     VAR_tmp12_MUX_uxn_c_l267_c8_792e_iftrue := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l272_l281_DUPLICATE_75e4_return_output;
     VAR_tmp12_MUX_uxn_c_l276_c8_e582_iftrue := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l272_l281_DUPLICATE_75e4_return_output;
     VAR_color_cmp_0_uxn_c_l221_c3_1f0a := VAR_CAST_TO_uint4_t_uxn_c_l221_c17_4cb5_return_output;
     VAR_BIN_OP_OR_uxn_c_l254_c4_b55c_right := VAR_CONST_SL_4_uxn_c_l252_c4_d347_return_output;
     VAR_tmp12_MUX_uxn_c_l245_c8_fe83_iftrue := VAR_CONST_SL_4_uxn_c_l252_c4_d347_return_output;
     VAR_BIN_OP_OR_uxn_c_l265_c4_aa0d_right := VAR_CONST_SL_4_uxn_c_l263_c4_4c39_return_output;
     VAR_tmp12_MUX_uxn_c_l256_c8_6a03_iftrue := VAR_CONST_SL_4_uxn_c_l263_c4_4c39_return_output;
     VAR_BIN_OP_OR_uxn_c_l232_c4_6a2b_right := VAR_CONST_SL_8_uxn_c_l230_c4_477c_return_output;
     VAR_tmp12_MUX_uxn_c_l223_c3_1674_iftrue := VAR_CONST_SL_8_uxn_c_l230_c4_477c_return_output;
     VAR_BIN_OP_OR_uxn_c_l243_c4_8ce0_right := VAR_CONST_SL_8_uxn_c_l241_c4_c5ed_return_output;
     VAR_tmp12_MUX_uxn_c_l234_c8_9034_iftrue := VAR_CONST_SL_8_uxn_c_l241_c4_c5ed_return_output;
     REG_VAR_color_cmp_1 := VAR_color_cmp_1_MUX_uxn_c_l220_c2_a2e2_return_output;
     VAR_color_cmp_0_MUX_uxn_c_l220_c2_a2e2_iftrue := VAR_color_cmp_0_uxn_c_l221_c3_1f0a;
     VAR_tmp12_uxn_c_l224_c4_b7b4 := resize(VAR_color_cmp_0_uxn_c_l221_c3_1f0a, 12);
     VAR_tmp12_uxn_c_l235_c4_e373 := resize(VAR_color_cmp_0_uxn_c_l221_c3_1f0a, 12);
     VAR_tmp12_uxn_c_l246_c4_5238 := resize(VAR_color_cmp_0_uxn_c_l221_c3_1f0a, 12);
     VAR_tmp12_uxn_c_l257_c4_3711 := resize(VAR_color_cmp_0_uxn_c_l221_c3_1f0a, 12);
     VAR_CONST_SL_8_uxn_c_l225_c4_ccbe_x := VAR_tmp12_uxn_c_l224_c4_b7b4;
     VAR_CONST_SL_8_uxn_c_l236_c4_1845_x := VAR_tmp12_uxn_c_l235_c4_e373;
     VAR_CONST_SL_4_uxn_c_l247_c4_ab5f_x := VAR_tmp12_uxn_c_l246_c4_5238;
     VAR_CONST_SL_4_uxn_c_l258_c4_d139_x := VAR_tmp12_uxn_c_l257_c4_3711;
     -- CAST_TO_uint12_t_uint4_t_uxn_c_l268_l277_DUPLICATE_2f67 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l268_l277_DUPLICATE_2f67_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_0_uxn_c_l221_c3_1f0a);

     -- BIN_OP_OR[uxn_c_l232_c4_6a2b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l232_c4_6a2b_left <= VAR_BIN_OP_OR_uxn_c_l232_c4_6a2b_left;
     BIN_OP_OR_uxn_c_l232_c4_6a2b_right <= VAR_BIN_OP_OR_uxn_c_l232_c4_6a2b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l232_c4_6a2b_return_output := BIN_OP_OR_uxn_c_l232_c4_6a2b_return_output;

     -- BIN_OP_OR[uxn_c_l243_c4_8ce0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l243_c4_8ce0_left <= VAR_BIN_OP_OR_uxn_c_l243_c4_8ce0_left;
     BIN_OP_OR_uxn_c_l243_c4_8ce0_right <= VAR_BIN_OP_OR_uxn_c_l243_c4_8ce0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l243_c4_8ce0_return_output := BIN_OP_OR_uxn_c_l243_c4_8ce0_return_output;

     -- CONST_SL_4[uxn_c_l258_c4_d139] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l258_c4_d139_x <= VAR_CONST_SL_4_uxn_c_l258_c4_d139_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l258_c4_d139_return_output := CONST_SL_4_uxn_c_l258_c4_d139_return_output;

     -- CONST_SL_8[uxn_c_l236_c4_1845] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l236_c4_1845_x <= VAR_CONST_SL_8_uxn_c_l236_c4_1845_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l236_c4_1845_return_output := CONST_SL_8_uxn_c_l236_c4_1845_return_output;

     -- BIN_OP_OR[uxn_c_l274_c4_2ac0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l274_c4_2ac0_left <= VAR_BIN_OP_OR_uxn_c_l274_c4_2ac0_left;
     BIN_OP_OR_uxn_c_l274_c4_2ac0_right <= VAR_BIN_OP_OR_uxn_c_l274_c4_2ac0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l274_c4_2ac0_return_output := BIN_OP_OR_uxn_c_l274_c4_2ac0_return_output;

     -- BIN_OP_OR[uxn_c_l265_c4_aa0d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l265_c4_aa0d_left <= VAR_BIN_OP_OR_uxn_c_l265_c4_aa0d_left;
     BIN_OP_OR_uxn_c_l265_c4_aa0d_right <= VAR_BIN_OP_OR_uxn_c_l265_c4_aa0d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l265_c4_aa0d_return_output := BIN_OP_OR_uxn_c_l265_c4_aa0d_return_output;

     -- color_cmp_0_MUX[uxn_c_l220_c2_a2e2] LATENCY=0
     -- Inputs
     color_cmp_0_MUX_uxn_c_l220_c2_a2e2_cond <= VAR_color_cmp_0_MUX_uxn_c_l220_c2_a2e2_cond;
     color_cmp_0_MUX_uxn_c_l220_c2_a2e2_iftrue <= VAR_color_cmp_0_MUX_uxn_c_l220_c2_a2e2_iftrue;
     color_cmp_0_MUX_uxn_c_l220_c2_a2e2_iffalse <= VAR_color_cmp_0_MUX_uxn_c_l220_c2_a2e2_iffalse;
     -- Outputs
     VAR_color_cmp_0_MUX_uxn_c_l220_c2_a2e2_return_output := color_cmp_0_MUX_uxn_c_l220_c2_a2e2_return_output;

     -- BIN_OP_OR[uxn_c_l254_c4_b55c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l254_c4_b55c_left <= VAR_BIN_OP_OR_uxn_c_l254_c4_b55c_left;
     BIN_OP_OR_uxn_c_l254_c4_b55c_right <= VAR_BIN_OP_OR_uxn_c_l254_c4_b55c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l254_c4_b55c_return_output := BIN_OP_OR_uxn_c_l254_c4_b55c_return_output;

     -- tmp12_MUX[uxn_c_l276_c8_e582] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l276_c8_e582_cond <= VAR_tmp12_MUX_uxn_c_l276_c8_e582_cond;
     tmp12_MUX_uxn_c_l276_c8_e582_iftrue <= VAR_tmp12_MUX_uxn_c_l276_c8_e582_iftrue;
     tmp12_MUX_uxn_c_l276_c8_e582_iffalse <= VAR_tmp12_MUX_uxn_c_l276_c8_e582_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l276_c8_e582_return_output := tmp12_MUX_uxn_c_l276_c8_e582_return_output;

     -- CONST_SL_4[uxn_c_l247_c4_ab5f] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l247_c4_ab5f_x <= VAR_CONST_SL_4_uxn_c_l247_c4_ab5f_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l247_c4_ab5f_return_output := CONST_SL_4_uxn_c_l247_c4_ab5f_return_output;

     -- BIN_OP_OR[uxn_c_l283_c4_a20f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l283_c4_a20f_left <= VAR_BIN_OP_OR_uxn_c_l283_c4_a20f_left;
     BIN_OP_OR_uxn_c_l283_c4_a20f_right <= VAR_BIN_OP_OR_uxn_c_l283_c4_a20f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l283_c4_a20f_return_output := BIN_OP_OR_uxn_c_l283_c4_a20f_return_output;

     -- CONST_SL_8[uxn_c_l225_c4_ccbe] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l225_c4_ccbe_x <= VAR_CONST_SL_8_uxn_c_l225_c4_ccbe_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l225_c4_ccbe_return_output := CONST_SL_8_uxn_c_l225_c4_ccbe_return_output;

     -- Submodule level 3
     VAR_color1_MUX_uxn_c_l223_c3_1674_iftrue := VAR_BIN_OP_OR_uxn_c_l232_c4_6a2b_return_output;
     VAR_color3_MUX_uxn_c_l234_c8_9034_iftrue := VAR_BIN_OP_OR_uxn_c_l243_c4_8ce0_return_output;
     VAR_color1_MUX_uxn_c_l245_c8_fe83_iftrue := VAR_BIN_OP_OR_uxn_c_l254_c4_b55c_return_output;
     VAR_color3_MUX_uxn_c_l256_c8_6a03_iftrue := VAR_BIN_OP_OR_uxn_c_l265_c4_aa0d_return_output;
     VAR_color1_MUX_uxn_c_l267_c8_792e_iftrue := VAR_BIN_OP_OR_uxn_c_l274_c4_2ac0_return_output;
     VAR_color3_MUX_uxn_c_l276_c8_e582_iftrue := VAR_BIN_OP_OR_uxn_c_l283_c4_a20f_return_output;
     VAR_BIN_OP_OR_uxn_c_l270_c4_aea5_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l268_l277_DUPLICATE_2f67_return_output;
     VAR_BIN_OP_OR_uxn_c_l279_c4_670d_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l268_l277_DUPLICATE_2f67_return_output;
     VAR_BIN_OP_OR_uxn_c_l249_c4_c19e_right := VAR_CONST_SL_4_uxn_c_l247_c4_ab5f_return_output;
     VAR_BIN_OP_OR_uxn_c_l260_c4_e87c_right := VAR_CONST_SL_4_uxn_c_l258_c4_d139_return_output;
     VAR_BIN_OP_OR_uxn_c_l227_c4_8212_right := VAR_CONST_SL_8_uxn_c_l225_c4_ccbe_return_output;
     VAR_BIN_OP_OR_uxn_c_l238_c4_cb31_right := VAR_CONST_SL_8_uxn_c_l236_c4_1845_return_output;
     REG_VAR_color_cmp_0 := VAR_color_cmp_0_MUX_uxn_c_l220_c2_a2e2_return_output;
     VAR_tmp12_MUX_uxn_c_l267_c8_792e_iffalse := VAR_tmp12_MUX_uxn_c_l276_c8_e582_return_output;
     -- BIN_OP_OR[uxn_c_l227_c4_8212] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l227_c4_8212_left <= VAR_BIN_OP_OR_uxn_c_l227_c4_8212_left;
     BIN_OP_OR_uxn_c_l227_c4_8212_right <= VAR_BIN_OP_OR_uxn_c_l227_c4_8212_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l227_c4_8212_return_output := BIN_OP_OR_uxn_c_l227_c4_8212_return_output;

     -- tmp12_MUX[uxn_c_l267_c8_792e] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l267_c8_792e_cond <= VAR_tmp12_MUX_uxn_c_l267_c8_792e_cond;
     tmp12_MUX_uxn_c_l267_c8_792e_iftrue <= VAR_tmp12_MUX_uxn_c_l267_c8_792e_iftrue;
     tmp12_MUX_uxn_c_l267_c8_792e_iffalse <= VAR_tmp12_MUX_uxn_c_l267_c8_792e_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l267_c8_792e_return_output := tmp12_MUX_uxn_c_l267_c8_792e_return_output;

     -- BIN_OP_OR[uxn_c_l249_c4_c19e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l249_c4_c19e_left <= VAR_BIN_OP_OR_uxn_c_l249_c4_c19e_left;
     BIN_OP_OR_uxn_c_l249_c4_c19e_right <= VAR_BIN_OP_OR_uxn_c_l249_c4_c19e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l249_c4_c19e_return_output := BIN_OP_OR_uxn_c_l249_c4_c19e_return_output;

     -- color1_MUX[uxn_c_l267_c8_792e] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l267_c8_792e_cond <= VAR_color1_MUX_uxn_c_l267_c8_792e_cond;
     color1_MUX_uxn_c_l267_c8_792e_iftrue <= VAR_color1_MUX_uxn_c_l267_c8_792e_iftrue;
     color1_MUX_uxn_c_l267_c8_792e_iffalse <= VAR_color1_MUX_uxn_c_l267_c8_792e_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l267_c8_792e_return_output := color1_MUX_uxn_c_l267_c8_792e_return_output;

     -- color3_MUX[uxn_c_l276_c8_e582] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l276_c8_e582_cond <= VAR_color3_MUX_uxn_c_l276_c8_e582_cond;
     color3_MUX_uxn_c_l276_c8_e582_iftrue <= VAR_color3_MUX_uxn_c_l276_c8_e582_iftrue;
     color3_MUX_uxn_c_l276_c8_e582_iffalse <= VAR_color3_MUX_uxn_c_l276_c8_e582_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l276_c8_e582_return_output := color3_MUX_uxn_c_l276_c8_e582_return_output;

     -- BIN_OP_OR[uxn_c_l279_c4_670d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l279_c4_670d_left <= VAR_BIN_OP_OR_uxn_c_l279_c4_670d_left;
     BIN_OP_OR_uxn_c_l279_c4_670d_right <= VAR_BIN_OP_OR_uxn_c_l279_c4_670d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l279_c4_670d_return_output := BIN_OP_OR_uxn_c_l279_c4_670d_return_output;

     -- BIN_OP_OR[uxn_c_l238_c4_cb31] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l238_c4_cb31_left <= VAR_BIN_OP_OR_uxn_c_l238_c4_cb31_left;
     BIN_OP_OR_uxn_c_l238_c4_cb31_right <= VAR_BIN_OP_OR_uxn_c_l238_c4_cb31_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l238_c4_cb31_return_output := BIN_OP_OR_uxn_c_l238_c4_cb31_return_output;

     -- BIN_OP_OR[uxn_c_l270_c4_aea5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l270_c4_aea5_left <= VAR_BIN_OP_OR_uxn_c_l270_c4_aea5_left;
     BIN_OP_OR_uxn_c_l270_c4_aea5_right <= VAR_BIN_OP_OR_uxn_c_l270_c4_aea5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l270_c4_aea5_return_output := BIN_OP_OR_uxn_c_l270_c4_aea5_return_output;

     -- BIN_OP_OR[uxn_c_l260_c4_e87c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l260_c4_e87c_left <= VAR_BIN_OP_OR_uxn_c_l260_c4_e87c_left;
     BIN_OP_OR_uxn_c_l260_c4_e87c_right <= VAR_BIN_OP_OR_uxn_c_l260_c4_e87c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l260_c4_e87c_return_output := BIN_OP_OR_uxn_c_l260_c4_e87c_return_output;

     -- Submodule level 4
     VAR_color0_MUX_uxn_c_l223_c3_1674_iftrue := VAR_BIN_OP_OR_uxn_c_l227_c4_8212_return_output;
     VAR_color2_MUX_uxn_c_l234_c8_9034_iftrue := VAR_BIN_OP_OR_uxn_c_l238_c4_cb31_return_output;
     VAR_color0_MUX_uxn_c_l245_c8_fe83_iftrue := VAR_BIN_OP_OR_uxn_c_l249_c4_c19e_return_output;
     VAR_color2_MUX_uxn_c_l256_c8_6a03_iftrue := VAR_BIN_OP_OR_uxn_c_l260_c4_e87c_return_output;
     VAR_color0_MUX_uxn_c_l267_c8_792e_iftrue := VAR_BIN_OP_OR_uxn_c_l270_c4_aea5_return_output;
     VAR_color2_MUX_uxn_c_l276_c8_e582_iftrue := VAR_BIN_OP_OR_uxn_c_l279_c4_670d_return_output;
     VAR_color1_MUX_uxn_c_l256_c8_6a03_iffalse := VAR_color1_MUX_uxn_c_l267_c8_792e_return_output;
     VAR_color3_MUX_uxn_c_l267_c8_792e_iffalse := VAR_color3_MUX_uxn_c_l276_c8_e582_return_output;
     VAR_tmp12_MUX_uxn_c_l256_c8_6a03_iffalse := VAR_tmp12_MUX_uxn_c_l267_c8_792e_return_output;
     -- color3_MUX[uxn_c_l267_c8_792e] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l267_c8_792e_cond <= VAR_color3_MUX_uxn_c_l267_c8_792e_cond;
     color3_MUX_uxn_c_l267_c8_792e_iftrue <= VAR_color3_MUX_uxn_c_l267_c8_792e_iftrue;
     color3_MUX_uxn_c_l267_c8_792e_iffalse <= VAR_color3_MUX_uxn_c_l267_c8_792e_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l267_c8_792e_return_output := color3_MUX_uxn_c_l267_c8_792e_return_output;

     -- color2_MUX[uxn_c_l276_c8_e582] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l276_c8_e582_cond <= VAR_color2_MUX_uxn_c_l276_c8_e582_cond;
     color2_MUX_uxn_c_l276_c8_e582_iftrue <= VAR_color2_MUX_uxn_c_l276_c8_e582_iftrue;
     color2_MUX_uxn_c_l276_c8_e582_iffalse <= VAR_color2_MUX_uxn_c_l276_c8_e582_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l276_c8_e582_return_output := color2_MUX_uxn_c_l276_c8_e582_return_output;

     -- color1_MUX[uxn_c_l256_c8_6a03] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l256_c8_6a03_cond <= VAR_color1_MUX_uxn_c_l256_c8_6a03_cond;
     color1_MUX_uxn_c_l256_c8_6a03_iftrue <= VAR_color1_MUX_uxn_c_l256_c8_6a03_iftrue;
     color1_MUX_uxn_c_l256_c8_6a03_iffalse <= VAR_color1_MUX_uxn_c_l256_c8_6a03_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l256_c8_6a03_return_output := color1_MUX_uxn_c_l256_c8_6a03_return_output;

     -- tmp12_MUX[uxn_c_l256_c8_6a03] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l256_c8_6a03_cond <= VAR_tmp12_MUX_uxn_c_l256_c8_6a03_cond;
     tmp12_MUX_uxn_c_l256_c8_6a03_iftrue <= VAR_tmp12_MUX_uxn_c_l256_c8_6a03_iftrue;
     tmp12_MUX_uxn_c_l256_c8_6a03_iffalse <= VAR_tmp12_MUX_uxn_c_l256_c8_6a03_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l256_c8_6a03_return_output := tmp12_MUX_uxn_c_l256_c8_6a03_return_output;

     -- color0_MUX[uxn_c_l267_c8_792e] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l267_c8_792e_cond <= VAR_color0_MUX_uxn_c_l267_c8_792e_cond;
     color0_MUX_uxn_c_l267_c8_792e_iftrue <= VAR_color0_MUX_uxn_c_l267_c8_792e_iftrue;
     color0_MUX_uxn_c_l267_c8_792e_iffalse <= VAR_color0_MUX_uxn_c_l267_c8_792e_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l267_c8_792e_return_output := color0_MUX_uxn_c_l267_c8_792e_return_output;

     -- Submodule level 5
     VAR_color0_MUX_uxn_c_l256_c8_6a03_iffalse := VAR_color0_MUX_uxn_c_l267_c8_792e_return_output;
     VAR_color1_MUX_uxn_c_l245_c8_fe83_iffalse := VAR_color1_MUX_uxn_c_l256_c8_6a03_return_output;
     VAR_color2_MUX_uxn_c_l267_c8_792e_iffalse := VAR_color2_MUX_uxn_c_l276_c8_e582_return_output;
     VAR_color3_MUX_uxn_c_l256_c8_6a03_iffalse := VAR_color3_MUX_uxn_c_l267_c8_792e_return_output;
     VAR_tmp12_MUX_uxn_c_l245_c8_fe83_iffalse := VAR_tmp12_MUX_uxn_c_l256_c8_6a03_return_output;
     -- color0_MUX[uxn_c_l256_c8_6a03] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l256_c8_6a03_cond <= VAR_color0_MUX_uxn_c_l256_c8_6a03_cond;
     color0_MUX_uxn_c_l256_c8_6a03_iftrue <= VAR_color0_MUX_uxn_c_l256_c8_6a03_iftrue;
     color0_MUX_uxn_c_l256_c8_6a03_iffalse <= VAR_color0_MUX_uxn_c_l256_c8_6a03_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l256_c8_6a03_return_output := color0_MUX_uxn_c_l256_c8_6a03_return_output;

     -- color1_MUX[uxn_c_l245_c8_fe83] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l245_c8_fe83_cond <= VAR_color1_MUX_uxn_c_l245_c8_fe83_cond;
     color1_MUX_uxn_c_l245_c8_fe83_iftrue <= VAR_color1_MUX_uxn_c_l245_c8_fe83_iftrue;
     color1_MUX_uxn_c_l245_c8_fe83_iffalse <= VAR_color1_MUX_uxn_c_l245_c8_fe83_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l245_c8_fe83_return_output := color1_MUX_uxn_c_l245_c8_fe83_return_output;

     -- tmp12_MUX[uxn_c_l245_c8_fe83] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l245_c8_fe83_cond <= VAR_tmp12_MUX_uxn_c_l245_c8_fe83_cond;
     tmp12_MUX_uxn_c_l245_c8_fe83_iftrue <= VAR_tmp12_MUX_uxn_c_l245_c8_fe83_iftrue;
     tmp12_MUX_uxn_c_l245_c8_fe83_iffalse <= VAR_tmp12_MUX_uxn_c_l245_c8_fe83_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l245_c8_fe83_return_output := tmp12_MUX_uxn_c_l245_c8_fe83_return_output;

     -- color2_MUX[uxn_c_l267_c8_792e] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l267_c8_792e_cond <= VAR_color2_MUX_uxn_c_l267_c8_792e_cond;
     color2_MUX_uxn_c_l267_c8_792e_iftrue <= VAR_color2_MUX_uxn_c_l267_c8_792e_iftrue;
     color2_MUX_uxn_c_l267_c8_792e_iffalse <= VAR_color2_MUX_uxn_c_l267_c8_792e_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l267_c8_792e_return_output := color2_MUX_uxn_c_l267_c8_792e_return_output;

     -- color3_MUX[uxn_c_l256_c8_6a03] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l256_c8_6a03_cond <= VAR_color3_MUX_uxn_c_l256_c8_6a03_cond;
     color3_MUX_uxn_c_l256_c8_6a03_iftrue <= VAR_color3_MUX_uxn_c_l256_c8_6a03_iftrue;
     color3_MUX_uxn_c_l256_c8_6a03_iffalse <= VAR_color3_MUX_uxn_c_l256_c8_6a03_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l256_c8_6a03_return_output := color3_MUX_uxn_c_l256_c8_6a03_return_output;

     -- Submodule level 6
     VAR_color0_MUX_uxn_c_l245_c8_fe83_iffalse := VAR_color0_MUX_uxn_c_l256_c8_6a03_return_output;
     VAR_color1_MUX_uxn_c_l234_c8_9034_iffalse := VAR_color1_MUX_uxn_c_l245_c8_fe83_return_output;
     VAR_color2_MUX_uxn_c_l256_c8_6a03_iffalse := VAR_color2_MUX_uxn_c_l267_c8_792e_return_output;
     VAR_color3_MUX_uxn_c_l245_c8_fe83_iffalse := VAR_color3_MUX_uxn_c_l256_c8_6a03_return_output;
     VAR_tmp12_MUX_uxn_c_l234_c8_9034_iffalse := VAR_tmp12_MUX_uxn_c_l245_c8_fe83_return_output;
     -- color3_MUX[uxn_c_l245_c8_fe83] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l245_c8_fe83_cond <= VAR_color3_MUX_uxn_c_l245_c8_fe83_cond;
     color3_MUX_uxn_c_l245_c8_fe83_iftrue <= VAR_color3_MUX_uxn_c_l245_c8_fe83_iftrue;
     color3_MUX_uxn_c_l245_c8_fe83_iffalse <= VAR_color3_MUX_uxn_c_l245_c8_fe83_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l245_c8_fe83_return_output := color3_MUX_uxn_c_l245_c8_fe83_return_output;

     -- color0_MUX[uxn_c_l245_c8_fe83] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l245_c8_fe83_cond <= VAR_color0_MUX_uxn_c_l245_c8_fe83_cond;
     color0_MUX_uxn_c_l245_c8_fe83_iftrue <= VAR_color0_MUX_uxn_c_l245_c8_fe83_iftrue;
     color0_MUX_uxn_c_l245_c8_fe83_iffalse <= VAR_color0_MUX_uxn_c_l245_c8_fe83_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l245_c8_fe83_return_output := color0_MUX_uxn_c_l245_c8_fe83_return_output;

     -- color2_MUX[uxn_c_l256_c8_6a03] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l256_c8_6a03_cond <= VAR_color2_MUX_uxn_c_l256_c8_6a03_cond;
     color2_MUX_uxn_c_l256_c8_6a03_iftrue <= VAR_color2_MUX_uxn_c_l256_c8_6a03_iftrue;
     color2_MUX_uxn_c_l256_c8_6a03_iffalse <= VAR_color2_MUX_uxn_c_l256_c8_6a03_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l256_c8_6a03_return_output := color2_MUX_uxn_c_l256_c8_6a03_return_output;

     -- tmp12_MUX[uxn_c_l234_c8_9034] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l234_c8_9034_cond <= VAR_tmp12_MUX_uxn_c_l234_c8_9034_cond;
     tmp12_MUX_uxn_c_l234_c8_9034_iftrue <= VAR_tmp12_MUX_uxn_c_l234_c8_9034_iftrue;
     tmp12_MUX_uxn_c_l234_c8_9034_iffalse <= VAR_tmp12_MUX_uxn_c_l234_c8_9034_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l234_c8_9034_return_output := tmp12_MUX_uxn_c_l234_c8_9034_return_output;

     -- color1_MUX[uxn_c_l234_c8_9034] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l234_c8_9034_cond <= VAR_color1_MUX_uxn_c_l234_c8_9034_cond;
     color1_MUX_uxn_c_l234_c8_9034_iftrue <= VAR_color1_MUX_uxn_c_l234_c8_9034_iftrue;
     color1_MUX_uxn_c_l234_c8_9034_iffalse <= VAR_color1_MUX_uxn_c_l234_c8_9034_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l234_c8_9034_return_output := color1_MUX_uxn_c_l234_c8_9034_return_output;

     -- Submodule level 7
     VAR_color0_MUX_uxn_c_l234_c8_9034_iffalse := VAR_color0_MUX_uxn_c_l245_c8_fe83_return_output;
     VAR_color1_MUX_uxn_c_l223_c3_1674_iffalse := VAR_color1_MUX_uxn_c_l234_c8_9034_return_output;
     VAR_color2_MUX_uxn_c_l245_c8_fe83_iffalse := VAR_color2_MUX_uxn_c_l256_c8_6a03_return_output;
     VAR_color3_MUX_uxn_c_l234_c8_9034_iffalse := VAR_color3_MUX_uxn_c_l245_c8_fe83_return_output;
     VAR_tmp12_MUX_uxn_c_l223_c3_1674_iffalse := VAR_tmp12_MUX_uxn_c_l234_c8_9034_return_output;
     -- color2_MUX[uxn_c_l245_c8_fe83] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l245_c8_fe83_cond <= VAR_color2_MUX_uxn_c_l245_c8_fe83_cond;
     color2_MUX_uxn_c_l245_c8_fe83_iftrue <= VAR_color2_MUX_uxn_c_l245_c8_fe83_iftrue;
     color2_MUX_uxn_c_l245_c8_fe83_iffalse <= VAR_color2_MUX_uxn_c_l245_c8_fe83_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l245_c8_fe83_return_output := color2_MUX_uxn_c_l245_c8_fe83_return_output;

     -- tmp12_MUX[uxn_c_l223_c3_1674] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l223_c3_1674_cond <= VAR_tmp12_MUX_uxn_c_l223_c3_1674_cond;
     tmp12_MUX_uxn_c_l223_c3_1674_iftrue <= VAR_tmp12_MUX_uxn_c_l223_c3_1674_iftrue;
     tmp12_MUX_uxn_c_l223_c3_1674_iffalse <= VAR_tmp12_MUX_uxn_c_l223_c3_1674_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l223_c3_1674_return_output := tmp12_MUX_uxn_c_l223_c3_1674_return_output;

     -- color0_MUX[uxn_c_l234_c8_9034] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l234_c8_9034_cond <= VAR_color0_MUX_uxn_c_l234_c8_9034_cond;
     color0_MUX_uxn_c_l234_c8_9034_iftrue <= VAR_color0_MUX_uxn_c_l234_c8_9034_iftrue;
     color0_MUX_uxn_c_l234_c8_9034_iffalse <= VAR_color0_MUX_uxn_c_l234_c8_9034_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l234_c8_9034_return_output := color0_MUX_uxn_c_l234_c8_9034_return_output;

     -- color3_MUX[uxn_c_l234_c8_9034] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l234_c8_9034_cond <= VAR_color3_MUX_uxn_c_l234_c8_9034_cond;
     color3_MUX_uxn_c_l234_c8_9034_iftrue <= VAR_color3_MUX_uxn_c_l234_c8_9034_iftrue;
     color3_MUX_uxn_c_l234_c8_9034_iffalse <= VAR_color3_MUX_uxn_c_l234_c8_9034_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l234_c8_9034_return_output := color3_MUX_uxn_c_l234_c8_9034_return_output;

     -- color1_MUX[uxn_c_l223_c3_1674] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l223_c3_1674_cond <= VAR_color1_MUX_uxn_c_l223_c3_1674_cond;
     color1_MUX_uxn_c_l223_c3_1674_iftrue <= VAR_color1_MUX_uxn_c_l223_c3_1674_iftrue;
     color1_MUX_uxn_c_l223_c3_1674_iffalse <= VAR_color1_MUX_uxn_c_l223_c3_1674_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l223_c3_1674_return_output := color1_MUX_uxn_c_l223_c3_1674_return_output;

     -- Submodule level 8
     VAR_color0_MUX_uxn_c_l223_c3_1674_iffalse := VAR_color0_MUX_uxn_c_l234_c8_9034_return_output;
     VAR_color1_MUX_uxn_c_l220_c2_a2e2_iftrue := VAR_color1_MUX_uxn_c_l223_c3_1674_return_output;
     VAR_color2_MUX_uxn_c_l234_c8_9034_iffalse := VAR_color2_MUX_uxn_c_l245_c8_fe83_return_output;
     VAR_color3_MUX_uxn_c_l223_c3_1674_iffalse := VAR_color3_MUX_uxn_c_l234_c8_9034_return_output;
     VAR_tmp12_MUX_uxn_c_l220_c2_a2e2_iftrue := VAR_tmp12_MUX_uxn_c_l223_c3_1674_return_output;
     -- tmp12_MUX[uxn_c_l220_c2_a2e2] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l220_c2_a2e2_cond <= VAR_tmp12_MUX_uxn_c_l220_c2_a2e2_cond;
     tmp12_MUX_uxn_c_l220_c2_a2e2_iftrue <= VAR_tmp12_MUX_uxn_c_l220_c2_a2e2_iftrue;
     tmp12_MUX_uxn_c_l220_c2_a2e2_iffalse <= VAR_tmp12_MUX_uxn_c_l220_c2_a2e2_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l220_c2_a2e2_return_output := tmp12_MUX_uxn_c_l220_c2_a2e2_return_output;

     -- color3_MUX[uxn_c_l223_c3_1674] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l223_c3_1674_cond <= VAR_color3_MUX_uxn_c_l223_c3_1674_cond;
     color3_MUX_uxn_c_l223_c3_1674_iftrue <= VAR_color3_MUX_uxn_c_l223_c3_1674_iftrue;
     color3_MUX_uxn_c_l223_c3_1674_iffalse <= VAR_color3_MUX_uxn_c_l223_c3_1674_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l223_c3_1674_return_output := color3_MUX_uxn_c_l223_c3_1674_return_output;

     -- color0_MUX[uxn_c_l223_c3_1674] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l223_c3_1674_cond <= VAR_color0_MUX_uxn_c_l223_c3_1674_cond;
     color0_MUX_uxn_c_l223_c3_1674_iftrue <= VAR_color0_MUX_uxn_c_l223_c3_1674_iftrue;
     color0_MUX_uxn_c_l223_c3_1674_iffalse <= VAR_color0_MUX_uxn_c_l223_c3_1674_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l223_c3_1674_return_output := color0_MUX_uxn_c_l223_c3_1674_return_output;

     -- color1_MUX[uxn_c_l220_c2_a2e2] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l220_c2_a2e2_cond <= VAR_color1_MUX_uxn_c_l220_c2_a2e2_cond;
     color1_MUX_uxn_c_l220_c2_a2e2_iftrue <= VAR_color1_MUX_uxn_c_l220_c2_a2e2_iftrue;
     color1_MUX_uxn_c_l220_c2_a2e2_iffalse <= VAR_color1_MUX_uxn_c_l220_c2_a2e2_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l220_c2_a2e2_return_output := color1_MUX_uxn_c_l220_c2_a2e2_return_output;

     -- color2_MUX[uxn_c_l234_c8_9034] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l234_c8_9034_cond <= VAR_color2_MUX_uxn_c_l234_c8_9034_cond;
     color2_MUX_uxn_c_l234_c8_9034_iftrue <= VAR_color2_MUX_uxn_c_l234_c8_9034_iftrue;
     color2_MUX_uxn_c_l234_c8_9034_iffalse <= VAR_color2_MUX_uxn_c_l234_c8_9034_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l234_c8_9034_return_output := color2_MUX_uxn_c_l234_c8_9034_return_output;

     -- Submodule level 9
     VAR_color0_MUX_uxn_c_l220_c2_a2e2_iftrue := VAR_color0_MUX_uxn_c_l223_c3_1674_return_output;
     REG_VAR_color1 := VAR_color1_MUX_uxn_c_l220_c2_a2e2_return_output;
     VAR_result_uxn_c_l290_c3_71ff := resize(VAR_color1_MUX_uxn_c_l220_c2_a2e2_return_output, 16);
     VAR_color2_MUX_uxn_c_l223_c3_1674_iffalse := VAR_color2_MUX_uxn_c_l234_c8_9034_return_output;
     VAR_color3_MUX_uxn_c_l220_c2_a2e2_iftrue := VAR_color3_MUX_uxn_c_l223_c3_1674_return_output;
     REG_VAR_tmp12 := VAR_tmp12_MUX_uxn_c_l220_c2_a2e2_return_output;
     VAR_result_MUX_uxn_c_l289_c9_d68f_iftrue := VAR_result_uxn_c_l290_c3_71ff;
     -- color3_MUX[uxn_c_l220_c2_a2e2] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l220_c2_a2e2_cond <= VAR_color3_MUX_uxn_c_l220_c2_a2e2_cond;
     color3_MUX_uxn_c_l220_c2_a2e2_iftrue <= VAR_color3_MUX_uxn_c_l220_c2_a2e2_iftrue;
     color3_MUX_uxn_c_l220_c2_a2e2_iffalse <= VAR_color3_MUX_uxn_c_l220_c2_a2e2_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l220_c2_a2e2_return_output := color3_MUX_uxn_c_l220_c2_a2e2_return_output;

     -- color0_MUX[uxn_c_l220_c2_a2e2] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l220_c2_a2e2_cond <= VAR_color0_MUX_uxn_c_l220_c2_a2e2_cond;
     color0_MUX_uxn_c_l220_c2_a2e2_iftrue <= VAR_color0_MUX_uxn_c_l220_c2_a2e2_iftrue;
     color0_MUX_uxn_c_l220_c2_a2e2_iffalse <= VAR_color0_MUX_uxn_c_l220_c2_a2e2_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l220_c2_a2e2_return_output := color0_MUX_uxn_c_l220_c2_a2e2_return_output;

     -- color2_MUX[uxn_c_l223_c3_1674] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l223_c3_1674_cond <= VAR_color2_MUX_uxn_c_l223_c3_1674_cond;
     color2_MUX_uxn_c_l223_c3_1674_iftrue <= VAR_color2_MUX_uxn_c_l223_c3_1674_iftrue;
     color2_MUX_uxn_c_l223_c3_1674_iffalse <= VAR_color2_MUX_uxn_c_l223_c3_1674_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l223_c3_1674_return_output := color2_MUX_uxn_c_l223_c3_1674_return_output;

     -- Submodule level 10
     REG_VAR_color0 := VAR_color0_MUX_uxn_c_l220_c2_a2e2_return_output;
     VAR_result_uxn_c_l288_c3_831b := resize(VAR_color0_MUX_uxn_c_l220_c2_a2e2_return_output, 16);
     VAR_color2_MUX_uxn_c_l220_c2_a2e2_iftrue := VAR_color2_MUX_uxn_c_l223_c3_1674_return_output;
     REG_VAR_color3 := VAR_color3_MUX_uxn_c_l220_c2_a2e2_return_output;
     VAR_result_uxn_c_l294_c3_3e20 := resize(VAR_color3_MUX_uxn_c_l220_c2_a2e2_return_output, 16);
     VAR_result_MUX_uxn_c_l287_c2_a9f0_iftrue := VAR_result_uxn_c_l288_c3_831b;
     VAR_result_MUX_uxn_c_l291_c9_0a78_iffalse := VAR_result_uxn_c_l294_c3_3e20;
     -- color2_MUX[uxn_c_l220_c2_a2e2] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l220_c2_a2e2_cond <= VAR_color2_MUX_uxn_c_l220_c2_a2e2_cond;
     color2_MUX_uxn_c_l220_c2_a2e2_iftrue <= VAR_color2_MUX_uxn_c_l220_c2_a2e2_iftrue;
     color2_MUX_uxn_c_l220_c2_a2e2_iffalse <= VAR_color2_MUX_uxn_c_l220_c2_a2e2_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l220_c2_a2e2_return_output := color2_MUX_uxn_c_l220_c2_a2e2_return_output;

     -- Submodule level 11
     REG_VAR_color2 := VAR_color2_MUX_uxn_c_l220_c2_a2e2_return_output;
     VAR_result_uxn_c_l292_c3_4845 := resize(VAR_color2_MUX_uxn_c_l220_c2_a2e2_return_output, 16);
     VAR_result_MUX_uxn_c_l291_c9_0a78_iftrue := VAR_result_uxn_c_l292_c3_4845;
     -- result_MUX[uxn_c_l291_c9_0a78] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l291_c9_0a78_cond <= VAR_result_MUX_uxn_c_l291_c9_0a78_cond;
     result_MUX_uxn_c_l291_c9_0a78_iftrue <= VAR_result_MUX_uxn_c_l291_c9_0a78_iftrue;
     result_MUX_uxn_c_l291_c9_0a78_iffalse <= VAR_result_MUX_uxn_c_l291_c9_0a78_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l291_c9_0a78_return_output := result_MUX_uxn_c_l291_c9_0a78_return_output;

     -- Submodule level 12
     VAR_result_MUX_uxn_c_l289_c9_d68f_iffalse := VAR_result_MUX_uxn_c_l291_c9_0a78_return_output;
     -- result_MUX[uxn_c_l289_c9_d68f] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l289_c9_d68f_cond <= VAR_result_MUX_uxn_c_l289_c9_d68f_cond;
     result_MUX_uxn_c_l289_c9_d68f_iftrue <= VAR_result_MUX_uxn_c_l289_c9_d68f_iftrue;
     result_MUX_uxn_c_l289_c9_d68f_iffalse <= VAR_result_MUX_uxn_c_l289_c9_d68f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l289_c9_d68f_return_output := result_MUX_uxn_c_l289_c9_d68f_return_output;

     -- Submodule level 13
     VAR_result_MUX_uxn_c_l287_c2_a9f0_iffalse := VAR_result_MUX_uxn_c_l289_c9_d68f_return_output;
     -- result_MUX[uxn_c_l287_c2_a9f0] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l287_c2_a9f0_cond <= VAR_result_MUX_uxn_c_l287_c2_a9f0_cond;
     result_MUX_uxn_c_l287_c2_a9f0_iftrue <= VAR_result_MUX_uxn_c_l287_c2_a9f0_iftrue;
     result_MUX_uxn_c_l287_c2_a9f0_iffalse <= VAR_result_MUX_uxn_c_l287_c2_a9f0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l287_c2_a9f0_return_output := result_MUX_uxn_c_l287_c2_a9f0_return_output;

     -- Submodule level 14
     REG_VAR_result := VAR_result_MUX_uxn_c_l287_c2_a9f0_return_output;
     VAR_return_output := VAR_result_MUX_uxn_c_l287_c2_a9f0_return_output;
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
