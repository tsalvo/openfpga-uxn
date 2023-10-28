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
-- Submodules: 25
entity device_out_0CLK_388fdae8 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 value : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end device_out_0CLK_388fdae8;
architecture arch of device_out_0CLK_388fdae8 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : device_out_result_t := (
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
vram_address => to_unsigned(0, 32),
ram_address => to_unsigned(0, 16),
u8_value => to_unsigned(0, 8),
is_deo_done => to_unsigned(0, 1))
;
signal device_index : unsigned(3 downto 0) := to_unsigned(0, 4);
signal device_port : unsigned(3 downto 0) := to_unsigned(0, 4);
signal deo_mask : uint16_t_16 := (
0 => to_unsigned(65320, 16),
1 => to_unsigned(768, 16),
2 => to_unsigned(49192, 16),
3 => to_unsigned(32768, 16),
4 => to_unsigned(32768, 16),
5 => to_unsigned(32768, 16),
6 => to_unsigned(32768, 16),
7 => to_unsigned(0, 16),
8 => to_unsigned(0, 16),
9 => to_unsigned(0, 16),
10 => to_unsigned(41568, 16),
11 => to_unsigned(41568, 16),
12 => to_unsigned(0, 16),
13 => to_unsigned(0, 16),
14 => to_unsigned(0, 16),
15 => to_unsigned(0, 16),
others => to_unsigned(0, 16))
;
signal REG_COMB_result : device_out_result_t;
signal REG_COMB_device_index : unsigned(3 downto 0);
signal REG_COMB_device_port : unsigned(3 downto 0);
signal REG_COMB_deo_mask : uint16_t_16;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l243_c6_b586]
signal BIN_OP_EQ_uxn_device_h_l243_c6_b586_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l243_c6_b586_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l243_c6_b586_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l252_c7_6953]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l252_c7_6953_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l252_c7_6953_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l252_c7_6953_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l252_c7_6953_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l243_c2_1730]
signal result_MUX_uxn_device_h_l243_c2_1730_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l243_c2_1730_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l243_c2_1730_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l243_c2_1730_return_output : device_out_result_t;

-- device_port_MUX[uxn_device_h_l243_c2_1730]
signal device_port_MUX_uxn_device_h_l243_c2_1730_cond : unsigned(0 downto 0);
signal device_port_MUX_uxn_device_h_l243_c2_1730_iftrue : unsigned(3 downto 0);
signal device_port_MUX_uxn_device_h_l243_c2_1730_iffalse : unsigned(3 downto 0);
signal device_port_MUX_uxn_device_h_l243_c2_1730_return_output : unsigned(3 downto 0);

-- device_index_MUX[uxn_device_h_l243_c2_1730]
signal device_index_MUX_uxn_device_h_l243_c2_1730_cond : unsigned(0 downto 0);
signal device_index_MUX_uxn_device_h_l243_c2_1730_iftrue : unsigned(3 downto 0);
signal device_index_MUX_uxn_device_h_l243_c2_1730_iffalse : unsigned(3 downto 0);
signal device_index_MUX_uxn_device_h_l243_c2_1730_return_output : unsigned(3 downto 0);

-- BIN_OP_AND[uxn_device_h_l248_c27_7786]
signal BIN_OP_AND_uxn_device_h_l248_c27_7786_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l248_c27_7786_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l248_c27_7786_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l250_c24_dcb1]
signal BIN_OP_EQ_uxn_device_h_l250_c24_dcb1_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_device_h_l250_c24_dcb1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l250_c24_dcb1_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l250_c24_69e0]
signal MUX_uxn_device_h_l250_c24_69e0_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l250_c24_69e0_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l250_c24_69e0_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l250_c24_69e0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l252_c11_e223]
signal BIN_OP_EQ_uxn_device_h_l252_c11_e223_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l252_c11_e223_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l252_c11_e223_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l258_c1_2422]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c1_2422_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c1_2422_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c1_2422_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c1_2422_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l252_c7_6953]
signal result_MUX_uxn_device_h_l252_c7_6953_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l252_c7_6953_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l252_c7_6953_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l252_c7_6953_return_output : device_out_result_t;

-- device_port_MUX[uxn_device_h_l252_c7_6953]
signal device_port_MUX_uxn_device_h_l252_c7_6953_cond : unsigned(0 downto 0);
signal device_port_MUX_uxn_device_h_l252_c7_6953_iftrue : unsigned(3 downto 0);
signal device_port_MUX_uxn_device_h_l252_c7_6953_iffalse : unsigned(3 downto 0);
signal device_port_MUX_uxn_device_h_l252_c7_6953_return_output : unsigned(3 downto 0);

-- device_index_MUX[uxn_device_h_l252_c7_6953]
signal device_index_MUX_uxn_device_h_l252_c7_6953_cond : unsigned(0 downto 0);
signal device_index_MUX_uxn_device_h_l252_c7_6953_iftrue : unsigned(3 downto 0);
signal device_index_MUX_uxn_device_h_l252_c7_6953_iffalse : unsigned(3 downto 0);
signal device_index_MUX_uxn_device_h_l252_c7_6953_return_output : unsigned(3 downto 0);

-- BIN_OP_AND[uxn_device_h_l254_c27_6244]
signal BIN_OP_AND_uxn_device_h_l254_c27_6244_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l254_c27_6244_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l254_c27_6244_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l256_c24_476a]
signal BIN_OP_EQ_uxn_device_h_l256_c24_476a_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_device_h_l256_c24_476a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l256_c24_476a_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l256_c24_0eaf]
signal MUX_uxn_device_h_l256_c24_0eaf_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l256_c24_0eaf_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l256_c24_0eaf_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l256_c24_0eaf_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l259_c47_f135]
signal BIN_OP_MINUS_uxn_device_h_l259_c47_f135_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l259_c47_f135_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l259_c47_f135_return_output : unsigned(7 downto 0);

-- emu_deo[uxn_device_h_l259_c12_0e66]
signal emu_deo_uxn_device_h_l259_c12_0e66_CLOCK_ENABLE : unsigned(0 downto 0);
signal emu_deo_uxn_device_h_l259_c12_0e66_device_index : unsigned(3 downto 0);
signal emu_deo_uxn_device_h_l259_c12_0e66_device_port : unsigned(3 downto 0);
signal emu_deo_uxn_device_h_l259_c12_0e66_phase : unsigned(7 downto 0);
signal emu_deo_uxn_device_h_l259_c12_0e66_previous_device_ram_read : unsigned(7 downto 0);
signal emu_deo_uxn_device_h_l259_c12_0e66_previous_ram_read : unsigned(7 downto 0);
signal emu_deo_uxn_device_h_l259_c12_0e66_return_output : device_out_result_t;

-- CONST_SR_4_uint8_t_uxn_device_h_l255_l249_DUPLICATE_7244
signal CONST_SR_4_uint8_t_uxn_device_h_l255_l249_DUPLICATE_7244_x : unsigned(7 downto 0);
signal CONST_SR_4_uint8_t_uxn_device_h_l255_l249_DUPLICATE_7244_return_output : unsigned(7 downto 0);

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l250_l256_DUPLICATE_1748
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l250_l256_DUPLICATE_1748_ref_toks_0 : uint16_t_16;
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l250_l256_DUPLICATE_1748_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l250_l256_DUPLICATE_1748_return_output : unsigned(15 downto 0);

function CAST_TO_uint4_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
    return return_output;
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_e500( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.is_device_ram_write := ref_toks_2;
      base.device_ram_address := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_deo_done := ref_toks_5;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_cf24( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_device_ram_write := ref_toks_1;
      base.is_deo_done := ref_toks_2;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_device_h_l243_c6_b586
BIN_OP_EQ_uxn_device_h_l243_c6_b586 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l243_c6_b586_left,
BIN_OP_EQ_uxn_device_h_l243_c6_b586_right,
BIN_OP_EQ_uxn_device_h_l243_c6_b586_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l252_c7_6953
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l252_c7_6953 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l252_c7_6953_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l252_c7_6953_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l252_c7_6953_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l252_c7_6953_return_output);

-- result_MUX_uxn_device_h_l243_c2_1730
result_MUX_uxn_device_h_l243_c2_1730 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l243_c2_1730_cond,
result_MUX_uxn_device_h_l243_c2_1730_iftrue,
result_MUX_uxn_device_h_l243_c2_1730_iffalse,
result_MUX_uxn_device_h_l243_c2_1730_return_output);

-- device_port_MUX_uxn_device_h_l243_c2_1730
device_port_MUX_uxn_device_h_l243_c2_1730 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
device_port_MUX_uxn_device_h_l243_c2_1730_cond,
device_port_MUX_uxn_device_h_l243_c2_1730_iftrue,
device_port_MUX_uxn_device_h_l243_c2_1730_iffalse,
device_port_MUX_uxn_device_h_l243_c2_1730_return_output);

-- device_index_MUX_uxn_device_h_l243_c2_1730
device_index_MUX_uxn_device_h_l243_c2_1730 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
device_index_MUX_uxn_device_h_l243_c2_1730_cond,
device_index_MUX_uxn_device_h_l243_c2_1730_iftrue,
device_index_MUX_uxn_device_h_l243_c2_1730_iffalse,
device_index_MUX_uxn_device_h_l243_c2_1730_return_output);

-- BIN_OP_AND_uxn_device_h_l248_c27_7786
BIN_OP_AND_uxn_device_h_l248_c27_7786 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l248_c27_7786_left,
BIN_OP_AND_uxn_device_h_l248_c27_7786_right,
BIN_OP_AND_uxn_device_h_l248_c27_7786_return_output);

-- BIN_OP_EQ_uxn_device_h_l250_c24_dcb1
BIN_OP_EQ_uxn_device_h_l250_c24_dcb1 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l250_c24_dcb1_left,
BIN_OP_EQ_uxn_device_h_l250_c24_dcb1_right,
BIN_OP_EQ_uxn_device_h_l250_c24_dcb1_return_output);

-- MUX_uxn_device_h_l250_c24_69e0
MUX_uxn_device_h_l250_c24_69e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l250_c24_69e0_cond,
MUX_uxn_device_h_l250_c24_69e0_iftrue,
MUX_uxn_device_h_l250_c24_69e0_iffalse,
MUX_uxn_device_h_l250_c24_69e0_return_output);

-- BIN_OP_EQ_uxn_device_h_l252_c11_e223
BIN_OP_EQ_uxn_device_h_l252_c11_e223 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l252_c11_e223_left,
BIN_OP_EQ_uxn_device_h_l252_c11_e223_right,
BIN_OP_EQ_uxn_device_h_l252_c11_e223_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c1_2422
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c1_2422 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c1_2422_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c1_2422_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c1_2422_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c1_2422_return_output);

-- result_MUX_uxn_device_h_l252_c7_6953
result_MUX_uxn_device_h_l252_c7_6953 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l252_c7_6953_cond,
result_MUX_uxn_device_h_l252_c7_6953_iftrue,
result_MUX_uxn_device_h_l252_c7_6953_iffalse,
result_MUX_uxn_device_h_l252_c7_6953_return_output);

-- device_port_MUX_uxn_device_h_l252_c7_6953
device_port_MUX_uxn_device_h_l252_c7_6953 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
device_port_MUX_uxn_device_h_l252_c7_6953_cond,
device_port_MUX_uxn_device_h_l252_c7_6953_iftrue,
device_port_MUX_uxn_device_h_l252_c7_6953_iffalse,
device_port_MUX_uxn_device_h_l252_c7_6953_return_output);

-- device_index_MUX_uxn_device_h_l252_c7_6953
device_index_MUX_uxn_device_h_l252_c7_6953 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
device_index_MUX_uxn_device_h_l252_c7_6953_cond,
device_index_MUX_uxn_device_h_l252_c7_6953_iftrue,
device_index_MUX_uxn_device_h_l252_c7_6953_iffalse,
device_index_MUX_uxn_device_h_l252_c7_6953_return_output);

-- BIN_OP_AND_uxn_device_h_l254_c27_6244
BIN_OP_AND_uxn_device_h_l254_c27_6244 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l254_c27_6244_left,
BIN_OP_AND_uxn_device_h_l254_c27_6244_right,
BIN_OP_AND_uxn_device_h_l254_c27_6244_return_output);

-- BIN_OP_EQ_uxn_device_h_l256_c24_476a
BIN_OP_EQ_uxn_device_h_l256_c24_476a : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l256_c24_476a_left,
BIN_OP_EQ_uxn_device_h_l256_c24_476a_right,
BIN_OP_EQ_uxn_device_h_l256_c24_476a_return_output);

-- MUX_uxn_device_h_l256_c24_0eaf
MUX_uxn_device_h_l256_c24_0eaf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l256_c24_0eaf_cond,
MUX_uxn_device_h_l256_c24_0eaf_iftrue,
MUX_uxn_device_h_l256_c24_0eaf_iffalse,
MUX_uxn_device_h_l256_c24_0eaf_return_output);

-- BIN_OP_MINUS_uxn_device_h_l259_c47_f135
BIN_OP_MINUS_uxn_device_h_l259_c47_f135 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l259_c47_f135_left,
BIN_OP_MINUS_uxn_device_h_l259_c47_f135_right,
BIN_OP_MINUS_uxn_device_h_l259_c47_f135_return_output);

-- emu_deo_uxn_device_h_l259_c12_0e66
emu_deo_uxn_device_h_l259_c12_0e66 : entity work.emu_deo_0CLK_25ec8415 port map (
clk,
emu_deo_uxn_device_h_l259_c12_0e66_CLOCK_ENABLE,
emu_deo_uxn_device_h_l259_c12_0e66_device_index,
emu_deo_uxn_device_h_l259_c12_0e66_device_port,
emu_deo_uxn_device_h_l259_c12_0e66_phase,
emu_deo_uxn_device_h_l259_c12_0e66_previous_device_ram_read,
emu_deo_uxn_device_h_l259_c12_0e66_previous_ram_read,
emu_deo_uxn_device_h_l259_c12_0e66_return_output);

-- CONST_SR_4_uint8_t_uxn_device_h_l255_l249_DUPLICATE_7244
CONST_SR_4_uint8_t_uxn_device_h_l255_l249_DUPLICATE_7244 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uint8_t_uxn_device_h_l255_l249_DUPLICATE_7244_x,
CONST_SR_4_uint8_t_uxn_device_h_l255_l249_DUPLICATE_7244_return_output);

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l250_l256_DUPLICATE_1748
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l250_l256_DUPLICATE_1748 : entity work.VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_0CLK_763c90e8 port map (
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l250_l256_DUPLICATE_1748_ref_toks_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l250_l256_DUPLICATE_1748_var_dim_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l250_l256_DUPLICATE_1748_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_address,
 value,
 phase,
 previous_device_ram_read,
 previous_ram_read,
 -- Registers
 result,
 device_index,
 device_port,
 deo_mask,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l243_c6_b586_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l252_c7_6953_return_output,
 result_MUX_uxn_device_h_l243_c2_1730_return_output,
 device_port_MUX_uxn_device_h_l243_c2_1730_return_output,
 device_index_MUX_uxn_device_h_l243_c2_1730_return_output,
 BIN_OP_AND_uxn_device_h_l248_c27_7786_return_output,
 BIN_OP_EQ_uxn_device_h_l250_c24_dcb1_return_output,
 MUX_uxn_device_h_l250_c24_69e0_return_output,
 BIN_OP_EQ_uxn_device_h_l252_c11_e223_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c1_2422_return_output,
 result_MUX_uxn_device_h_l252_c7_6953_return_output,
 device_port_MUX_uxn_device_h_l252_c7_6953_return_output,
 device_index_MUX_uxn_device_h_l252_c7_6953_return_output,
 BIN_OP_AND_uxn_device_h_l254_c27_6244_return_output,
 BIN_OP_EQ_uxn_device_h_l256_c24_476a_return_output,
 MUX_uxn_device_h_l256_c24_0eaf_return_output,
 BIN_OP_MINUS_uxn_device_h_l259_c47_f135_return_output,
 emu_deo_uxn_device_h_l259_c12_0e66_return_output,
 CONST_SR_4_uint8_t_uxn_device_h_l255_l249_DUPLICATE_7244_return_output,
 VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l250_l256_DUPLICATE_1748_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_value : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l243_c6_b586_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l243_c6_b586_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l243_c6_b586_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l252_c7_6953_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l252_c7_6953_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l252_c7_6953_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l252_c7_6953_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l243_c2_1730_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_e500_uxn_device_h_l243_c2_1730_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l243_c2_1730_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l252_c7_6953_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l243_c2_1730_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l243_c2_1730_cond : unsigned(0 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l243_c2_1730_iftrue : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l243_c2_1730_iffalse : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l252_c7_6953_return_output : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l243_c2_1730_return_output : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l243_c2_1730_cond : unsigned(0 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l243_c2_1730_iftrue : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l243_c2_1730_iffalse : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l252_c7_6953_return_output : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l243_c2_1730_return_output : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l243_c2_1730_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l248_c27_7786_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l248_c27_7786_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l248_c27_7786_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l248_c17_0a9c_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_device_h_l250_c24_69e0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l250_c24_69e0_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l250_c24_69e0_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l250_c24_dcb1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l250_c24_dcb1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l250_c24_dcb1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l250_c24_69e0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l252_c11_e223_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l252_c11_e223_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l252_c11_e223_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c1_2422_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c1_2422_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c1_2422_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c1_2422_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l252_c7_6953_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cf24_uxn_device_h_l252_c7_6953_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l252_c7_6953_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l252_c7_6953_cond : unsigned(0 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l252_c7_6953_iftrue : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l252_c7_6953_iffalse : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l252_c7_6953_cond : unsigned(0 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l252_c7_6953_iftrue : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l252_c7_6953_iffalse : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l252_c7_6953_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l254_c27_6244_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l254_c27_6244_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l254_c27_6244_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l254_c17_70f4_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_device_h_l256_c24_0eaf_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l256_c24_0eaf_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l256_c24_0eaf_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l256_c24_476a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l256_c24_476a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l256_c24_476a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l256_c24_0eaf_return_output : unsigned(0 downto 0);
 variable VAR_emu_deo_uxn_device_h_l259_c12_0e66_device_index : unsigned(3 downto 0);
 variable VAR_emu_deo_uxn_device_h_l259_c12_0e66_device_port : unsigned(3 downto 0);
 variable VAR_emu_deo_uxn_device_h_l259_c12_0e66_phase : unsigned(7 downto 0);
 variable VAR_emu_deo_uxn_device_h_l259_c12_0e66_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_emu_deo_uxn_device_h_l259_c12_0e66_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l259_c47_f135_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l259_c47_f135_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l259_c47_f135_return_output : unsigned(7 downto 0);
 variable VAR_emu_deo_uxn_device_h_l259_c12_0e66_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_emu_deo_uxn_device_h_l259_c12_0e66_return_output : device_out_result_t;
 variable VAR_CONST_SR_4_uint8_t_uxn_device_h_l255_l249_DUPLICATE_7244_x : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uint8_t_uxn_device_h_l255_l249_DUPLICATE_7244_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l249_l255_DUPLICATE_f333_return_output : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l250_l256_DUPLICATE_1748_ref_toks_0 : uint16_t_16;
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l250_l256_DUPLICATE_1748_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l250_l256_DUPLICATE_1748_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_result : device_out_result_t;
variable REG_VAR_device_index : unsigned(3 downto 0);
variable REG_VAR_device_port : unsigned(3 downto 0);
variable REG_VAR_deo_mask : uint16_t_16;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
  REG_VAR_device_index := device_index;
  REG_VAR_device_port := device_port;
  REG_VAR_deo_mask := deo_mask;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c1_2422_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l256_c24_476a_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l250_c24_69e0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l243_c6_b586_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l252_c7_6953_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l252_c11_e223_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l256_c24_0eaf_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l259_c47_f135_right := to_unsigned(2, 2);
     VAR_BIN_OP_AND_uxn_device_h_l254_c27_6244_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l250_c24_dcb1_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l250_c24_69e0_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l256_c24_0eaf_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l248_c27_7786_right := to_unsigned(15, 4);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_address := device_address;
     VAR_value := value;
     VAR_phase := phase;
     VAR_previous_device_ram_read := previous_device_ram_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l252_c7_6953_iffalse := VAR_CLOCK_ENABLE;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l250_l256_DUPLICATE_1748_ref_toks_0 := deo_mask;
     REG_VAR_deo_mask := deo_mask;
     VAR_BIN_OP_AND_uxn_device_h_l248_c27_7786_left := VAR_device_address;
     VAR_BIN_OP_AND_uxn_device_h_l254_c27_6244_left := VAR_device_address;
     VAR_CONST_SR_4_uint8_t_uxn_device_h_l255_l249_DUPLICATE_7244_x := VAR_device_address;
     VAR_device_index_MUX_uxn_device_h_l252_c7_6953_iffalse := device_index;
     VAR_emu_deo_uxn_device_h_l259_c12_0e66_device_index := device_index;
     VAR_device_port_MUX_uxn_device_h_l252_c7_6953_iffalse := device_port;
     VAR_emu_deo_uxn_device_h_l259_c12_0e66_device_port := device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l243_c6_b586_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l252_c11_e223_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l259_c47_f135_left := VAR_phase;
     VAR_emu_deo_uxn_device_h_l259_c12_0e66_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_emu_deo_uxn_device_h_l259_c12_0e66_previous_ram_read := VAR_previous_ram_read;
     -- BIN_OP_AND[uxn_device_h_l254_c27_6244] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l254_c27_6244_left <= VAR_BIN_OP_AND_uxn_device_h_l254_c27_6244_left;
     BIN_OP_AND_uxn_device_h_l254_c27_6244_right <= VAR_BIN_OP_AND_uxn_device_h_l254_c27_6244_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l254_c27_6244_return_output := BIN_OP_AND_uxn_device_h_l254_c27_6244_return_output;

     -- BIN_OP_EQ[uxn_device_h_l252_c11_e223] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l252_c11_e223_left <= VAR_BIN_OP_EQ_uxn_device_h_l252_c11_e223_left;
     BIN_OP_EQ_uxn_device_h_l252_c11_e223_right <= VAR_BIN_OP_EQ_uxn_device_h_l252_c11_e223_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l252_c11_e223_return_output := BIN_OP_EQ_uxn_device_h_l252_c11_e223_return_output;

     -- BIN_OP_EQ[uxn_device_h_l243_c6_b586] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l243_c6_b586_left <= VAR_BIN_OP_EQ_uxn_device_h_l243_c6_b586_left;
     BIN_OP_EQ_uxn_device_h_l243_c6_b586_right <= VAR_BIN_OP_EQ_uxn_device_h_l243_c6_b586_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l243_c6_b586_return_output := BIN_OP_EQ_uxn_device_h_l243_c6_b586_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l259_c47_f135] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l259_c47_f135_left <= VAR_BIN_OP_MINUS_uxn_device_h_l259_c47_f135_left;
     BIN_OP_MINUS_uxn_device_h_l259_c47_f135_right <= VAR_BIN_OP_MINUS_uxn_device_h_l259_c47_f135_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l259_c47_f135_return_output := BIN_OP_MINUS_uxn_device_h_l259_c47_f135_return_output;

     -- BIN_OP_AND[uxn_device_h_l248_c27_7786] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l248_c27_7786_left <= VAR_BIN_OP_AND_uxn_device_h_l248_c27_7786_left;
     BIN_OP_AND_uxn_device_h_l248_c27_7786_right <= VAR_BIN_OP_AND_uxn_device_h_l248_c27_7786_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l248_c27_7786_return_output := BIN_OP_AND_uxn_device_h_l248_c27_7786_return_output;

     -- CONST_SR_4_uint8_t_uxn_device_h_l255_l249_DUPLICATE_7244 LATENCY=0
     -- Inputs
     CONST_SR_4_uint8_t_uxn_device_h_l255_l249_DUPLICATE_7244_x <= VAR_CONST_SR_4_uint8_t_uxn_device_h_l255_l249_DUPLICATE_7244_x;
     -- Outputs
     VAR_CONST_SR_4_uint8_t_uxn_device_h_l255_l249_DUPLICATE_7244_return_output := CONST_SR_4_uint8_t_uxn_device_h_l255_l249_DUPLICATE_7244_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l252_c7_6953_cond := VAR_BIN_OP_EQ_uxn_device_h_l243_c6_b586_return_output;
     VAR_device_index_MUX_uxn_device_h_l243_c2_1730_cond := VAR_BIN_OP_EQ_uxn_device_h_l243_c6_b586_return_output;
     VAR_device_port_MUX_uxn_device_h_l243_c2_1730_cond := VAR_BIN_OP_EQ_uxn_device_h_l243_c6_b586_return_output;
     VAR_result_MUX_uxn_device_h_l243_c2_1730_cond := VAR_BIN_OP_EQ_uxn_device_h_l243_c6_b586_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c1_2422_cond := VAR_BIN_OP_EQ_uxn_device_h_l252_c11_e223_return_output;
     VAR_device_index_MUX_uxn_device_h_l252_c7_6953_cond := VAR_BIN_OP_EQ_uxn_device_h_l252_c11_e223_return_output;
     VAR_device_port_MUX_uxn_device_h_l252_c7_6953_cond := VAR_BIN_OP_EQ_uxn_device_h_l252_c11_e223_return_output;
     VAR_result_MUX_uxn_device_h_l252_c7_6953_cond := VAR_BIN_OP_EQ_uxn_device_h_l252_c11_e223_return_output;
     VAR_emu_deo_uxn_device_h_l259_c12_0e66_phase := VAR_BIN_OP_MINUS_uxn_device_h_l259_c47_f135_return_output;
     -- CAST_TO_uint4_t_uint8_t_uxn_device_h_l249_l255_DUPLICATE_f333 LATENCY=0
     VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l249_l255_DUPLICATE_f333_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uint8_t_uxn_device_h_l255_l249_DUPLICATE_7244_return_output);

     -- CAST_TO_uint4_t[uxn_device_h_l248_c17_0a9c] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l248_c17_0a9c_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_BIN_OP_AND_uxn_device_h_l248_c27_7786_return_output);

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l252_c7_6953] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l252_c7_6953_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l252_c7_6953_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l252_c7_6953_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l252_c7_6953_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l252_c7_6953_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l252_c7_6953_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l252_c7_6953_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l252_c7_6953_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l254_c17_70f4] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l254_c17_70f4_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_BIN_OP_AND_uxn_device_h_l254_c27_6244_return_output);

     -- Submodule level 2
     VAR_device_port_MUX_uxn_device_h_l243_c2_1730_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l248_c17_0a9c_return_output;
     VAR_device_port_MUX_uxn_device_h_l252_c7_6953_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l254_c17_70f4_return_output;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l250_l256_DUPLICATE_1748_var_dim_0 := VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l249_l255_DUPLICATE_f333_return_output;
     VAR_device_index_MUX_uxn_device_h_l243_c2_1730_iftrue := VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l249_l255_DUPLICATE_f333_return_output;
     VAR_device_index_MUX_uxn_device_h_l252_c7_6953_iftrue := VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l249_l255_DUPLICATE_f333_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c1_2422_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l252_c7_6953_return_output;
     -- device_port_MUX[uxn_device_h_l252_c7_6953] LATENCY=0
     -- Inputs
     device_port_MUX_uxn_device_h_l252_c7_6953_cond <= VAR_device_port_MUX_uxn_device_h_l252_c7_6953_cond;
     device_port_MUX_uxn_device_h_l252_c7_6953_iftrue <= VAR_device_port_MUX_uxn_device_h_l252_c7_6953_iftrue;
     device_port_MUX_uxn_device_h_l252_c7_6953_iffalse <= VAR_device_port_MUX_uxn_device_h_l252_c7_6953_iffalse;
     -- Outputs
     VAR_device_port_MUX_uxn_device_h_l252_c7_6953_return_output := device_port_MUX_uxn_device_h_l252_c7_6953_return_output;

     -- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l250_l256_DUPLICATE_1748 LATENCY=0
     -- Inputs
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l250_l256_DUPLICATE_1748_ref_toks_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l250_l256_DUPLICATE_1748_ref_toks_0;
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l250_l256_DUPLICATE_1748_var_dim_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l250_l256_DUPLICATE_1748_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l250_l256_DUPLICATE_1748_return_output := VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l250_l256_DUPLICATE_1748_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l258_c1_2422] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c1_2422_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c1_2422_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c1_2422_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c1_2422_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c1_2422_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c1_2422_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c1_2422_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c1_2422_return_output;

     -- device_index_MUX[uxn_device_h_l252_c7_6953] LATENCY=0
     -- Inputs
     device_index_MUX_uxn_device_h_l252_c7_6953_cond <= VAR_device_index_MUX_uxn_device_h_l252_c7_6953_cond;
     device_index_MUX_uxn_device_h_l252_c7_6953_iftrue <= VAR_device_index_MUX_uxn_device_h_l252_c7_6953_iftrue;
     device_index_MUX_uxn_device_h_l252_c7_6953_iffalse <= VAR_device_index_MUX_uxn_device_h_l252_c7_6953_iffalse;
     -- Outputs
     VAR_device_index_MUX_uxn_device_h_l252_c7_6953_return_output := device_index_MUX_uxn_device_h_l252_c7_6953_return_output;

     -- Submodule level 3
     VAR_emu_deo_uxn_device_h_l259_c12_0e66_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c1_2422_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l250_c24_dcb1_left := VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l250_l256_DUPLICATE_1748_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l256_c24_476a_left := VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l250_l256_DUPLICATE_1748_return_output;
     VAR_device_index_MUX_uxn_device_h_l243_c2_1730_iffalse := VAR_device_index_MUX_uxn_device_h_l252_c7_6953_return_output;
     VAR_device_port_MUX_uxn_device_h_l243_c2_1730_iffalse := VAR_device_port_MUX_uxn_device_h_l252_c7_6953_return_output;
     -- BIN_OP_EQ[uxn_device_h_l250_c24_dcb1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l250_c24_dcb1_left <= VAR_BIN_OP_EQ_uxn_device_h_l250_c24_dcb1_left;
     BIN_OP_EQ_uxn_device_h_l250_c24_dcb1_right <= VAR_BIN_OP_EQ_uxn_device_h_l250_c24_dcb1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l250_c24_dcb1_return_output := BIN_OP_EQ_uxn_device_h_l250_c24_dcb1_return_output;

     -- device_index_MUX[uxn_device_h_l243_c2_1730] LATENCY=0
     -- Inputs
     device_index_MUX_uxn_device_h_l243_c2_1730_cond <= VAR_device_index_MUX_uxn_device_h_l243_c2_1730_cond;
     device_index_MUX_uxn_device_h_l243_c2_1730_iftrue <= VAR_device_index_MUX_uxn_device_h_l243_c2_1730_iftrue;
     device_index_MUX_uxn_device_h_l243_c2_1730_iffalse <= VAR_device_index_MUX_uxn_device_h_l243_c2_1730_iffalse;
     -- Outputs
     VAR_device_index_MUX_uxn_device_h_l243_c2_1730_return_output := device_index_MUX_uxn_device_h_l243_c2_1730_return_output;

     -- BIN_OP_EQ[uxn_device_h_l256_c24_476a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l256_c24_476a_left <= VAR_BIN_OP_EQ_uxn_device_h_l256_c24_476a_left;
     BIN_OP_EQ_uxn_device_h_l256_c24_476a_right <= VAR_BIN_OP_EQ_uxn_device_h_l256_c24_476a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l256_c24_476a_return_output := BIN_OP_EQ_uxn_device_h_l256_c24_476a_return_output;

     -- device_port_MUX[uxn_device_h_l243_c2_1730] LATENCY=0
     -- Inputs
     device_port_MUX_uxn_device_h_l243_c2_1730_cond <= VAR_device_port_MUX_uxn_device_h_l243_c2_1730_cond;
     device_port_MUX_uxn_device_h_l243_c2_1730_iftrue <= VAR_device_port_MUX_uxn_device_h_l243_c2_1730_iftrue;
     device_port_MUX_uxn_device_h_l243_c2_1730_iffalse <= VAR_device_port_MUX_uxn_device_h_l243_c2_1730_iffalse;
     -- Outputs
     VAR_device_port_MUX_uxn_device_h_l243_c2_1730_return_output := device_port_MUX_uxn_device_h_l243_c2_1730_return_output;

     -- emu_deo[uxn_device_h_l259_c12_0e66] LATENCY=0
     -- Clock enable
     emu_deo_uxn_device_h_l259_c12_0e66_CLOCK_ENABLE <= VAR_emu_deo_uxn_device_h_l259_c12_0e66_CLOCK_ENABLE;
     -- Inputs
     emu_deo_uxn_device_h_l259_c12_0e66_device_index <= VAR_emu_deo_uxn_device_h_l259_c12_0e66_device_index;
     emu_deo_uxn_device_h_l259_c12_0e66_device_port <= VAR_emu_deo_uxn_device_h_l259_c12_0e66_device_port;
     emu_deo_uxn_device_h_l259_c12_0e66_phase <= VAR_emu_deo_uxn_device_h_l259_c12_0e66_phase;
     emu_deo_uxn_device_h_l259_c12_0e66_previous_device_ram_read <= VAR_emu_deo_uxn_device_h_l259_c12_0e66_previous_device_ram_read;
     emu_deo_uxn_device_h_l259_c12_0e66_previous_ram_read <= VAR_emu_deo_uxn_device_h_l259_c12_0e66_previous_ram_read;
     -- Outputs
     VAR_emu_deo_uxn_device_h_l259_c12_0e66_return_output := emu_deo_uxn_device_h_l259_c12_0e66_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l250_c24_69e0_cond := VAR_BIN_OP_EQ_uxn_device_h_l250_c24_dcb1_return_output;
     VAR_MUX_uxn_device_h_l256_c24_0eaf_cond := VAR_BIN_OP_EQ_uxn_device_h_l256_c24_476a_return_output;
     REG_VAR_device_index := VAR_device_index_MUX_uxn_device_h_l243_c2_1730_return_output;
     REG_VAR_device_port := VAR_device_port_MUX_uxn_device_h_l243_c2_1730_return_output;
     VAR_result_MUX_uxn_device_h_l252_c7_6953_iffalse := VAR_emu_deo_uxn_device_h_l259_c12_0e66_return_output;
     -- MUX[uxn_device_h_l256_c24_0eaf] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l256_c24_0eaf_cond <= VAR_MUX_uxn_device_h_l256_c24_0eaf_cond;
     MUX_uxn_device_h_l256_c24_0eaf_iftrue <= VAR_MUX_uxn_device_h_l256_c24_0eaf_iftrue;
     MUX_uxn_device_h_l256_c24_0eaf_iffalse <= VAR_MUX_uxn_device_h_l256_c24_0eaf_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l256_c24_0eaf_return_output := MUX_uxn_device_h_l256_c24_0eaf_return_output;

     -- MUX[uxn_device_h_l250_c24_69e0] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l250_c24_69e0_cond <= VAR_MUX_uxn_device_h_l250_c24_69e0_cond;
     MUX_uxn_device_h_l250_c24_69e0_iftrue <= VAR_MUX_uxn_device_h_l250_c24_69e0_iftrue;
     MUX_uxn_device_h_l250_c24_69e0_iffalse <= VAR_MUX_uxn_device_h_l250_c24_69e0_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l250_c24_69e0_return_output := MUX_uxn_device_h_l250_c24_69e0_return_output;

     -- Submodule level 5
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cf24[uxn_device_h_l252_c7_6953] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cf24_uxn_device_h_l252_c7_6953_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_cf24(
     result,
     to_unsigned(0, 1),
     VAR_MUX_uxn_device_h_l256_c24_0eaf_return_output);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_e500[uxn_device_h_l243_c2_1730] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_e500_uxn_device_h_l243_c2_1730_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_e500(
     result,
     to_unsigned(0, 1),
     to_unsigned(1, 1),
     VAR_device_address,
     VAR_value,
     VAR_MUX_uxn_device_h_l250_c24_69e0_return_output);

     -- Submodule level 6
     VAR_result_MUX_uxn_device_h_l252_c7_6953_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cf24_uxn_device_h_l252_c7_6953_return_output;
     VAR_result_MUX_uxn_device_h_l243_c2_1730_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_e500_uxn_device_h_l243_c2_1730_return_output;
     -- result_MUX[uxn_device_h_l252_c7_6953] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l252_c7_6953_cond <= VAR_result_MUX_uxn_device_h_l252_c7_6953_cond;
     result_MUX_uxn_device_h_l252_c7_6953_iftrue <= VAR_result_MUX_uxn_device_h_l252_c7_6953_iftrue;
     result_MUX_uxn_device_h_l252_c7_6953_iffalse <= VAR_result_MUX_uxn_device_h_l252_c7_6953_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l252_c7_6953_return_output := result_MUX_uxn_device_h_l252_c7_6953_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_device_h_l243_c2_1730_iffalse := VAR_result_MUX_uxn_device_h_l252_c7_6953_return_output;
     -- result_MUX[uxn_device_h_l243_c2_1730] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l243_c2_1730_cond <= VAR_result_MUX_uxn_device_h_l243_c2_1730_cond;
     result_MUX_uxn_device_h_l243_c2_1730_iftrue <= VAR_result_MUX_uxn_device_h_l243_c2_1730_iftrue;
     result_MUX_uxn_device_h_l243_c2_1730_iffalse <= VAR_result_MUX_uxn_device_h_l243_c2_1730_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l243_c2_1730_return_output := result_MUX_uxn_device_h_l243_c2_1730_return_output;

     -- Submodule level 8
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l243_c2_1730_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l243_c2_1730_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
REG_COMB_device_index <= REG_VAR_device_index;
REG_COMB_device_port <= REG_VAR_device_port;
REG_COMB_deo_mask <= REG_VAR_deo_mask;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
     device_index <= REG_COMB_device_index;
     device_port <= REG_COMB_device_port;
     deo_mask <= REG_COMB_deo_mask;
 end if;
 end if;
end process;

end arch;
