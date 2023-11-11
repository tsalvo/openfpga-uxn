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
-- color_cmp_1_MUX[uxn_c_l220_c2_6be9]
signal color_cmp_1_MUX_uxn_c_l220_c2_6be9_cond : unsigned(0 downto 0);
signal color_cmp_1_MUX_uxn_c_l220_c2_6be9_iftrue : unsigned(3 downto 0);
signal color_cmp_1_MUX_uxn_c_l220_c2_6be9_iffalse : unsigned(3 downto 0);
signal color_cmp_1_MUX_uxn_c_l220_c2_6be9_return_output : unsigned(3 downto 0);

-- color1_MUX[uxn_c_l220_c2_6be9]
signal color1_MUX_uxn_c_l220_c2_6be9_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l220_c2_6be9_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l220_c2_6be9_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l220_c2_6be9_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l220_c2_6be9]
signal tmp12_MUX_uxn_c_l220_c2_6be9_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l220_c2_6be9_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l220_c2_6be9_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l220_c2_6be9_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l220_c2_6be9]
signal color2_MUX_uxn_c_l220_c2_6be9_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l220_c2_6be9_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l220_c2_6be9_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l220_c2_6be9_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l220_c2_6be9]
signal color0_MUX_uxn_c_l220_c2_6be9_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l220_c2_6be9_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l220_c2_6be9_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l220_c2_6be9_return_output : unsigned(11 downto 0);

-- color_cmp_0_MUX[uxn_c_l220_c2_6be9]
signal color_cmp_0_MUX_uxn_c_l220_c2_6be9_cond : unsigned(0 downto 0);
signal color_cmp_0_MUX_uxn_c_l220_c2_6be9_iftrue : unsigned(3 downto 0);
signal color_cmp_0_MUX_uxn_c_l220_c2_6be9_iffalse : unsigned(3 downto 0);
signal color_cmp_0_MUX_uxn_c_l220_c2_6be9_return_output : unsigned(3 downto 0);

-- color3_MUX[uxn_c_l220_c2_6be9]
signal color3_MUX_uxn_c_l220_c2_6be9_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l220_c2_6be9_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l220_c2_6be9_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l220_c2_6be9_return_output : unsigned(11 downto 0);

-- CONST_SR_4[uxn_c_l221_c27_9bff]
signal CONST_SR_4_uxn_c_l221_c27_9bff_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l221_c27_9bff_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l223_c7_0916]
signal BIN_OP_EQ_uxn_c_l223_c7_0916_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l223_c7_0916_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l223_c7_0916_return_output : unsigned(0 downto 0);

-- color1_MUX[uxn_c_l223_c3_35dd]
signal color1_MUX_uxn_c_l223_c3_35dd_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l223_c3_35dd_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l223_c3_35dd_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l223_c3_35dd_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l223_c3_35dd]
signal tmp12_MUX_uxn_c_l223_c3_35dd_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l223_c3_35dd_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l223_c3_35dd_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l223_c3_35dd_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l223_c3_35dd]
signal color2_MUX_uxn_c_l223_c3_35dd_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l223_c3_35dd_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l223_c3_35dd_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l223_c3_35dd_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l223_c3_35dd]
signal color0_MUX_uxn_c_l223_c3_35dd_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l223_c3_35dd_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l223_c3_35dd_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l223_c3_35dd_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l223_c3_35dd]
signal color3_MUX_uxn_c_l223_c3_35dd_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l223_c3_35dd_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l223_c3_35dd_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l223_c3_35dd_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l225_c4_c82f]
signal CONST_SL_8_uxn_c_l225_c4_c82f_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l225_c4_c82f_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l226_c4_4269]
signal BIN_OP_AND_uxn_c_l226_c4_4269_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l226_c4_4269_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l226_c4_4269_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l227_c4_f3cf]
signal BIN_OP_OR_uxn_c_l227_c4_f3cf_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l227_c4_f3cf_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l227_c4_f3cf_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l230_c4_5405]
signal CONST_SL_8_uxn_c_l230_c4_5405_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l230_c4_5405_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l231_c4_0a5f]
signal BIN_OP_AND_uxn_c_l231_c4_0a5f_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l231_c4_0a5f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l231_c4_0a5f_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l232_c4_16a7]
signal BIN_OP_OR_uxn_c_l232_c4_16a7_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l232_c4_16a7_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l232_c4_16a7_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l234_c12_72f9]
signal BIN_OP_EQ_uxn_c_l234_c12_72f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l234_c12_72f9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l234_c12_72f9_return_output : unsigned(0 downto 0);

-- color1_MUX[uxn_c_l234_c8_29bc]
signal color1_MUX_uxn_c_l234_c8_29bc_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l234_c8_29bc_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l234_c8_29bc_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l234_c8_29bc_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l234_c8_29bc]
signal tmp12_MUX_uxn_c_l234_c8_29bc_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l234_c8_29bc_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l234_c8_29bc_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l234_c8_29bc_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l234_c8_29bc]
signal color2_MUX_uxn_c_l234_c8_29bc_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l234_c8_29bc_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l234_c8_29bc_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l234_c8_29bc_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l234_c8_29bc]
signal color0_MUX_uxn_c_l234_c8_29bc_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l234_c8_29bc_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l234_c8_29bc_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l234_c8_29bc_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l234_c8_29bc]
signal color3_MUX_uxn_c_l234_c8_29bc_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l234_c8_29bc_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l234_c8_29bc_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l234_c8_29bc_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l236_c4_9763]
signal CONST_SL_8_uxn_c_l236_c4_9763_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l236_c4_9763_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l237_c4_4608]
signal BIN_OP_AND_uxn_c_l237_c4_4608_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l237_c4_4608_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l237_c4_4608_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l238_c4_ffd9]
signal BIN_OP_OR_uxn_c_l238_c4_ffd9_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l238_c4_ffd9_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l238_c4_ffd9_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l241_c4_81ff]
signal CONST_SL_8_uxn_c_l241_c4_81ff_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l241_c4_81ff_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l242_c4_1a57]
signal BIN_OP_AND_uxn_c_l242_c4_1a57_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l242_c4_1a57_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l242_c4_1a57_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l243_c4_935d]
signal BIN_OP_OR_uxn_c_l243_c4_935d_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l243_c4_935d_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l243_c4_935d_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l245_c12_0085]
signal BIN_OP_EQ_uxn_c_l245_c12_0085_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l245_c12_0085_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l245_c12_0085_return_output : unsigned(0 downto 0);

-- color1_MUX[uxn_c_l245_c8_73ea]
signal color1_MUX_uxn_c_l245_c8_73ea_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l245_c8_73ea_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l245_c8_73ea_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l245_c8_73ea_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l245_c8_73ea]
signal tmp12_MUX_uxn_c_l245_c8_73ea_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l245_c8_73ea_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l245_c8_73ea_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l245_c8_73ea_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l245_c8_73ea]
signal color2_MUX_uxn_c_l245_c8_73ea_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l245_c8_73ea_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l245_c8_73ea_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l245_c8_73ea_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l245_c8_73ea]
signal color0_MUX_uxn_c_l245_c8_73ea_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l245_c8_73ea_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l245_c8_73ea_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l245_c8_73ea_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l245_c8_73ea]
signal color3_MUX_uxn_c_l245_c8_73ea_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l245_c8_73ea_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l245_c8_73ea_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l245_c8_73ea_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l247_c4_f183]
signal CONST_SL_4_uxn_c_l247_c4_f183_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l247_c4_f183_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l248_c4_22fc]
signal BIN_OP_AND_uxn_c_l248_c4_22fc_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l248_c4_22fc_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l248_c4_22fc_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l249_c4_a5c2]
signal BIN_OP_OR_uxn_c_l249_c4_a5c2_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l249_c4_a5c2_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l249_c4_a5c2_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l252_c4_91d5]
signal CONST_SL_4_uxn_c_l252_c4_91d5_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l252_c4_91d5_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l253_c4_0585]
signal BIN_OP_AND_uxn_c_l253_c4_0585_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l253_c4_0585_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l253_c4_0585_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l254_c4_a82b]
signal BIN_OP_OR_uxn_c_l254_c4_a82b_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l254_c4_a82b_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l254_c4_a82b_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l256_c12_bf05]
signal BIN_OP_EQ_uxn_c_l256_c12_bf05_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l256_c12_bf05_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l256_c12_bf05_return_output : unsigned(0 downto 0);

-- color1_MUX[uxn_c_l256_c8_7aca]
signal color1_MUX_uxn_c_l256_c8_7aca_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l256_c8_7aca_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l256_c8_7aca_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l256_c8_7aca_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l256_c8_7aca]
signal tmp12_MUX_uxn_c_l256_c8_7aca_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l256_c8_7aca_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l256_c8_7aca_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l256_c8_7aca_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l256_c8_7aca]
signal color2_MUX_uxn_c_l256_c8_7aca_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l256_c8_7aca_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l256_c8_7aca_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l256_c8_7aca_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l256_c8_7aca]
signal color0_MUX_uxn_c_l256_c8_7aca_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l256_c8_7aca_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l256_c8_7aca_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l256_c8_7aca_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l256_c8_7aca]
signal color3_MUX_uxn_c_l256_c8_7aca_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l256_c8_7aca_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l256_c8_7aca_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l256_c8_7aca_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l258_c4_2cee]
signal CONST_SL_4_uxn_c_l258_c4_2cee_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l258_c4_2cee_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l259_c4_352e]
signal BIN_OP_AND_uxn_c_l259_c4_352e_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l259_c4_352e_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l259_c4_352e_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l260_c4_f4b9]
signal BIN_OP_OR_uxn_c_l260_c4_f4b9_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l260_c4_f4b9_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l260_c4_f4b9_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l263_c4_0107]
signal CONST_SL_4_uxn_c_l263_c4_0107_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l263_c4_0107_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l264_c4_7b03]
signal BIN_OP_AND_uxn_c_l264_c4_7b03_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l264_c4_7b03_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l264_c4_7b03_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l265_c4_ce9f]
signal BIN_OP_OR_uxn_c_l265_c4_ce9f_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l265_c4_ce9f_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l265_c4_ce9f_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l267_c12_aecc]
signal BIN_OP_EQ_uxn_c_l267_c12_aecc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l267_c12_aecc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l267_c12_aecc_return_output : unsigned(0 downto 0);

-- color1_MUX[uxn_c_l267_c8_3366]
signal color1_MUX_uxn_c_l267_c8_3366_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l267_c8_3366_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l267_c8_3366_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l267_c8_3366_return_output : unsigned(11 downto 0);

-- tmp12_MUX[uxn_c_l267_c8_3366]
signal tmp12_MUX_uxn_c_l267_c8_3366_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l267_c8_3366_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l267_c8_3366_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l267_c8_3366_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l267_c8_3366]
signal color2_MUX_uxn_c_l267_c8_3366_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l267_c8_3366_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l267_c8_3366_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l267_c8_3366_return_output : unsigned(11 downto 0);

-- color0_MUX[uxn_c_l267_c8_3366]
signal color0_MUX_uxn_c_l267_c8_3366_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l267_c8_3366_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l267_c8_3366_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l267_c8_3366_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l267_c8_3366]
signal color3_MUX_uxn_c_l267_c8_3366_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l267_c8_3366_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l267_c8_3366_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l267_c8_3366_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l269_c4_4e1a]
signal BIN_OP_AND_uxn_c_l269_c4_4e1a_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l269_c4_4e1a_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l269_c4_4e1a_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l270_c4_8250]
signal BIN_OP_OR_uxn_c_l270_c4_8250_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l270_c4_8250_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l270_c4_8250_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l273_c4_5468]
signal BIN_OP_AND_uxn_c_l273_c4_5468_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l273_c4_5468_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l273_c4_5468_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l274_c4_bf56]
signal BIN_OP_OR_uxn_c_l274_c4_bf56_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l274_c4_bf56_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l274_c4_bf56_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l276_c12_ed55]
signal BIN_OP_EQ_uxn_c_l276_c12_ed55_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l276_c12_ed55_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l276_c12_ed55_return_output : unsigned(0 downto 0);

-- tmp12_MUX[uxn_c_l276_c8_fd2a]
signal tmp12_MUX_uxn_c_l276_c8_fd2a_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_c_l276_c8_fd2a_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l276_c8_fd2a_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_c_l276_c8_fd2a_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l276_c8_fd2a]
signal color2_MUX_uxn_c_l276_c8_fd2a_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l276_c8_fd2a_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l276_c8_fd2a_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l276_c8_fd2a_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l276_c8_fd2a]
signal color3_MUX_uxn_c_l276_c8_fd2a_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l276_c8_fd2a_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l276_c8_fd2a_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l276_c8_fd2a_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l278_c4_9c30]
signal BIN_OP_AND_uxn_c_l278_c4_9c30_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l278_c4_9c30_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l278_c4_9c30_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l279_c4_ce95]
signal BIN_OP_OR_uxn_c_l279_c4_ce95_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l279_c4_ce95_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l279_c4_ce95_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l282_c4_cd2c]
signal BIN_OP_AND_uxn_c_l282_c4_cd2c_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l282_c4_cd2c_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l282_c4_cd2c_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l283_c4_b481]
signal BIN_OP_OR_uxn_c_l283_c4_b481_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l283_c4_b481_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l283_c4_b481_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l287_c6_a1c6]
signal BIN_OP_EQ_uxn_c_l287_c6_a1c6_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l287_c6_a1c6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l287_c6_a1c6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l287_c2_06ba]
signal result_MUX_uxn_c_l287_c2_06ba_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l287_c2_06ba_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l287_c2_06ba_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l287_c2_06ba_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l289_c13_66e2]
signal BIN_OP_EQ_uxn_c_l289_c13_66e2_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l289_c13_66e2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l289_c13_66e2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l289_c9_a421]
signal result_MUX_uxn_c_l289_c9_a421_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l289_c9_a421_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l289_c9_a421_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l289_c9_a421_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l291_c13_c24f]
signal BIN_OP_EQ_uxn_c_l291_c13_c24f_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l291_c13_c24f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l291_c13_c24f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l291_c9_1bcc]
signal result_MUX_uxn_c_l291_c9_1bcc_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l291_c9_1bcc_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l291_c9_1bcc_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l291_c9_1bcc_return_output : unsigned(15 downto 0);

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
-- color_cmp_1_MUX_uxn_c_l220_c2_6be9
color_cmp_1_MUX_uxn_c_l220_c2_6be9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_cmp_1_MUX_uxn_c_l220_c2_6be9_cond,
color_cmp_1_MUX_uxn_c_l220_c2_6be9_iftrue,
color_cmp_1_MUX_uxn_c_l220_c2_6be9_iffalse,
color_cmp_1_MUX_uxn_c_l220_c2_6be9_return_output);

-- color1_MUX_uxn_c_l220_c2_6be9
color1_MUX_uxn_c_l220_c2_6be9 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l220_c2_6be9_cond,
color1_MUX_uxn_c_l220_c2_6be9_iftrue,
color1_MUX_uxn_c_l220_c2_6be9_iffalse,
color1_MUX_uxn_c_l220_c2_6be9_return_output);

-- tmp12_MUX_uxn_c_l220_c2_6be9
tmp12_MUX_uxn_c_l220_c2_6be9 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l220_c2_6be9_cond,
tmp12_MUX_uxn_c_l220_c2_6be9_iftrue,
tmp12_MUX_uxn_c_l220_c2_6be9_iffalse,
tmp12_MUX_uxn_c_l220_c2_6be9_return_output);

-- color2_MUX_uxn_c_l220_c2_6be9
color2_MUX_uxn_c_l220_c2_6be9 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l220_c2_6be9_cond,
color2_MUX_uxn_c_l220_c2_6be9_iftrue,
color2_MUX_uxn_c_l220_c2_6be9_iffalse,
color2_MUX_uxn_c_l220_c2_6be9_return_output);

-- color0_MUX_uxn_c_l220_c2_6be9
color0_MUX_uxn_c_l220_c2_6be9 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l220_c2_6be9_cond,
color0_MUX_uxn_c_l220_c2_6be9_iftrue,
color0_MUX_uxn_c_l220_c2_6be9_iffalse,
color0_MUX_uxn_c_l220_c2_6be9_return_output);

-- color_cmp_0_MUX_uxn_c_l220_c2_6be9
color_cmp_0_MUX_uxn_c_l220_c2_6be9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_cmp_0_MUX_uxn_c_l220_c2_6be9_cond,
color_cmp_0_MUX_uxn_c_l220_c2_6be9_iftrue,
color_cmp_0_MUX_uxn_c_l220_c2_6be9_iffalse,
color_cmp_0_MUX_uxn_c_l220_c2_6be9_return_output);

-- color3_MUX_uxn_c_l220_c2_6be9
color3_MUX_uxn_c_l220_c2_6be9 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l220_c2_6be9_cond,
color3_MUX_uxn_c_l220_c2_6be9_iftrue,
color3_MUX_uxn_c_l220_c2_6be9_iffalse,
color3_MUX_uxn_c_l220_c2_6be9_return_output);

-- CONST_SR_4_uxn_c_l221_c27_9bff
CONST_SR_4_uxn_c_l221_c27_9bff : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l221_c27_9bff_x,
CONST_SR_4_uxn_c_l221_c27_9bff_return_output);

-- BIN_OP_EQ_uxn_c_l223_c7_0916
BIN_OP_EQ_uxn_c_l223_c7_0916 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l223_c7_0916_left,
BIN_OP_EQ_uxn_c_l223_c7_0916_right,
BIN_OP_EQ_uxn_c_l223_c7_0916_return_output);

-- color1_MUX_uxn_c_l223_c3_35dd
color1_MUX_uxn_c_l223_c3_35dd : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l223_c3_35dd_cond,
color1_MUX_uxn_c_l223_c3_35dd_iftrue,
color1_MUX_uxn_c_l223_c3_35dd_iffalse,
color1_MUX_uxn_c_l223_c3_35dd_return_output);

-- tmp12_MUX_uxn_c_l223_c3_35dd
tmp12_MUX_uxn_c_l223_c3_35dd : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l223_c3_35dd_cond,
tmp12_MUX_uxn_c_l223_c3_35dd_iftrue,
tmp12_MUX_uxn_c_l223_c3_35dd_iffalse,
tmp12_MUX_uxn_c_l223_c3_35dd_return_output);

-- color2_MUX_uxn_c_l223_c3_35dd
color2_MUX_uxn_c_l223_c3_35dd : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l223_c3_35dd_cond,
color2_MUX_uxn_c_l223_c3_35dd_iftrue,
color2_MUX_uxn_c_l223_c3_35dd_iffalse,
color2_MUX_uxn_c_l223_c3_35dd_return_output);

-- color0_MUX_uxn_c_l223_c3_35dd
color0_MUX_uxn_c_l223_c3_35dd : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l223_c3_35dd_cond,
color0_MUX_uxn_c_l223_c3_35dd_iftrue,
color0_MUX_uxn_c_l223_c3_35dd_iffalse,
color0_MUX_uxn_c_l223_c3_35dd_return_output);

-- color3_MUX_uxn_c_l223_c3_35dd
color3_MUX_uxn_c_l223_c3_35dd : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l223_c3_35dd_cond,
color3_MUX_uxn_c_l223_c3_35dd_iftrue,
color3_MUX_uxn_c_l223_c3_35dd_iffalse,
color3_MUX_uxn_c_l223_c3_35dd_return_output);

-- CONST_SL_8_uxn_c_l225_c4_c82f
CONST_SL_8_uxn_c_l225_c4_c82f : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l225_c4_c82f_x,
CONST_SL_8_uxn_c_l225_c4_c82f_return_output);

-- BIN_OP_AND_uxn_c_l226_c4_4269
BIN_OP_AND_uxn_c_l226_c4_4269 : entity work.BIN_OP_AND_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l226_c4_4269_left,
BIN_OP_AND_uxn_c_l226_c4_4269_right,
BIN_OP_AND_uxn_c_l226_c4_4269_return_output);

-- BIN_OP_OR_uxn_c_l227_c4_f3cf
BIN_OP_OR_uxn_c_l227_c4_f3cf : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l227_c4_f3cf_left,
BIN_OP_OR_uxn_c_l227_c4_f3cf_right,
BIN_OP_OR_uxn_c_l227_c4_f3cf_return_output);

-- CONST_SL_8_uxn_c_l230_c4_5405
CONST_SL_8_uxn_c_l230_c4_5405 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l230_c4_5405_x,
CONST_SL_8_uxn_c_l230_c4_5405_return_output);

-- BIN_OP_AND_uxn_c_l231_c4_0a5f
BIN_OP_AND_uxn_c_l231_c4_0a5f : entity work.BIN_OP_AND_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l231_c4_0a5f_left,
BIN_OP_AND_uxn_c_l231_c4_0a5f_right,
BIN_OP_AND_uxn_c_l231_c4_0a5f_return_output);

-- BIN_OP_OR_uxn_c_l232_c4_16a7
BIN_OP_OR_uxn_c_l232_c4_16a7 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l232_c4_16a7_left,
BIN_OP_OR_uxn_c_l232_c4_16a7_right,
BIN_OP_OR_uxn_c_l232_c4_16a7_return_output);

-- BIN_OP_EQ_uxn_c_l234_c12_72f9
BIN_OP_EQ_uxn_c_l234_c12_72f9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l234_c12_72f9_left,
BIN_OP_EQ_uxn_c_l234_c12_72f9_right,
BIN_OP_EQ_uxn_c_l234_c12_72f9_return_output);

-- color1_MUX_uxn_c_l234_c8_29bc
color1_MUX_uxn_c_l234_c8_29bc : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l234_c8_29bc_cond,
color1_MUX_uxn_c_l234_c8_29bc_iftrue,
color1_MUX_uxn_c_l234_c8_29bc_iffalse,
color1_MUX_uxn_c_l234_c8_29bc_return_output);

-- tmp12_MUX_uxn_c_l234_c8_29bc
tmp12_MUX_uxn_c_l234_c8_29bc : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l234_c8_29bc_cond,
tmp12_MUX_uxn_c_l234_c8_29bc_iftrue,
tmp12_MUX_uxn_c_l234_c8_29bc_iffalse,
tmp12_MUX_uxn_c_l234_c8_29bc_return_output);

-- color2_MUX_uxn_c_l234_c8_29bc
color2_MUX_uxn_c_l234_c8_29bc : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l234_c8_29bc_cond,
color2_MUX_uxn_c_l234_c8_29bc_iftrue,
color2_MUX_uxn_c_l234_c8_29bc_iffalse,
color2_MUX_uxn_c_l234_c8_29bc_return_output);

-- color0_MUX_uxn_c_l234_c8_29bc
color0_MUX_uxn_c_l234_c8_29bc : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l234_c8_29bc_cond,
color0_MUX_uxn_c_l234_c8_29bc_iftrue,
color0_MUX_uxn_c_l234_c8_29bc_iffalse,
color0_MUX_uxn_c_l234_c8_29bc_return_output);

-- color3_MUX_uxn_c_l234_c8_29bc
color3_MUX_uxn_c_l234_c8_29bc : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l234_c8_29bc_cond,
color3_MUX_uxn_c_l234_c8_29bc_iftrue,
color3_MUX_uxn_c_l234_c8_29bc_iffalse,
color3_MUX_uxn_c_l234_c8_29bc_return_output);

-- CONST_SL_8_uxn_c_l236_c4_9763
CONST_SL_8_uxn_c_l236_c4_9763 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l236_c4_9763_x,
CONST_SL_8_uxn_c_l236_c4_9763_return_output);

-- BIN_OP_AND_uxn_c_l237_c4_4608
BIN_OP_AND_uxn_c_l237_c4_4608 : entity work.BIN_OP_AND_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l237_c4_4608_left,
BIN_OP_AND_uxn_c_l237_c4_4608_right,
BIN_OP_AND_uxn_c_l237_c4_4608_return_output);

-- BIN_OP_OR_uxn_c_l238_c4_ffd9
BIN_OP_OR_uxn_c_l238_c4_ffd9 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l238_c4_ffd9_left,
BIN_OP_OR_uxn_c_l238_c4_ffd9_right,
BIN_OP_OR_uxn_c_l238_c4_ffd9_return_output);

-- CONST_SL_8_uxn_c_l241_c4_81ff
CONST_SL_8_uxn_c_l241_c4_81ff : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l241_c4_81ff_x,
CONST_SL_8_uxn_c_l241_c4_81ff_return_output);

-- BIN_OP_AND_uxn_c_l242_c4_1a57
BIN_OP_AND_uxn_c_l242_c4_1a57 : entity work.BIN_OP_AND_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l242_c4_1a57_left,
BIN_OP_AND_uxn_c_l242_c4_1a57_right,
BIN_OP_AND_uxn_c_l242_c4_1a57_return_output);

-- BIN_OP_OR_uxn_c_l243_c4_935d
BIN_OP_OR_uxn_c_l243_c4_935d : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l243_c4_935d_left,
BIN_OP_OR_uxn_c_l243_c4_935d_right,
BIN_OP_OR_uxn_c_l243_c4_935d_return_output);

-- BIN_OP_EQ_uxn_c_l245_c12_0085
BIN_OP_EQ_uxn_c_l245_c12_0085 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l245_c12_0085_left,
BIN_OP_EQ_uxn_c_l245_c12_0085_right,
BIN_OP_EQ_uxn_c_l245_c12_0085_return_output);

-- color1_MUX_uxn_c_l245_c8_73ea
color1_MUX_uxn_c_l245_c8_73ea : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l245_c8_73ea_cond,
color1_MUX_uxn_c_l245_c8_73ea_iftrue,
color1_MUX_uxn_c_l245_c8_73ea_iffalse,
color1_MUX_uxn_c_l245_c8_73ea_return_output);

-- tmp12_MUX_uxn_c_l245_c8_73ea
tmp12_MUX_uxn_c_l245_c8_73ea : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l245_c8_73ea_cond,
tmp12_MUX_uxn_c_l245_c8_73ea_iftrue,
tmp12_MUX_uxn_c_l245_c8_73ea_iffalse,
tmp12_MUX_uxn_c_l245_c8_73ea_return_output);

-- color2_MUX_uxn_c_l245_c8_73ea
color2_MUX_uxn_c_l245_c8_73ea : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l245_c8_73ea_cond,
color2_MUX_uxn_c_l245_c8_73ea_iftrue,
color2_MUX_uxn_c_l245_c8_73ea_iffalse,
color2_MUX_uxn_c_l245_c8_73ea_return_output);

-- color0_MUX_uxn_c_l245_c8_73ea
color0_MUX_uxn_c_l245_c8_73ea : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l245_c8_73ea_cond,
color0_MUX_uxn_c_l245_c8_73ea_iftrue,
color0_MUX_uxn_c_l245_c8_73ea_iffalse,
color0_MUX_uxn_c_l245_c8_73ea_return_output);

-- color3_MUX_uxn_c_l245_c8_73ea
color3_MUX_uxn_c_l245_c8_73ea : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l245_c8_73ea_cond,
color3_MUX_uxn_c_l245_c8_73ea_iftrue,
color3_MUX_uxn_c_l245_c8_73ea_iffalse,
color3_MUX_uxn_c_l245_c8_73ea_return_output);

-- CONST_SL_4_uxn_c_l247_c4_f183
CONST_SL_4_uxn_c_l247_c4_f183 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l247_c4_f183_x,
CONST_SL_4_uxn_c_l247_c4_f183_return_output);

-- BIN_OP_AND_uxn_c_l248_c4_22fc
BIN_OP_AND_uxn_c_l248_c4_22fc : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l248_c4_22fc_left,
BIN_OP_AND_uxn_c_l248_c4_22fc_right,
BIN_OP_AND_uxn_c_l248_c4_22fc_return_output);

-- BIN_OP_OR_uxn_c_l249_c4_a5c2
BIN_OP_OR_uxn_c_l249_c4_a5c2 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l249_c4_a5c2_left,
BIN_OP_OR_uxn_c_l249_c4_a5c2_right,
BIN_OP_OR_uxn_c_l249_c4_a5c2_return_output);

-- CONST_SL_4_uxn_c_l252_c4_91d5
CONST_SL_4_uxn_c_l252_c4_91d5 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l252_c4_91d5_x,
CONST_SL_4_uxn_c_l252_c4_91d5_return_output);

-- BIN_OP_AND_uxn_c_l253_c4_0585
BIN_OP_AND_uxn_c_l253_c4_0585 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l253_c4_0585_left,
BIN_OP_AND_uxn_c_l253_c4_0585_right,
BIN_OP_AND_uxn_c_l253_c4_0585_return_output);

-- BIN_OP_OR_uxn_c_l254_c4_a82b
BIN_OP_OR_uxn_c_l254_c4_a82b : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l254_c4_a82b_left,
BIN_OP_OR_uxn_c_l254_c4_a82b_right,
BIN_OP_OR_uxn_c_l254_c4_a82b_return_output);

-- BIN_OP_EQ_uxn_c_l256_c12_bf05
BIN_OP_EQ_uxn_c_l256_c12_bf05 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l256_c12_bf05_left,
BIN_OP_EQ_uxn_c_l256_c12_bf05_right,
BIN_OP_EQ_uxn_c_l256_c12_bf05_return_output);

-- color1_MUX_uxn_c_l256_c8_7aca
color1_MUX_uxn_c_l256_c8_7aca : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l256_c8_7aca_cond,
color1_MUX_uxn_c_l256_c8_7aca_iftrue,
color1_MUX_uxn_c_l256_c8_7aca_iffalse,
color1_MUX_uxn_c_l256_c8_7aca_return_output);

-- tmp12_MUX_uxn_c_l256_c8_7aca
tmp12_MUX_uxn_c_l256_c8_7aca : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l256_c8_7aca_cond,
tmp12_MUX_uxn_c_l256_c8_7aca_iftrue,
tmp12_MUX_uxn_c_l256_c8_7aca_iffalse,
tmp12_MUX_uxn_c_l256_c8_7aca_return_output);

-- color2_MUX_uxn_c_l256_c8_7aca
color2_MUX_uxn_c_l256_c8_7aca : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l256_c8_7aca_cond,
color2_MUX_uxn_c_l256_c8_7aca_iftrue,
color2_MUX_uxn_c_l256_c8_7aca_iffalse,
color2_MUX_uxn_c_l256_c8_7aca_return_output);

-- color0_MUX_uxn_c_l256_c8_7aca
color0_MUX_uxn_c_l256_c8_7aca : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l256_c8_7aca_cond,
color0_MUX_uxn_c_l256_c8_7aca_iftrue,
color0_MUX_uxn_c_l256_c8_7aca_iffalse,
color0_MUX_uxn_c_l256_c8_7aca_return_output);

-- color3_MUX_uxn_c_l256_c8_7aca
color3_MUX_uxn_c_l256_c8_7aca : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l256_c8_7aca_cond,
color3_MUX_uxn_c_l256_c8_7aca_iftrue,
color3_MUX_uxn_c_l256_c8_7aca_iffalse,
color3_MUX_uxn_c_l256_c8_7aca_return_output);

-- CONST_SL_4_uxn_c_l258_c4_2cee
CONST_SL_4_uxn_c_l258_c4_2cee : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l258_c4_2cee_x,
CONST_SL_4_uxn_c_l258_c4_2cee_return_output);

-- BIN_OP_AND_uxn_c_l259_c4_352e
BIN_OP_AND_uxn_c_l259_c4_352e : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l259_c4_352e_left,
BIN_OP_AND_uxn_c_l259_c4_352e_right,
BIN_OP_AND_uxn_c_l259_c4_352e_return_output);

-- BIN_OP_OR_uxn_c_l260_c4_f4b9
BIN_OP_OR_uxn_c_l260_c4_f4b9 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l260_c4_f4b9_left,
BIN_OP_OR_uxn_c_l260_c4_f4b9_right,
BIN_OP_OR_uxn_c_l260_c4_f4b9_return_output);

-- CONST_SL_4_uxn_c_l263_c4_0107
CONST_SL_4_uxn_c_l263_c4_0107 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l263_c4_0107_x,
CONST_SL_4_uxn_c_l263_c4_0107_return_output);

-- BIN_OP_AND_uxn_c_l264_c4_7b03
BIN_OP_AND_uxn_c_l264_c4_7b03 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l264_c4_7b03_left,
BIN_OP_AND_uxn_c_l264_c4_7b03_right,
BIN_OP_AND_uxn_c_l264_c4_7b03_return_output);

-- BIN_OP_OR_uxn_c_l265_c4_ce9f
BIN_OP_OR_uxn_c_l265_c4_ce9f : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l265_c4_ce9f_left,
BIN_OP_OR_uxn_c_l265_c4_ce9f_right,
BIN_OP_OR_uxn_c_l265_c4_ce9f_return_output);

-- BIN_OP_EQ_uxn_c_l267_c12_aecc
BIN_OP_EQ_uxn_c_l267_c12_aecc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l267_c12_aecc_left,
BIN_OP_EQ_uxn_c_l267_c12_aecc_right,
BIN_OP_EQ_uxn_c_l267_c12_aecc_return_output);

-- color1_MUX_uxn_c_l267_c8_3366
color1_MUX_uxn_c_l267_c8_3366 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l267_c8_3366_cond,
color1_MUX_uxn_c_l267_c8_3366_iftrue,
color1_MUX_uxn_c_l267_c8_3366_iffalse,
color1_MUX_uxn_c_l267_c8_3366_return_output);

-- tmp12_MUX_uxn_c_l267_c8_3366
tmp12_MUX_uxn_c_l267_c8_3366 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l267_c8_3366_cond,
tmp12_MUX_uxn_c_l267_c8_3366_iftrue,
tmp12_MUX_uxn_c_l267_c8_3366_iffalse,
tmp12_MUX_uxn_c_l267_c8_3366_return_output);

-- color2_MUX_uxn_c_l267_c8_3366
color2_MUX_uxn_c_l267_c8_3366 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l267_c8_3366_cond,
color2_MUX_uxn_c_l267_c8_3366_iftrue,
color2_MUX_uxn_c_l267_c8_3366_iffalse,
color2_MUX_uxn_c_l267_c8_3366_return_output);

-- color0_MUX_uxn_c_l267_c8_3366
color0_MUX_uxn_c_l267_c8_3366 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l267_c8_3366_cond,
color0_MUX_uxn_c_l267_c8_3366_iftrue,
color0_MUX_uxn_c_l267_c8_3366_iffalse,
color0_MUX_uxn_c_l267_c8_3366_return_output);

-- color3_MUX_uxn_c_l267_c8_3366
color3_MUX_uxn_c_l267_c8_3366 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l267_c8_3366_cond,
color3_MUX_uxn_c_l267_c8_3366_iftrue,
color3_MUX_uxn_c_l267_c8_3366_iffalse,
color3_MUX_uxn_c_l267_c8_3366_return_output);

-- BIN_OP_AND_uxn_c_l269_c4_4e1a
BIN_OP_AND_uxn_c_l269_c4_4e1a : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l269_c4_4e1a_left,
BIN_OP_AND_uxn_c_l269_c4_4e1a_right,
BIN_OP_AND_uxn_c_l269_c4_4e1a_return_output);

-- BIN_OP_OR_uxn_c_l270_c4_8250
BIN_OP_OR_uxn_c_l270_c4_8250 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l270_c4_8250_left,
BIN_OP_OR_uxn_c_l270_c4_8250_right,
BIN_OP_OR_uxn_c_l270_c4_8250_return_output);

-- BIN_OP_AND_uxn_c_l273_c4_5468
BIN_OP_AND_uxn_c_l273_c4_5468 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l273_c4_5468_left,
BIN_OP_AND_uxn_c_l273_c4_5468_right,
BIN_OP_AND_uxn_c_l273_c4_5468_return_output);

-- BIN_OP_OR_uxn_c_l274_c4_bf56
BIN_OP_OR_uxn_c_l274_c4_bf56 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l274_c4_bf56_left,
BIN_OP_OR_uxn_c_l274_c4_bf56_right,
BIN_OP_OR_uxn_c_l274_c4_bf56_return_output);

-- BIN_OP_EQ_uxn_c_l276_c12_ed55
BIN_OP_EQ_uxn_c_l276_c12_ed55 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l276_c12_ed55_left,
BIN_OP_EQ_uxn_c_l276_c12_ed55_right,
BIN_OP_EQ_uxn_c_l276_c12_ed55_return_output);

-- tmp12_MUX_uxn_c_l276_c8_fd2a
tmp12_MUX_uxn_c_l276_c8_fd2a : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_c_l276_c8_fd2a_cond,
tmp12_MUX_uxn_c_l276_c8_fd2a_iftrue,
tmp12_MUX_uxn_c_l276_c8_fd2a_iffalse,
tmp12_MUX_uxn_c_l276_c8_fd2a_return_output);

-- color2_MUX_uxn_c_l276_c8_fd2a
color2_MUX_uxn_c_l276_c8_fd2a : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l276_c8_fd2a_cond,
color2_MUX_uxn_c_l276_c8_fd2a_iftrue,
color2_MUX_uxn_c_l276_c8_fd2a_iffalse,
color2_MUX_uxn_c_l276_c8_fd2a_return_output);

-- color3_MUX_uxn_c_l276_c8_fd2a
color3_MUX_uxn_c_l276_c8_fd2a : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l276_c8_fd2a_cond,
color3_MUX_uxn_c_l276_c8_fd2a_iftrue,
color3_MUX_uxn_c_l276_c8_fd2a_iffalse,
color3_MUX_uxn_c_l276_c8_fd2a_return_output);

-- BIN_OP_AND_uxn_c_l278_c4_9c30
BIN_OP_AND_uxn_c_l278_c4_9c30 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l278_c4_9c30_left,
BIN_OP_AND_uxn_c_l278_c4_9c30_right,
BIN_OP_AND_uxn_c_l278_c4_9c30_return_output);

-- BIN_OP_OR_uxn_c_l279_c4_ce95
BIN_OP_OR_uxn_c_l279_c4_ce95 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l279_c4_ce95_left,
BIN_OP_OR_uxn_c_l279_c4_ce95_right,
BIN_OP_OR_uxn_c_l279_c4_ce95_return_output);

-- BIN_OP_AND_uxn_c_l282_c4_cd2c
BIN_OP_AND_uxn_c_l282_c4_cd2c : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l282_c4_cd2c_left,
BIN_OP_AND_uxn_c_l282_c4_cd2c_right,
BIN_OP_AND_uxn_c_l282_c4_cd2c_return_output);

-- BIN_OP_OR_uxn_c_l283_c4_b481
BIN_OP_OR_uxn_c_l283_c4_b481 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l283_c4_b481_left,
BIN_OP_OR_uxn_c_l283_c4_b481_right,
BIN_OP_OR_uxn_c_l283_c4_b481_return_output);

-- BIN_OP_EQ_uxn_c_l287_c6_a1c6
BIN_OP_EQ_uxn_c_l287_c6_a1c6 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l287_c6_a1c6_left,
BIN_OP_EQ_uxn_c_l287_c6_a1c6_right,
BIN_OP_EQ_uxn_c_l287_c6_a1c6_return_output);

-- result_MUX_uxn_c_l287_c2_06ba
result_MUX_uxn_c_l287_c2_06ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l287_c2_06ba_cond,
result_MUX_uxn_c_l287_c2_06ba_iftrue,
result_MUX_uxn_c_l287_c2_06ba_iffalse,
result_MUX_uxn_c_l287_c2_06ba_return_output);

-- BIN_OP_EQ_uxn_c_l289_c13_66e2
BIN_OP_EQ_uxn_c_l289_c13_66e2 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l289_c13_66e2_left,
BIN_OP_EQ_uxn_c_l289_c13_66e2_right,
BIN_OP_EQ_uxn_c_l289_c13_66e2_return_output);

-- result_MUX_uxn_c_l289_c9_a421
result_MUX_uxn_c_l289_c9_a421 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l289_c9_a421_cond,
result_MUX_uxn_c_l289_c9_a421_iftrue,
result_MUX_uxn_c_l289_c9_a421_iffalse,
result_MUX_uxn_c_l289_c9_a421_return_output);

-- BIN_OP_EQ_uxn_c_l291_c13_c24f
BIN_OP_EQ_uxn_c_l291_c13_c24f : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l291_c13_c24f_left,
BIN_OP_EQ_uxn_c_l291_c13_c24f_right,
BIN_OP_EQ_uxn_c_l291_c13_c24f_return_output);

-- result_MUX_uxn_c_l291_c9_1bcc
result_MUX_uxn_c_l291_c9_1bcc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l291_c9_1bcc_cond,
result_MUX_uxn_c_l291_c9_1bcc_iftrue,
result_MUX_uxn_c_l291_c9_1bcc_iffalse,
result_MUX_uxn_c_l291_c9_1bcc_return_output);



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
 color_cmp_1_MUX_uxn_c_l220_c2_6be9_return_output,
 color1_MUX_uxn_c_l220_c2_6be9_return_output,
 tmp12_MUX_uxn_c_l220_c2_6be9_return_output,
 color2_MUX_uxn_c_l220_c2_6be9_return_output,
 color0_MUX_uxn_c_l220_c2_6be9_return_output,
 color_cmp_0_MUX_uxn_c_l220_c2_6be9_return_output,
 color3_MUX_uxn_c_l220_c2_6be9_return_output,
 CONST_SR_4_uxn_c_l221_c27_9bff_return_output,
 BIN_OP_EQ_uxn_c_l223_c7_0916_return_output,
 color1_MUX_uxn_c_l223_c3_35dd_return_output,
 tmp12_MUX_uxn_c_l223_c3_35dd_return_output,
 color2_MUX_uxn_c_l223_c3_35dd_return_output,
 color0_MUX_uxn_c_l223_c3_35dd_return_output,
 color3_MUX_uxn_c_l223_c3_35dd_return_output,
 CONST_SL_8_uxn_c_l225_c4_c82f_return_output,
 BIN_OP_AND_uxn_c_l226_c4_4269_return_output,
 BIN_OP_OR_uxn_c_l227_c4_f3cf_return_output,
 CONST_SL_8_uxn_c_l230_c4_5405_return_output,
 BIN_OP_AND_uxn_c_l231_c4_0a5f_return_output,
 BIN_OP_OR_uxn_c_l232_c4_16a7_return_output,
 BIN_OP_EQ_uxn_c_l234_c12_72f9_return_output,
 color1_MUX_uxn_c_l234_c8_29bc_return_output,
 tmp12_MUX_uxn_c_l234_c8_29bc_return_output,
 color2_MUX_uxn_c_l234_c8_29bc_return_output,
 color0_MUX_uxn_c_l234_c8_29bc_return_output,
 color3_MUX_uxn_c_l234_c8_29bc_return_output,
 CONST_SL_8_uxn_c_l236_c4_9763_return_output,
 BIN_OP_AND_uxn_c_l237_c4_4608_return_output,
 BIN_OP_OR_uxn_c_l238_c4_ffd9_return_output,
 CONST_SL_8_uxn_c_l241_c4_81ff_return_output,
 BIN_OP_AND_uxn_c_l242_c4_1a57_return_output,
 BIN_OP_OR_uxn_c_l243_c4_935d_return_output,
 BIN_OP_EQ_uxn_c_l245_c12_0085_return_output,
 color1_MUX_uxn_c_l245_c8_73ea_return_output,
 tmp12_MUX_uxn_c_l245_c8_73ea_return_output,
 color2_MUX_uxn_c_l245_c8_73ea_return_output,
 color0_MUX_uxn_c_l245_c8_73ea_return_output,
 color3_MUX_uxn_c_l245_c8_73ea_return_output,
 CONST_SL_4_uxn_c_l247_c4_f183_return_output,
 BIN_OP_AND_uxn_c_l248_c4_22fc_return_output,
 BIN_OP_OR_uxn_c_l249_c4_a5c2_return_output,
 CONST_SL_4_uxn_c_l252_c4_91d5_return_output,
 BIN_OP_AND_uxn_c_l253_c4_0585_return_output,
 BIN_OP_OR_uxn_c_l254_c4_a82b_return_output,
 BIN_OP_EQ_uxn_c_l256_c12_bf05_return_output,
 color1_MUX_uxn_c_l256_c8_7aca_return_output,
 tmp12_MUX_uxn_c_l256_c8_7aca_return_output,
 color2_MUX_uxn_c_l256_c8_7aca_return_output,
 color0_MUX_uxn_c_l256_c8_7aca_return_output,
 color3_MUX_uxn_c_l256_c8_7aca_return_output,
 CONST_SL_4_uxn_c_l258_c4_2cee_return_output,
 BIN_OP_AND_uxn_c_l259_c4_352e_return_output,
 BIN_OP_OR_uxn_c_l260_c4_f4b9_return_output,
 CONST_SL_4_uxn_c_l263_c4_0107_return_output,
 BIN_OP_AND_uxn_c_l264_c4_7b03_return_output,
 BIN_OP_OR_uxn_c_l265_c4_ce9f_return_output,
 BIN_OP_EQ_uxn_c_l267_c12_aecc_return_output,
 color1_MUX_uxn_c_l267_c8_3366_return_output,
 tmp12_MUX_uxn_c_l267_c8_3366_return_output,
 color2_MUX_uxn_c_l267_c8_3366_return_output,
 color0_MUX_uxn_c_l267_c8_3366_return_output,
 color3_MUX_uxn_c_l267_c8_3366_return_output,
 BIN_OP_AND_uxn_c_l269_c4_4e1a_return_output,
 BIN_OP_OR_uxn_c_l270_c4_8250_return_output,
 BIN_OP_AND_uxn_c_l273_c4_5468_return_output,
 BIN_OP_OR_uxn_c_l274_c4_bf56_return_output,
 BIN_OP_EQ_uxn_c_l276_c12_ed55_return_output,
 tmp12_MUX_uxn_c_l276_c8_fd2a_return_output,
 color2_MUX_uxn_c_l276_c8_fd2a_return_output,
 color3_MUX_uxn_c_l276_c8_fd2a_return_output,
 BIN_OP_AND_uxn_c_l278_c4_9c30_return_output,
 BIN_OP_OR_uxn_c_l279_c4_ce95_return_output,
 BIN_OP_AND_uxn_c_l282_c4_cd2c_return_output,
 BIN_OP_OR_uxn_c_l283_c4_b481_return_output,
 BIN_OP_EQ_uxn_c_l287_c6_a1c6_return_output,
 result_MUX_uxn_c_l287_c2_06ba_return_output,
 BIN_OP_EQ_uxn_c_l289_c13_66e2_return_output,
 result_MUX_uxn_c_l289_c9_a421_return_output,
 BIN_OP_EQ_uxn_c_l291_c13_c24f_return_output,
 result_MUX_uxn_c_l291_c9_1bcc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_gpu_step_color : unsigned(1 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l220_c2_6be9_iftrue : unsigned(3 downto 0);
 variable VAR_color_cmp_1_uxn_c_l222_c3_53bc : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l220_c2_6be9_iffalse : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l220_c2_6be9_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_1_MUX_uxn_c_l220_c2_6be9_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l220_c2_6be9_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l223_c3_35dd_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l220_c2_6be9_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l220_c2_6be9_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l220_c2_6be9_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l220_c2_6be9_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l223_c3_35dd_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l220_c2_6be9_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l220_c2_6be9_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l220_c2_6be9_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l220_c2_6be9_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l223_c3_35dd_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l220_c2_6be9_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l220_c2_6be9_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l220_c2_6be9_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l220_c2_6be9_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l223_c3_35dd_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l220_c2_6be9_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l220_c2_6be9_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l220_c2_6be9_cond : unsigned(0 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l220_c2_6be9_iftrue : unsigned(3 downto 0);
 variable VAR_color_cmp_0_uxn_c_l221_c3_a6a2 : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l220_c2_6be9_iffalse : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l220_c2_6be9_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_0_MUX_uxn_c_l220_c2_6be9_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l220_c2_6be9_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l223_c3_35dd_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l220_c2_6be9_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l220_c2_6be9_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l220_c2_6be9_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l221_c27_9bff_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l221_c27_9bff_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l221_c17_91b7_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l222_c17_198c_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l223_c7_0916_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l223_c7_0916_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l223_c7_0916_return_output : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l223_c3_35dd_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l223_c3_35dd_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l234_c8_29bc_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l223_c3_35dd_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l223_c3_35dd_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l223_c3_35dd_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l234_c8_29bc_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l223_c3_35dd_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l223_c3_35dd_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l223_c3_35dd_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l234_c8_29bc_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l223_c3_35dd_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l223_c3_35dd_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l223_c3_35dd_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l234_c8_29bc_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l223_c3_35dd_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l223_c3_35dd_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l223_c3_35dd_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l234_c8_29bc_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l223_c3_35dd_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l224_c4_fc3a : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l225_c4_c82f_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l225_c4_c82f_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l226_c4_4269_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l226_c4_4269_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l226_c4_4269_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l227_c4_f3cf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l227_c4_f3cf_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l227_c4_f3cf_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l229_c4_218b : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l230_c4_5405_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l230_c4_5405_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l231_c4_0a5f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l231_c4_0a5f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l231_c4_0a5f_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l232_c4_16a7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l232_c4_16a7_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l232_c4_16a7_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l234_c12_72f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l234_c12_72f9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l234_c12_72f9_return_output : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l234_c8_29bc_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l234_c8_29bc_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l245_c8_73ea_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l234_c8_29bc_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l234_c8_29bc_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l234_c8_29bc_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l245_c8_73ea_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l234_c8_29bc_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l234_c8_29bc_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l234_c8_29bc_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l245_c8_73ea_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l234_c8_29bc_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l234_c8_29bc_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l234_c8_29bc_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l245_c8_73ea_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l234_c8_29bc_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l234_c8_29bc_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l234_c8_29bc_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l245_c8_73ea_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l234_c8_29bc_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l235_c4_3f0d : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l236_c4_9763_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l236_c4_9763_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l237_c4_4608_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l237_c4_4608_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l237_c4_4608_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l238_c4_ffd9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l238_c4_ffd9_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l238_c4_ffd9_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l240_c4_4717 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l241_c4_81ff_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l241_c4_81ff_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l242_c4_1a57_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l242_c4_1a57_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l242_c4_1a57_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l243_c4_935d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l243_c4_935d_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l243_c4_935d_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l245_c12_0085_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l245_c12_0085_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l245_c12_0085_return_output : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l245_c8_73ea_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l245_c8_73ea_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l256_c8_7aca_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l245_c8_73ea_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l245_c8_73ea_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l245_c8_73ea_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l256_c8_7aca_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l245_c8_73ea_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l245_c8_73ea_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l245_c8_73ea_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l256_c8_7aca_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l245_c8_73ea_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l245_c8_73ea_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l245_c8_73ea_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l256_c8_7aca_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l245_c8_73ea_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l245_c8_73ea_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l245_c8_73ea_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l256_c8_7aca_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l245_c8_73ea_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l246_c4_0f94 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l247_c4_f183_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l247_c4_f183_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l248_c4_22fc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l248_c4_22fc_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l248_c4_22fc_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l249_c4_a5c2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l249_c4_a5c2_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l249_c4_a5c2_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l251_c4_1074 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l252_c4_91d5_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l252_c4_91d5_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l253_c4_0585_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l253_c4_0585_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l253_c4_0585_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l254_c4_a82b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l254_c4_a82b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l254_c4_a82b_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l256_c12_bf05_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l256_c12_bf05_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l256_c12_bf05_return_output : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l256_c8_7aca_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l256_c8_7aca_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l267_c8_3366_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l256_c8_7aca_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l256_c8_7aca_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l256_c8_7aca_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l267_c8_3366_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l256_c8_7aca_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l256_c8_7aca_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l256_c8_7aca_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l267_c8_3366_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l256_c8_7aca_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l256_c8_7aca_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l256_c8_7aca_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l267_c8_3366_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l256_c8_7aca_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l256_c8_7aca_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l256_c8_7aca_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l267_c8_3366_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l256_c8_7aca_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l257_c4_8598 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l258_c4_2cee_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l258_c4_2cee_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l259_c4_352e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l259_c4_352e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l259_c4_352e_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l260_c4_f4b9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l260_c4_f4b9_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l260_c4_f4b9_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l262_c4_3fd7 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l263_c4_0107_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l263_c4_0107_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l264_c4_7b03_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l264_c4_7b03_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l264_c4_7b03_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l265_c4_ce9f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l265_c4_ce9f_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l265_c4_ce9f_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l267_c12_aecc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l267_c12_aecc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l267_c12_aecc_return_output : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l267_c8_3366_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l267_c8_3366_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l267_c8_3366_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l267_c8_3366_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l267_c8_3366_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l276_c8_fd2a_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l267_c8_3366_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l267_c8_3366_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l267_c8_3366_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l276_c8_fd2a_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l267_c8_3366_cond : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l267_c8_3366_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l267_c8_3366_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l267_c8_3366_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l267_c8_3366_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l267_c8_3366_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l276_c8_fd2a_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l267_c8_3366_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l269_c4_4e1a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l269_c4_4e1a_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l269_c4_4e1a_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l270_c4_8250_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l270_c4_8250_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l270_c4_8250_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l273_c4_5468_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l273_c4_5468_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l273_c4_5468_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l274_c4_bf56_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l274_c4_bf56_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l274_c4_bf56_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l276_c12_ed55_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l276_c12_ed55_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l276_c12_ed55_return_output : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l276_c8_fd2a_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l276_c8_fd2a_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_c_l276_c8_fd2a_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l276_c8_fd2a_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l276_c8_fd2a_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l276_c8_fd2a_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l276_c8_fd2a_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l276_c8_fd2a_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l276_c8_fd2a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l278_c4_9c30_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l278_c4_9c30_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l278_c4_9c30_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l279_c4_ce95_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l279_c4_ce95_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l279_c4_ce95_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l282_c4_cd2c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l282_c4_cd2c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l282_c4_cd2c_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l283_c4_b481_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l283_c4_b481_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l283_c4_b481_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l287_c6_a1c6_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l287_c6_a1c6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l287_c6_a1c6_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l287_c2_06ba_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l288_c3_29aa : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l287_c2_06ba_iffalse : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l289_c9_a421_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l287_c2_06ba_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l287_c2_06ba_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l289_c13_66e2_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l289_c13_66e2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l289_c13_66e2_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l289_c9_a421_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l290_c3_3436 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l289_c9_a421_iffalse : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l291_c9_1bcc_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l289_c9_a421_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l291_c13_c24f_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l291_c13_c24f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l291_c13_c24f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l291_c9_1bcc_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l292_c3_7f62 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l291_c9_1bcc_iffalse : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l294_c3_cb45 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l291_c9_1bcc_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l277_l268_DUPLICATE_1348_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l281_l272_DUPLICATE_962c_return_output : unsigned(11 downto 0);
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
     VAR_BIN_OP_AND_uxn_c_l253_c4_0585_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l245_c12_0085_right := to_unsigned(10, 4);
     VAR_BIN_OP_AND_uxn_c_l264_c4_7b03_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l278_c4_9c30_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l276_c12_ed55_right := to_unsigned(13, 4);
     VAR_BIN_OP_AND_uxn_c_l231_c4_0a5f_right := to_unsigned(255, 8);
     VAR_BIN_OP_AND_uxn_c_l273_c4_5468_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l289_c13_66e2_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l256_c12_bf05_right := to_unsigned(11, 4);
     VAR_BIN_OP_AND_uxn_c_l248_c4_22fc_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l223_c7_0916_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_c_l287_c6_a1c6_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l267_c12_aecc_right := to_unsigned(12, 4);
     VAR_BIN_OP_AND_uxn_c_l226_c4_4269_right := to_unsigned(255, 8);
     VAR_BIN_OP_AND_uxn_c_l242_c4_1a57_right := to_unsigned(255, 8);
     VAR_BIN_OP_AND_uxn_c_l259_c4_352e_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l291_c13_c24f_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_c_l234_c12_72f9_right := to_unsigned(9, 4);
     VAR_BIN_OP_AND_uxn_c_l237_c4_4608_right := to_unsigned(255, 8);
     VAR_BIN_OP_AND_uxn_c_l269_c4_4e1a_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l282_c4_cd2c_right := to_unsigned(4080, 12);

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
     VAR_BIN_OP_AND_uxn_c_l226_c4_4269_left := color0;
     VAR_BIN_OP_AND_uxn_c_l248_c4_22fc_left := color0;
     VAR_BIN_OP_AND_uxn_c_l269_c4_4e1a_left := color0;
     VAR_color0_MUX_uxn_c_l220_c2_6be9_iffalse := color0;
     VAR_color0_MUX_uxn_c_l234_c8_29bc_iftrue := color0;
     VAR_color0_MUX_uxn_c_l256_c8_7aca_iftrue := color0;
     VAR_color0_MUX_uxn_c_l267_c8_3366_iffalse := color0;
     VAR_BIN_OP_AND_uxn_c_l231_c4_0a5f_left := color1;
     VAR_BIN_OP_AND_uxn_c_l253_c4_0585_left := color1;
     VAR_BIN_OP_AND_uxn_c_l273_c4_5468_left := color1;
     VAR_color1_MUX_uxn_c_l220_c2_6be9_iffalse := color1;
     VAR_color1_MUX_uxn_c_l234_c8_29bc_iftrue := color1;
     VAR_color1_MUX_uxn_c_l256_c8_7aca_iftrue := color1;
     VAR_color1_MUX_uxn_c_l267_c8_3366_iffalse := color1;
     VAR_BIN_OP_AND_uxn_c_l237_c4_4608_left := color2;
     VAR_BIN_OP_AND_uxn_c_l259_c4_352e_left := color2;
     VAR_BIN_OP_AND_uxn_c_l278_c4_9c30_left := color2;
     VAR_color2_MUX_uxn_c_l220_c2_6be9_iffalse := color2;
     VAR_color2_MUX_uxn_c_l223_c3_35dd_iftrue := color2;
     VAR_color2_MUX_uxn_c_l245_c8_73ea_iftrue := color2;
     VAR_color2_MUX_uxn_c_l267_c8_3366_iftrue := color2;
     VAR_color2_MUX_uxn_c_l276_c8_fd2a_iffalse := color2;
     VAR_BIN_OP_AND_uxn_c_l242_c4_1a57_left := color3;
     VAR_BIN_OP_AND_uxn_c_l264_c4_7b03_left := color3;
     VAR_BIN_OP_AND_uxn_c_l282_c4_cd2c_left := color3;
     VAR_color3_MUX_uxn_c_l220_c2_6be9_iffalse := color3;
     VAR_color3_MUX_uxn_c_l223_c3_35dd_iftrue := color3;
     VAR_color3_MUX_uxn_c_l245_c8_73ea_iftrue := color3;
     VAR_color3_MUX_uxn_c_l267_c8_3366_iftrue := color3;
     VAR_color3_MUX_uxn_c_l276_c8_fd2a_iffalse := color3;
     VAR_color_cmp_0_MUX_uxn_c_l220_c2_6be9_iffalse := color_cmp_0;
     VAR_color_cmp_1_MUX_uxn_c_l220_c2_6be9_iffalse := color_cmp_1;
     VAR_BIN_OP_EQ_uxn_c_l223_c7_0916_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l234_c12_72f9_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l245_c12_0085_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l256_c12_bf05_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l267_c12_aecc_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l276_c12_ed55_left := VAR_device_ram_address;
     VAR_CONST_SR_4_uxn_c_l221_c27_9bff_x := VAR_device_ram_value;
     VAR_BIN_OP_EQ_uxn_c_l287_c6_a1c6_left := VAR_gpu_step_color;
     VAR_BIN_OP_EQ_uxn_c_l289_c13_66e2_left := VAR_gpu_step_color;
     VAR_BIN_OP_EQ_uxn_c_l291_c13_c24f_left := VAR_gpu_step_color;
     VAR_color0_MUX_uxn_c_l220_c2_6be9_cond := VAR_is_device_ram_write;
     VAR_color1_MUX_uxn_c_l220_c2_6be9_cond := VAR_is_device_ram_write;
     VAR_color2_MUX_uxn_c_l220_c2_6be9_cond := VAR_is_device_ram_write;
     VAR_color3_MUX_uxn_c_l220_c2_6be9_cond := VAR_is_device_ram_write;
     VAR_color_cmp_0_MUX_uxn_c_l220_c2_6be9_cond := VAR_is_device_ram_write;
     VAR_color_cmp_1_MUX_uxn_c_l220_c2_6be9_cond := VAR_is_device_ram_write;
     VAR_tmp12_MUX_uxn_c_l220_c2_6be9_cond := VAR_is_device_ram_write;
     VAR_tmp12_MUX_uxn_c_l220_c2_6be9_iffalse := tmp12;
     VAR_tmp12_MUX_uxn_c_l276_c8_fd2a_iffalse := tmp12;
     -- CONST_SR_4[uxn_c_l221_c27_9bff] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l221_c27_9bff_x <= VAR_CONST_SR_4_uxn_c_l221_c27_9bff_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l221_c27_9bff_return_output := CONST_SR_4_uxn_c_l221_c27_9bff_return_output;

     -- BIN_OP_AND[uxn_c_l282_c4_cd2c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l282_c4_cd2c_left <= VAR_BIN_OP_AND_uxn_c_l282_c4_cd2c_left;
     BIN_OP_AND_uxn_c_l282_c4_cd2c_right <= VAR_BIN_OP_AND_uxn_c_l282_c4_cd2c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l282_c4_cd2c_return_output := BIN_OP_AND_uxn_c_l282_c4_cd2c_return_output;

     -- BIN_OP_AND[uxn_c_l273_c4_5468] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l273_c4_5468_left <= VAR_BIN_OP_AND_uxn_c_l273_c4_5468_left;
     BIN_OP_AND_uxn_c_l273_c4_5468_right <= VAR_BIN_OP_AND_uxn_c_l273_c4_5468_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l273_c4_5468_return_output := BIN_OP_AND_uxn_c_l273_c4_5468_return_output;

     -- BIN_OP_AND[uxn_c_l253_c4_0585] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l253_c4_0585_left <= VAR_BIN_OP_AND_uxn_c_l253_c4_0585_left;
     BIN_OP_AND_uxn_c_l253_c4_0585_right <= VAR_BIN_OP_AND_uxn_c_l253_c4_0585_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l253_c4_0585_return_output := BIN_OP_AND_uxn_c_l253_c4_0585_return_output;

     -- BIN_OP_AND[uxn_c_l226_c4_4269] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l226_c4_4269_left <= VAR_BIN_OP_AND_uxn_c_l226_c4_4269_left;
     BIN_OP_AND_uxn_c_l226_c4_4269_right <= VAR_BIN_OP_AND_uxn_c_l226_c4_4269_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l226_c4_4269_return_output := BIN_OP_AND_uxn_c_l226_c4_4269_return_output;

     -- CAST_TO_uint4_t[uxn_c_l222_c17_198c] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l222_c17_198c_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_value);

     -- BIN_OP_EQ[uxn_c_l291_c13_c24f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l291_c13_c24f_left <= VAR_BIN_OP_EQ_uxn_c_l291_c13_c24f_left;
     BIN_OP_EQ_uxn_c_l291_c13_c24f_right <= VAR_BIN_OP_EQ_uxn_c_l291_c13_c24f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l291_c13_c24f_return_output := BIN_OP_EQ_uxn_c_l291_c13_c24f_return_output;

     -- BIN_OP_AND[uxn_c_l259_c4_352e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l259_c4_352e_left <= VAR_BIN_OP_AND_uxn_c_l259_c4_352e_left;
     BIN_OP_AND_uxn_c_l259_c4_352e_right <= VAR_BIN_OP_AND_uxn_c_l259_c4_352e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l259_c4_352e_return_output := BIN_OP_AND_uxn_c_l259_c4_352e_return_output;

     -- BIN_OP_AND[uxn_c_l269_c4_4e1a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l269_c4_4e1a_left <= VAR_BIN_OP_AND_uxn_c_l269_c4_4e1a_left;
     BIN_OP_AND_uxn_c_l269_c4_4e1a_right <= VAR_BIN_OP_AND_uxn_c_l269_c4_4e1a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l269_c4_4e1a_return_output := BIN_OP_AND_uxn_c_l269_c4_4e1a_return_output;

     -- BIN_OP_EQ[uxn_c_l245_c12_0085] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l245_c12_0085_left <= VAR_BIN_OP_EQ_uxn_c_l245_c12_0085_left;
     BIN_OP_EQ_uxn_c_l245_c12_0085_right <= VAR_BIN_OP_EQ_uxn_c_l245_c12_0085_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l245_c12_0085_return_output := BIN_OP_EQ_uxn_c_l245_c12_0085_return_output;

     -- BIN_OP_EQ[uxn_c_l287_c6_a1c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l287_c6_a1c6_left <= VAR_BIN_OP_EQ_uxn_c_l287_c6_a1c6_left;
     BIN_OP_EQ_uxn_c_l287_c6_a1c6_right <= VAR_BIN_OP_EQ_uxn_c_l287_c6_a1c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l287_c6_a1c6_return_output := BIN_OP_EQ_uxn_c_l287_c6_a1c6_return_output;

     -- BIN_OP_EQ[uxn_c_l276_c12_ed55] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l276_c12_ed55_left <= VAR_BIN_OP_EQ_uxn_c_l276_c12_ed55_left;
     BIN_OP_EQ_uxn_c_l276_c12_ed55_right <= VAR_BIN_OP_EQ_uxn_c_l276_c12_ed55_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l276_c12_ed55_return_output := BIN_OP_EQ_uxn_c_l276_c12_ed55_return_output;

     -- BIN_OP_EQ[uxn_c_l267_c12_aecc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l267_c12_aecc_left <= VAR_BIN_OP_EQ_uxn_c_l267_c12_aecc_left;
     BIN_OP_EQ_uxn_c_l267_c12_aecc_right <= VAR_BIN_OP_EQ_uxn_c_l267_c12_aecc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l267_c12_aecc_return_output := BIN_OP_EQ_uxn_c_l267_c12_aecc_return_output;

     -- BIN_OP_AND[uxn_c_l264_c4_7b03] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l264_c4_7b03_left <= VAR_BIN_OP_AND_uxn_c_l264_c4_7b03_left;
     BIN_OP_AND_uxn_c_l264_c4_7b03_right <= VAR_BIN_OP_AND_uxn_c_l264_c4_7b03_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l264_c4_7b03_return_output := BIN_OP_AND_uxn_c_l264_c4_7b03_return_output;

     -- BIN_OP_AND[uxn_c_l242_c4_1a57] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l242_c4_1a57_left <= VAR_BIN_OP_AND_uxn_c_l242_c4_1a57_left;
     BIN_OP_AND_uxn_c_l242_c4_1a57_right <= VAR_BIN_OP_AND_uxn_c_l242_c4_1a57_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l242_c4_1a57_return_output := BIN_OP_AND_uxn_c_l242_c4_1a57_return_output;

     -- BIN_OP_EQ[uxn_c_l256_c12_bf05] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l256_c12_bf05_left <= VAR_BIN_OP_EQ_uxn_c_l256_c12_bf05_left;
     BIN_OP_EQ_uxn_c_l256_c12_bf05_right <= VAR_BIN_OP_EQ_uxn_c_l256_c12_bf05_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l256_c12_bf05_return_output := BIN_OP_EQ_uxn_c_l256_c12_bf05_return_output;

     -- BIN_OP_AND[uxn_c_l278_c4_9c30] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l278_c4_9c30_left <= VAR_BIN_OP_AND_uxn_c_l278_c4_9c30_left;
     BIN_OP_AND_uxn_c_l278_c4_9c30_right <= VAR_BIN_OP_AND_uxn_c_l278_c4_9c30_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l278_c4_9c30_return_output := BIN_OP_AND_uxn_c_l278_c4_9c30_return_output;

     -- BIN_OP_EQ[uxn_c_l234_c12_72f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l234_c12_72f9_left <= VAR_BIN_OP_EQ_uxn_c_l234_c12_72f9_left;
     BIN_OP_EQ_uxn_c_l234_c12_72f9_right <= VAR_BIN_OP_EQ_uxn_c_l234_c12_72f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l234_c12_72f9_return_output := BIN_OP_EQ_uxn_c_l234_c12_72f9_return_output;

     -- BIN_OP_EQ[uxn_c_l223_c7_0916] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l223_c7_0916_left <= VAR_BIN_OP_EQ_uxn_c_l223_c7_0916_left;
     BIN_OP_EQ_uxn_c_l223_c7_0916_right <= VAR_BIN_OP_EQ_uxn_c_l223_c7_0916_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l223_c7_0916_return_output := BIN_OP_EQ_uxn_c_l223_c7_0916_return_output;

     -- BIN_OP_AND[uxn_c_l237_c4_4608] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l237_c4_4608_left <= VAR_BIN_OP_AND_uxn_c_l237_c4_4608_left;
     BIN_OP_AND_uxn_c_l237_c4_4608_right <= VAR_BIN_OP_AND_uxn_c_l237_c4_4608_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l237_c4_4608_return_output := BIN_OP_AND_uxn_c_l237_c4_4608_return_output;

     -- BIN_OP_AND[uxn_c_l248_c4_22fc] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l248_c4_22fc_left <= VAR_BIN_OP_AND_uxn_c_l248_c4_22fc_left;
     BIN_OP_AND_uxn_c_l248_c4_22fc_right <= VAR_BIN_OP_AND_uxn_c_l248_c4_22fc_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l248_c4_22fc_return_output := BIN_OP_AND_uxn_c_l248_c4_22fc_return_output;

     -- BIN_OP_EQ[uxn_c_l289_c13_66e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l289_c13_66e2_left <= VAR_BIN_OP_EQ_uxn_c_l289_c13_66e2_left;
     BIN_OP_EQ_uxn_c_l289_c13_66e2_right <= VAR_BIN_OP_EQ_uxn_c_l289_c13_66e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l289_c13_66e2_return_output := BIN_OP_EQ_uxn_c_l289_c13_66e2_return_output;

     -- BIN_OP_AND[uxn_c_l231_c4_0a5f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l231_c4_0a5f_left <= VAR_BIN_OP_AND_uxn_c_l231_c4_0a5f_left;
     BIN_OP_AND_uxn_c_l231_c4_0a5f_right <= VAR_BIN_OP_AND_uxn_c_l231_c4_0a5f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l231_c4_0a5f_return_output := BIN_OP_AND_uxn_c_l231_c4_0a5f_return_output;

     -- Submodule level 1
     VAR_BIN_OP_OR_uxn_c_l227_c4_f3cf_left := VAR_BIN_OP_AND_uxn_c_l226_c4_4269_return_output;
     VAR_BIN_OP_OR_uxn_c_l232_c4_16a7_left := VAR_BIN_OP_AND_uxn_c_l231_c4_0a5f_return_output;
     VAR_BIN_OP_OR_uxn_c_l238_c4_ffd9_left := VAR_BIN_OP_AND_uxn_c_l237_c4_4608_return_output;
     VAR_BIN_OP_OR_uxn_c_l243_c4_935d_left := VAR_BIN_OP_AND_uxn_c_l242_c4_1a57_return_output;
     VAR_BIN_OP_OR_uxn_c_l249_c4_a5c2_left := VAR_BIN_OP_AND_uxn_c_l248_c4_22fc_return_output;
     VAR_BIN_OP_OR_uxn_c_l254_c4_a82b_left := VAR_BIN_OP_AND_uxn_c_l253_c4_0585_return_output;
     VAR_BIN_OP_OR_uxn_c_l260_c4_f4b9_left := VAR_BIN_OP_AND_uxn_c_l259_c4_352e_return_output;
     VAR_BIN_OP_OR_uxn_c_l265_c4_ce9f_left := VAR_BIN_OP_AND_uxn_c_l264_c4_7b03_return_output;
     VAR_BIN_OP_OR_uxn_c_l270_c4_8250_left := VAR_BIN_OP_AND_uxn_c_l269_c4_4e1a_return_output;
     VAR_BIN_OP_OR_uxn_c_l274_c4_bf56_left := VAR_BIN_OP_AND_uxn_c_l273_c4_5468_return_output;
     VAR_BIN_OP_OR_uxn_c_l279_c4_ce95_left := VAR_BIN_OP_AND_uxn_c_l278_c4_9c30_return_output;
     VAR_BIN_OP_OR_uxn_c_l283_c4_b481_left := VAR_BIN_OP_AND_uxn_c_l282_c4_cd2c_return_output;
     VAR_color0_MUX_uxn_c_l223_c3_35dd_cond := VAR_BIN_OP_EQ_uxn_c_l223_c7_0916_return_output;
     VAR_color1_MUX_uxn_c_l223_c3_35dd_cond := VAR_BIN_OP_EQ_uxn_c_l223_c7_0916_return_output;
     VAR_color2_MUX_uxn_c_l223_c3_35dd_cond := VAR_BIN_OP_EQ_uxn_c_l223_c7_0916_return_output;
     VAR_color3_MUX_uxn_c_l223_c3_35dd_cond := VAR_BIN_OP_EQ_uxn_c_l223_c7_0916_return_output;
     VAR_tmp12_MUX_uxn_c_l223_c3_35dd_cond := VAR_BIN_OP_EQ_uxn_c_l223_c7_0916_return_output;
     VAR_color0_MUX_uxn_c_l234_c8_29bc_cond := VAR_BIN_OP_EQ_uxn_c_l234_c12_72f9_return_output;
     VAR_color1_MUX_uxn_c_l234_c8_29bc_cond := VAR_BIN_OP_EQ_uxn_c_l234_c12_72f9_return_output;
     VAR_color2_MUX_uxn_c_l234_c8_29bc_cond := VAR_BIN_OP_EQ_uxn_c_l234_c12_72f9_return_output;
     VAR_color3_MUX_uxn_c_l234_c8_29bc_cond := VAR_BIN_OP_EQ_uxn_c_l234_c12_72f9_return_output;
     VAR_tmp12_MUX_uxn_c_l234_c8_29bc_cond := VAR_BIN_OP_EQ_uxn_c_l234_c12_72f9_return_output;
     VAR_color0_MUX_uxn_c_l245_c8_73ea_cond := VAR_BIN_OP_EQ_uxn_c_l245_c12_0085_return_output;
     VAR_color1_MUX_uxn_c_l245_c8_73ea_cond := VAR_BIN_OP_EQ_uxn_c_l245_c12_0085_return_output;
     VAR_color2_MUX_uxn_c_l245_c8_73ea_cond := VAR_BIN_OP_EQ_uxn_c_l245_c12_0085_return_output;
     VAR_color3_MUX_uxn_c_l245_c8_73ea_cond := VAR_BIN_OP_EQ_uxn_c_l245_c12_0085_return_output;
     VAR_tmp12_MUX_uxn_c_l245_c8_73ea_cond := VAR_BIN_OP_EQ_uxn_c_l245_c12_0085_return_output;
     VAR_color0_MUX_uxn_c_l256_c8_7aca_cond := VAR_BIN_OP_EQ_uxn_c_l256_c12_bf05_return_output;
     VAR_color1_MUX_uxn_c_l256_c8_7aca_cond := VAR_BIN_OP_EQ_uxn_c_l256_c12_bf05_return_output;
     VAR_color2_MUX_uxn_c_l256_c8_7aca_cond := VAR_BIN_OP_EQ_uxn_c_l256_c12_bf05_return_output;
     VAR_color3_MUX_uxn_c_l256_c8_7aca_cond := VAR_BIN_OP_EQ_uxn_c_l256_c12_bf05_return_output;
     VAR_tmp12_MUX_uxn_c_l256_c8_7aca_cond := VAR_BIN_OP_EQ_uxn_c_l256_c12_bf05_return_output;
     VAR_color0_MUX_uxn_c_l267_c8_3366_cond := VAR_BIN_OP_EQ_uxn_c_l267_c12_aecc_return_output;
     VAR_color1_MUX_uxn_c_l267_c8_3366_cond := VAR_BIN_OP_EQ_uxn_c_l267_c12_aecc_return_output;
     VAR_color2_MUX_uxn_c_l267_c8_3366_cond := VAR_BIN_OP_EQ_uxn_c_l267_c12_aecc_return_output;
     VAR_color3_MUX_uxn_c_l267_c8_3366_cond := VAR_BIN_OP_EQ_uxn_c_l267_c12_aecc_return_output;
     VAR_tmp12_MUX_uxn_c_l267_c8_3366_cond := VAR_BIN_OP_EQ_uxn_c_l267_c12_aecc_return_output;
     VAR_color2_MUX_uxn_c_l276_c8_fd2a_cond := VAR_BIN_OP_EQ_uxn_c_l276_c12_ed55_return_output;
     VAR_color3_MUX_uxn_c_l276_c8_fd2a_cond := VAR_BIN_OP_EQ_uxn_c_l276_c12_ed55_return_output;
     VAR_tmp12_MUX_uxn_c_l276_c8_fd2a_cond := VAR_BIN_OP_EQ_uxn_c_l276_c12_ed55_return_output;
     VAR_result_MUX_uxn_c_l287_c2_06ba_cond := VAR_BIN_OP_EQ_uxn_c_l287_c6_a1c6_return_output;
     VAR_result_MUX_uxn_c_l289_c9_a421_cond := VAR_BIN_OP_EQ_uxn_c_l289_c13_66e2_return_output;
     VAR_result_MUX_uxn_c_l291_c9_1bcc_cond := VAR_BIN_OP_EQ_uxn_c_l291_c13_c24f_return_output;
     VAR_color_cmp_1_uxn_c_l222_c3_53bc := VAR_CAST_TO_uint4_t_uxn_c_l222_c17_198c_return_output;
     VAR_color_cmp_1_MUX_uxn_c_l220_c2_6be9_iftrue := VAR_color_cmp_1_uxn_c_l222_c3_53bc;
     VAR_tmp12_uxn_c_l229_c4_218b := resize(VAR_color_cmp_1_uxn_c_l222_c3_53bc, 12);
     VAR_tmp12_uxn_c_l240_c4_4717 := resize(VAR_color_cmp_1_uxn_c_l222_c3_53bc, 12);
     VAR_tmp12_uxn_c_l251_c4_1074 := resize(VAR_color_cmp_1_uxn_c_l222_c3_53bc, 12);
     VAR_tmp12_uxn_c_l262_c4_3fd7 := resize(VAR_color_cmp_1_uxn_c_l222_c3_53bc, 12);
     VAR_CONST_SL_8_uxn_c_l230_c4_5405_x := VAR_tmp12_uxn_c_l229_c4_218b;
     VAR_CONST_SL_8_uxn_c_l241_c4_81ff_x := VAR_tmp12_uxn_c_l240_c4_4717;
     VAR_CONST_SL_4_uxn_c_l252_c4_91d5_x := VAR_tmp12_uxn_c_l251_c4_1074;
     VAR_CONST_SL_4_uxn_c_l263_c4_0107_x := VAR_tmp12_uxn_c_l262_c4_3fd7;
     -- CONST_SL_4[uxn_c_l252_c4_91d5] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l252_c4_91d5_x <= VAR_CONST_SL_4_uxn_c_l252_c4_91d5_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l252_c4_91d5_return_output := CONST_SL_4_uxn_c_l252_c4_91d5_return_output;

     -- CAST_TO_uint4_t[uxn_c_l221_c17_91b7] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l221_c17_91b7_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l221_c27_9bff_return_output);

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l281_l272_DUPLICATE_962c LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l281_l272_DUPLICATE_962c_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_1_uxn_c_l222_c3_53bc);

     -- CONST_SL_8[uxn_c_l241_c4_81ff] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l241_c4_81ff_x <= VAR_CONST_SL_8_uxn_c_l241_c4_81ff_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l241_c4_81ff_return_output := CONST_SL_8_uxn_c_l241_c4_81ff_return_output;

     -- CONST_SL_8[uxn_c_l230_c4_5405] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l230_c4_5405_x <= VAR_CONST_SL_8_uxn_c_l230_c4_5405_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l230_c4_5405_return_output := CONST_SL_8_uxn_c_l230_c4_5405_return_output;

     -- CONST_SL_4[uxn_c_l263_c4_0107] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l263_c4_0107_x <= VAR_CONST_SL_4_uxn_c_l263_c4_0107_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l263_c4_0107_return_output := CONST_SL_4_uxn_c_l263_c4_0107_return_output;

     -- color_cmp_1_MUX[uxn_c_l220_c2_6be9] LATENCY=0
     -- Inputs
     color_cmp_1_MUX_uxn_c_l220_c2_6be9_cond <= VAR_color_cmp_1_MUX_uxn_c_l220_c2_6be9_cond;
     color_cmp_1_MUX_uxn_c_l220_c2_6be9_iftrue <= VAR_color_cmp_1_MUX_uxn_c_l220_c2_6be9_iftrue;
     color_cmp_1_MUX_uxn_c_l220_c2_6be9_iffalse <= VAR_color_cmp_1_MUX_uxn_c_l220_c2_6be9_iffalse;
     -- Outputs
     VAR_color_cmp_1_MUX_uxn_c_l220_c2_6be9_return_output := color_cmp_1_MUX_uxn_c_l220_c2_6be9_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_c_l274_c4_bf56_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l281_l272_DUPLICATE_962c_return_output;
     VAR_BIN_OP_OR_uxn_c_l283_c4_b481_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l281_l272_DUPLICATE_962c_return_output;
     VAR_tmp12_MUX_uxn_c_l267_c8_3366_iftrue := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l281_l272_DUPLICATE_962c_return_output;
     VAR_tmp12_MUX_uxn_c_l276_c8_fd2a_iftrue := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l281_l272_DUPLICATE_962c_return_output;
     VAR_color_cmp_0_uxn_c_l221_c3_a6a2 := VAR_CAST_TO_uint4_t_uxn_c_l221_c17_91b7_return_output;
     VAR_BIN_OP_OR_uxn_c_l254_c4_a82b_right := VAR_CONST_SL_4_uxn_c_l252_c4_91d5_return_output;
     VAR_tmp12_MUX_uxn_c_l245_c8_73ea_iftrue := VAR_CONST_SL_4_uxn_c_l252_c4_91d5_return_output;
     VAR_BIN_OP_OR_uxn_c_l265_c4_ce9f_right := VAR_CONST_SL_4_uxn_c_l263_c4_0107_return_output;
     VAR_tmp12_MUX_uxn_c_l256_c8_7aca_iftrue := VAR_CONST_SL_4_uxn_c_l263_c4_0107_return_output;
     VAR_BIN_OP_OR_uxn_c_l232_c4_16a7_right := VAR_CONST_SL_8_uxn_c_l230_c4_5405_return_output;
     VAR_tmp12_MUX_uxn_c_l223_c3_35dd_iftrue := VAR_CONST_SL_8_uxn_c_l230_c4_5405_return_output;
     VAR_BIN_OP_OR_uxn_c_l243_c4_935d_right := VAR_CONST_SL_8_uxn_c_l241_c4_81ff_return_output;
     VAR_tmp12_MUX_uxn_c_l234_c8_29bc_iftrue := VAR_CONST_SL_8_uxn_c_l241_c4_81ff_return_output;
     REG_VAR_color_cmp_1 := VAR_color_cmp_1_MUX_uxn_c_l220_c2_6be9_return_output;
     VAR_color_cmp_0_MUX_uxn_c_l220_c2_6be9_iftrue := VAR_color_cmp_0_uxn_c_l221_c3_a6a2;
     VAR_tmp12_uxn_c_l224_c4_fc3a := resize(VAR_color_cmp_0_uxn_c_l221_c3_a6a2, 12);
     VAR_tmp12_uxn_c_l235_c4_3f0d := resize(VAR_color_cmp_0_uxn_c_l221_c3_a6a2, 12);
     VAR_tmp12_uxn_c_l246_c4_0f94 := resize(VAR_color_cmp_0_uxn_c_l221_c3_a6a2, 12);
     VAR_tmp12_uxn_c_l257_c4_8598 := resize(VAR_color_cmp_0_uxn_c_l221_c3_a6a2, 12);
     VAR_CONST_SL_8_uxn_c_l225_c4_c82f_x := VAR_tmp12_uxn_c_l224_c4_fc3a;
     VAR_CONST_SL_8_uxn_c_l236_c4_9763_x := VAR_tmp12_uxn_c_l235_c4_3f0d;
     VAR_CONST_SL_4_uxn_c_l247_c4_f183_x := VAR_tmp12_uxn_c_l246_c4_0f94;
     VAR_CONST_SL_4_uxn_c_l258_c4_2cee_x := VAR_tmp12_uxn_c_l257_c4_8598;
     -- BIN_OP_OR[uxn_c_l232_c4_16a7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l232_c4_16a7_left <= VAR_BIN_OP_OR_uxn_c_l232_c4_16a7_left;
     BIN_OP_OR_uxn_c_l232_c4_16a7_right <= VAR_BIN_OP_OR_uxn_c_l232_c4_16a7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l232_c4_16a7_return_output := BIN_OP_OR_uxn_c_l232_c4_16a7_return_output;

     -- color_cmp_0_MUX[uxn_c_l220_c2_6be9] LATENCY=0
     -- Inputs
     color_cmp_0_MUX_uxn_c_l220_c2_6be9_cond <= VAR_color_cmp_0_MUX_uxn_c_l220_c2_6be9_cond;
     color_cmp_0_MUX_uxn_c_l220_c2_6be9_iftrue <= VAR_color_cmp_0_MUX_uxn_c_l220_c2_6be9_iftrue;
     color_cmp_0_MUX_uxn_c_l220_c2_6be9_iffalse <= VAR_color_cmp_0_MUX_uxn_c_l220_c2_6be9_iffalse;
     -- Outputs
     VAR_color_cmp_0_MUX_uxn_c_l220_c2_6be9_return_output := color_cmp_0_MUX_uxn_c_l220_c2_6be9_return_output;

     -- BIN_OP_OR[uxn_c_l243_c4_935d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l243_c4_935d_left <= VAR_BIN_OP_OR_uxn_c_l243_c4_935d_left;
     BIN_OP_OR_uxn_c_l243_c4_935d_right <= VAR_BIN_OP_OR_uxn_c_l243_c4_935d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l243_c4_935d_return_output := BIN_OP_OR_uxn_c_l243_c4_935d_return_output;

     -- BIN_OP_OR[uxn_c_l265_c4_ce9f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l265_c4_ce9f_left <= VAR_BIN_OP_OR_uxn_c_l265_c4_ce9f_left;
     BIN_OP_OR_uxn_c_l265_c4_ce9f_right <= VAR_BIN_OP_OR_uxn_c_l265_c4_ce9f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l265_c4_ce9f_return_output := BIN_OP_OR_uxn_c_l265_c4_ce9f_return_output;

     -- CONST_SL_4[uxn_c_l247_c4_f183] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l247_c4_f183_x <= VAR_CONST_SL_4_uxn_c_l247_c4_f183_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l247_c4_f183_return_output := CONST_SL_4_uxn_c_l247_c4_f183_return_output;

     -- CONST_SL_4[uxn_c_l258_c4_2cee] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l258_c4_2cee_x <= VAR_CONST_SL_4_uxn_c_l258_c4_2cee_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l258_c4_2cee_return_output := CONST_SL_4_uxn_c_l258_c4_2cee_return_output;

     -- CONST_SL_8[uxn_c_l225_c4_c82f] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l225_c4_c82f_x <= VAR_CONST_SL_8_uxn_c_l225_c4_c82f_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l225_c4_c82f_return_output := CONST_SL_8_uxn_c_l225_c4_c82f_return_output;

     -- BIN_OP_OR[uxn_c_l254_c4_a82b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l254_c4_a82b_left <= VAR_BIN_OP_OR_uxn_c_l254_c4_a82b_left;
     BIN_OP_OR_uxn_c_l254_c4_a82b_right <= VAR_BIN_OP_OR_uxn_c_l254_c4_a82b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l254_c4_a82b_return_output := BIN_OP_OR_uxn_c_l254_c4_a82b_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l277_l268_DUPLICATE_1348 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l277_l268_DUPLICATE_1348_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_0_uxn_c_l221_c3_a6a2);

     -- CONST_SL_8[uxn_c_l236_c4_9763] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l236_c4_9763_x <= VAR_CONST_SL_8_uxn_c_l236_c4_9763_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l236_c4_9763_return_output := CONST_SL_8_uxn_c_l236_c4_9763_return_output;

     -- tmp12_MUX[uxn_c_l276_c8_fd2a] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l276_c8_fd2a_cond <= VAR_tmp12_MUX_uxn_c_l276_c8_fd2a_cond;
     tmp12_MUX_uxn_c_l276_c8_fd2a_iftrue <= VAR_tmp12_MUX_uxn_c_l276_c8_fd2a_iftrue;
     tmp12_MUX_uxn_c_l276_c8_fd2a_iffalse <= VAR_tmp12_MUX_uxn_c_l276_c8_fd2a_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l276_c8_fd2a_return_output := tmp12_MUX_uxn_c_l276_c8_fd2a_return_output;

     -- BIN_OP_OR[uxn_c_l274_c4_bf56] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l274_c4_bf56_left <= VAR_BIN_OP_OR_uxn_c_l274_c4_bf56_left;
     BIN_OP_OR_uxn_c_l274_c4_bf56_right <= VAR_BIN_OP_OR_uxn_c_l274_c4_bf56_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l274_c4_bf56_return_output := BIN_OP_OR_uxn_c_l274_c4_bf56_return_output;

     -- BIN_OP_OR[uxn_c_l283_c4_b481] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l283_c4_b481_left <= VAR_BIN_OP_OR_uxn_c_l283_c4_b481_left;
     BIN_OP_OR_uxn_c_l283_c4_b481_right <= VAR_BIN_OP_OR_uxn_c_l283_c4_b481_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l283_c4_b481_return_output := BIN_OP_OR_uxn_c_l283_c4_b481_return_output;

     -- Submodule level 3
     VAR_color1_MUX_uxn_c_l223_c3_35dd_iftrue := VAR_BIN_OP_OR_uxn_c_l232_c4_16a7_return_output;
     VAR_color3_MUX_uxn_c_l234_c8_29bc_iftrue := VAR_BIN_OP_OR_uxn_c_l243_c4_935d_return_output;
     VAR_color1_MUX_uxn_c_l245_c8_73ea_iftrue := VAR_BIN_OP_OR_uxn_c_l254_c4_a82b_return_output;
     VAR_color3_MUX_uxn_c_l256_c8_7aca_iftrue := VAR_BIN_OP_OR_uxn_c_l265_c4_ce9f_return_output;
     VAR_color1_MUX_uxn_c_l267_c8_3366_iftrue := VAR_BIN_OP_OR_uxn_c_l274_c4_bf56_return_output;
     VAR_color3_MUX_uxn_c_l276_c8_fd2a_iftrue := VAR_BIN_OP_OR_uxn_c_l283_c4_b481_return_output;
     VAR_BIN_OP_OR_uxn_c_l270_c4_8250_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l277_l268_DUPLICATE_1348_return_output;
     VAR_BIN_OP_OR_uxn_c_l279_c4_ce95_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l277_l268_DUPLICATE_1348_return_output;
     VAR_BIN_OP_OR_uxn_c_l249_c4_a5c2_right := VAR_CONST_SL_4_uxn_c_l247_c4_f183_return_output;
     VAR_BIN_OP_OR_uxn_c_l260_c4_f4b9_right := VAR_CONST_SL_4_uxn_c_l258_c4_2cee_return_output;
     VAR_BIN_OP_OR_uxn_c_l227_c4_f3cf_right := VAR_CONST_SL_8_uxn_c_l225_c4_c82f_return_output;
     VAR_BIN_OP_OR_uxn_c_l238_c4_ffd9_right := VAR_CONST_SL_8_uxn_c_l236_c4_9763_return_output;
     REG_VAR_color_cmp_0 := VAR_color_cmp_0_MUX_uxn_c_l220_c2_6be9_return_output;
     VAR_tmp12_MUX_uxn_c_l267_c8_3366_iffalse := VAR_tmp12_MUX_uxn_c_l276_c8_fd2a_return_output;
     -- tmp12_MUX[uxn_c_l267_c8_3366] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l267_c8_3366_cond <= VAR_tmp12_MUX_uxn_c_l267_c8_3366_cond;
     tmp12_MUX_uxn_c_l267_c8_3366_iftrue <= VAR_tmp12_MUX_uxn_c_l267_c8_3366_iftrue;
     tmp12_MUX_uxn_c_l267_c8_3366_iffalse <= VAR_tmp12_MUX_uxn_c_l267_c8_3366_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l267_c8_3366_return_output := tmp12_MUX_uxn_c_l267_c8_3366_return_output;

     -- BIN_OP_OR[uxn_c_l238_c4_ffd9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l238_c4_ffd9_left <= VAR_BIN_OP_OR_uxn_c_l238_c4_ffd9_left;
     BIN_OP_OR_uxn_c_l238_c4_ffd9_right <= VAR_BIN_OP_OR_uxn_c_l238_c4_ffd9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l238_c4_ffd9_return_output := BIN_OP_OR_uxn_c_l238_c4_ffd9_return_output;

     -- BIN_OP_OR[uxn_c_l270_c4_8250] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l270_c4_8250_left <= VAR_BIN_OP_OR_uxn_c_l270_c4_8250_left;
     BIN_OP_OR_uxn_c_l270_c4_8250_right <= VAR_BIN_OP_OR_uxn_c_l270_c4_8250_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l270_c4_8250_return_output := BIN_OP_OR_uxn_c_l270_c4_8250_return_output;

     -- color1_MUX[uxn_c_l267_c8_3366] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l267_c8_3366_cond <= VAR_color1_MUX_uxn_c_l267_c8_3366_cond;
     color1_MUX_uxn_c_l267_c8_3366_iftrue <= VAR_color1_MUX_uxn_c_l267_c8_3366_iftrue;
     color1_MUX_uxn_c_l267_c8_3366_iffalse <= VAR_color1_MUX_uxn_c_l267_c8_3366_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l267_c8_3366_return_output := color1_MUX_uxn_c_l267_c8_3366_return_output;

     -- BIN_OP_OR[uxn_c_l279_c4_ce95] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l279_c4_ce95_left <= VAR_BIN_OP_OR_uxn_c_l279_c4_ce95_left;
     BIN_OP_OR_uxn_c_l279_c4_ce95_right <= VAR_BIN_OP_OR_uxn_c_l279_c4_ce95_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l279_c4_ce95_return_output := BIN_OP_OR_uxn_c_l279_c4_ce95_return_output;

     -- BIN_OP_OR[uxn_c_l249_c4_a5c2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l249_c4_a5c2_left <= VAR_BIN_OP_OR_uxn_c_l249_c4_a5c2_left;
     BIN_OP_OR_uxn_c_l249_c4_a5c2_right <= VAR_BIN_OP_OR_uxn_c_l249_c4_a5c2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l249_c4_a5c2_return_output := BIN_OP_OR_uxn_c_l249_c4_a5c2_return_output;

     -- BIN_OP_OR[uxn_c_l227_c4_f3cf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l227_c4_f3cf_left <= VAR_BIN_OP_OR_uxn_c_l227_c4_f3cf_left;
     BIN_OP_OR_uxn_c_l227_c4_f3cf_right <= VAR_BIN_OP_OR_uxn_c_l227_c4_f3cf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l227_c4_f3cf_return_output := BIN_OP_OR_uxn_c_l227_c4_f3cf_return_output;

     -- color3_MUX[uxn_c_l276_c8_fd2a] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l276_c8_fd2a_cond <= VAR_color3_MUX_uxn_c_l276_c8_fd2a_cond;
     color3_MUX_uxn_c_l276_c8_fd2a_iftrue <= VAR_color3_MUX_uxn_c_l276_c8_fd2a_iftrue;
     color3_MUX_uxn_c_l276_c8_fd2a_iffalse <= VAR_color3_MUX_uxn_c_l276_c8_fd2a_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l276_c8_fd2a_return_output := color3_MUX_uxn_c_l276_c8_fd2a_return_output;

     -- BIN_OP_OR[uxn_c_l260_c4_f4b9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l260_c4_f4b9_left <= VAR_BIN_OP_OR_uxn_c_l260_c4_f4b9_left;
     BIN_OP_OR_uxn_c_l260_c4_f4b9_right <= VAR_BIN_OP_OR_uxn_c_l260_c4_f4b9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l260_c4_f4b9_return_output := BIN_OP_OR_uxn_c_l260_c4_f4b9_return_output;

     -- Submodule level 4
     VAR_color0_MUX_uxn_c_l223_c3_35dd_iftrue := VAR_BIN_OP_OR_uxn_c_l227_c4_f3cf_return_output;
     VAR_color2_MUX_uxn_c_l234_c8_29bc_iftrue := VAR_BIN_OP_OR_uxn_c_l238_c4_ffd9_return_output;
     VAR_color0_MUX_uxn_c_l245_c8_73ea_iftrue := VAR_BIN_OP_OR_uxn_c_l249_c4_a5c2_return_output;
     VAR_color2_MUX_uxn_c_l256_c8_7aca_iftrue := VAR_BIN_OP_OR_uxn_c_l260_c4_f4b9_return_output;
     VAR_color0_MUX_uxn_c_l267_c8_3366_iftrue := VAR_BIN_OP_OR_uxn_c_l270_c4_8250_return_output;
     VAR_color2_MUX_uxn_c_l276_c8_fd2a_iftrue := VAR_BIN_OP_OR_uxn_c_l279_c4_ce95_return_output;
     VAR_color1_MUX_uxn_c_l256_c8_7aca_iffalse := VAR_color1_MUX_uxn_c_l267_c8_3366_return_output;
     VAR_color3_MUX_uxn_c_l267_c8_3366_iffalse := VAR_color3_MUX_uxn_c_l276_c8_fd2a_return_output;
     VAR_tmp12_MUX_uxn_c_l256_c8_7aca_iffalse := VAR_tmp12_MUX_uxn_c_l267_c8_3366_return_output;
     -- color0_MUX[uxn_c_l267_c8_3366] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l267_c8_3366_cond <= VAR_color0_MUX_uxn_c_l267_c8_3366_cond;
     color0_MUX_uxn_c_l267_c8_3366_iftrue <= VAR_color0_MUX_uxn_c_l267_c8_3366_iftrue;
     color0_MUX_uxn_c_l267_c8_3366_iffalse <= VAR_color0_MUX_uxn_c_l267_c8_3366_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l267_c8_3366_return_output := color0_MUX_uxn_c_l267_c8_3366_return_output;

     -- tmp12_MUX[uxn_c_l256_c8_7aca] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l256_c8_7aca_cond <= VAR_tmp12_MUX_uxn_c_l256_c8_7aca_cond;
     tmp12_MUX_uxn_c_l256_c8_7aca_iftrue <= VAR_tmp12_MUX_uxn_c_l256_c8_7aca_iftrue;
     tmp12_MUX_uxn_c_l256_c8_7aca_iffalse <= VAR_tmp12_MUX_uxn_c_l256_c8_7aca_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l256_c8_7aca_return_output := tmp12_MUX_uxn_c_l256_c8_7aca_return_output;

     -- color1_MUX[uxn_c_l256_c8_7aca] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l256_c8_7aca_cond <= VAR_color1_MUX_uxn_c_l256_c8_7aca_cond;
     color1_MUX_uxn_c_l256_c8_7aca_iftrue <= VAR_color1_MUX_uxn_c_l256_c8_7aca_iftrue;
     color1_MUX_uxn_c_l256_c8_7aca_iffalse <= VAR_color1_MUX_uxn_c_l256_c8_7aca_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l256_c8_7aca_return_output := color1_MUX_uxn_c_l256_c8_7aca_return_output;

     -- color3_MUX[uxn_c_l267_c8_3366] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l267_c8_3366_cond <= VAR_color3_MUX_uxn_c_l267_c8_3366_cond;
     color3_MUX_uxn_c_l267_c8_3366_iftrue <= VAR_color3_MUX_uxn_c_l267_c8_3366_iftrue;
     color3_MUX_uxn_c_l267_c8_3366_iffalse <= VAR_color3_MUX_uxn_c_l267_c8_3366_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l267_c8_3366_return_output := color3_MUX_uxn_c_l267_c8_3366_return_output;

     -- color2_MUX[uxn_c_l276_c8_fd2a] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l276_c8_fd2a_cond <= VAR_color2_MUX_uxn_c_l276_c8_fd2a_cond;
     color2_MUX_uxn_c_l276_c8_fd2a_iftrue <= VAR_color2_MUX_uxn_c_l276_c8_fd2a_iftrue;
     color2_MUX_uxn_c_l276_c8_fd2a_iffalse <= VAR_color2_MUX_uxn_c_l276_c8_fd2a_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l276_c8_fd2a_return_output := color2_MUX_uxn_c_l276_c8_fd2a_return_output;

     -- Submodule level 5
     VAR_color0_MUX_uxn_c_l256_c8_7aca_iffalse := VAR_color0_MUX_uxn_c_l267_c8_3366_return_output;
     VAR_color1_MUX_uxn_c_l245_c8_73ea_iffalse := VAR_color1_MUX_uxn_c_l256_c8_7aca_return_output;
     VAR_color2_MUX_uxn_c_l267_c8_3366_iffalse := VAR_color2_MUX_uxn_c_l276_c8_fd2a_return_output;
     VAR_color3_MUX_uxn_c_l256_c8_7aca_iffalse := VAR_color3_MUX_uxn_c_l267_c8_3366_return_output;
     VAR_tmp12_MUX_uxn_c_l245_c8_73ea_iffalse := VAR_tmp12_MUX_uxn_c_l256_c8_7aca_return_output;
     -- color0_MUX[uxn_c_l256_c8_7aca] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l256_c8_7aca_cond <= VAR_color0_MUX_uxn_c_l256_c8_7aca_cond;
     color0_MUX_uxn_c_l256_c8_7aca_iftrue <= VAR_color0_MUX_uxn_c_l256_c8_7aca_iftrue;
     color0_MUX_uxn_c_l256_c8_7aca_iffalse <= VAR_color0_MUX_uxn_c_l256_c8_7aca_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l256_c8_7aca_return_output := color0_MUX_uxn_c_l256_c8_7aca_return_output;

     -- tmp12_MUX[uxn_c_l245_c8_73ea] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l245_c8_73ea_cond <= VAR_tmp12_MUX_uxn_c_l245_c8_73ea_cond;
     tmp12_MUX_uxn_c_l245_c8_73ea_iftrue <= VAR_tmp12_MUX_uxn_c_l245_c8_73ea_iftrue;
     tmp12_MUX_uxn_c_l245_c8_73ea_iffalse <= VAR_tmp12_MUX_uxn_c_l245_c8_73ea_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l245_c8_73ea_return_output := tmp12_MUX_uxn_c_l245_c8_73ea_return_output;

     -- color2_MUX[uxn_c_l267_c8_3366] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l267_c8_3366_cond <= VAR_color2_MUX_uxn_c_l267_c8_3366_cond;
     color2_MUX_uxn_c_l267_c8_3366_iftrue <= VAR_color2_MUX_uxn_c_l267_c8_3366_iftrue;
     color2_MUX_uxn_c_l267_c8_3366_iffalse <= VAR_color2_MUX_uxn_c_l267_c8_3366_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l267_c8_3366_return_output := color2_MUX_uxn_c_l267_c8_3366_return_output;

     -- color1_MUX[uxn_c_l245_c8_73ea] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l245_c8_73ea_cond <= VAR_color1_MUX_uxn_c_l245_c8_73ea_cond;
     color1_MUX_uxn_c_l245_c8_73ea_iftrue <= VAR_color1_MUX_uxn_c_l245_c8_73ea_iftrue;
     color1_MUX_uxn_c_l245_c8_73ea_iffalse <= VAR_color1_MUX_uxn_c_l245_c8_73ea_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l245_c8_73ea_return_output := color1_MUX_uxn_c_l245_c8_73ea_return_output;

     -- color3_MUX[uxn_c_l256_c8_7aca] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l256_c8_7aca_cond <= VAR_color3_MUX_uxn_c_l256_c8_7aca_cond;
     color3_MUX_uxn_c_l256_c8_7aca_iftrue <= VAR_color3_MUX_uxn_c_l256_c8_7aca_iftrue;
     color3_MUX_uxn_c_l256_c8_7aca_iffalse <= VAR_color3_MUX_uxn_c_l256_c8_7aca_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l256_c8_7aca_return_output := color3_MUX_uxn_c_l256_c8_7aca_return_output;

     -- Submodule level 6
     VAR_color0_MUX_uxn_c_l245_c8_73ea_iffalse := VAR_color0_MUX_uxn_c_l256_c8_7aca_return_output;
     VAR_color1_MUX_uxn_c_l234_c8_29bc_iffalse := VAR_color1_MUX_uxn_c_l245_c8_73ea_return_output;
     VAR_color2_MUX_uxn_c_l256_c8_7aca_iffalse := VAR_color2_MUX_uxn_c_l267_c8_3366_return_output;
     VAR_color3_MUX_uxn_c_l245_c8_73ea_iffalse := VAR_color3_MUX_uxn_c_l256_c8_7aca_return_output;
     VAR_tmp12_MUX_uxn_c_l234_c8_29bc_iffalse := VAR_tmp12_MUX_uxn_c_l245_c8_73ea_return_output;
     -- color1_MUX[uxn_c_l234_c8_29bc] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l234_c8_29bc_cond <= VAR_color1_MUX_uxn_c_l234_c8_29bc_cond;
     color1_MUX_uxn_c_l234_c8_29bc_iftrue <= VAR_color1_MUX_uxn_c_l234_c8_29bc_iftrue;
     color1_MUX_uxn_c_l234_c8_29bc_iffalse <= VAR_color1_MUX_uxn_c_l234_c8_29bc_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l234_c8_29bc_return_output := color1_MUX_uxn_c_l234_c8_29bc_return_output;

     -- color3_MUX[uxn_c_l245_c8_73ea] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l245_c8_73ea_cond <= VAR_color3_MUX_uxn_c_l245_c8_73ea_cond;
     color3_MUX_uxn_c_l245_c8_73ea_iftrue <= VAR_color3_MUX_uxn_c_l245_c8_73ea_iftrue;
     color3_MUX_uxn_c_l245_c8_73ea_iffalse <= VAR_color3_MUX_uxn_c_l245_c8_73ea_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l245_c8_73ea_return_output := color3_MUX_uxn_c_l245_c8_73ea_return_output;

     -- tmp12_MUX[uxn_c_l234_c8_29bc] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l234_c8_29bc_cond <= VAR_tmp12_MUX_uxn_c_l234_c8_29bc_cond;
     tmp12_MUX_uxn_c_l234_c8_29bc_iftrue <= VAR_tmp12_MUX_uxn_c_l234_c8_29bc_iftrue;
     tmp12_MUX_uxn_c_l234_c8_29bc_iffalse <= VAR_tmp12_MUX_uxn_c_l234_c8_29bc_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l234_c8_29bc_return_output := tmp12_MUX_uxn_c_l234_c8_29bc_return_output;

     -- color2_MUX[uxn_c_l256_c8_7aca] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l256_c8_7aca_cond <= VAR_color2_MUX_uxn_c_l256_c8_7aca_cond;
     color2_MUX_uxn_c_l256_c8_7aca_iftrue <= VAR_color2_MUX_uxn_c_l256_c8_7aca_iftrue;
     color2_MUX_uxn_c_l256_c8_7aca_iffalse <= VAR_color2_MUX_uxn_c_l256_c8_7aca_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l256_c8_7aca_return_output := color2_MUX_uxn_c_l256_c8_7aca_return_output;

     -- color0_MUX[uxn_c_l245_c8_73ea] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l245_c8_73ea_cond <= VAR_color0_MUX_uxn_c_l245_c8_73ea_cond;
     color0_MUX_uxn_c_l245_c8_73ea_iftrue <= VAR_color0_MUX_uxn_c_l245_c8_73ea_iftrue;
     color0_MUX_uxn_c_l245_c8_73ea_iffalse <= VAR_color0_MUX_uxn_c_l245_c8_73ea_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l245_c8_73ea_return_output := color0_MUX_uxn_c_l245_c8_73ea_return_output;

     -- Submodule level 7
     VAR_color0_MUX_uxn_c_l234_c8_29bc_iffalse := VAR_color0_MUX_uxn_c_l245_c8_73ea_return_output;
     VAR_color1_MUX_uxn_c_l223_c3_35dd_iffalse := VAR_color1_MUX_uxn_c_l234_c8_29bc_return_output;
     VAR_color2_MUX_uxn_c_l245_c8_73ea_iffalse := VAR_color2_MUX_uxn_c_l256_c8_7aca_return_output;
     VAR_color3_MUX_uxn_c_l234_c8_29bc_iffalse := VAR_color3_MUX_uxn_c_l245_c8_73ea_return_output;
     VAR_tmp12_MUX_uxn_c_l223_c3_35dd_iffalse := VAR_tmp12_MUX_uxn_c_l234_c8_29bc_return_output;
     -- color0_MUX[uxn_c_l234_c8_29bc] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l234_c8_29bc_cond <= VAR_color0_MUX_uxn_c_l234_c8_29bc_cond;
     color0_MUX_uxn_c_l234_c8_29bc_iftrue <= VAR_color0_MUX_uxn_c_l234_c8_29bc_iftrue;
     color0_MUX_uxn_c_l234_c8_29bc_iffalse <= VAR_color0_MUX_uxn_c_l234_c8_29bc_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l234_c8_29bc_return_output := color0_MUX_uxn_c_l234_c8_29bc_return_output;

     -- color2_MUX[uxn_c_l245_c8_73ea] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l245_c8_73ea_cond <= VAR_color2_MUX_uxn_c_l245_c8_73ea_cond;
     color2_MUX_uxn_c_l245_c8_73ea_iftrue <= VAR_color2_MUX_uxn_c_l245_c8_73ea_iftrue;
     color2_MUX_uxn_c_l245_c8_73ea_iffalse <= VAR_color2_MUX_uxn_c_l245_c8_73ea_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l245_c8_73ea_return_output := color2_MUX_uxn_c_l245_c8_73ea_return_output;

     -- color1_MUX[uxn_c_l223_c3_35dd] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l223_c3_35dd_cond <= VAR_color1_MUX_uxn_c_l223_c3_35dd_cond;
     color1_MUX_uxn_c_l223_c3_35dd_iftrue <= VAR_color1_MUX_uxn_c_l223_c3_35dd_iftrue;
     color1_MUX_uxn_c_l223_c3_35dd_iffalse <= VAR_color1_MUX_uxn_c_l223_c3_35dd_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l223_c3_35dd_return_output := color1_MUX_uxn_c_l223_c3_35dd_return_output;

     -- color3_MUX[uxn_c_l234_c8_29bc] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l234_c8_29bc_cond <= VAR_color3_MUX_uxn_c_l234_c8_29bc_cond;
     color3_MUX_uxn_c_l234_c8_29bc_iftrue <= VAR_color3_MUX_uxn_c_l234_c8_29bc_iftrue;
     color3_MUX_uxn_c_l234_c8_29bc_iffalse <= VAR_color3_MUX_uxn_c_l234_c8_29bc_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l234_c8_29bc_return_output := color3_MUX_uxn_c_l234_c8_29bc_return_output;

     -- tmp12_MUX[uxn_c_l223_c3_35dd] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l223_c3_35dd_cond <= VAR_tmp12_MUX_uxn_c_l223_c3_35dd_cond;
     tmp12_MUX_uxn_c_l223_c3_35dd_iftrue <= VAR_tmp12_MUX_uxn_c_l223_c3_35dd_iftrue;
     tmp12_MUX_uxn_c_l223_c3_35dd_iffalse <= VAR_tmp12_MUX_uxn_c_l223_c3_35dd_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l223_c3_35dd_return_output := tmp12_MUX_uxn_c_l223_c3_35dd_return_output;

     -- Submodule level 8
     VAR_color0_MUX_uxn_c_l223_c3_35dd_iffalse := VAR_color0_MUX_uxn_c_l234_c8_29bc_return_output;
     VAR_color1_MUX_uxn_c_l220_c2_6be9_iftrue := VAR_color1_MUX_uxn_c_l223_c3_35dd_return_output;
     VAR_color2_MUX_uxn_c_l234_c8_29bc_iffalse := VAR_color2_MUX_uxn_c_l245_c8_73ea_return_output;
     VAR_color3_MUX_uxn_c_l223_c3_35dd_iffalse := VAR_color3_MUX_uxn_c_l234_c8_29bc_return_output;
     VAR_tmp12_MUX_uxn_c_l220_c2_6be9_iftrue := VAR_tmp12_MUX_uxn_c_l223_c3_35dd_return_output;
     -- color3_MUX[uxn_c_l223_c3_35dd] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l223_c3_35dd_cond <= VAR_color3_MUX_uxn_c_l223_c3_35dd_cond;
     color3_MUX_uxn_c_l223_c3_35dd_iftrue <= VAR_color3_MUX_uxn_c_l223_c3_35dd_iftrue;
     color3_MUX_uxn_c_l223_c3_35dd_iffalse <= VAR_color3_MUX_uxn_c_l223_c3_35dd_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l223_c3_35dd_return_output := color3_MUX_uxn_c_l223_c3_35dd_return_output;

     -- color2_MUX[uxn_c_l234_c8_29bc] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l234_c8_29bc_cond <= VAR_color2_MUX_uxn_c_l234_c8_29bc_cond;
     color2_MUX_uxn_c_l234_c8_29bc_iftrue <= VAR_color2_MUX_uxn_c_l234_c8_29bc_iftrue;
     color2_MUX_uxn_c_l234_c8_29bc_iffalse <= VAR_color2_MUX_uxn_c_l234_c8_29bc_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l234_c8_29bc_return_output := color2_MUX_uxn_c_l234_c8_29bc_return_output;

     -- color0_MUX[uxn_c_l223_c3_35dd] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l223_c3_35dd_cond <= VAR_color0_MUX_uxn_c_l223_c3_35dd_cond;
     color0_MUX_uxn_c_l223_c3_35dd_iftrue <= VAR_color0_MUX_uxn_c_l223_c3_35dd_iftrue;
     color0_MUX_uxn_c_l223_c3_35dd_iffalse <= VAR_color0_MUX_uxn_c_l223_c3_35dd_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l223_c3_35dd_return_output := color0_MUX_uxn_c_l223_c3_35dd_return_output;

     -- color1_MUX[uxn_c_l220_c2_6be9] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l220_c2_6be9_cond <= VAR_color1_MUX_uxn_c_l220_c2_6be9_cond;
     color1_MUX_uxn_c_l220_c2_6be9_iftrue <= VAR_color1_MUX_uxn_c_l220_c2_6be9_iftrue;
     color1_MUX_uxn_c_l220_c2_6be9_iffalse <= VAR_color1_MUX_uxn_c_l220_c2_6be9_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l220_c2_6be9_return_output := color1_MUX_uxn_c_l220_c2_6be9_return_output;

     -- tmp12_MUX[uxn_c_l220_c2_6be9] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_c_l220_c2_6be9_cond <= VAR_tmp12_MUX_uxn_c_l220_c2_6be9_cond;
     tmp12_MUX_uxn_c_l220_c2_6be9_iftrue <= VAR_tmp12_MUX_uxn_c_l220_c2_6be9_iftrue;
     tmp12_MUX_uxn_c_l220_c2_6be9_iffalse <= VAR_tmp12_MUX_uxn_c_l220_c2_6be9_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_c_l220_c2_6be9_return_output := tmp12_MUX_uxn_c_l220_c2_6be9_return_output;

     -- Submodule level 9
     VAR_color0_MUX_uxn_c_l220_c2_6be9_iftrue := VAR_color0_MUX_uxn_c_l223_c3_35dd_return_output;
     REG_VAR_color1 := VAR_color1_MUX_uxn_c_l220_c2_6be9_return_output;
     VAR_result_uxn_c_l290_c3_3436 := resize(VAR_color1_MUX_uxn_c_l220_c2_6be9_return_output, 16);
     VAR_color2_MUX_uxn_c_l223_c3_35dd_iffalse := VAR_color2_MUX_uxn_c_l234_c8_29bc_return_output;
     VAR_color3_MUX_uxn_c_l220_c2_6be9_iftrue := VAR_color3_MUX_uxn_c_l223_c3_35dd_return_output;
     REG_VAR_tmp12 := VAR_tmp12_MUX_uxn_c_l220_c2_6be9_return_output;
     VAR_result_MUX_uxn_c_l289_c9_a421_iftrue := VAR_result_uxn_c_l290_c3_3436;
     -- color2_MUX[uxn_c_l223_c3_35dd] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l223_c3_35dd_cond <= VAR_color2_MUX_uxn_c_l223_c3_35dd_cond;
     color2_MUX_uxn_c_l223_c3_35dd_iftrue <= VAR_color2_MUX_uxn_c_l223_c3_35dd_iftrue;
     color2_MUX_uxn_c_l223_c3_35dd_iffalse <= VAR_color2_MUX_uxn_c_l223_c3_35dd_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l223_c3_35dd_return_output := color2_MUX_uxn_c_l223_c3_35dd_return_output;

     -- color0_MUX[uxn_c_l220_c2_6be9] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l220_c2_6be9_cond <= VAR_color0_MUX_uxn_c_l220_c2_6be9_cond;
     color0_MUX_uxn_c_l220_c2_6be9_iftrue <= VAR_color0_MUX_uxn_c_l220_c2_6be9_iftrue;
     color0_MUX_uxn_c_l220_c2_6be9_iffalse <= VAR_color0_MUX_uxn_c_l220_c2_6be9_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l220_c2_6be9_return_output := color0_MUX_uxn_c_l220_c2_6be9_return_output;

     -- color3_MUX[uxn_c_l220_c2_6be9] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l220_c2_6be9_cond <= VAR_color3_MUX_uxn_c_l220_c2_6be9_cond;
     color3_MUX_uxn_c_l220_c2_6be9_iftrue <= VAR_color3_MUX_uxn_c_l220_c2_6be9_iftrue;
     color3_MUX_uxn_c_l220_c2_6be9_iffalse <= VAR_color3_MUX_uxn_c_l220_c2_6be9_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l220_c2_6be9_return_output := color3_MUX_uxn_c_l220_c2_6be9_return_output;

     -- Submodule level 10
     REG_VAR_color0 := VAR_color0_MUX_uxn_c_l220_c2_6be9_return_output;
     VAR_result_uxn_c_l288_c3_29aa := resize(VAR_color0_MUX_uxn_c_l220_c2_6be9_return_output, 16);
     VAR_color2_MUX_uxn_c_l220_c2_6be9_iftrue := VAR_color2_MUX_uxn_c_l223_c3_35dd_return_output;
     REG_VAR_color3 := VAR_color3_MUX_uxn_c_l220_c2_6be9_return_output;
     VAR_result_uxn_c_l294_c3_cb45 := resize(VAR_color3_MUX_uxn_c_l220_c2_6be9_return_output, 16);
     VAR_result_MUX_uxn_c_l287_c2_06ba_iftrue := VAR_result_uxn_c_l288_c3_29aa;
     VAR_result_MUX_uxn_c_l291_c9_1bcc_iffalse := VAR_result_uxn_c_l294_c3_cb45;
     -- color2_MUX[uxn_c_l220_c2_6be9] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l220_c2_6be9_cond <= VAR_color2_MUX_uxn_c_l220_c2_6be9_cond;
     color2_MUX_uxn_c_l220_c2_6be9_iftrue <= VAR_color2_MUX_uxn_c_l220_c2_6be9_iftrue;
     color2_MUX_uxn_c_l220_c2_6be9_iffalse <= VAR_color2_MUX_uxn_c_l220_c2_6be9_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l220_c2_6be9_return_output := color2_MUX_uxn_c_l220_c2_6be9_return_output;

     -- Submodule level 11
     REG_VAR_color2 := VAR_color2_MUX_uxn_c_l220_c2_6be9_return_output;
     VAR_result_uxn_c_l292_c3_7f62 := resize(VAR_color2_MUX_uxn_c_l220_c2_6be9_return_output, 16);
     VAR_result_MUX_uxn_c_l291_c9_1bcc_iftrue := VAR_result_uxn_c_l292_c3_7f62;
     -- result_MUX[uxn_c_l291_c9_1bcc] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l291_c9_1bcc_cond <= VAR_result_MUX_uxn_c_l291_c9_1bcc_cond;
     result_MUX_uxn_c_l291_c9_1bcc_iftrue <= VAR_result_MUX_uxn_c_l291_c9_1bcc_iftrue;
     result_MUX_uxn_c_l291_c9_1bcc_iffalse <= VAR_result_MUX_uxn_c_l291_c9_1bcc_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l291_c9_1bcc_return_output := result_MUX_uxn_c_l291_c9_1bcc_return_output;

     -- Submodule level 12
     VAR_result_MUX_uxn_c_l289_c9_a421_iffalse := VAR_result_MUX_uxn_c_l291_c9_1bcc_return_output;
     -- result_MUX[uxn_c_l289_c9_a421] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l289_c9_a421_cond <= VAR_result_MUX_uxn_c_l289_c9_a421_cond;
     result_MUX_uxn_c_l289_c9_a421_iftrue <= VAR_result_MUX_uxn_c_l289_c9_a421_iftrue;
     result_MUX_uxn_c_l289_c9_a421_iffalse <= VAR_result_MUX_uxn_c_l289_c9_a421_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l289_c9_a421_return_output := result_MUX_uxn_c_l289_c9_a421_return_output;

     -- Submodule level 13
     VAR_result_MUX_uxn_c_l287_c2_06ba_iffalse := VAR_result_MUX_uxn_c_l289_c9_a421_return_output;
     -- result_MUX[uxn_c_l287_c2_06ba] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l287_c2_06ba_cond <= VAR_result_MUX_uxn_c_l287_c2_06ba_cond;
     result_MUX_uxn_c_l287_c2_06ba_iftrue <= VAR_result_MUX_uxn_c_l287_c2_06ba_iftrue;
     result_MUX_uxn_c_l287_c2_06ba_iffalse <= VAR_result_MUX_uxn_c_l287_c2_06ba_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l287_c2_06ba_return_output := result_MUX_uxn_c_l287_c2_06ba_return_output;

     -- Submodule level 14
     REG_VAR_result := VAR_result_MUX_uxn_c_l287_c2_06ba_return_output;
     VAR_return_output := VAR_result_MUX_uxn_c_l287_c2_06ba_return_output;
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
