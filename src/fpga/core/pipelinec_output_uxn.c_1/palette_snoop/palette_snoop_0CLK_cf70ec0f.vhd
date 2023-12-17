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
-- Submodules: 80
entity palette_snoop_0CLK_cf70ec0f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_ram_address : in unsigned(7 downto 0);
 device_ram_value : in unsigned(7 downto 0);
 is_device_ram_write : in unsigned(0 downto 0);
 gpu_step_color : in unsigned(1 downto 0);
 return_output : out unsigned(15 downto 0));
end palette_snoop_0CLK_cf70ec0f;
architecture arch of palette_snoop_0CLK_cf70ec0f is
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
signal REG_COMB_color0 : unsigned(11 downto 0);
signal REG_COMB_color1 : unsigned(11 downto 0);
signal REG_COMB_color2 : unsigned(11 downto 0);
signal REG_COMB_color3 : unsigned(11 downto 0);

-- Each function instance gets signals
-- CONST_SR_4[uxn_c_l208_c30_0092]
signal CONST_SR_4_uxn_c_l208_c30_0092_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l208_c30_0092_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l208_c30_e16f]
signal BIN_OP_EQ_uxn_c_l208_c30_e16f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l208_c30_e16f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l208_c30_e16f_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l208_c30_a611]
signal MUX_uxn_c_l208_c30_a611_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l208_c30_a611_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l208_c30_a611_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l208_c30_a611_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l210_c6_e6aa]
signal BIN_OP_AND_uxn_c_l210_c6_e6aa_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l210_c6_e6aa_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l210_c6_e6aa_return_output : unsigned(0 downto 0);

-- color0_MUX[uxn_c_l210_c2_3a91]
signal color0_MUX_uxn_c_l210_c2_3a91_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l210_c2_3a91_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l210_c2_3a91_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l210_c2_3a91_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l210_c2_3a91]
signal color2_MUX_uxn_c_l210_c2_3a91_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l210_c2_3a91_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l210_c2_3a91_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l210_c2_3a91_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l210_c2_3a91]
signal color1_MUX_uxn_c_l210_c2_3a91_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l210_c2_3a91_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l210_c2_3a91_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l210_c2_3a91_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l210_c2_3a91]
signal color3_MUX_uxn_c_l210_c2_3a91_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l210_c2_3a91_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l210_c2_3a91_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l210_c2_3a91_return_output : unsigned(11 downto 0);

-- CONST_SR_4[uxn_c_l212_c35_d993]
signal CONST_SR_4_uxn_c_l212_c35_d993_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_c_l212_c35_d993_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l214_c7_742d]
signal BIN_OP_EQ_uxn_c_l214_c7_742d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l214_c7_742d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l214_c7_742d_return_output : unsigned(0 downto 0);

-- color0_MUX[uxn_c_l214_c3_56dd]
signal color0_MUX_uxn_c_l214_c3_56dd_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l214_c3_56dd_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l214_c3_56dd_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l214_c3_56dd_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l214_c3_56dd]
signal color2_MUX_uxn_c_l214_c3_56dd_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l214_c3_56dd_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l214_c3_56dd_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l214_c3_56dd_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l214_c3_56dd]
signal color1_MUX_uxn_c_l214_c3_56dd_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l214_c3_56dd_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l214_c3_56dd_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l214_c3_56dd_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l214_c3_56dd]
signal color3_MUX_uxn_c_l214_c3_56dd_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l214_c3_56dd_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l214_c3_56dd_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l214_c3_56dd_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l216_c4_0ed0]
signal CONST_SL_8_uxn_c_l216_c4_0ed0_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l216_c4_0ed0_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l217_c4_7aa4]
signal BIN_OP_AND_uxn_c_l217_c4_7aa4_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l217_c4_7aa4_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l217_c4_7aa4_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l218_c4_101f]
signal BIN_OP_OR_uxn_c_l218_c4_101f_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l218_c4_101f_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l218_c4_101f_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l221_c4_71d5]
signal CONST_SL_8_uxn_c_l221_c4_71d5_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l221_c4_71d5_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l222_c4_8f3a]
signal BIN_OP_AND_uxn_c_l222_c4_8f3a_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l222_c4_8f3a_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l222_c4_8f3a_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l223_c4_8397]
signal BIN_OP_OR_uxn_c_l223_c4_8397_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l223_c4_8397_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l223_c4_8397_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l225_c12_1f90]
signal BIN_OP_EQ_uxn_c_l225_c12_1f90_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l225_c12_1f90_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l225_c12_1f90_return_output : unsigned(0 downto 0);

-- color0_MUX[uxn_c_l225_c8_dd3f]
signal color0_MUX_uxn_c_l225_c8_dd3f_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l225_c8_dd3f_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l225_c8_dd3f_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l225_c8_dd3f_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l225_c8_dd3f]
signal color2_MUX_uxn_c_l225_c8_dd3f_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l225_c8_dd3f_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l225_c8_dd3f_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l225_c8_dd3f_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l225_c8_dd3f]
signal color1_MUX_uxn_c_l225_c8_dd3f_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l225_c8_dd3f_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l225_c8_dd3f_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l225_c8_dd3f_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l225_c8_dd3f]
signal color3_MUX_uxn_c_l225_c8_dd3f_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l225_c8_dd3f_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l225_c8_dd3f_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l225_c8_dd3f_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l227_c4_1204]
signal CONST_SL_8_uxn_c_l227_c4_1204_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l227_c4_1204_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l228_c4_f06f]
signal BIN_OP_AND_uxn_c_l228_c4_f06f_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l228_c4_f06f_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l228_c4_f06f_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l229_c4_7b56]
signal BIN_OP_OR_uxn_c_l229_c4_7b56_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l229_c4_7b56_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l229_c4_7b56_return_output : unsigned(11 downto 0);

-- CONST_SL_8[uxn_c_l232_c4_a0bf]
signal CONST_SL_8_uxn_c_l232_c4_a0bf_x : unsigned(11 downto 0);
signal CONST_SL_8_uxn_c_l232_c4_a0bf_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l233_c4_234d]
signal BIN_OP_AND_uxn_c_l233_c4_234d_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l233_c4_234d_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l233_c4_234d_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l234_c4_1396]
signal BIN_OP_OR_uxn_c_l234_c4_1396_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l234_c4_1396_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l234_c4_1396_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l236_c12_4ede]
signal BIN_OP_EQ_uxn_c_l236_c12_4ede_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l236_c12_4ede_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l236_c12_4ede_return_output : unsigned(0 downto 0);

-- color0_MUX[uxn_c_l236_c8_ed67]
signal color0_MUX_uxn_c_l236_c8_ed67_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l236_c8_ed67_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l236_c8_ed67_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l236_c8_ed67_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l236_c8_ed67]
signal color2_MUX_uxn_c_l236_c8_ed67_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l236_c8_ed67_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l236_c8_ed67_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l236_c8_ed67_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l236_c8_ed67]
signal color1_MUX_uxn_c_l236_c8_ed67_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l236_c8_ed67_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l236_c8_ed67_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l236_c8_ed67_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l236_c8_ed67]
signal color3_MUX_uxn_c_l236_c8_ed67_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l236_c8_ed67_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l236_c8_ed67_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l236_c8_ed67_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l238_c4_0cc6]
signal CONST_SL_4_uxn_c_l238_c4_0cc6_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l238_c4_0cc6_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l239_c4_a782]
signal BIN_OP_AND_uxn_c_l239_c4_a782_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l239_c4_a782_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l239_c4_a782_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l240_c4_fdb4]
signal BIN_OP_OR_uxn_c_l240_c4_fdb4_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l240_c4_fdb4_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l240_c4_fdb4_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l243_c4_f0c4]
signal CONST_SL_4_uxn_c_l243_c4_f0c4_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l243_c4_f0c4_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l244_c4_9c62]
signal BIN_OP_AND_uxn_c_l244_c4_9c62_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l244_c4_9c62_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l244_c4_9c62_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l245_c4_bc8c]
signal BIN_OP_OR_uxn_c_l245_c4_bc8c_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l245_c4_bc8c_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l245_c4_bc8c_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l247_c12_71e2]
signal BIN_OP_EQ_uxn_c_l247_c12_71e2_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l247_c12_71e2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l247_c12_71e2_return_output : unsigned(0 downto 0);

-- color0_MUX[uxn_c_l247_c8_a61c]
signal color0_MUX_uxn_c_l247_c8_a61c_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l247_c8_a61c_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l247_c8_a61c_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l247_c8_a61c_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l247_c8_a61c]
signal color2_MUX_uxn_c_l247_c8_a61c_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l247_c8_a61c_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l247_c8_a61c_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l247_c8_a61c_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l247_c8_a61c]
signal color1_MUX_uxn_c_l247_c8_a61c_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l247_c8_a61c_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l247_c8_a61c_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l247_c8_a61c_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l247_c8_a61c]
signal color3_MUX_uxn_c_l247_c8_a61c_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l247_c8_a61c_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l247_c8_a61c_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l247_c8_a61c_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l249_c4_c173]
signal CONST_SL_4_uxn_c_l249_c4_c173_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l249_c4_c173_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l250_c4_8a7a]
signal BIN_OP_AND_uxn_c_l250_c4_8a7a_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l250_c4_8a7a_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l250_c4_8a7a_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l251_c4_323a]
signal BIN_OP_OR_uxn_c_l251_c4_323a_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l251_c4_323a_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l251_c4_323a_return_output : unsigned(11 downto 0);

-- CONST_SL_4[uxn_c_l254_c4_1d57]
signal CONST_SL_4_uxn_c_l254_c4_1d57_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_c_l254_c4_1d57_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l255_c4_9726]
signal BIN_OP_AND_uxn_c_l255_c4_9726_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l255_c4_9726_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l255_c4_9726_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l256_c4_aa20]
signal BIN_OP_OR_uxn_c_l256_c4_aa20_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l256_c4_aa20_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l256_c4_aa20_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l258_c12_b7ec]
signal BIN_OP_EQ_uxn_c_l258_c12_b7ec_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l258_c12_b7ec_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l258_c12_b7ec_return_output : unsigned(0 downto 0);

-- color0_MUX[uxn_c_l258_c8_d8df]
signal color0_MUX_uxn_c_l258_c8_d8df_cond : unsigned(0 downto 0);
signal color0_MUX_uxn_c_l258_c8_d8df_iftrue : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l258_c8_d8df_iffalse : unsigned(11 downto 0);
signal color0_MUX_uxn_c_l258_c8_d8df_return_output : unsigned(11 downto 0);

-- color2_MUX[uxn_c_l258_c8_d8df]
signal color2_MUX_uxn_c_l258_c8_d8df_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l258_c8_d8df_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l258_c8_d8df_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l258_c8_d8df_return_output : unsigned(11 downto 0);

-- color1_MUX[uxn_c_l258_c8_d8df]
signal color1_MUX_uxn_c_l258_c8_d8df_cond : unsigned(0 downto 0);
signal color1_MUX_uxn_c_l258_c8_d8df_iftrue : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l258_c8_d8df_iffalse : unsigned(11 downto 0);
signal color1_MUX_uxn_c_l258_c8_d8df_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l258_c8_d8df]
signal color3_MUX_uxn_c_l258_c8_d8df_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l258_c8_d8df_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l258_c8_d8df_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l258_c8_d8df_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l260_c4_2d4c]
signal BIN_OP_AND_uxn_c_l260_c4_2d4c_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l260_c4_2d4c_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l260_c4_2d4c_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l261_c4_9b16]
signal BIN_OP_OR_uxn_c_l261_c4_9b16_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l261_c4_9b16_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l261_c4_9b16_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l264_c4_3b17]
signal BIN_OP_AND_uxn_c_l264_c4_3b17_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l264_c4_3b17_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l264_c4_3b17_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l265_c4_c611]
signal BIN_OP_OR_uxn_c_l265_c4_c611_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l265_c4_c611_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l265_c4_c611_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l267_c12_cc4a]
signal BIN_OP_EQ_uxn_c_l267_c12_cc4a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l267_c12_cc4a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l267_c12_cc4a_return_output : unsigned(0 downto 0);

-- color2_MUX[uxn_c_l267_c8_b4f1]
signal color2_MUX_uxn_c_l267_c8_b4f1_cond : unsigned(0 downto 0);
signal color2_MUX_uxn_c_l267_c8_b4f1_iftrue : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l267_c8_b4f1_iffalse : unsigned(11 downto 0);
signal color2_MUX_uxn_c_l267_c8_b4f1_return_output : unsigned(11 downto 0);

-- color3_MUX[uxn_c_l267_c8_b4f1]
signal color3_MUX_uxn_c_l267_c8_b4f1_cond : unsigned(0 downto 0);
signal color3_MUX_uxn_c_l267_c8_b4f1_iftrue : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l267_c8_b4f1_iffalse : unsigned(11 downto 0);
signal color3_MUX_uxn_c_l267_c8_b4f1_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l269_c4_d99f]
signal BIN_OP_AND_uxn_c_l269_c4_d99f_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l269_c4_d99f_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l269_c4_d99f_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l270_c4_a100]
signal BIN_OP_OR_uxn_c_l270_c4_a100_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l270_c4_a100_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l270_c4_a100_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_c_l273_c4_61cd]
signal BIN_OP_AND_uxn_c_l273_c4_61cd_left : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l273_c4_61cd_right : unsigned(11 downto 0);
signal BIN_OP_AND_uxn_c_l273_c4_61cd_return_output : unsigned(11 downto 0);

-- BIN_OP_OR[uxn_c_l274_c4_794e]
signal BIN_OP_OR_uxn_c_l274_c4_794e_left : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l274_c4_794e_right : unsigned(11 downto 0);
signal BIN_OP_OR_uxn_c_l274_c4_794e_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l278_c6_bb33]
signal BIN_OP_EQ_uxn_c_l278_c6_bb33_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l278_c6_bb33_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l278_c6_bb33_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l278_c2_1d34]
signal result_MUX_uxn_c_l278_c2_1d34_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l278_c2_1d34_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l278_c2_1d34_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l278_c2_1d34_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l280_c13_cf02]
signal BIN_OP_EQ_uxn_c_l280_c13_cf02_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l280_c13_cf02_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l280_c13_cf02_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l280_c9_e221]
signal result_MUX_uxn_c_l280_c9_e221_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l280_c9_e221_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l280_c9_e221_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l280_c9_e221_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l282_c13_20a6]
signal BIN_OP_EQ_uxn_c_l282_c13_20a6_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l282_c13_20a6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l282_c13_20a6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l282_c9_b3e6]
signal result_MUX_uxn_c_l282_c9_b3e6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l282_c9_b3e6_iftrue : unsigned(15 downto 0);
signal result_MUX_uxn_c_l282_c9_b3e6_iffalse : unsigned(15 downto 0);
signal result_MUX_uxn_c_l282_c9_b3e6_return_output : unsigned(15 downto 0);

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
-- CONST_SR_4_uxn_c_l208_c30_0092
CONST_SR_4_uxn_c_l208_c30_0092 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l208_c30_0092_x,
CONST_SR_4_uxn_c_l208_c30_0092_return_output);

-- BIN_OP_EQ_uxn_c_l208_c30_e16f
BIN_OP_EQ_uxn_c_l208_c30_e16f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l208_c30_e16f_left,
BIN_OP_EQ_uxn_c_l208_c30_e16f_right,
BIN_OP_EQ_uxn_c_l208_c30_e16f_return_output);

-- MUX_uxn_c_l208_c30_a611
MUX_uxn_c_l208_c30_a611 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l208_c30_a611_cond,
MUX_uxn_c_l208_c30_a611_iftrue,
MUX_uxn_c_l208_c30_a611_iffalse,
MUX_uxn_c_l208_c30_a611_return_output);

-- BIN_OP_AND_uxn_c_l210_c6_e6aa
BIN_OP_AND_uxn_c_l210_c6_e6aa : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l210_c6_e6aa_left,
BIN_OP_AND_uxn_c_l210_c6_e6aa_right,
BIN_OP_AND_uxn_c_l210_c6_e6aa_return_output);

-- color0_MUX_uxn_c_l210_c2_3a91
color0_MUX_uxn_c_l210_c2_3a91 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l210_c2_3a91_cond,
color0_MUX_uxn_c_l210_c2_3a91_iftrue,
color0_MUX_uxn_c_l210_c2_3a91_iffalse,
color0_MUX_uxn_c_l210_c2_3a91_return_output);

-- color2_MUX_uxn_c_l210_c2_3a91
color2_MUX_uxn_c_l210_c2_3a91 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l210_c2_3a91_cond,
color2_MUX_uxn_c_l210_c2_3a91_iftrue,
color2_MUX_uxn_c_l210_c2_3a91_iffalse,
color2_MUX_uxn_c_l210_c2_3a91_return_output);

-- color1_MUX_uxn_c_l210_c2_3a91
color1_MUX_uxn_c_l210_c2_3a91 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l210_c2_3a91_cond,
color1_MUX_uxn_c_l210_c2_3a91_iftrue,
color1_MUX_uxn_c_l210_c2_3a91_iffalse,
color1_MUX_uxn_c_l210_c2_3a91_return_output);

-- color3_MUX_uxn_c_l210_c2_3a91
color3_MUX_uxn_c_l210_c2_3a91 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l210_c2_3a91_cond,
color3_MUX_uxn_c_l210_c2_3a91_iftrue,
color3_MUX_uxn_c_l210_c2_3a91_iffalse,
color3_MUX_uxn_c_l210_c2_3a91_return_output);

-- CONST_SR_4_uxn_c_l212_c35_d993
CONST_SR_4_uxn_c_l212_c35_d993 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_c_l212_c35_d993_x,
CONST_SR_4_uxn_c_l212_c35_d993_return_output);

-- BIN_OP_EQ_uxn_c_l214_c7_742d
BIN_OP_EQ_uxn_c_l214_c7_742d : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l214_c7_742d_left,
BIN_OP_EQ_uxn_c_l214_c7_742d_right,
BIN_OP_EQ_uxn_c_l214_c7_742d_return_output);

-- color0_MUX_uxn_c_l214_c3_56dd
color0_MUX_uxn_c_l214_c3_56dd : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l214_c3_56dd_cond,
color0_MUX_uxn_c_l214_c3_56dd_iftrue,
color0_MUX_uxn_c_l214_c3_56dd_iffalse,
color0_MUX_uxn_c_l214_c3_56dd_return_output);

-- color2_MUX_uxn_c_l214_c3_56dd
color2_MUX_uxn_c_l214_c3_56dd : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l214_c3_56dd_cond,
color2_MUX_uxn_c_l214_c3_56dd_iftrue,
color2_MUX_uxn_c_l214_c3_56dd_iffalse,
color2_MUX_uxn_c_l214_c3_56dd_return_output);

-- color1_MUX_uxn_c_l214_c3_56dd
color1_MUX_uxn_c_l214_c3_56dd : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l214_c3_56dd_cond,
color1_MUX_uxn_c_l214_c3_56dd_iftrue,
color1_MUX_uxn_c_l214_c3_56dd_iffalse,
color1_MUX_uxn_c_l214_c3_56dd_return_output);

-- color3_MUX_uxn_c_l214_c3_56dd
color3_MUX_uxn_c_l214_c3_56dd : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l214_c3_56dd_cond,
color3_MUX_uxn_c_l214_c3_56dd_iftrue,
color3_MUX_uxn_c_l214_c3_56dd_iffalse,
color3_MUX_uxn_c_l214_c3_56dd_return_output);

-- CONST_SL_8_uxn_c_l216_c4_0ed0
CONST_SL_8_uxn_c_l216_c4_0ed0 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l216_c4_0ed0_x,
CONST_SL_8_uxn_c_l216_c4_0ed0_return_output);

-- BIN_OP_AND_uxn_c_l217_c4_7aa4
BIN_OP_AND_uxn_c_l217_c4_7aa4 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l217_c4_7aa4_left,
BIN_OP_AND_uxn_c_l217_c4_7aa4_right,
BIN_OP_AND_uxn_c_l217_c4_7aa4_return_output);

-- BIN_OP_OR_uxn_c_l218_c4_101f
BIN_OP_OR_uxn_c_l218_c4_101f : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l218_c4_101f_left,
BIN_OP_OR_uxn_c_l218_c4_101f_right,
BIN_OP_OR_uxn_c_l218_c4_101f_return_output);

-- CONST_SL_8_uxn_c_l221_c4_71d5
CONST_SL_8_uxn_c_l221_c4_71d5 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l221_c4_71d5_x,
CONST_SL_8_uxn_c_l221_c4_71d5_return_output);

-- BIN_OP_AND_uxn_c_l222_c4_8f3a
BIN_OP_AND_uxn_c_l222_c4_8f3a : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l222_c4_8f3a_left,
BIN_OP_AND_uxn_c_l222_c4_8f3a_right,
BIN_OP_AND_uxn_c_l222_c4_8f3a_return_output);

-- BIN_OP_OR_uxn_c_l223_c4_8397
BIN_OP_OR_uxn_c_l223_c4_8397 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l223_c4_8397_left,
BIN_OP_OR_uxn_c_l223_c4_8397_right,
BIN_OP_OR_uxn_c_l223_c4_8397_return_output);

-- BIN_OP_EQ_uxn_c_l225_c12_1f90
BIN_OP_EQ_uxn_c_l225_c12_1f90 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l225_c12_1f90_left,
BIN_OP_EQ_uxn_c_l225_c12_1f90_right,
BIN_OP_EQ_uxn_c_l225_c12_1f90_return_output);

-- color0_MUX_uxn_c_l225_c8_dd3f
color0_MUX_uxn_c_l225_c8_dd3f : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l225_c8_dd3f_cond,
color0_MUX_uxn_c_l225_c8_dd3f_iftrue,
color0_MUX_uxn_c_l225_c8_dd3f_iffalse,
color0_MUX_uxn_c_l225_c8_dd3f_return_output);

-- color2_MUX_uxn_c_l225_c8_dd3f
color2_MUX_uxn_c_l225_c8_dd3f : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l225_c8_dd3f_cond,
color2_MUX_uxn_c_l225_c8_dd3f_iftrue,
color2_MUX_uxn_c_l225_c8_dd3f_iffalse,
color2_MUX_uxn_c_l225_c8_dd3f_return_output);

-- color1_MUX_uxn_c_l225_c8_dd3f
color1_MUX_uxn_c_l225_c8_dd3f : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l225_c8_dd3f_cond,
color1_MUX_uxn_c_l225_c8_dd3f_iftrue,
color1_MUX_uxn_c_l225_c8_dd3f_iffalse,
color1_MUX_uxn_c_l225_c8_dd3f_return_output);

-- color3_MUX_uxn_c_l225_c8_dd3f
color3_MUX_uxn_c_l225_c8_dd3f : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l225_c8_dd3f_cond,
color3_MUX_uxn_c_l225_c8_dd3f_iftrue,
color3_MUX_uxn_c_l225_c8_dd3f_iffalse,
color3_MUX_uxn_c_l225_c8_dd3f_return_output);

-- CONST_SL_8_uxn_c_l227_c4_1204
CONST_SL_8_uxn_c_l227_c4_1204 : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l227_c4_1204_x,
CONST_SL_8_uxn_c_l227_c4_1204_return_output);

-- BIN_OP_AND_uxn_c_l228_c4_f06f
BIN_OP_AND_uxn_c_l228_c4_f06f : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l228_c4_f06f_left,
BIN_OP_AND_uxn_c_l228_c4_f06f_right,
BIN_OP_AND_uxn_c_l228_c4_f06f_return_output);

-- BIN_OP_OR_uxn_c_l229_c4_7b56
BIN_OP_OR_uxn_c_l229_c4_7b56 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l229_c4_7b56_left,
BIN_OP_OR_uxn_c_l229_c4_7b56_right,
BIN_OP_OR_uxn_c_l229_c4_7b56_return_output);

-- CONST_SL_8_uxn_c_l232_c4_a0bf
CONST_SL_8_uxn_c_l232_c4_a0bf : entity work.CONST_SL_8_uint12_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l232_c4_a0bf_x,
CONST_SL_8_uxn_c_l232_c4_a0bf_return_output);

-- BIN_OP_AND_uxn_c_l233_c4_234d
BIN_OP_AND_uxn_c_l233_c4_234d : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l233_c4_234d_left,
BIN_OP_AND_uxn_c_l233_c4_234d_right,
BIN_OP_AND_uxn_c_l233_c4_234d_return_output);

-- BIN_OP_OR_uxn_c_l234_c4_1396
BIN_OP_OR_uxn_c_l234_c4_1396 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l234_c4_1396_left,
BIN_OP_OR_uxn_c_l234_c4_1396_right,
BIN_OP_OR_uxn_c_l234_c4_1396_return_output);

-- BIN_OP_EQ_uxn_c_l236_c12_4ede
BIN_OP_EQ_uxn_c_l236_c12_4ede : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l236_c12_4ede_left,
BIN_OP_EQ_uxn_c_l236_c12_4ede_right,
BIN_OP_EQ_uxn_c_l236_c12_4ede_return_output);

-- color0_MUX_uxn_c_l236_c8_ed67
color0_MUX_uxn_c_l236_c8_ed67 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l236_c8_ed67_cond,
color0_MUX_uxn_c_l236_c8_ed67_iftrue,
color0_MUX_uxn_c_l236_c8_ed67_iffalse,
color0_MUX_uxn_c_l236_c8_ed67_return_output);

-- color2_MUX_uxn_c_l236_c8_ed67
color2_MUX_uxn_c_l236_c8_ed67 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l236_c8_ed67_cond,
color2_MUX_uxn_c_l236_c8_ed67_iftrue,
color2_MUX_uxn_c_l236_c8_ed67_iffalse,
color2_MUX_uxn_c_l236_c8_ed67_return_output);

-- color1_MUX_uxn_c_l236_c8_ed67
color1_MUX_uxn_c_l236_c8_ed67 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l236_c8_ed67_cond,
color1_MUX_uxn_c_l236_c8_ed67_iftrue,
color1_MUX_uxn_c_l236_c8_ed67_iffalse,
color1_MUX_uxn_c_l236_c8_ed67_return_output);

-- color3_MUX_uxn_c_l236_c8_ed67
color3_MUX_uxn_c_l236_c8_ed67 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l236_c8_ed67_cond,
color3_MUX_uxn_c_l236_c8_ed67_iftrue,
color3_MUX_uxn_c_l236_c8_ed67_iffalse,
color3_MUX_uxn_c_l236_c8_ed67_return_output);

-- CONST_SL_4_uxn_c_l238_c4_0cc6
CONST_SL_4_uxn_c_l238_c4_0cc6 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l238_c4_0cc6_x,
CONST_SL_4_uxn_c_l238_c4_0cc6_return_output);

-- BIN_OP_AND_uxn_c_l239_c4_a782
BIN_OP_AND_uxn_c_l239_c4_a782 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l239_c4_a782_left,
BIN_OP_AND_uxn_c_l239_c4_a782_right,
BIN_OP_AND_uxn_c_l239_c4_a782_return_output);

-- BIN_OP_OR_uxn_c_l240_c4_fdb4
BIN_OP_OR_uxn_c_l240_c4_fdb4 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l240_c4_fdb4_left,
BIN_OP_OR_uxn_c_l240_c4_fdb4_right,
BIN_OP_OR_uxn_c_l240_c4_fdb4_return_output);

-- CONST_SL_4_uxn_c_l243_c4_f0c4
CONST_SL_4_uxn_c_l243_c4_f0c4 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l243_c4_f0c4_x,
CONST_SL_4_uxn_c_l243_c4_f0c4_return_output);

-- BIN_OP_AND_uxn_c_l244_c4_9c62
BIN_OP_AND_uxn_c_l244_c4_9c62 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l244_c4_9c62_left,
BIN_OP_AND_uxn_c_l244_c4_9c62_right,
BIN_OP_AND_uxn_c_l244_c4_9c62_return_output);

-- BIN_OP_OR_uxn_c_l245_c4_bc8c
BIN_OP_OR_uxn_c_l245_c4_bc8c : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l245_c4_bc8c_left,
BIN_OP_OR_uxn_c_l245_c4_bc8c_right,
BIN_OP_OR_uxn_c_l245_c4_bc8c_return_output);

-- BIN_OP_EQ_uxn_c_l247_c12_71e2
BIN_OP_EQ_uxn_c_l247_c12_71e2 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l247_c12_71e2_left,
BIN_OP_EQ_uxn_c_l247_c12_71e2_right,
BIN_OP_EQ_uxn_c_l247_c12_71e2_return_output);

-- color0_MUX_uxn_c_l247_c8_a61c
color0_MUX_uxn_c_l247_c8_a61c : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l247_c8_a61c_cond,
color0_MUX_uxn_c_l247_c8_a61c_iftrue,
color0_MUX_uxn_c_l247_c8_a61c_iffalse,
color0_MUX_uxn_c_l247_c8_a61c_return_output);

-- color2_MUX_uxn_c_l247_c8_a61c
color2_MUX_uxn_c_l247_c8_a61c : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l247_c8_a61c_cond,
color2_MUX_uxn_c_l247_c8_a61c_iftrue,
color2_MUX_uxn_c_l247_c8_a61c_iffalse,
color2_MUX_uxn_c_l247_c8_a61c_return_output);

-- color1_MUX_uxn_c_l247_c8_a61c
color1_MUX_uxn_c_l247_c8_a61c : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l247_c8_a61c_cond,
color1_MUX_uxn_c_l247_c8_a61c_iftrue,
color1_MUX_uxn_c_l247_c8_a61c_iffalse,
color1_MUX_uxn_c_l247_c8_a61c_return_output);

-- color3_MUX_uxn_c_l247_c8_a61c
color3_MUX_uxn_c_l247_c8_a61c : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l247_c8_a61c_cond,
color3_MUX_uxn_c_l247_c8_a61c_iftrue,
color3_MUX_uxn_c_l247_c8_a61c_iffalse,
color3_MUX_uxn_c_l247_c8_a61c_return_output);

-- CONST_SL_4_uxn_c_l249_c4_c173
CONST_SL_4_uxn_c_l249_c4_c173 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l249_c4_c173_x,
CONST_SL_4_uxn_c_l249_c4_c173_return_output);

-- BIN_OP_AND_uxn_c_l250_c4_8a7a
BIN_OP_AND_uxn_c_l250_c4_8a7a : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l250_c4_8a7a_left,
BIN_OP_AND_uxn_c_l250_c4_8a7a_right,
BIN_OP_AND_uxn_c_l250_c4_8a7a_return_output);

-- BIN_OP_OR_uxn_c_l251_c4_323a
BIN_OP_OR_uxn_c_l251_c4_323a : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l251_c4_323a_left,
BIN_OP_OR_uxn_c_l251_c4_323a_right,
BIN_OP_OR_uxn_c_l251_c4_323a_return_output);

-- CONST_SL_4_uxn_c_l254_c4_1d57
CONST_SL_4_uxn_c_l254_c4_1d57 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_c_l254_c4_1d57_x,
CONST_SL_4_uxn_c_l254_c4_1d57_return_output);

-- BIN_OP_AND_uxn_c_l255_c4_9726
BIN_OP_AND_uxn_c_l255_c4_9726 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l255_c4_9726_left,
BIN_OP_AND_uxn_c_l255_c4_9726_right,
BIN_OP_AND_uxn_c_l255_c4_9726_return_output);

-- BIN_OP_OR_uxn_c_l256_c4_aa20
BIN_OP_OR_uxn_c_l256_c4_aa20 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l256_c4_aa20_left,
BIN_OP_OR_uxn_c_l256_c4_aa20_right,
BIN_OP_OR_uxn_c_l256_c4_aa20_return_output);

-- BIN_OP_EQ_uxn_c_l258_c12_b7ec
BIN_OP_EQ_uxn_c_l258_c12_b7ec : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l258_c12_b7ec_left,
BIN_OP_EQ_uxn_c_l258_c12_b7ec_right,
BIN_OP_EQ_uxn_c_l258_c12_b7ec_return_output);

-- color0_MUX_uxn_c_l258_c8_d8df
color0_MUX_uxn_c_l258_c8_d8df : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color0_MUX_uxn_c_l258_c8_d8df_cond,
color0_MUX_uxn_c_l258_c8_d8df_iftrue,
color0_MUX_uxn_c_l258_c8_d8df_iffalse,
color0_MUX_uxn_c_l258_c8_d8df_return_output);

-- color2_MUX_uxn_c_l258_c8_d8df
color2_MUX_uxn_c_l258_c8_d8df : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l258_c8_d8df_cond,
color2_MUX_uxn_c_l258_c8_d8df_iftrue,
color2_MUX_uxn_c_l258_c8_d8df_iffalse,
color2_MUX_uxn_c_l258_c8_d8df_return_output);

-- color1_MUX_uxn_c_l258_c8_d8df
color1_MUX_uxn_c_l258_c8_d8df : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color1_MUX_uxn_c_l258_c8_d8df_cond,
color1_MUX_uxn_c_l258_c8_d8df_iftrue,
color1_MUX_uxn_c_l258_c8_d8df_iffalse,
color1_MUX_uxn_c_l258_c8_d8df_return_output);

-- color3_MUX_uxn_c_l258_c8_d8df
color3_MUX_uxn_c_l258_c8_d8df : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l258_c8_d8df_cond,
color3_MUX_uxn_c_l258_c8_d8df_iftrue,
color3_MUX_uxn_c_l258_c8_d8df_iffalse,
color3_MUX_uxn_c_l258_c8_d8df_return_output);

-- BIN_OP_AND_uxn_c_l260_c4_2d4c
BIN_OP_AND_uxn_c_l260_c4_2d4c : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l260_c4_2d4c_left,
BIN_OP_AND_uxn_c_l260_c4_2d4c_right,
BIN_OP_AND_uxn_c_l260_c4_2d4c_return_output);

-- BIN_OP_OR_uxn_c_l261_c4_9b16
BIN_OP_OR_uxn_c_l261_c4_9b16 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l261_c4_9b16_left,
BIN_OP_OR_uxn_c_l261_c4_9b16_right,
BIN_OP_OR_uxn_c_l261_c4_9b16_return_output);

-- BIN_OP_AND_uxn_c_l264_c4_3b17
BIN_OP_AND_uxn_c_l264_c4_3b17 : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l264_c4_3b17_left,
BIN_OP_AND_uxn_c_l264_c4_3b17_right,
BIN_OP_AND_uxn_c_l264_c4_3b17_return_output);

-- BIN_OP_OR_uxn_c_l265_c4_c611
BIN_OP_OR_uxn_c_l265_c4_c611 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l265_c4_c611_left,
BIN_OP_OR_uxn_c_l265_c4_c611_right,
BIN_OP_OR_uxn_c_l265_c4_c611_return_output);

-- BIN_OP_EQ_uxn_c_l267_c12_cc4a
BIN_OP_EQ_uxn_c_l267_c12_cc4a : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l267_c12_cc4a_left,
BIN_OP_EQ_uxn_c_l267_c12_cc4a_right,
BIN_OP_EQ_uxn_c_l267_c12_cc4a_return_output);

-- color2_MUX_uxn_c_l267_c8_b4f1
color2_MUX_uxn_c_l267_c8_b4f1 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color2_MUX_uxn_c_l267_c8_b4f1_cond,
color2_MUX_uxn_c_l267_c8_b4f1_iftrue,
color2_MUX_uxn_c_l267_c8_b4f1_iffalse,
color2_MUX_uxn_c_l267_c8_b4f1_return_output);

-- color3_MUX_uxn_c_l267_c8_b4f1
color3_MUX_uxn_c_l267_c8_b4f1 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
color3_MUX_uxn_c_l267_c8_b4f1_cond,
color3_MUX_uxn_c_l267_c8_b4f1_iftrue,
color3_MUX_uxn_c_l267_c8_b4f1_iffalse,
color3_MUX_uxn_c_l267_c8_b4f1_return_output);

-- BIN_OP_AND_uxn_c_l269_c4_d99f
BIN_OP_AND_uxn_c_l269_c4_d99f : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l269_c4_d99f_left,
BIN_OP_AND_uxn_c_l269_c4_d99f_right,
BIN_OP_AND_uxn_c_l269_c4_d99f_return_output);

-- BIN_OP_OR_uxn_c_l270_c4_a100
BIN_OP_OR_uxn_c_l270_c4_a100 : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l270_c4_a100_left,
BIN_OP_OR_uxn_c_l270_c4_a100_right,
BIN_OP_OR_uxn_c_l270_c4_a100_return_output);

-- BIN_OP_AND_uxn_c_l273_c4_61cd
BIN_OP_AND_uxn_c_l273_c4_61cd : entity work.BIN_OP_AND_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l273_c4_61cd_left,
BIN_OP_AND_uxn_c_l273_c4_61cd_right,
BIN_OP_AND_uxn_c_l273_c4_61cd_return_output);

-- BIN_OP_OR_uxn_c_l274_c4_794e
BIN_OP_OR_uxn_c_l274_c4_794e : entity work.BIN_OP_OR_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l274_c4_794e_left,
BIN_OP_OR_uxn_c_l274_c4_794e_right,
BIN_OP_OR_uxn_c_l274_c4_794e_return_output);

-- BIN_OP_EQ_uxn_c_l278_c6_bb33
BIN_OP_EQ_uxn_c_l278_c6_bb33 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l278_c6_bb33_left,
BIN_OP_EQ_uxn_c_l278_c6_bb33_right,
BIN_OP_EQ_uxn_c_l278_c6_bb33_return_output);

-- result_MUX_uxn_c_l278_c2_1d34
result_MUX_uxn_c_l278_c2_1d34 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l278_c2_1d34_cond,
result_MUX_uxn_c_l278_c2_1d34_iftrue,
result_MUX_uxn_c_l278_c2_1d34_iffalse,
result_MUX_uxn_c_l278_c2_1d34_return_output);

-- BIN_OP_EQ_uxn_c_l280_c13_cf02
BIN_OP_EQ_uxn_c_l280_c13_cf02 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l280_c13_cf02_left,
BIN_OP_EQ_uxn_c_l280_c13_cf02_right,
BIN_OP_EQ_uxn_c_l280_c13_cf02_return_output);

-- result_MUX_uxn_c_l280_c9_e221
result_MUX_uxn_c_l280_c9_e221 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l280_c9_e221_cond,
result_MUX_uxn_c_l280_c9_e221_iftrue,
result_MUX_uxn_c_l280_c9_e221_iffalse,
result_MUX_uxn_c_l280_c9_e221_return_output);

-- BIN_OP_EQ_uxn_c_l282_c13_20a6
BIN_OP_EQ_uxn_c_l282_c13_20a6 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l282_c13_20a6_left,
BIN_OP_EQ_uxn_c_l282_c13_20a6_right,
BIN_OP_EQ_uxn_c_l282_c13_20a6_return_output);

-- result_MUX_uxn_c_l282_c9_b3e6
result_MUX_uxn_c_l282_c9_b3e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l282_c9_b3e6_cond,
result_MUX_uxn_c_l282_c9_b3e6_iftrue,
result_MUX_uxn_c_l282_c9_b3e6_iffalse,
result_MUX_uxn_c_l282_c9_b3e6_return_output);



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
 -- All submodule outputs
 CONST_SR_4_uxn_c_l208_c30_0092_return_output,
 BIN_OP_EQ_uxn_c_l208_c30_e16f_return_output,
 MUX_uxn_c_l208_c30_a611_return_output,
 BIN_OP_AND_uxn_c_l210_c6_e6aa_return_output,
 color0_MUX_uxn_c_l210_c2_3a91_return_output,
 color2_MUX_uxn_c_l210_c2_3a91_return_output,
 color1_MUX_uxn_c_l210_c2_3a91_return_output,
 color3_MUX_uxn_c_l210_c2_3a91_return_output,
 CONST_SR_4_uxn_c_l212_c35_d993_return_output,
 BIN_OP_EQ_uxn_c_l214_c7_742d_return_output,
 color0_MUX_uxn_c_l214_c3_56dd_return_output,
 color2_MUX_uxn_c_l214_c3_56dd_return_output,
 color1_MUX_uxn_c_l214_c3_56dd_return_output,
 color3_MUX_uxn_c_l214_c3_56dd_return_output,
 CONST_SL_8_uxn_c_l216_c4_0ed0_return_output,
 BIN_OP_AND_uxn_c_l217_c4_7aa4_return_output,
 BIN_OP_OR_uxn_c_l218_c4_101f_return_output,
 CONST_SL_8_uxn_c_l221_c4_71d5_return_output,
 BIN_OP_AND_uxn_c_l222_c4_8f3a_return_output,
 BIN_OP_OR_uxn_c_l223_c4_8397_return_output,
 BIN_OP_EQ_uxn_c_l225_c12_1f90_return_output,
 color0_MUX_uxn_c_l225_c8_dd3f_return_output,
 color2_MUX_uxn_c_l225_c8_dd3f_return_output,
 color1_MUX_uxn_c_l225_c8_dd3f_return_output,
 color3_MUX_uxn_c_l225_c8_dd3f_return_output,
 CONST_SL_8_uxn_c_l227_c4_1204_return_output,
 BIN_OP_AND_uxn_c_l228_c4_f06f_return_output,
 BIN_OP_OR_uxn_c_l229_c4_7b56_return_output,
 CONST_SL_8_uxn_c_l232_c4_a0bf_return_output,
 BIN_OP_AND_uxn_c_l233_c4_234d_return_output,
 BIN_OP_OR_uxn_c_l234_c4_1396_return_output,
 BIN_OP_EQ_uxn_c_l236_c12_4ede_return_output,
 color0_MUX_uxn_c_l236_c8_ed67_return_output,
 color2_MUX_uxn_c_l236_c8_ed67_return_output,
 color1_MUX_uxn_c_l236_c8_ed67_return_output,
 color3_MUX_uxn_c_l236_c8_ed67_return_output,
 CONST_SL_4_uxn_c_l238_c4_0cc6_return_output,
 BIN_OP_AND_uxn_c_l239_c4_a782_return_output,
 BIN_OP_OR_uxn_c_l240_c4_fdb4_return_output,
 CONST_SL_4_uxn_c_l243_c4_f0c4_return_output,
 BIN_OP_AND_uxn_c_l244_c4_9c62_return_output,
 BIN_OP_OR_uxn_c_l245_c4_bc8c_return_output,
 BIN_OP_EQ_uxn_c_l247_c12_71e2_return_output,
 color0_MUX_uxn_c_l247_c8_a61c_return_output,
 color2_MUX_uxn_c_l247_c8_a61c_return_output,
 color1_MUX_uxn_c_l247_c8_a61c_return_output,
 color3_MUX_uxn_c_l247_c8_a61c_return_output,
 CONST_SL_4_uxn_c_l249_c4_c173_return_output,
 BIN_OP_AND_uxn_c_l250_c4_8a7a_return_output,
 BIN_OP_OR_uxn_c_l251_c4_323a_return_output,
 CONST_SL_4_uxn_c_l254_c4_1d57_return_output,
 BIN_OP_AND_uxn_c_l255_c4_9726_return_output,
 BIN_OP_OR_uxn_c_l256_c4_aa20_return_output,
 BIN_OP_EQ_uxn_c_l258_c12_b7ec_return_output,
 color0_MUX_uxn_c_l258_c8_d8df_return_output,
 color2_MUX_uxn_c_l258_c8_d8df_return_output,
 color1_MUX_uxn_c_l258_c8_d8df_return_output,
 color3_MUX_uxn_c_l258_c8_d8df_return_output,
 BIN_OP_AND_uxn_c_l260_c4_2d4c_return_output,
 BIN_OP_OR_uxn_c_l261_c4_9b16_return_output,
 BIN_OP_AND_uxn_c_l264_c4_3b17_return_output,
 BIN_OP_OR_uxn_c_l265_c4_c611_return_output,
 BIN_OP_EQ_uxn_c_l267_c12_cc4a_return_output,
 color2_MUX_uxn_c_l267_c8_b4f1_return_output,
 color3_MUX_uxn_c_l267_c8_b4f1_return_output,
 BIN_OP_AND_uxn_c_l269_c4_d99f_return_output,
 BIN_OP_OR_uxn_c_l270_c4_a100_return_output,
 BIN_OP_AND_uxn_c_l273_c4_61cd_return_output,
 BIN_OP_OR_uxn_c_l274_c4_794e_return_output,
 BIN_OP_EQ_uxn_c_l278_c6_bb33_return_output,
 result_MUX_uxn_c_l278_c2_1d34_return_output,
 BIN_OP_EQ_uxn_c_l280_c13_cf02_return_output,
 result_MUX_uxn_c_l280_c9_e221_return_output,
 BIN_OP_EQ_uxn_c_l282_c13_20a6_return_output,
 result_MUX_uxn_c_l282_c9_b3e6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_gpu_step_color : unsigned(1 downto 0);
 variable VAR_tmp12 : unsigned(11 downto 0);
 variable VAR_result : unsigned(15 downto 0);
 variable VAR_is_palette_range : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l208_c30_a611_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l208_c30_0092_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l208_c30_e16f_left : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l208_c30_0092_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l208_c30_e16f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l208_c30_e16f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l208_c30_a611_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l208_c30_a611_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l208_c30_a611_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l210_c6_e6aa_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l210_c6_e6aa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l210_c6_e6aa_return_output : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l210_c2_3a91_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l214_c3_56dd_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l210_c2_3a91_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l210_c2_3a91_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l210_c2_3a91_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l210_c2_3a91_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l214_c3_56dd_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l210_c2_3a91_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l210_c2_3a91_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l210_c2_3a91_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l210_c2_3a91_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l214_c3_56dd_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l210_c2_3a91_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l210_c2_3a91_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l210_c2_3a91_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l210_c2_3a91_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l214_c3_56dd_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l210_c2_3a91_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l210_c2_3a91_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l210_c2_3a91_cond : unsigned(0 downto 0);
 variable VAR_addr_low : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l211_c22_0b52_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_0 : unsigned(3 downto 0);
 variable VAR_color_cmp_0_uxn_c_l212_c11_a638_0 : unsigned(3 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l212_c35_d993_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_c_l212_c35_d993_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l212_c25_b1ea_return_output : unsigned(3 downto 0);
 variable VAR_color_cmp_1 : unsigned(3 downto 0);
 variable VAR_color_cmp_1_uxn_c_l213_c11_08bc_0 : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l213_c25_2efb_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l214_c7_742d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l214_c7_742d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l214_c7_742d_return_output : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l214_c3_56dd_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l214_c3_56dd_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l225_c8_dd3f_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l214_c3_56dd_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l214_c3_56dd_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l214_c3_56dd_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l225_c8_dd3f_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l214_c3_56dd_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l214_c3_56dd_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l214_c3_56dd_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l225_c8_dd3f_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l214_c3_56dd_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l214_c3_56dd_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l214_c3_56dd_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l225_c8_dd3f_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l214_c3_56dd_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l215_c4_e5d4 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l216_c4_0ed0_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l216_c4_0ed0_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l217_c4_7aa4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l217_c4_7aa4_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l217_c4_7aa4_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l218_c4_101f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l218_c4_101f_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l218_c4_101f_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l220_c4_814f : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l221_c4_71d5_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l221_c4_71d5_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l222_c4_8f3a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l222_c4_8f3a_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l222_c4_8f3a_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l223_c4_8397_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l223_c4_8397_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l223_c4_8397_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l225_c12_1f90_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l225_c12_1f90_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l225_c12_1f90_return_output : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l225_c8_dd3f_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l225_c8_dd3f_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l236_c8_ed67_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l225_c8_dd3f_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l225_c8_dd3f_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l225_c8_dd3f_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l236_c8_ed67_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l225_c8_dd3f_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l225_c8_dd3f_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l225_c8_dd3f_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l236_c8_ed67_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l225_c8_dd3f_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l225_c8_dd3f_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l225_c8_dd3f_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l236_c8_ed67_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l225_c8_dd3f_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l226_c4_2bd3 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l227_c4_1204_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l227_c4_1204_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l228_c4_f06f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l228_c4_f06f_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l228_c4_f06f_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l229_c4_7b56_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l229_c4_7b56_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l229_c4_7b56_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l231_c4_4ef9 : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l232_c4_a0bf_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l232_c4_a0bf_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l233_c4_234d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l233_c4_234d_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l233_c4_234d_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l234_c4_1396_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l234_c4_1396_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l234_c4_1396_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l236_c12_4ede_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l236_c12_4ede_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l236_c12_4ede_return_output : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l236_c8_ed67_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l236_c8_ed67_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l247_c8_a61c_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l236_c8_ed67_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l236_c8_ed67_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l236_c8_ed67_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l247_c8_a61c_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l236_c8_ed67_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l236_c8_ed67_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l236_c8_ed67_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l247_c8_a61c_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l236_c8_ed67_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l236_c8_ed67_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l236_c8_ed67_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l247_c8_a61c_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l236_c8_ed67_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l237_c4_a300 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l238_c4_0cc6_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l238_c4_0cc6_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l239_c4_a782_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l239_c4_a782_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l239_c4_a782_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l240_c4_fdb4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l240_c4_fdb4_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l240_c4_fdb4_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l242_c4_1f03 : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l243_c4_f0c4_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l243_c4_f0c4_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l244_c4_9c62_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l244_c4_9c62_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l244_c4_9c62_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l245_c4_bc8c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l245_c4_bc8c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l245_c4_bc8c_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l247_c12_71e2_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l247_c12_71e2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l247_c12_71e2_return_output : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l247_c8_a61c_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l247_c8_a61c_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l258_c8_d8df_return_output : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l247_c8_a61c_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l247_c8_a61c_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l247_c8_a61c_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l258_c8_d8df_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l247_c8_a61c_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l247_c8_a61c_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l247_c8_a61c_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l258_c8_d8df_return_output : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l247_c8_a61c_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l247_c8_a61c_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l247_c8_a61c_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l258_c8_d8df_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l247_c8_a61c_cond : unsigned(0 downto 0);
 variable VAR_tmp12_uxn_c_l248_c4_4c8a : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l249_c4_c173_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l249_c4_c173_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l250_c4_8a7a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l250_c4_8a7a_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l250_c4_8a7a_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l251_c4_323a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l251_c4_323a_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l251_c4_323a_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_uxn_c_l253_c4_bfae : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l254_c4_1d57_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_c_l254_c4_1d57_x : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l255_c4_9726_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l255_c4_9726_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l255_c4_9726_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l256_c4_aa20_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l256_c4_aa20_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l256_c4_aa20_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l258_c12_b7ec_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l258_c12_b7ec_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l258_c12_b7ec_return_output : unsigned(0 downto 0);
 variable VAR_color0_MUX_uxn_c_l258_c8_d8df_iftrue : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l258_c8_d8df_iffalse : unsigned(11 downto 0);
 variable VAR_color0_MUX_uxn_c_l258_c8_d8df_cond : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l258_c8_d8df_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l258_c8_d8df_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l267_c8_b4f1_return_output : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l258_c8_d8df_cond : unsigned(0 downto 0);
 variable VAR_color1_MUX_uxn_c_l258_c8_d8df_iftrue : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l258_c8_d8df_iffalse : unsigned(11 downto 0);
 variable VAR_color1_MUX_uxn_c_l258_c8_d8df_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l258_c8_d8df_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l258_c8_d8df_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l267_c8_b4f1_return_output : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l258_c8_d8df_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l260_c4_2d4c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l260_c4_2d4c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l260_c4_2d4c_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l261_c4_9b16_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l261_c4_9b16_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l261_c4_9b16_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l264_c4_3b17_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l264_c4_3b17_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l264_c4_3b17_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l265_c4_c611_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l265_c4_c611_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l265_c4_c611_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l267_c12_cc4a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l267_c12_cc4a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l267_c12_cc4a_return_output : unsigned(0 downto 0);
 variable VAR_color2_MUX_uxn_c_l267_c8_b4f1_iftrue : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l267_c8_b4f1_iffalse : unsigned(11 downto 0);
 variable VAR_color2_MUX_uxn_c_l267_c8_b4f1_cond : unsigned(0 downto 0);
 variable VAR_color3_MUX_uxn_c_l267_c8_b4f1_iftrue : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l267_c8_b4f1_iffalse : unsigned(11 downto 0);
 variable VAR_color3_MUX_uxn_c_l267_c8_b4f1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l269_c4_d99f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l269_c4_d99f_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l269_c4_d99f_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l270_c4_a100_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l270_c4_a100_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l270_c4_a100_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l273_c4_61cd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l273_c4_61cd_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l273_c4_61cd_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l274_c4_794e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l274_c4_794e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l274_c4_794e_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c6_bb33_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c6_bb33_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l278_c6_bb33_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l278_c2_1d34_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l279_c3_5a22 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l278_c2_1d34_iffalse : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l280_c9_e221_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l278_c2_1d34_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l278_c2_1d34_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l280_c13_cf02_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l280_c13_cf02_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l280_c13_cf02_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l280_c9_e221_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l281_c3_50f6 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l280_c9_e221_iffalse : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l282_c9_b3e6_return_output : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l280_c9_e221_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l282_c13_20a6_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l282_c13_20a6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l282_c13_20a6_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l282_c9_b3e6_iftrue : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l283_c3_4ac1 : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l282_c9_b3e6_iffalse : unsigned(15 downto 0);
 variable VAR_result_uxn_c_l285_c3_8a1e : unsigned(15 downto 0);
 variable VAR_result_MUX_uxn_c_l282_c9_b3e6_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l259_l268_DUPLICATE_11d2_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l263_l272_DUPLICATE_dd77_return_output : unsigned(11 downto 0);
 -- State registers comb logic variables
variable REG_VAR_color0 : unsigned(11 downto 0);
variable REG_VAR_color1 : unsigned(11 downto 0);
variable REG_VAR_color2 : unsigned(11 downto 0);
variable REG_VAR_color3 : unsigned(11 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_color0 := color0;
  REG_VAR_color1 := color1;
  REG_VAR_color2 := color2;
  REG_VAR_color3 := color3;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_c_l247_c12_71e2_right := to_unsigned(11, 4);
     VAR_BIN_OP_AND_uxn_c_l228_c4_f06f_right := to_unsigned(255, 12);
     VAR_BIN_OP_EQ_uxn_c_l214_c7_742d_right := to_unsigned(8, 4);
     VAR_BIN_OP_AND_uxn_c_l217_c4_7aa4_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l269_c4_d99f_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l260_c4_2d4c_right := to_unsigned(4080, 12);
     VAR_MUX_uxn_c_l208_c30_a611_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l244_c4_9c62_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l233_c4_234d_right := to_unsigned(255, 12);
     VAR_BIN_OP_AND_uxn_c_l250_c4_8a7a_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l278_c6_bb33_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l255_c4_9726_right := to_unsigned(3855, 12);
     VAR_BIN_OP_EQ_uxn_c_l258_c12_b7ec_right := to_unsigned(12, 4);
     VAR_MUX_uxn_c_l208_c30_a611_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l222_c4_8f3a_right := to_unsigned(255, 12);
     VAR_BIN_OP_EQ_uxn_c_l280_c13_cf02_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l267_c12_cc4a_right := to_unsigned(13, 4);
     VAR_BIN_OP_AND_uxn_c_l239_c4_a782_right := to_unsigned(3855, 12);
     VAR_BIN_OP_AND_uxn_c_l264_c4_3b17_right := to_unsigned(4080, 12);
     VAR_BIN_OP_AND_uxn_c_l273_c4_61cd_right := to_unsigned(4080, 12);
     VAR_BIN_OP_EQ_uxn_c_l208_c30_e16f_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l282_c13_20a6_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_c_l236_c12_4ede_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_c_l225_c12_1f90_right := to_unsigned(9, 4);

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
     VAR_BIN_OP_AND_uxn_c_l217_c4_7aa4_left := color0;
     VAR_BIN_OP_AND_uxn_c_l239_c4_a782_left := color0;
     VAR_BIN_OP_AND_uxn_c_l260_c4_2d4c_left := color0;
     VAR_color0_MUX_uxn_c_l210_c2_3a91_iffalse := color0;
     VAR_color0_MUX_uxn_c_l225_c8_dd3f_iftrue := color0;
     VAR_color0_MUX_uxn_c_l247_c8_a61c_iftrue := color0;
     VAR_color0_MUX_uxn_c_l258_c8_d8df_iffalse := color0;
     VAR_BIN_OP_AND_uxn_c_l222_c4_8f3a_left := color1;
     VAR_BIN_OP_AND_uxn_c_l244_c4_9c62_left := color1;
     VAR_BIN_OP_AND_uxn_c_l264_c4_3b17_left := color1;
     VAR_color1_MUX_uxn_c_l210_c2_3a91_iffalse := color1;
     VAR_color1_MUX_uxn_c_l225_c8_dd3f_iftrue := color1;
     VAR_color1_MUX_uxn_c_l247_c8_a61c_iftrue := color1;
     VAR_color1_MUX_uxn_c_l258_c8_d8df_iffalse := color1;
     VAR_BIN_OP_AND_uxn_c_l228_c4_f06f_left := color2;
     VAR_BIN_OP_AND_uxn_c_l250_c4_8a7a_left := color2;
     VAR_BIN_OP_AND_uxn_c_l269_c4_d99f_left := color2;
     VAR_color2_MUX_uxn_c_l210_c2_3a91_iffalse := color2;
     VAR_color2_MUX_uxn_c_l214_c3_56dd_iftrue := color2;
     VAR_color2_MUX_uxn_c_l236_c8_ed67_iftrue := color2;
     VAR_color2_MUX_uxn_c_l258_c8_d8df_iftrue := color2;
     VAR_color2_MUX_uxn_c_l267_c8_b4f1_iffalse := color2;
     VAR_BIN_OP_AND_uxn_c_l233_c4_234d_left := color3;
     VAR_BIN_OP_AND_uxn_c_l255_c4_9726_left := color3;
     VAR_BIN_OP_AND_uxn_c_l273_c4_61cd_left := color3;
     VAR_color3_MUX_uxn_c_l210_c2_3a91_iffalse := color3;
     VAR_color3_MUX_uxn_c_l214_c3_56dd_iftrue := color3;
     VAR_color3_MUX_uxn_c_l236_c8_ed67_iftrue := color3;
     VAR_color3_MUX_uxn_c_l258_c8_d8df_iftrue := color3;
     VAR_color3_MUX_uxn_c_l267_c8_b4f1_iffalse := color3;
     VAR_CONST_SR_4_uxn_c_l208_c30_0092_x := VAR_device_ram_address;
     VAR_CONST_SR_4_uxn_c_l212_c35_d993_x := VAR_device_ram_value;
     VAR_BIN_OP_EQ_uxn_c_l278_c6_bb33_left := VAR_gpu_step_color;
     VAR_BIN_OP_EQ_uxn_c_l280_c13_cf02_left := VAR_gpu_step_color;
     VAR_BIN_OP_EQ_uxn_c_l282_c13_20a6_left := VAR_gpu_step_color;
     VAR_BIN_OP_AND_uxn_c_l210_c6_e6aa_left := VAR_is_device_ram_write;
     -- BIN_OP_AND[uxn_c_l228_c4_f06f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l228_c4_f06f_left <= VAR_BIN_OP_AND_uxn_c_l228_c4_f06f_left;
     BIN_OP_AND_uxn_c_l228_c4_f06f_right <= VAR_BIN_OP_AND_uxn_c_l228_c4_f06f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l228_c4_f06f_return_output := BIN_OP_AND_uxn_c_l228_c4_f06f_return_output;

     -- BIN_OP_AND[uxn_c_l217_c4_7aa4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l217_c4_7aa4_left <= VAR_BIN_OP_AND_uxn_c_l217_c4_7aa4_left;
     BIN_OP_AND_uxn_c_l217_c4_7aa4_right <= VAR_BIN_OP_AND_uxn_c_l217_c4_7aa4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l217_c4_7aa4_return_output := BIN_OP_AND_uxn_c_l217_c4_7aa4_return_output;

     -- BIN_OP_AND[uxn_c_l273_c4_61cd] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l273_c4_61cd_left <= VAR_BIN_OP_AND_uxn_c_l273_c4_61cd_left;
     BIN_OP_AND_uxn_c_l273_c4_61cd_right <= VAR_BIN_OP_AND_uxn_c_l273_c4_61cd_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l273_c4_61cd_return_output := BIN_OP_AND_uxn_c_l273_c4_61cd_return_output;

     -- BIN_OP_AND[uxn_c_l222_c4_8f3a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l222_c4_8f3a_left <= VAR_BIN_OP_AND_uxn_c_l222_c4_8f3a_left;
     BIN_OP_AND_uxn_c_l222_c4_8f3a_right <= VAR_BIN_OP_AND_uxn_c_l222_c4_8f3a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l222_c4_8f3a_return_output := BIN_OP_AND_uxn_c_l222_c4_8f3a_return_output;

     -- CAST_TO_uint4_t[uxn_c_l213_c25_2efb] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l213_c25_2efb_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_value);

     -- CONST_SR_4[uxn_c_l208_c30_0092] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l208_c30_0092_x <= VAR_CONST_SR_4_uxn_c_l208_c30_0092_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l208_c30_0092_return_output := CONST_SR_4_uxn_c_l208_c30_0092_return_output;

     -- BIN_OP_AND[uxn_c_l264_c4_3b17] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l264_c4_3b17_left <= VAR_BIN_OP_AND_uxn_c_l264_c4_3b17_left;
     BIN_OP_AND_uxn_c_l264_c4_3b17_right <= VAR_BIN_OP_AND_uxn_c_l264_c4_3b17_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l264_c4_3b17_return_output := BIN_OP_AND_uxn_c_l264_c4_3b17_return_output;

     -- BIN_OP_EQ[uxn_c_l280_c13_cf02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l280_c13_cf02_left <= VAR_BIN_OP_EQ_uxn_c_l280_c13_cf02_left;
     BIN_OP_EQ_uxn_c_l280_c13_cf02_right <= VAR_BIN_OP_EQ_uxn_c_l280_c13_cf02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l280_c13_cf02_return_output := BIN_OP_EQ_uxn_c_l280_c13_cf02_return_output;

     -- BIN_OP_AND[uxn_c_l260_c4_2d4c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l260_c4_2d4c_left <= VAR_BIN_OP_AND_uxn_c_l260_c4_2d4c_left;
     BIN_OP_AND_uxn_c_l260_c4_2d4c_right <= VAR_BIN_OP_AND_uxn_c_l260_c4_2d4c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l260_c4_2d4c_return_output := BIN_OP_AND_uxn_c_l260_c4_2d4c_return_output;

     -- BIN_OP_EQ[uxn_c_l282_c13_20a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l282_c13_20a6_left <= VAR_BIN_OP_EQ_uxn_c_l282_c13_20a6_left;
     BIN_OP_EQ_uxn_c_l282_c13_20a6_right <= VAR_BIN_OP_EQ_uxn_c_l282_c13_20a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l282_c13_20a6_return_output := BIN_OP_EQ_uxn_c_l282_c13_20a6_return_output;

     -- BIN_OP_EQ[uxn_c_l278_c6_bb33] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l278_c6_bb33_left <= VAR_BIN_OP_EQ_uxn_c_l278_c6_bb33_left;
     BIN_OP_EQ_uxn_c_l278_c6_bb33_right <= VAR_BIN_OP_EQ_uxn_c_l278_c6_bb33_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l278_c6_bb33_return_output := BIN_OP_EQ_uxn_c_l278_c6_bb33_return_output;

     -- BIN_OP_AND[uxn_c_l233_c4_234d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l233_c4_234d_left <= VAR_BIN_OP_AND_uxn_c_l233_c4_234d_left;
     BIN_OP_AND_uxn_c_l233_c4_234d_right <= VAR_BIN_OP_AND_uxn_c_l233_c4_234d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l233_c4_234d_return_output := BIN_OP_AND_uxn_c_l233_c4_234d_return_output;

     -- BIN_OP_AND[uxn_c_l269_c4_d99f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l269_c4_d99f_left <= VAR_BIN_OP_AND_uxn_c_l269_c4_d99f_left;
     BIN_OP_AND_uxn_c_l269_c4_d99f_right <= VAR_BIN_OP_AND_uxn_c_l269_c4_d99f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l269_c4_d99f_return_output := BIN_OP_AND_uxn_c_l269_c4_d99f_return_output;

     -- CONST_SR_4[uxn_c_l212_c35_d993] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_c_l212_c35_d993_x <= VAR_CONST_SR_4_uxn_c_l212_c35_d993_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_c_l212_c35_d993_return_output := CONST_SR_4_uxn_c_l212_c35_d993_return_output;

     -- BIN_OP_AND[uxn_c_l244_c4_9c62] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l244_c4_9c62_left <= VAR_BIN_OP_AND_uxn_c_l244_c4_9c62_left;
     BIN_OP_AND_uxn_c_l244_c4_9c62_right <= VAR_BIN_OP_AND_uxn_c_l244_c4_9c62_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l244_c4_9c62_return_output := BIN_OP_AND_uxn_c_l244_c4_9c62_return_output;

     -- BIN_OP_AND[uxn_c_l255_c4_9726] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l255_c4_9726_left <= VAR_BIN_OP_AND_uxn_c_l255_c4_9726_left;
     BIN_OP_AND_uxn_c_l255_c4_9726_right <= VAR_BIN_OP_AND_uxn_c_l255_c4_9726_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l255_c4_9726_return_output := BIN_OP_AND_uxn_c_l255_c4_9726_return_output;

     -- BIN_OP_AND[uxn_c_l250_c4_8a7a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l250_c4_8a7a_left <= VAR_BIN_OP_AND_uxn_c_l250_c4_8a7a_left;
     BIN_OP_AND_uxn_c_l250_c4_8a7a_right <= VAR_BIN_OP_AND_uxn_c_l250_c4_8a7a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l250_c4_8a7a_return_output := BIN_OP_AND_uxn_c_l250_c4_8a7a_return_output;

     -- BIN_OP_AND[uxn_c_l239_c4_a782] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l239_c4_a782_left <= VAR_BIN_OP_AND_uxn_c_l239_c4_a782_left;
     BIN_OP_AND_uxn_c_l239_c4_a782_right <= VAR_BIN_OP_AND_uxn_c_l239_c4_a782_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l239_c4_a782_return_output := BIN_OP_AND_uxn_c_l239_c4_a782_return_output;

     -- CAST_TO_uint4_t[uxn_c_l211_c22_0b52] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l211_c22_0b52_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_ram_address);

     -- Submodule level 1
     VAR_BIN_OP_OR_uxn_c_l218_c4_101f_left := VAR_BIN_OP_AND_uxn_c_l217_c4_7aa4_return_output;
     VAR_BIN_OP_OR_uxn_c_l223_c4_8397_left := VAR_BIN_OP_AND_uxn_c_l222_c4_8f3a_return_output;
     VAR_BIN_OP_OR_uxn_c_l229_c4_7b56_left := VAR_BIN_OP_AND_uxn_c_l228_c4_f06f_return_output;
     VAR_BIN_OP_OR_uxn_c_l234_c4_1396_left := VAR_BIN_OP_AND_uxn_c_l233_c4_234d_return_output;
     VAR_BIN_OP_OR_uxn_c_l240_c4_fdb4_left := VAR_BIN_OP_AND_uxn_c_l239_c4_a782_return_output;
     VAR_BIN_OP_OR_uxn_c_l245_c4_bc8c_left := VAR_BIN_OP_AND_uxn_c_l244_c4_9c62_return_output;
     VAR_BIN_OP_OR_uxn_c_l251_c4_323a_left := VAR_BIN_OP_AND_uxn_c_l250_c4_8a7a_return_output;
     VAR_BIN_OP_OR_uxn_c_l256_c4_aa20_left := VAR_BIN_OP_AND_uxn_c_l255_c4_9726_return_output;
     VAR_BIN_OP_OR_uxn_c_l261_c4_9b16_left := VAR_BIN_OP_AND_uxn_c_l260_c4_2d4c_return_output;
     VAR_BIN_OP_OR_uxn_c_l265_c4_c611_left := VAR_BIN_OP_AND_uxn_c_l264_c4_3b17_return_output;
     VAR_BIN_OP_OR_uxn_c_l270_c4_a100_left := VAR_BIN_OP_AND_uxn_c_l269_c4_d99f_return_output;
     VAR_BIN_OP_OR_uxn_c_l274_c4_794e_left := VAR_BIN_OP_AND_uxn_c_l273_c4_61cd_return_output;
     VAR_result_MUX_uxn_c_l278_c2_1d34_cond := VAR_BIN_OP_EQ_uxn_c_l278_c6_bb33_return_output;
     VAR_result_MUX_uxn_c_l280_c9_e221_cond := VAR_BIN_OP_EQ_uxn_c_l280_c13_cf02_return_output;
     VAR_result_MUX_uxn_c_l282_c9_b3e6_cond := VAR_BIN_OP_EQ_uxn_c_l282_c13_20a6_return_output;
     VAR_BIN_OP_EQ_uxn_c_l214_c7_742d_left := VAR_CAST_TO_uint4_t_uxn_c_l211_c22_0b52_return_output;
     VAR_BIN_OP_EQ_uxn_c_l225_c12_1f90_left := VAR_CAST_TO_uint4_t_uxn_c_l211_c22_0b52_return_output;
     VAR_BIN_OP_EQ_uxn_c_l236_c12_4ede_left := VAR_CAST_TO_uint4_t_uxn_c_l211_c22_0b52_return_output;
     VAR_BIN_OP_EQ_uxn_c_l247_c12_71e2_left := VAR_CAST_TO_uint4_t_uxn_c_l211_c22_0b52_return_output;
     VAR_BIN_OP_EQ_uxn_c_l258_c12_b7ec_left := VAR_CAST_TO_uint4_t_uxn_c_l211_c22_0b52_return_output;
     VAR_BIN_OP_EQ_uxn_c_l267_c12_cc4a_left := VAR_CAST_TO_uint4_t_uxn_c_l211_c22_0b52_return_output;
     VAR_color_cmp_1_uxn_c_l213_c11_08bc_0 := VAR_CAST_TO_uint4_t_uxn_c_l213_c25_2efb_return_output;
     VAR_BIN_OP_EQ_uxn_c_l208_c30_e16f_left := VAR_CONST_SR_4_uxn_c_l208_c30_0092_return_output;
     VAR_tmp12_uxn_c_l220_c4_814f := resize(VAR_color_cmp_1_uxn_c_l213_c11_08bc_0, 12);
     VAR_tmp12_uxn_c_l231_c4_4ef9 := resize(VAR_color_cmp_1_uxn_c_l213_c11_08bc_0, 12);
     VAR_tmp12_uxn_c_l242_c4_1f03 := resize(VAR_color_cmp_1_uxn_c_l213_c11_08bc_0, 12);
     VAR_tmp12_uxn_c_l253_c4_bfae := resize(VAR_color_cmp_1_uxn_c_l213_c11_08bc_0, 12);
     VAR_CONST_SL_8_uxn_c_l221_c4_71d5_x := VAR_tmp12_uxn_c_l220_c4_814f;
     VAR_CONST_SL_8_uxn_c_l232_c4_a0bf_x := VAR_tmp12_uxn_c_l231_c4_4ef9;
     VAR_CONST_SL_4_uxn_c_l243_c4_f0c4_x := VAR_tmp12_uxn_c_l242_c4_1f03;
     VAR_CONST_SL_4_uxn_c_l254_c4_1d57_x := VAR_tmp12_uxn_c_l253_c4_bfae;
     -- CONST_SL_8[uxn_c_l232_c4_a0bf] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l232_c4_a0bf_x <= VAR_CONST_SL_8_uxn_c_l232_c4_a0bf_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l232_c4_a0bf_return_output := CONST_SL_8_uxn_c_l232_c4_a0bf_return_output;

     -- BIN_OP_EQ[uxn_c_l225_c12_1f90] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l225_c12_1f90_left <= VAR_BIN_OP_EQ_uxn_c_l225_c12_1f90_left;
     BIN_OP_EQ_uxn_c_l225_c12_1f90_right <= VAR_BIN_OP_EQ_uxn_c_l225_c12_1f90_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l225_c12_1f90_return_output := BIN_OP_EQ_uxn_c_l225_c12_1f90_return_output;

     -- CONST_SL_8[uxn_c_l221_c4_71d5] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l221_c4_71d5_x <= VAR_CONST_SL_8_uxn_c_l221_c4_71d5_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l221_c4_71d5_return_output := CONST_SL_8_uxn_c_l221_c4_71d5_return_output;

     -- CAST_TO_uint4_t[uxn_c_l212_c25_b1ea] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l212_c25_b1ea_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uxn_c_l212_c35_d993_return_output);

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l263_l272_DUPLICATE_dd77 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l263_l272_DUPLICATE_dd77_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_1_uxn_c_l213_c11_08bc_0);

     -- BIN_OP_EQ[uxn_c_l267_c12_cc4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l267_c12_cc4a_left <= VAR_BIN_OP_EQ_uxn_c_l267_c12_cc4a_left;
     BIN_OP_EQ_uxn_c_l267_c12_cc4a_right <= VAR_BIN_OP_EQ_uxn_c_l267_c12_cc4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l267_c12_cc4a_return_output := BIN_OP_EQ_uxn_c_l267_c12_cc4a_return_output;

     -- BIN_OP_EQ[uxn_c_l214_c7_742d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l214_c7_742d_left <= VAR_BIN_OP_EQ_uxn_c_l214_c7_742d_left;
     BIN_OP_EQ_uxn_c_l214_c7_742d_right <= VAR_BIN_OP_EQ_uxn_c_l214_c7_742d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l214_c7_742d_return_output := BIN_OP_EQ_uxn_c_l214_c7_742d_return_output;

     -- CONST_SL_4[uxn_c_l254_c4_1d57] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l254_c4_1d57_x <= VAR_CONST_SL_4_uxn_c_l254_c4_1d57_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l254_c4_1d57_return_output := CONST_SL_4_uxn_c_l254_c4_1d57_return_output;

     -- BIN_OP_EQ[uxn_c_l236_c12_4ede] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l236_c12_4ede_left <= VAR_BIN_OP_EQ_uxn_c_l236_c12_4ede_left;
     BIN_OP_EQ_uxn_c_l236_c12_4ede_right <= VAR_BIN_OP_EQ_uxn_c_l236_c12_4ede_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l236_c12_4ede_return_output := BIN_OP_EQ_uxn_c_l236_c12_4ede_return_output;

     -- BIN_OP_EQ[uxn_c_l247_c12_71e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l247_c12_71e2_left <= VAR_BIN_OP_EQ_uxn_c_l247_c12_71e2_left;
     BIN_OP_EQ_uxn_c_l247_c12_71e2_right <= VAR_BIN_OP_EQ_uxn_c_l247_c12_71e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l247_c12_71e2_return_output := BIN_OP_EQ_uxn_c_l247_c12_71e2_return_output;

     -- BIN_OP_EQ[uxn_c_l258_c12_b7ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l258_c12_b7ec_left <= VAR_BIN_OP_EQ_uxn_c_l258_c12_b7ec_left;
     BIN_OP_EQ_uxn_c_l258_c12_b7ec_right <= VAR_BIN_OP_EQ_uxn_c_l258_c12_b7ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l258_c12_b7ec_return_output := BIN_OP_EQ_uxn_c_l258_c12_b7ec_return_output;

     -- BIN_OP_EQ[uxn_c_l208_c30_e16f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l208_c30_e16f_left <= VAR_BIN_OP_EQ_uxn_c_l208_c30_e16f_left;
     BIN_OP_EQ_uxn_c_l208_c30_e16f_right <= VAR_BIN_OP_EQ_uxn_c_l208_c30_e16f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l208_c30_e16f_return_output := BIN_OP_EQ_uxn_c_l208_c30_e16f_return_output;

     -- CONST_SL_4[uxn_c_l243_c4_f0c4] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l243_c4_f0c4_x <= VAR_CONST_SL_4_uxn_c_l243_c4_f0c4_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l243_c4_f0c4_return_output := CONST_SL_4_uxn_c_l243_c4_f0c4_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_c_l208_c30_a611_cond := VAR_BIN_OP_EQ_uxn_c_l208_c30_e16f_return_output;
     VAR_color0_MUX_uxn_c_l214_c3_56dd_cond := VAR_BIN_OP_EQ_uxn_c_l214_c7_742d_return_output;
     VAR_color1_MUX_uxn_c_l214_c3_56dd_cond := VAR_BIN_OP_EQ_uxn_c_l214_c7_742d_return_output;
     VAR_color2_MUX_uxn_c_l214_c3_56dd_cond := VAR_BIN_OP_EQ_uxn_c_l214_c7_742d_return_output;
     VAR_color3_MUX_uxn_c_l214_c3_56dd_cond := VAR_BIN_OP_EQ_uxn_c_l214_c7_742d_return_output;
     VAR_color0_MUX_uxn_c_l225_c8_dd3f_cond := VAR_BIN_OP_EQ_uxn_c_l225_c12_1f90_return_output;
     VAR_color1_MUX_uxn_c_l225_c8_dd3f_cond := VAR_BIN_OP_EQ_uxn_c_l225_c12_1f90_return_output;
     VAR_color2_MUX_uxn_c_l225_c8_dd3f_cond := VAR_BIN_OP_EQ_uxn_c_l225_c12_1f90_return_output;
     VAR_color3_MUX_uxn_c_l225_c8_dd3f_cond := VAR_BIN_OP_EQ_uxn_c_l225_c12_1f90_return_output;
     VAR_color0_MUX_uxn_c_l236_c8_ed67_cond := VAR_BIN_OP_EQ_uxn_c_l236_c12_4ede_return_output;
     VAR_color1_MUX_uxn_c_l236_c8_ed67_cond := VAR_BIN_OP_EQ_uxn_c_l236_c12_4ede_return_output;
     VAR_color2_MUX_uxn_c_l236_c8_ed67_cond := VAR_BIN_OP_EQ_uxn_c_l236_c12_4ede_return_output;
     VAR_color3_MUX_uxn_c_l236_c8_ed67_cond := VAR_BIN_OP_EQ_uxn_c_l236_c12_4ede_return_output;
     VAR_color0_MUX_uxn_c_l247_c8_a61c_cond := VAR_BIN_OP_EQ_uxn_c_l247_c12_71e2_return_output;
     VAR_color1_MUX_uxn_c_l247_c8_a61c_cond := VAR_BIN_OP_EQ_uxn_c_l247_c12_71e2_return_output;
     VAR_color2_MUX_uxn_c_l247_c8_a61c_cond := VAR_BIN_OP_EQ_uxn_c_l247_c12_71e2_return_output;
     VAR_color3_MUX_uxn_c_l247_c8_a61c_cond := VAR_BIN_OP_EQ_uxn_c_l247_c12_71e2_return_output;
     VAR_color0_MUX_uxn_c_l258_c8_d8df_cond := VAR_BIN_OP_EQ_uxn_c_l258_c12_b7ec_return_output;
     VAR_color1_MUX_uxn_c_l258_c8_d8df_cond := VAR_BIN_OP_EQ_uxn_c_l258_c12_b7ec_return_output;
     VAR_color2_MUX_uxn_c_l258_c8_d8df_cond := VAR_BIN_OP_EQ_uxn_c_l258_c12_b7ec_return_output;
     VAR_color3_MUX_uxn_c_l258_c8_d8df_cond := VAR_BIN_OP_EQ_uxn_c_l258_c12_b7ec_return_output;
     VAR_color2_MUX_uxn_c_l267_c8_b4f1_cond := VAR_BIN_OP_EQ_uxn_c_l267_c12_cc4a_return_output;
     VAR_color3_MUX_uxn_c_l267_c8_b4f1_cond := VAR_BIN_OP_EQ_uxn_c_l267_c12_cc4a_return_output;
     VAR_BIN_OP_OR_uxn_c_l265_c4_c611_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l263_l272_DUPLICATE_dd77_return_output;
     VAR_BIN_OP_OR_uxn_c_l274_c4_794e_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l263_l272_DUPLICATE_dd77_return_output;
     VAR_color_cmp_0_uxn_c_l212_c11_a638_0 := VAR_CAST_TO_uint4_t_uxn_c_l212_c25_b1ea_return_output;
     VAR_BIN_OP_OR_uxn_c_l245_c4_bc8c_right := VAR_CONST_SL_4_uxn_c_l243_c4_f0c4_return_output;
     VAR_BIN_OP_OR_uxn_c_l256_c4_aa20_right := VAR_CONST_SL_4_uxn_c_l254_c4_1d57_return_output;
     VAR_BIN_OP_OR_uxn_c_l223_c4_8397_right := VAR_CONST_SL_8_uxn_c_l221_c4_71d5_return_output;
     VAR_BIN_OP_OR_uxn_c_l234_c4_1396_right := VAR_CONST_SL_8_uxn_c_l232_c4_a0bf_return_output;
     VAR_tmp12_uxn_c_l215_c4_e5d4 := resize(VAR_color_cmp_0_uxn_c_l212_c11_a638_0, 12);
     VAR_tmp12_uxn_c_l226_c4_2bd3 := resize(VAR_color_cmp_0_uxn_c_l212_c11_a638_0, 12);
     VAR_tmp12_uxn_c_l237_c4_a300 := resize(VAR_color_cmp_0_uxn_c_l212_c11_a638_0, 12);
     VAR_tmp12_uxn_c_l248_c4_4c8a := resize(VAR_color_cmp_0_uxn_c_l212_c11_a638_0, 12);
     VAR_CONST_SL_8_uxn_c_l216_c4_0ed0_x := VAR_tmp12_uxn_c_l215_c4_e5d4;
     VAR_CONST_SL_8_uxn_c_l227_c4_1204_x := VAR_tmp12_uxn_c_l226_c4_2bd3;
     VAR_CONST_SL_4_uxn_c_l238_c4_0cc6_x := VAR_tmp12_uxn_c_l237_c4_a300;
     VAR_CONST_SL_4_uxn_c_l249_c4_c173_x := VAR_tmp12_uxn_c_l248_c4_4c8a;
     -- MUX[uxn_c_l208_c30_a611] LATENCY=0
     -- Inputs
     MUX_uxn_c_l208_c30_a611_cond <= VAR_MUX_uxn_c_l208_c30_a611_cond;
     MUX_uxn_c_l208_c30_a611_iftrue <= VAR_MUX_uxn_c_l208_c30_a611_iftrue;
     MUX_uxn_c_l208_c30_a611_iffalse <= VAR_MUX_uxn_c_l208_c30_a611_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l208_c30_a611_return_output := MUX_uxn_c_l208_c30_a611_return_output;

     -- BIN_OP_OR[uxn_c_l274_c4_794e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l274_c4_794e_left <= VAR_BIN_OP_OR_uxn_c_l274_c4_794e_left;
     BIN_OP_OR_uxn_c_l274_c4_794e_right <= VAR_BIN_OP_OR_uxn_c_l274_c4_794e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l274_c4_794e_return_output := BIN_OP_OR_uxn_c_l274_c4_794e_return_output;

     -- BIN_OP_OR[uxn_c_l223_c4_8397] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l223_c4_8397_left <= VAR_BIN_OP_OR_uxn_c_l223_c4_8397_left;
     BIN_OP_OR_uxn_c_l223_c4_8397_right <= VAR_BIN_OP_OR_uxn_c_l223_c4_8397_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l223_c4_8397_return_output := BIN_OP_OR_uxn_c_l223_c4_8397_return_output;

     -- CONST_SL_4[uxn_c_l238_c4_0cc6] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l238_c4_0cc6_x <= VAR_CONST_SL_4_uxn_c_l238_c4_0cc6_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l238_c4_0cc6_return_output := CONST_SL_4_uxn_c_l238_c4_0cc6_return_output;

     -- BIN_OP_OR[uxn_c_l256_c4_aa20] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l256_c4_aa20_left <= VAR_BIN_OP_OR_uxn_c_l256_c4_aa20_left;
     BIN_OP_OR_uxn_c_l256_c4_aa20_right <= VAR_BIN_OP_OR_uxn_c_l256_c4_aa20_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l256_c4_aa20_return_output := BIN_OP_OR_uxn_c_l256_c4_aa20_return_output;

     -- CONST_SL_4[uxn_c_l249_c4_c173] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_c_l249_c4_c173_x <= VAR_CONST_SL_4_uxn_c_l249_c4_c173_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_c_l249_c4_c173_return_output := CONST_SL_4_uxn_c_l249_c4_c173_return_output;

     -- CAST_TO_uint12_t_uint4_t_uxn_c_l259_l268_DUPLICATE_11d2 LATENCY=0
     VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l259_l268_DUPLICATE_11d2_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_color_cmp_0_uxn_c_l212_c11_a638_0);

     -- CONST_SL_8[uxn_c_l216_c4_0ed0] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l216_c4_0ed0_x <= VAR_CONST_SL_8_uxn_c_l216_c4_0ed0_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l216_c4_0ed0_return_output := CONST_SL_8_uxn_c_l216_c4_0ed0_return_output;

     -- CONST_SL_8[uxn_c_l227_c4_1204] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l227_c4_1204_x <= VAR_CONST_SL_8_uxn_c_l227_c4_1204_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l227_c4_1204_return_output := CONST_SL_8_uxn_c_l227_c4_1204_return_output;

     -- BIN_OP_OR[uxn_c_l245_c4_bc8c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l245_c4_bc8c_left <= VAR_BIN_OP_OR_uxn_c_l245_c4_bc8c_left;
     BIN_OP_OR_uxn_c_l245_c4_bc8c_right <= VAR_BIN_OP_OR_uxn_c_l245_c4_bc8c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l245_c4_bc8c_return_output := BIN_OP_OR_uxn_c_l245_c4_bc8c_return_output;

     -- BIN_OP_OR[uxn_c_l265_c4_c611] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l265_c4_c611_left <= VAR_BIN_OP_OR_uxn_c_l265_c4_c611_left;
     BIN_OP_OR_uxn_c_l265_c4_c611_right <= VAR_BIN_OP_OR_uxn_c_l265_c4_c611_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l265_c4_c611_return_output := BIN_OP_OR_uxn_c_l265_c4_c611_return_output;

     -- BIN_OP_OR[uxn_c_l234_c4_1396] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l234_c4_1396_left <= VAR_BIN_OP_OR_uxn_c_l234_c4_1396_left;
     BIN_OP_OR_uxn_c_l234_c4_1396_right <= VAR_BIN_OP_OR_uxn_c_l234_c4_1396_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l234_c4_1396_return_output := BIN_OP_OR_uxn_c_l234_c4_1396_return_output;

     -- Submodule level 3
     VAR_color1_MUX_uxn_c_l214_c3_56dd_iftrue := VAR_BIN_OP_OR_uxn_c_l223_c4_8397_return_output;
     VAR_color3_MUX_uxn_c_l225_c8_dd3f_iftrue := VAR_BIN_OP_OR_uxn_c_l234_c4_1396_return_output;
     VAR_color1_MUX_uxn_c_l236_c8_ed67_iftrue := VAR_BIN_OP_OR_uxn_c_l245_c4_bc8c_return_output;
     VAR_color3_MUX_uxn_c_l247_c8_a61c_iftrue := VAR_BIN_OP_OR_uxn_c_l256_c4_aa20_return_output;
     VAR_color1_MUX_uxn_c_l258_c8_d8df_iftrue := VAR_BIN_OP_OR_uxn_c_l265_c4_c611_return_output;
     VAR_color3_MUX_uxn_c_l267_c8_b4f1_iftrue := VAR_BIN_OP_OR_uxn_c_l274_c4_794e_return_output;
     VAR_BIN_OP_OR_uxn_c_l261_c4_9b16_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l259_l268_DUPLICATE_11d2_return_output;
     VAR_BIN_OP_OR_uxn_c_l270_c4_a100_right := VAR_CAST_TO_uint12_t_uint4_t_uxn_c_l259_l268_DUPLICATE_11d2_return_output;
     VAR_BIN_OP_OR_uxn_c_l240_c4_fdb4_right := VAR_CONST_SL_4_uxn_c_l238_c4_0cc6_return_output;
     VAR_BIN_OP_OR_uxn_c_l251_c4_323a_right := VAR_CONST_SL_4_uxn_c_l249_c4_c173_return_output;
     VAR_BIN_OP_OR_uxn_c_l218_c4_101f_right := VAR_CONST_SL_8_uxn_c_l216_c4_0ed0_return_output;
     VAR_BIN_OP_OR_uxn_c_l229_c4_7b56_right := VAR_CONST_SL_8_uxn_c_l227_c4_1204_return_output;
     VAR_BIN_OP_AND_uxn_c_l210_c6_e6aa_right := VAR_MUX_uxn_c_l208_c30_a611_return_output;
     -- BIN_OP_OR[uxn_c_l261_c4_9b16] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l261_c4_9b16_left <= VAR_BIN_OP_OR_uxn_c_l261_c4_9b16_left;
     BIN_OP_OR_uxn_c_l261_c4_9b16_right <= VAR_BIN_OP_OR_uxn_c_l261_c4_9b16_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l261_c4_9b16_return_output := BIN_OP_OR_uxn_c_l261_c4_9b16_return_output;

     -- color3_MUX[uxn_c_l267_c8_b4f1] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l267_c8_b4f1_cond <= VAR_color3_MUX_uxn_c_l267_c8_b4f1_cond;
     color3_MUX_uxn_c_l267_c8_b4f1_iftrue <= VAR_color3_MUX_uxn_c_l267_c8_b4f1_iftrue;
     color3_MUX_uxn_c_l267_c8_b4f1_iffalse <= VAR_color3_MUX_uxn_c_l267_c8_b4f1_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l267_c8_b4f1_return_output := color3_MUX_uxn_c_l267_c8_b4f1_return_output;

     -- BIN_OP_OR[uxn_c_l251_c4_323a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l251_c4_323a_left <= VAR_BIN_OP_OR_uxn_c_l251_c4_323a_left;
     BIN_OP_OR_uxn_c_l251_c4_323a_right <= VAR_BIN_OP_OR_uxn_c_l251_c4_323a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l251_c4_323a_return_output := BIN_OP_OR_uxn_c_l251_c4_323a_return_output;

     -- BIN_OP_OR[uxn_c_l218_c4_101f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l218_c4_101f_left <= VAR_BIN_OP_OR_uxn_c_l218_c4_101f_left;
     BIN_OP_OR_uxn_c_l218_c4_101f_right <= VAR_BIN_OP_OR_uxn_c_l218_c4_101f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l218_c4_101f_return_output := BIN_OP_OR_uxn_c_l218_c4_101f_return_output;

     -- BIN_OP_OR[uxn_c_l240_c4_fdb4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l240_c4_fdb4_left <= VAR_BIN_OP_OR_uxn_c_l240_c4_fdb4_left;
     BIN_OP_OR_uxn_c_l240_c4_fdb4_right <= VAR_BIN_OP_OR_uxn_c_l240_c4_fdb4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l240_c4_fdb4_return_output := BIN_OP_OR_uxn_c_l240_c4_fdb4_return_output;

     -- BIN_OP_OR[uxn_c_l270_c4_a100] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l270_c4_a100_left <= VAR_BIN_OP_OR_uxn_c_l270_c4_a100_left;
     BIN_OP_OR_uxn_c_l270_c4_a100_right <= VAR_BIN_OP_OR_uxn_c_l270_c4_a100_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l270_c4_a100_return_output := BIN_OP_OR_uxn_c_l270_c4_a100_return_output;

     -- color1_MUX[uxn_c_l258_c8_d8df] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l258_c8_d8df_cond <= VAR_color1_MUX_uxn_c_l258_c8_d8df_cond;
     color1_MUX_uxn_c_l258_c8_d8df_iftrue <= VAR_color1_MUX_uxn_c_l258_c8_d8df_iftrue;
     color1_MUX_uxn_c_l258_c8_d8df_iffalse <= VAR_color1_MUX_uxn_c_l258_c8_d8df_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l258_c8_d8df_return_output := color1_MUX_uxn_c_l258_c8_d8df_return_output;

     -- BIN_OP_OR[uxn_c_l229_c4_7b56] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l229_c4_7b56_left <= VAR_BIN_OP_OR_uxn_c_l229_c4_7b56_left;
     BIN_OP_OR_uxn_c_l229_c4_7b56_right <= VAR_BIN_OP_OR_uxn_c_l229_c4_7b56_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l229_c4_7b56_return_output := BIN_OP_OR_uxn_c_l229_c4_7b56_return_output;

     -- BIN_OP_AND[uxn_c_l210_c6_e6aa] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l210_c6_e6aa_left <= VAR_BIN_OP_AND_uxn_c_l210_c6_e6aa_left;
     BIN_OP_AND_uxn_c_l210_c6_e6aa_right <= VAR_BIN_OP_AND_uxn_c_l210_c6_e6aa_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l210_c6_e6aa_return_output := BIN_OP_AND_uxn_c_l210_c6_e6aa_return_output;

     -- Submodule level 4
     VAR_color0_MUX_uxn_c_l210_c2_3a91_cond := VAR_BIN_OP_AND_uxn_c_l210_c6_e6aa_return_output;
     VAR_color1_MUX_uxn_c_l210_c2_3a91_cond := VAR_BIN_OP_AND_uxn_c_l210_c6_e6aa_return_output;
     VAR_color2_MUX_uxn_c_l210_c2_3a91_cond := VAR_BIN_OP_AND_uxn_c_l210_c6_e6aa_return_output;
     VAR_color3_MUX_uxn_c_l210_c2_3a91_cond := VAR_BIN_OP_AND_uxn_c_l210_c6_e6aa_return_output;
     VAR_color0_MUX_uxn_c_l214_c3_56dd_iftrue := VAR_BIN_OP_OR_uxn_c_l218_c4_101f_return_output;
     VAR_color2_MUX_uxn_c_l225_c8_dd3f_iftrue := VAR_BIN_OP_OR_uxn_c_l229_c4_7b56_return_output;
     VAR_color0_MUX_uxn_c_l236_c8_ed67_iftrue := VAR_BIN_OP_OR_uxn_c_l240_c4_fdb4_return_output;
     VAR_color2_MUX_uxn_c_l247_c8_a61c_iftrue := VAR_BIN_OP_OR_uxn_c_l251_c4_323a_return_output;
     VAR_color0_MUX_uxn_c_l258_c8_d8df_iftrue := VAR_BIN_OP_OR_uxn_c_l261_c4_9b16_return_output;
     VAR_color2_MUX_uxn_c_l267_c8_b4f1_iftrue := VAR_BIN_OP_OR_uxn_c_l270_c4_a100_return_output;
     VAR_color1_MUX_uxn_c_l247_c8_a61c_iffalse := VAR_color1_MUX_uxn_c_l258_c8_d8df_return_output;
     VAR_color3_MUX_uxn_c_l258_c8_d8df_iffalse := VAR_color3_MUX_uxn_c_l267_c8_b4f1_return_output;
     -- color3_MUX[uxn_c_l258_c8_d8df] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l258_c8_d8df_cond <= VAR_color3_MUX_uxn_c_l258_c8_d8df_cond;
     color3_MUX_uxn_c_l258_c8_d8df_iftrue <= VAR_color3_MUX_uxn_c_l258_c8_d8df_iftrue;
     color3_MUX_uxn_c_l258_c8_d8df_iffalse <= VAR_color3_MUX_uxn_c_l258_c8_d8df_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l258_c8_d8df_return_output := color3_MUX_uxn_c_l258_c8_d8df_return_output;

     -- color1_MUX[uxn_c_l247_c8_a61c] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l247_c8_a61c_cond <= VAR_color1_MUX_uxn_c_l247_c8_a61c_cond;
     color1_MUX_uxn_c_l247_c8_a61c_iftrue <= VAR_color1_MUX_uxn_c_l247_c8_a61c_iftrue;
     color1_MUX_uxn_c_l247_c8_a61c_iffalse <= VAR_color1_MUX_uxn_c_l247_c8_a61c_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l247_c8_a61c_return_output := color1_MUX_uxn_c_l247_c8_a61c_return_output;

     -- color0_MUX[uxn_c_l258_c8_d8df] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l258_c8_d8df_cond <= VAR_color0_MUX_uxn_c_l258_c8_d8df_cond;
     color0_MUX_uxn_c_l258_c8_d8df_iftrue <= VAR_color0_MUX_uxn_c_l258_c8_d8df_iftrue;
     color0_MUX_uxn_c_l258_c8_d8df_iffalse <= VAR_color0_MUX_uxn_c_l258_c8_d8df_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l258_c8_d8df_return_output := color0_MUX_uxn_c_l258_c8_d8df_return_output;

     -- color2_MUX[uxn_c_l267_c8_b4f1] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l267_c8_b4f1_cond <= VAR_color2_MUX_uxn_c_l267_c8_b4f1_cond;
     color2_MUX_uxn_c_l267_c8_b4f1_iftrue <= VAR_color2_MUX_uxn_c_l267_c8_b4f1_iftrue;
     color2_MUX_uxn_c_l267_c8_b4f1_iffalse <= VAR_color2_MUX_uxn_c_l267_c8_b4f1_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l267_c8_b4f1_return_output := color2_MUX_uxn_c_l267_c8_b4f1_return_output;

     -- Submodule level 5
     VAR_color0_MUX_uxn_c_l247_c8_a61c_iffalse := VAR_color0_MUX_uxn_c_l258_c8_d8df_return_output;
     VAR_color1_MUX_uxn_c_l236_c8_ed67_iffalse := VAR_color1_MUX_uxn_c_l247_c8_a61c_return_output;
     VAR_color2_MUX_uxn_c_l258_c8_d8df_iffalse := VAR_color2_MUX_uxn_c_l267_c8_b4f1_return_output;
     VAR_color3_MUX_uxn_c_l247_c8_a61c_iffalse := VAR_color3_MUX_uxn_c_l258_c8_d8df_return_output;
     -- color3_MUX[uxn_c_l247_c8_a61c] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l247_c8_a61c_cond <= VAR_color3_MUX_uxn_c_l247_c8_a61c_cond;
     color3_MUX_uxn_c_l247_c8_a61c_iftrue <= VAR_color3_MUX_uxn_c_l247_c8_a61c_iftrue;
     color3_MUX_uxn_c_l247_c8_a61c_iffalse <= VAR_color3_MUX_uxn_c_l247_c8_a61c_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l247_c8_a61c_return_output := color3_MUX_uxn_c_l247_c8_a61c_return_output;

     -- color1_MUX[uxn_c_l236_c8_ed67] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l236_c8_ed67_cond <= VAR_color1_MUX_uxn_c_l236_c8_ed67_cond;
     color1_MUX_uxn_c_l236_c8_ed67_iftrue <= VAR_color1_MUX_uxn_c_l236_c8_ed67_iftrue;
     color1_MUX_uxn_c_l236_c8_ed67_iffalse <= VAR_color1_MUX_uxn_c_l236_c8_ed67_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l236_c8_ed67_return_output := color1_MUX_uxn_c_l236_c8_ed67_return_output;

     -- color0_MUX[uxn_c_l247_c8_a61c] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l247_c8_a61c_cond <= VAR_color0_MUX_uxn_c_l247_c8_a61c_cond;
     color0_MUX_uxn_c_l247_c8_a61c_iftrue <= VAR_color0_MUX_uxn_c_l247_c8_a61c_iftrue;
     color0_MUX_uxn_c_l247_c8_a61c_iffalse <= VAR_color0_MUX_uxn_c_l247_c8_a61c_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l247_c8_a61c_return_output := color0_MUX_uxn_c_l247_c8_a61c_return_output;

     -- color2_MUX[uxn_c_l258_c8_d8df] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l258_c8_d8df_cond <= VAR_color2_MUX_uxn_c_l258_c8_d8df_cond;
     color2_MUX_uxn_c_l258_c8_d8df_iftrue <= VAR_color2_MUX_uxn_c_l258_c8_d8df_iftrue;
     color2_MUX_uxn_c_l258_c8_d8df_iffalse <= VAR_color2_MUX_uxn_c_l258_c8_d8df_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l258_c8_d8df_return_output := color2_MUX_uxn_c_l258_c8_d8df_return_output;

     -- Submodule level 6
     VAR_color0_MUX_uxn_c_l236_c8_ed67_iffalse := VAR_color0_MUX_uxn_c_l247_c8_a61c_return_output;
     VAR_color1_MUX_uxn_c_l225_c8_dd3f_iffalse := VAR_color1_MUX_uxn_c_l236_c8_ed67_return_output;
     VAR_color2_MUX_uxn_c_l247_c8_a61c_iffalse := VAR_color2_MUX_uxn_c_l258_c8_d8df_return_output;
     VAR_color3_MUX_uxn_c_l236_c8_ed67_iffalse := VAR_color3_MUX_uxn_c_l247_c8_a61c_return_output;
     -- color3_MUX[uxn_c_l236_c8_ed67] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l236_c8_ed67_cond <= VAR_color3_MUX_uxn_c_l236_c8_ed67_cond;
     color3_MUX_uxn_c_l236_c8_ed67_iftrue <= VAR_color3_MUX_uxn_c_l236_c8_ed67_iftrue;
     color3_MUX_uxn_c_l236_c8_ed67_iffalse <= VAR_color3_MUX_uxn_c_l236_c8_ed67_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l236_c8_ed67_return_output := color3_MUX_uxn_c_l236_c8_ed67_return_output;

     -- color2_MUX[uxn_c_l247_c8_a61c] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l247_c8_a61c_cond <= VAR_color2_MUX_uxn_c_l247_c8_a61c_cond;
     color2_MUX_uxn_c_l247_c8_a61c_iftrue <= VAR_color2_MUX_uxn_c_l247_c8_a61c_iftrue;
     color2_MUX_uxn_c_l247_c8_a61c_iffalse <= VAR_color2_MUX_uxn_c_l247_c8_a61c_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l247_c8_a61c_return_output := color2_MUX_uxn_c_l247_c8_a61c_return_output;

     -- color0_MUX[uxn_c_l236_c8_ed67] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l236_c8_ed67_cond <= VAR_color0_MUX_uxn_c_l236_c8_ed67_cond;
     color0_MUX_uxn_c_l236_c8_ed67_iftrue <= VAR_color0_MUX_uxn_c_l236_c8_ed67_iftrue;
     color0_MUX_uxn_c_l236_c8_ed67_iffalse <= VAR_color0_MUX_uxn_c_l236_c8_ed67_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l236_c8_ed67_return_output := color0_MUX_uxn_c_l236_c8_ed67_return_output;

     -- color1_MUX[uxn_c_l225_c8_dd3f] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l225_c8_dd3f_cond <= VAR_color1_MUX_uxn_c_l225_c8_dd3f_cond;
     color1_MUX_uxn_c_l225_c8_dd3f_iftrue <= VAR_color1_MUX_uxn_c_l225_c8_dd3f_iftrue;
     color1_MUX_uxn_c_l225_c8_dd3f_iffalse <= VAR_color1_MUX_uxn_c_l225_c8_dd3f_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l225_c8_dd3f_return_output := color1_MUX_uxn_c_l225_c8_dd3f_return_output;

     -- Submodule level 7
     VAR_color0_MUX_uxn_c_l225_c8_dd3f_iffalse := VAR_color0_MUX_uxn_c_l236_c8_ed67_return_output;
     VAR_color1_MUX_uxn_c_l214_c3_56dd_iffalse := VAR_color1_MUX_uxn_c_l225_c8_dd3f_return_output;
     VAR_color2_MUX_uxn_c_l236_c8_ed67_iffalse := VAR_color2_MUX_uxn_c_l247_c8_a61c_return_output;
     VAR_color3_MUX_uxn_c_l225_c8_dd3f_iffalse := VAR_color3_MUX_uxn_c_l236_c8_ed67_return_output;
     -- color3_MUX[uxn_c_l225_c8_dd3f] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l225_c8_dd3f_cond <= VAR_color3_MUX_uxn_c_l225_c8_dd3f_cond;
     color3_MUX_uxn_c_l225_c8_dd3f_iftrue <= VAR_color3_MUX_uxn_c_l225_c8_dd3f_iftrue;
     color3_MUX_uxn_c_l225_c8_dd3f_iffalse <= VAR_color3_MUX_uxn_c_l225_c8_dd3f_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l225_c8_dd3f_return_output := color3_MUX_uxn_c_l225_c8_dd3f_return_output;

     -- color1_MUX[uxn_c_l214_c3_56dd] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l214_c3_56dd_cond <= VAR_color1_MUX_uxn_c_l214_c3_56dd_cond;
     color1_MUX_uxn_c_l214_c3_56dd_iftrue <= VAR_color1_MUX_uxn_c_l214_c3_56dd_iftrue;
     color1_MUX_uxn_c_l214_c3_56dd_iffalse <= VAR_color1_MUX_uxn_c_l214_c3_56dd_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l214_c3_56dd_return_output := color1_MUX_uxn_c_l214_c3_56dd_return_output;

     -- color0_MUX[uxn_c_l225_c8_dd3f] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l225_c8_dd3f_cond <= VAR_color0_MUX_uxn_c_l225_c8_dd3f_cond;
     color0_MUX_uxn_c_l225_c8_dd3f_iftrue <= VAR_color0_MUX_uxn_c_l225_c8_dd3f_iftrue;
     color0_MUX_uxn_c_l225_c8_dd3f_iffalse <= VAR_color0_MUX_uxn_c_l225_c8_dd3f_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l225_c8_dd3f_return_output := color0_MUX_uxn_c_l225_c8_dd3f_return_output;

     -- color2_MUX[uxn_c_l236_c8_ed67] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l236_c8_ed67_cond <= VAR_color2_MUX_uxn_c_l236_c8_ed67_cond;
     color2_MUX_uxn_c_l236_c8_ed67_iftrue <= VAR_color2_MUX_uxn_c_l236_c8_ed67_iftrue;
     color2_MUX_uxn_c_l236_c8_ed67_iffalse <= VAR_color2_MUX_uxn_c_l236_c8_ed67_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l236_c8_ed67_return_output := color2_MUX_uxn_c_l236_c8_ed67_return_output;

     -- Submodule level 8
     VAR_color0_MUX_uxn_c_l214_c3_56dd_iffalse := VAR_color0_MUX_uxn_c_l225_c8_dd3f_return_output;
     VAR_color1_MUX_uxn_c_l210_c2_3a91_iftrue := VAR_color1_MUX_uxn_c_l214_c3_56dd_return_output;
     VAR_color2_MUX_uxn_c_l225_c8_dd3f_iffalse := VAR_color2_MUX_uxn_c_l236_c8_ed67_return_output;
     VAR_color3_MUX_uxn_c_l214_c3_56dd_iffalse := VAR_color3_MUX_uxn_c_l225_c8_dd3f_return_output;
     -- color3_MUX[uxn_c_l214_c3_56dd] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l214_c3_56dd_cond <= VAR_color3_MUX_uxn_c_l214_c3_56dd_cond;
     color3_MUX_uxn_c_l214_c3_56dd_iftrue <= VAR_color3_MUX_uxn_c_l214_c3_56dd_iftrue;
     color3_MUX_uxn_c_l214_c3_56dd_iffalse <= VAR_color3_MUX_uxn_c_l214_c3_56dd_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l214_c3_56dd_return_output := color3_MUX_uxn_c_l214_c3_56dd_return_output;

     -- color2_MUX[uxn_c_l225_c8_dd3f] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l225_c8_dd3f_cond <= VAR_color2_MUX_uxn_c_l225_c8_dd3f_cond;
     color2_MUX_uxn_c_l225_c8_dd3f_iftrue <= VAR_color2_MUX_uxn_c_l225_c8_dd3f_iftrue;
     color2_MUX_uxn_c_l225_c8_dd3f_iffalse <= VAR_color2_MUX_uxn_c_l225_c8_dd3f_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l225_c8_dd3f_return_output := color2_MUX_uxn_c_l225_c8_dd3f_return_output;

     -- color1_MUX[uxn_c_l210_c2_3a91] LATENCY=0
     -- Inputs
     color1_MUX_uxn_c_l210_c2_3a91_cond <= VAR_color1_MUX_uxn_c_l210_c2_3a91_cond;
     color1_MUX_uxn_c_l210_c2_3a91_iftrue <= VAR_color1_MUX_uxn_c_l210_c2_3a91_iftrue;
     color1_MUX_uxn_c_l210_c2_3a91_iffalse <= VAR_color1_MUX_uxn_c_l210_c2_3a91_iffalse;
     -- Outputs
     VAR_color1_MUX_uxn_c_l210_c2_3a91_return_output := color1_MUX_uxn_c_l210_c2_3a91_return_output;

     -- color0_MUX[uxn_c_l214_c3_56dd] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l214_c3_56dd_cond <= VAR_color0_MUX_uxn_c_l214_c3_56dd_cond;
     color0_MUX_uxn_c_l214_c3_56dd_iftrue <= VAR_color0_MUX_uxn_c_l214_c3_56dd_iftrue;
     color0_MUX_uxn_c_l214_c3_56dd_iffalse <= VAR_color0_MUX_uxn_c_l214_c3_56dd_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l214_c3_56dd_return_output := color0_MUX_uxn_c_l214_c3_56dd_return_output;

     -- Submodule level 9
     VAR_color0_MUX_uxn_c_l210_c2_3a91_iftrue := VAR_color0_MUX_uxn_c_l214_c3_56dd_return_output;
     REG_VAR_color1 := VAR_color1_MUX_uxn_c_l210_c2_3a91_return_output;
     VAR_result_uxn_c_l281_c3_50f6 := resize(VAR_color1_MUX_uxn_c_l210_c2_3a91_return_output, 16);
     VAR_color2_MUX_uxn_c_l214_c3_56dd_iffalse := VAR_color2_MUX_uxn_c_l225_c8_dd3f_return_output;
     VAR_color3_MUX_uxn_c_l210_c2_3a91_iftrue := VAR_color3_MUX_uxn_c_l214_c3_56dd_return_output;
     VAR_result_MUX_uxn_c_l280_c9_e221_iftrue := VAR_result_uxn_c_l281_c3_50f6;
     -- color3_MUX[uxn_c_l210_c2_3a91] LATENCY=0
     -- Inputs
     color3_MUX_uxn_c_l210_c2_3a91_cond <= VAR_color3_MUX_uxn_c_l210_c2_3a91_cond;
     color3_MUX_uxn_c_l210_c2_3a91_iftrue <= VAR_color3_MUX_uxn_c_l210_c2_3a91_iftrue;
     color3_MUX_uxn_c_l210_c2_3a91_iffalse <= VAR_color3_MUX_uxn_c_l210_c2_3a91_iffalse;
     -- Outputs
     VAR_color3_MUX_uxn_c_l210_c2_3a91_return_output := color3_MUX_uxn_c_l210_c2_3a91_return_output;

     -- color2_MUX[uxn_c_l214_c3_56dd] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l214_c3_56dd_cond <= VAR_color2_MUX_uxn_c_l214_c3_56dd_cond;
     color2_MUX_uxn_c_l214_c3_56dd_iftrue <= VAR_color2_MUX_uxn_c_l214_c3_56dd_iftrue;
     color2_MUX_uxn_c_l214_c3_56dd_iffalse <= VAR_color2_MUX_uxn_c_l214_c3_56dd_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l214_c3_56dd_return_output := color2_MUX_uxn_c_l214_c3_56dd_return_output;

     -- color0_MUX[uxn_c_l210_c2_3a91] LATENCY=0
     -- Inputs
     color0_MUX_uxn_c_l210_c2_3a91_cond <= VAR_color0_MUX_uxn_c_l210_c2_3a91_cond;
     color0_MUX_uxn_c_l210_c2_3a91_iftrue <= VAR_color0_MUX_uxn_c_l210_c2_3a91_iftrue;
     color0_MUX_uxn_c_l210_c2_3a91_iffalse <= VAR_color0_MUX_uxn_c_l210_c2_3a91_iffalse;
     -- Outputs
     VAR_color0_MUX_uxn_c_l210_c2_3a91_return_output := color0_MUX_uxn_c_l210_c2_3a91_return_output;

     -- Submodule level 10
     REG_VAR_color0 := VAR_color0_MUX_uxn_c_l210_c2_3a91_return_output;
     VAR_result_uxn_c_l279_c3_5a22 := resize(VAR_color0_MUX_uxn_c_l210_c2_3a91_return_output, 16);
     VAR_color2_MUX_uxn_c_l210_c2_3a91_iftrue := VAR_color2_MUX_uxn_c_l214_c3_56dd_return_output;
     REG_VAR_color3 := VAR_color3_MUX_uxn_c_l210_c2_3a91_return_output;
     VAR_result_uxn_c_l285_c3_8a1e := resize(VAR_color3_MUX_uxn_c_l210_c2_3a91_return_output, 16);
     VAR_result_MUX_uxn_c_l278_c2_1d34_iftrue := VAR_result_uxn_c_l279_c3_5a22;
     VAR_result_MUX_uxn_c_l282_c9_b3e6_iffalse := VAR_result_uxn_c_l285_c3_8a1e;
     -- color2_MUX[uxn_c_l210_c2_3a91] LATENCY=0
     -- Inputs
     color2_MUX_uxn_c_l210_c2_3a91_cond <= VAR_color2_MUX_uxn_c_l210_c2_3a91_cond;
     color2_MUX_uxn_c_l210_c2_3a91_iftrue <= VAR_color2_MUX_uxn_c_l210_c2_3a91_iftrue;
     color2_MUX_uxn_c_l210_c2_3a91_iffalse <= VAR_color2_MUX_uxn_c_l210_c2_3a91_iffalse;
     -- Outputs
     VAR_color2_MUX_uxn_c_l210_c2_3a91_return_output := color2_MUX_uxn_c_l210_c2_3a91_return_output;

     -- Submodule level 11
     REG_VAR_color2 := VAR_color2_MUX_uxn_c_l210_c2_3a91_return_output;
     VAR_result_uxn_c_l283_c3_4ac1 := resize(VAR_color2_MUX_uxn_c_l210_c2_3a91_return_output, 16);
     VAR_result_MUX_uxn_c_l282_c9_b3e6_iftrue := VAR_result_uxn_c_l283_c3_4ac1;
     -- result_MUX[uxn_c_l282_c9_b3e6] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l282_c9_b3e6_cond <= VAR_result_MUX_uxn_c_l282_c9_b3e6_cond;
     result_MUX_uxn_c_l282_c9_b3e6_iftrue <= VAR_result_MUX_uxn_c_l282_c9_b3e6_iftrue;
     result_MUX_uxn_c_l282_c9_b3e6_iffalse <= VAR_result_MUX_uxn_c_l282_c9_b3e6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l282_c9_b3e6_return_output := result_MUX_uxn_c_l282_c9_b3e6_return_output;

     -- Submodule level 12
     VAR_result_MUX_uxn_c_l280_c9_e221_iffalse := VAR_result_MUX_uxn_c_l282_c9_b3e6_return_output;
     -- result_MUX[uxn_c_l280_c9_e221] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l280_c9_e221_cond <= VAR_result_MUX_uxn_c_l280_c9_e221_cond;
     result_MUX_uxn_c_l280_c9_e221_iftrue <= VAR_result_MUX_uxn_c_l280_c9_e221_iftrue;
     result_MUX_uxn_c_l280_c9_e221_iffalse <= VAR_result_MUX_uxn_c_l280_c9_e221_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l280_c9_e221_return_output := result_MUX_uxn_c_l280_c9_e221_return_output;

     -- Submodule level 13
     VAR_result_MUX_uxn_c_l278_c2_1d34_iffalse := VAR_result_MUX_uxn_c_l280_c9_e221_return_output;
     -- result_MUX[uxn_c_l278_c2_1d34] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l278_c2_1d34_cond <= VAR_result_MUX_uxn_c_l278_c2_1d34_cond;
     result_MUX_uxn_c_l278_c2_1d34_iftrue <= VAR_result_MUX_uxn_c_l278_c2_1d34_iftrue;
     result_MUX_uxn_c_l278_c2_1d34_iffalse <= VAR_result_MUX_uxn_c_l278_c2_1d34_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l278_c2_1d34_return_output := result_MUX_uxn_c_l278_c2_1d34_return_output;

     -- Submodule level 14
     VAR_return_output := VAR_result_MUX_uxn_c_l278_c2_1d34_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_color0 <= REG_VAR_color0;
REG_COMB_color1 <= REG_VAR_color1;
REG_COMB_color2 <= REG_VAR_color2;
REG_COMB_color3 <= REG_VAR_color3;
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
 end if;
 end if;
end process;

end arch;
