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
-- Submodules: 26
entity device_out_0CLK_8baf3119 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 value : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end device_out_0CLK_8baf3119;
architecture arch of device_out_0CLK_8baf3119 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : device_out_result_t := (
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
device_ram_value => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
vram_address => to_unsigned(0, 32),
vram_value => to_unsigned(0, 2),
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
-- printf_uxn_device_h_l204_c2_23c0[uxn_device_h_l204_c2_23c0]
signal printf_uxn_device_h_l204_c2_23c0_uxn_device_h_l204_c2_23c0_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l204_c2_23c0_uxn_device_h_l204_c2_23c0_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l204_c2_23c0_uxn_device_h_l204_c2_23c0_arg1 : unsigned(31 downto 0);
signal printf_uxn_device_h_l204_c2_23c0_uxn_device_h_l204_c2_23c0_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l206_c6_1de1]
signal BIN_OP_EQ_uxn_device_h_l206_c6_1de1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l206_c6_1de1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l206_c6_1de1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l214_c7_b460]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c7_b460_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c7_b460_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c7_b460_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c7_b460_return_output : unsigned(0 downto 0);

-- device_index_MUX[uxn_device_h_l206_c2_90c4]
signal device_index_MUX_uxn_device_h_l206_c2_90c4_cond : unsigned(0 downto 0);
signal device_index_MUX_uxn_device_h_l206_c2_90c4_iftrue : unsigned(3 downto 0);
signal device_index_MUX_uxn_device_h_l206_c2_90c4_iffalse : unsigned(3 downto 0);
signal device_index_MUX_uxn_device_h_l206_c2_90c4_return_output : unsigned(3 downto 0);

-- result_MUX[uxn_device_h_l206_c2_90c4]
signal result_MUX_uxn_device_h_l206_c2_90c4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l206_c2_90c4_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l206_c2_90c4_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l206_c2_90c4_return_output : device_out_result_t;

-- device_port_MUX[uxn_device_h_l206_c2_90c4]
signal device_port_MUX_uxn_device_h_l206_c2_90c4_cond : unsigned(0 downto 0);
signal device_port_MUX_uxn_device_h_l206_c2_90c4_iftrue : unsigned(3 downto 0);
signal device_port_MUX_uxn_device_h_l206_c2_90c4_iffalse : unsigned(3 downto 0);
signal device_port_MUX_uxn_device_h_l206_c2_90c4_return_output : unsigned(3 downto 0);

-- BIN_OP_AND[uxn_device_h_l210_c27_8bde]
signal BIN_OP_AND_uxn_device_h_l210_c27_8bde_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l210_c27_8bde_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l210_c27_8bde_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l212_c24_d608]
signal BIN_OP_EQ_uxn_device_h_l212_c24_d608_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_device_h_l212_c24_d608_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l212_c24_d608_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l212_c24_d5f5]
signal MUX_uxn_device_h_l212_c24_d5f5_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l212_c24_d5f5_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l212_c24_d5f5_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l212_c24_d5f5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l214_c11_c4fe]
signal BIN_OP_EQ_uxn_device_h_l214_c11_c4fe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l214_c11_c4fe_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l214_c11_c4fe_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l220_c1_7f19]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_7f19_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_7f19_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_7f19_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_7f19_return_output : unsigned(0 downto 0);

-- device_index_MUX[uxn_device_h_l214_c7_b460]
signal device_index_MUX_uxn_device_h_l214_c7_b460_cond : unsigned(0 downto 0);
signal device_index_MUX_uxn_device_h_l214_c7_b460_iftrue : unsigned(3 downto 0);
signal device_index_MUX_uxn_device_h_l214_c7_b460_iffalse : unsigned(3 downto 0);
signal device_index_MUX_uxn_device_h_l214_c7_b460_return_output : unsigned(3 downto 0);

-- result_MUX[uxn_device_h_l214_c7_b460]
signal result_MUX_uxn_device_h_l214_c7_b460_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l214_c7_b460_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l214_c7_b460_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l214_c7_b460_return_output : device_out_result_t;

-- device_port_MUX[uxn_device_h_l214_c7_b460]
signal device_port_MUX_uxn_device_h_l214_c7_b460_cond : unsigned(0 downto 0);
signal device_port_MUX_uxn_device_h_l214_c7_b460_iftrue : unsigned(3 downto 0);
signal device_port_MUX_uxn_device_h_l214_c7_b460_iffalse : unsigned(3 downto 0);
signal device_port_MUX_uxn_device_h_l214_c7_b460_return_output : unsigned(3 downto 0);

-- BIN_OP_AND[uxn_device_h_l216_c27_97c2]
signal BIN_OP_AND_uxn_device_h_l216_c27_97c2_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l216_c27_97c2_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l216_c27_97c2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l218_c24_b380]
signal BIN_OP_EQ_uxn_device_h_l218_c24_b380_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_device_h_l218_c24_b380_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l218_c24_b380_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l218_c24_4536]
signal MUX_uxn_device_h_l218_c24_4536_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l218_c24_4536_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l218_c24_4536_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l218_c24_4536_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l221_c47_119b]
signal BIN_OP_MINUS_uxn_device_h_l221_c47_119b_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l221_c47_119b_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l221_c47_119b_return_output : unsigned(7 downto 0);

-- emu_deo[uxn_device_h_l221_c12_8586]
signal emu_deo_uxn_device_h_l221_c12_8586_CLOCK_ENABLE : unsigned(0 downto 0);
signal emu_deo_uxn_device_h_l221_c12_8586_device_index : unsigned(3 downto 0);
signal emu_deo_uxn_device_h_l221_c12_8586_device_port : unsigned(3 downto 0);
signal emu_deo_uxn_device_h_l221_c12_8586_phase : unsigned(7 downto 0);
signal emu_deo_uxn_device_h_l221_c12_8586_previous_device_ram_read : unsigned(7 downto 0);
signal emu_deo_uxn_device_h_l221_c12_8586_return_output : device_out_result_t;

-- CONST_SR_4_uint8_t_uxn_device_h_l217_l211_DUPLICATE_baec
signal CONST_SR_4_uint8_t_uxn_device_h_l217_l211_DUPLICATE_baec_x : unsigned(7 downto 0);
signal CONST_SR_4_uint8_t_uxn_device_h_l217_l211_DUPLICATE_baec_return_output : unsigned(7 downto 0);

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l212_l218_DUPLICATE_6356
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l212_l218_DUPLICATE_6356_ref_toks_0 : uint16_t_16;
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l212_l218_DUPLICATE_6356_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l212_l218_DUPLICATE_6356_return_output : unsigned(15 downto 0);

function CAST_TO_uint4_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
    return return_output;
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_3666( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_device_ram_write := ref_toks_1;
      base.device_ram_address := ref_toks_2;
      base.device_ram_value := ref_toks_3;
      base.is_deo_done := ref_toks_4;

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
-- printf_uxn_device_h_l204_c2_23c0_uxn_device_h_l204_c2_23c0
printf_uxn_device_h_l204_c2_23c0_uxn_device_h_l204_c2_23c0 : entity work.printf_uxn_device_h_l204_c2_23c0_0CLK_de264c78 port map (
printf_uxn_device_h_l204_c2_23c0_uxn_device_h_l204_c2_23c0_CLOCK_ENABLE,
printf_uxn_device_h_l204_c2_23c0_uxn_device_h_l204_c2_23c0_arg0,
printf_uxn_device_h_l204_c2_23c0_uxn_device_h_l204_c2_23c0_arg1,
printf_uxn_device_h_l204_c2_23c0_uxn_device_h_l204_c2_23c0_arg2);

-- BIN_OP_EQ_uxn_device_h_l206_c6_1de1
BIN_OP_EQ_uxn_device_h_l206_c6_1de1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l206_c6_1de1_left,
BIN_OP_EQ_uxn_device_h_l206_c6_1de1_right,
BIN_OP_EQ_uxn_device_h_l206_c6_1de1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c7_b460
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c7_b460 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c7_b460_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c7_b460_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c7_b460_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c7_b460_return_output);

-- device_index_MUX_uxn_device_h_l206_c2_90c4
device_index_MUX_uxn_device_h_l206_c2_90c4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
device_index_MUX_uxn_device_h_l206_c2_90c4_cond,
device_index_MUX_uxn_device_h_l206_c2_90c4_iftrue,
device_index_MUX_uxn_device_h_l206_c2_90c4_iffalse,
device_index_MUX_uxn_device_h_l206_c2_90c4_return_output);

-- result_MUX_uxn_device_h_l206_c2_90c4
result_MUX_uxn_device_h_l206_c2_90c4 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l206_c2_90c4_cond,
result_MUX_uxn_device_h_l206_c2_90c4_iftrue,
result_MUX_uxn_device_h_l206_c2_90c4_iffalse,
result_MUX_uxn_device_h_l206_c2_90c4_return_output);

-- device_port_MUX_uxn_device_h_l206_c2_90c4
device_port_MUX_uxn_device_h_l206_c2_90c4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
device_port_MUX_uxn_device_h_l206_c2_90c4_cond,
device_port_MUX_uxn_device_h_l206_c2_90c4_iftrue,
device_port_MUX_uxn_device_h_l206_c2_90c4_iffalse,
device_port_MUX_uxn_device_h_l206_c2_90c4_return_output);

-- BIN_OP_AND_uxn_device_h_l210_c27_8bde
BIN_OP_AND_uxn_device_h_l210_c27_8bde : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l210_c27_8bde_left,
BIN_OP_AND_uxn_device_h_l210_c27_8bde_right,
BIN_OP_AND_uxn_device_h_l210_c27_8bde_return_output);

-- BIN_OP_EQ_uxn_device_h_l212_c24_d608
BIN_OP_EQ_uxn_device_h_l212_c24_d608 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l212_c24_d608_left,
BIN_OP_EQ_uxn_device_h_l212_c24_d608_right,
BIN_OP_EQ_uxn_device_h_l212_c24_d608_return_output);

-- MUX_uxn_device_h_l212_c24_d5f5
MUX_uxn_device_h_l212_c24_d5f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l212_c24_d5f5_cond,
MUX_uxn_device_h_l212_c24_d5f5_iftrue,
MUX_uxn_device_h_l212_c24_d5f5_iffalse,
MUX_uxn_device_h_l212_c24_d5f5_return_output);

-- BIN_OP_EQ_uxn_device_h_l214_c11_c4fe
BIN_OP_EQ_uxn_device_h_l214_c11_c4fe : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l214_c11_c4fe_left,
BIN_OP_EQ_uxn_device_h_l214_c11_c4fe_right,
BIN_OP_EQ_uxn_device_h_l214_c11_c4fe_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_7f19
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_7f19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_7f19_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_7f19_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_7f19_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_7f19_return_output);

-- device_index_MUX_uxn_device_h_l214_c7_b460
device_index_MUX_uxn_device_h_l214_c7_b460 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
device_index_MUX_uxn_device_h_l214_c7_b460_cond,
device_index_MUX_uxn_device_h_l214_c7_b460_iftrue,
device_index_MUX_uxn_device_h_l214_c7_b460_iffalse,
device_index_MUX_uxn_device_h_l214_c7_b460_return_output);

-- result_MUX_uxn_device_h_l214_c7_b460
result_MUX_uxn_device_h_l214_c7_b460 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l214_c7_b460_cond,
result_MUX_uxn_device_h_l214_c7_b460_iftrue,
result_MUX_uxn_device_h_l214_c7_b460_iffalse,
result_MUX_uxn_device_h_l214_c7_b460_return_output);

-- device_port_MUX_uxn_device_h_l214_c7_b460
device_port_MUX_uxn_device_h_l214_c7_b460 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
device_port_MUX_uxn_device_h_l214_c7_b460_cond,
device_port_MUX_uxn_device_h_l214_c7_b460_iftrue,
device_port_MUX_uxn_device_h_l214_c7_b460_iffalse,
device_port_MUX_uxn_device_h_l214_c7_b460_return_output);

-- BIN_OP_AND_uxn_device_h_l216_c27_97c2
BIN_OP_AND_uxn_device_h_l216_c27_97c2 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l216_c27_97c2_left,
BIN_OP_AND_uxn_device_h_l216_c27_97c2_right,
BIN_OP_AND_uxn_device_h_l216_c27_97c2_return_output);

-- BIN_OP_EQ_uxn_device_h_l218_c24_b380
BIN_OP_EQ_uxn_device_h_l218_c24_b380 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l218_c24_b380_left,
BIN_OP_EQ_uxn_device_h_l218_c24_b380_right,
BIN_OP_EQ_uxn_device_h_l218_c24_b380_return_output);

-- MUX_uxn_device_h_l218_c24_4536
MUX_uxn_device_h_l218_c24_4536 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l218_c24_4536_cond,
MUX_uxn_device_h_l218_c24_4536_iftrue,
MUX_uxn_device_h_l218_c24_4536_iffalse,
MUX_uxn_device_h_l218_c24_4536_return_output);

-- BIN_OP_MINUS_uxn_device_h_l221_c47_119b
BIN_OP_MINUS_uxn_device_h_l221_c47_119b : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l221_c47_119b_left,
BIN_OP_MINUS_uxn_device_h_l221_c47_119b_right,
BIN_OP_MINUS_uxn_device_h_l221_c47_119b_return_output);

-- emu_deo_uxn_device_h_l221_c12_8586
emu_deo_uxn_device_h_l221_c12_8586 : entity work.emu_deo_0CLK_8db42dd1 port map (
clk,
emu_deo_uxn_device_h_l221_c12_8586_CLOCK_ENABLE,
emu_deo_uxn_device_h_l221_c12_8586_device_index,
emu_deo_uxn_device_h_l221_c12_8586_device_port,
emu_deo_uxn_device_h_l221_c12_8586_phase,
emu_deo_uxn_device_h_l221_c12_8586_previous_device_ram_read,
emu_deo_uxn_device_h_l221_c12_8586_return_output);

-- CONST_SR_4_uint8_t_uxn_device_h_l217_l211_DUPLICATE_baec
CONST_SR_4_uint8_t_uxn_device_h_l217_l211_DUPLICATE_baec : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uint8_t_uxn_device_h_l217_l211_DUPLICATE_baec_x,
CONST_SR_4_uint8_t_uxn_device_h_l217_l211_DUPLICATE_baec_return_output);

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l212_l218_DUPLICATE_6356
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l212_l218_DUPLICATE_6356 : entity work.VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_0CLK_763c90e8 port map (
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l212_l218_DUPLICATE_6356_ref_toks_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l212_l218_DUPLICATE_6356_var_dim_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l212_l218_DUPLICATE_6356_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_address,
 value,
 phase,
 previous_device_ram_read,
 -- Registers
 result,
 device_index,
 device_port,
 deo_mask,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l206_c6_1de1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c7_b460_return_output,
 device_index_MUX_uxn_device_h_l206_c2_90c4_return_output,
 result_MUX_uxn_device_h_l206_c2_90c4_return_output,
 device_port_MUX_uxn_device_h_l206_c2_90c4_return_output,
 BIN_OP_AND_uxn_device_h_l210_c27_8bde_return_output,
 BIN_OP_EQ_uxn_device_h_l212_c24_d608_return_output,
 MUX_uxn_device_h_l212_c24_d5f5_return_output,
 BIN_OP_EQ_uxn_device_h_l214_c11_c4fe_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_7f19_return_output,
 device_index_MUX_uxn_device_h_l214_c7_b460_return_output,
 result_MUX_uxn_device_h_l214_c7_b460_return_output,
 device_port_MUX_uxn_device_h_l214_c7_b460_return_output,
 BIN_OP_AND_uxn_device_h_l216_c27_97c2_return_output,
 BIN_OP_EQ_uxn_device_h_l218_c24_b380_return_output,
 MUX_uxn_device_h_l218_c24_4536_return_output,
 BIN_OP_MINUS_uxn_device_h_l221_c47_119b_return_output,
 emu_deo_uxn_device_h_l221_c12_8586_return_output,
 CONST_SR_4_uint8_t_uxn_device_h_l217_l211_DUPLICATE_baec_return_output,
 VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l212_l218_DUPLICATE_6356_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_value : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_printf_uxn_device_h_l204_c2_23c0_uxn_device_h_l204_c2_23c0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l204_c2_23c0_uxn_device_h_l204_c2_23c0_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l204_c2_23c0_uxn_device_h_l204_c2_23c0_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l204_c2_23c0_uxn_device_h_l204_c2_23c0_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l206_c6_1de1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l206_c6_1de1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l206_c6_1de1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c7_b460_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c7_b460_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c7_b460_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c7_b460_iffalse : unsigned(0 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l206_c2_90c4_iftrue : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l206_c2_90c4_iffalse : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l214_c7_b460_return_output : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l206_c2_90c4_return_output : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l206_c2_90c4_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l206_c2_90c4_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_3666_uxn_device_h_l206_c2_90c4_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l206_c2_90c4_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l214_c7_b460_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l206_c2_90c4_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l206_c2_90c4_cond : unsigned(0 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l206_c2_90c4_iftrue : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l206_c2_90c4_iffalse : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l214_c7_b460_return_output : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l206_c2_90c4_return_output : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l206_c2_90c4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l210_c27_8bde_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l210_c27_8bde_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l210_c27_8bde_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l210_c17_dd7a_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_device_h_l212_c24_d5f5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l212_c24_d5f5_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l212_c24_d5f5_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l212_c24_d608_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l212_c24_d608_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l212_c24_d608_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l212_c24_d5f5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l214_c11_c4fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l214_c11_c4fe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l214_c11_c4fe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_7f19_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_7f19_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_7f19_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_7f19_iffalse : unsigned(0 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l214_c7_b460_iftrue : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l214_c7_b460_iffalse : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l214_c7_b460_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l214_c7_b460_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cf24_uxn_device_h_l214_c7_b460_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l214_c7_b460_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l214_c7_b460_cond : unsigned(0 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l214_c7_b460_iftrue : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l214_c7_b460_iffalse : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l214_c7_b460_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l216_c27_97c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l216_c27_97c2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l216_c27_97c2_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l216_c17_9136_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_device_h_l218_c24_4536_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l218_c24_4536_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l218_c24_4536_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l218_c24_b380_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l218_c24_b380_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l218_c24_b380_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l218_c24_4536_return_output : unsigned(0 downto 0);
 variable VAR_emu_deo_uxn_device_h_l221_c12_8586_device_index : unsigned(3 downto 0);
 variable VAR_emu_deo_uxn_device_h_l221_c12_8586_device_port : unsigned(3 downto 0);
 variable VAR_emu_deo_uxn_device_h_l221_c12_8586_phase : unsigned(7 downto 0);
 variable VAR_emu_deo_uxn_device_h_l221_c12_8586_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l221_c47_119b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l221_c47_119b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l221_c47_119b_return_output : unsigned(7 downto 0);
 variable VAR_emu_deo_uxn_device_h_l221_c12_8586_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_emu_deo_uxn_device_h_l221_c12_8586_return_output : device_out_result_t;
 variable VAR_CONST_SR_4_uint8_t_uxn_device_h_l217_l211_DUPLICATE_baec_x : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uint8_t_uxn_device_h_l217_l211_DUPLICATE_baec_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l211_l217_DUPLICATE_c76b_return_output : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l212_l218_DUPLICATE_6356_ref_toks_0 : uint16_t_16;
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l212_l218_DUPLICATE_6356_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l212_l218_DUPLICATE_6356_return_output : unsigned(15 downto 0);
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c7_b460_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l206_c6_1de1_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l216_c27_97c2_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l218_c24_b380_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l212_c24_d5f5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l210_c27_8bde_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l212_c24_d608_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l218_c24_4536_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l212_c24_d5f5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l214_c11_c4fe_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l221_c47_119b_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_7f19_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l218_c24_4536_iffalse := to_unsigned(0, 1);

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

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c7_b460_iffalse := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_device_h_l204_c2_23c0_uxn_device_h_l204_c2_23c0_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l212_l218_DUPLICATE_6356_ref_toks_0 := deo_mask;
     REG_VAR_deo_mask := deo_mask;
     VAR_BIN_OP_AND_uxn_device_h_l210_c27_8bde_left := VAR_device_address;
     VAR_BIN_OP_AND_uxn_device_h_l216_c27_97c2_left := VAR_device_address;
     VAR_CONST_SR_4_uint8_t_uxn_device_h_l217_l211_DUPLICATE_baec_x := VAR_device_address;
     VAR_printf_uxn_device_h_l204_c2_23c0_uxn_device_h_l204_c2_23c0_arg0 := resize(VAR_device_address, 32);
     VAR_device_index_MUX_uxn_device_h_l214_c7_b460_iffalse := device_index;
     VAR_emu_deo_uxn_device_h_l221_c12_8586_device_index := device_index;
     VAR_device_port_MUX_uxn_device_h_l214_c7_b460_iffalse := device_port;
     VAR_emu_deo_uxn_device_h_l221_c12_8586_device_port := device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l206_c6_1de1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l214_c11_c4fe_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l221_c47_119b_left := VAR_phase;
     VAR_printf_uxn_device_h_l204_c2_23c0_uxn_device_h_l204_c2_23c0_arg2 := resize(VAR_phase, 32);
     VAR_emu_deo_uxn_device_h_l221_c12_8586_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_printf_uxn_device_h_l204_c2_23c0_uxn_device_h_l204_c2_23c0_arg1 := resize(VAR_value, 32);
     -- BIN_OP_EQ[uxn_device_h_l206_c6_1de1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l206_c6_1de1_left <= VAR_BIN_OP_EQ_uxn_device_h_l206_c6_1de1_left;
     BIN_OP_EQ_uxn_device_h_l206_c6_1de1_right <= VAR_BIN_OP_EQ_uxn_device_h_l206_c6_1de1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l206_c6_1de1_return_output := BIN_OP_EQ_uxn_device_h_l206_c6_1de1_return_output;

     -- BIN_OP_EQ[uxn_device_h_l214_c11_c4fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l214_c11_c4fe_left <= VAR_BIN_OP_EQ_uxn_device_h_l214_c11_c4fe_left;
     BIN_OP_EQ_uxn_device_h_l214_c11_c4fe_right <= VAR_BIN_OP_EQ_uxn_device_h_l214_c11_c4fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l214_c11_c4fe_return_output := BIN_OP_EQ_uxn_device_h_l214_c11_c4fe_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l221_c47_119b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l221_c47_119b_left <= VAR_BIN_OP_MINUS_uxn_device_h_l221_c47_119b_left;
     BIN_OP_MINUS_uxn_device_h_l221_c47_119b_right <= VAR_BIN_OP_MINUS_uxn_device_h_l221_c47_119b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l221_c47_119b_return_output := BIN_OP_MINUS_uxn_device_h_l221_c47_119b_return_output;

     -- BIN_OP_AND[uxn_device_h_l216_c27_97c2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l216_c27_97c2_left <= VAR_BIN_OP_AND_uxn_device_h_l216_c27_97c2_left;
     BIN_OP_AND_uxn_device_h_l216_c27_97c2_right <= VAR_BIN_OP_AND_uxn_device_h_l216_c27_97c2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l216_c27_97c2_return_output := BIN_OP_AND_uxn_device_h_l216_c27_97c2_return_output;

     -- BIN_OP_AND[uxn_device_h_l210_c27_8bde] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l210_c27_8bde_left <= VAR_BIN_OP_AND_uxn_device_h_l210_c27_8bde_left;
     BIN_OP_AND_uxn_device_h_l210_c27_8bde_right <= VAR_BIN_OP_AND_uxn_device_h_l210_c27_8bde_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l210_c27_8bde_return_output := BIN_OP_AND_uxn_device_h_l210_c27_8bde_return_output;

     -- CONST_SR_4_uint8_t_uxn_device_h_l217_l211_DUPLICATE_baec LATENCY=0
     -- Inputs
     CONST_SR_4_uint8_t_uxn_device_h_l217_l211_DUPLICATE_baec_x <= VAR_CONST_SR_4_uint8_t_uxn_device_h_l217_l211_DUPLICATE_baec_x;
     -- Outputs
     VAR_CONST_SR_4_uint8_t_uxn_device_h_l217_l211_DUPLICATE_baec_return_output := CONST_SR_4_uint8_t_uxn_device_h_l217_l211_DUPLICATE_baec_return_output;

     -- printf_uxn_device_h_l204_c2_23c0[uxn_device_h_l204_c2_23c0] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l204_c2_23c0_uxn_device_h_l204_c2_23c0_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l204_c2_23c0_uxn_device_h_l204_c2_23c0_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l204_c2_23c0_uxn_device_h_l204_c2_23c0_arg0 <= VAR_printf_uxn_device_h_l204_c2_23c0_uxn_device_h_l204_c2_23c0_arg0;
     printf_uxn_device_h_l204_c2_23c0_uxn_device_h_l204_c2_23c0_arg1 <= VAR_printf_uxn_device_h_l204_c2_23c0_uxn_device_h_l204_c2_23c0_arg1;
     printf_uxn_device_h_l204_c2_23c0_uxn_device_h_l204_c2_23c0_arg2 <= VAR_printf_uxn_device_h_l204_c2_23c0_uxn_device_h_l204_c2_23c0_arg2;
     -- Outputs

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c7_b460_cond := VAR_BIN_OP_EQ_uxn_device_h_l206_c6_1de1_return_output;
     VAR_device_index_MUX_uxn_device_h_l206_c2_90c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l206_c6_1de1_return_output;
     VAR_device_port_MUX_uxn_device_h_l206_c2_90c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l206_c6_1de1_return_output;
     VAR_result_MUX_uxn_device_h_l206_c2_90c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l206_c6_1de1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_7f19_cond := VAR_BIN_OP_EQ_uxn_device_h_l214_c11_c4fe_return_output;
     VAR_device_index_MUX_uxn_device_h_l214_c7_b460_cond := VAR_BIN_OP_EQ_uxn_device_h_l214_c11_c4fe_return_output;
     VAR_device_port_MUX_uxn_device_h_l214_c7_b460_cond := VAR_BIN_OP_EQ_uxn_device_h_l214_c11_c4fe_return_output;
     VAR_result_MUX_uxn_device_h_l214_c7_b460_cond := VAR_BIN_OP_EQ_uxn_device_h_l214_c11_c4fe_return_output;
     VAR_emu_deo_uxn_device_h_l221_c12_8586_phase := VAR_BIN_OP_MINUS_uxn_device_h_l221_c47_119b_return_output;
     -- CAST_TO_uint4_t[uxn_device_h_l216_c17_9136] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l216_c17_9136_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_BIN_OP_AND_uxn_device_h_l216_c27_97c2_return_output);

     -- CAST_TO_uint4_t_uint8_t_uxn_device_h_l211_l217_DUPLICATE_c76b LATENCY=0
     VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l211_l217_DUPLICATE_c76b_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uint8_t_uxn_device_h_l217_l211_DUPLICATE_baec_return_output);

     -- CAST_TO_uint4_t[uxn_device_h_l210_c17_dd7a] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l210_c17_dd7a_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_BIN_OP_AND_uxn_device_h_l210_c27_8bde_return_output);

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l214_c7_b460] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c7_b460_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c7_b460_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c7_b460_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c7_b460_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c7_b460_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c7_b460_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c7_b460_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c7_b460_return_output;

     -- Submodule level 2
     VAR_device_port_MUX_uxn_device_h_l206_c2_90c4_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l210_c17_dd7a_return_output;
     VAR_device_port_MUX_uxn_device_h_l214_c7_b460_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l216_c17_9136_return_output;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l212_l218_DUPLICATE_6356_var_dim_0 := VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l211_l217_DUPLICATE_c76b_return_output;
     VAR_device_index_MUX_uxn_device_h_l206_c2_90c4_iftrue := VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l211_l217_DUPLICATE_c76b_return_output;
     VAR_device_index_MUX_uxn_device_h_l214_c7_b460_iftrue := VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l211_l217_DUPLICATE_c76b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_7f19_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c7_b460_return_output;
     -- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l212_l218_DUPLICATE_6356 LATENCY=0
     -- Inputs
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l212_l218_DUPLICATE_6356_ref_toks_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l212_l218_DUPLICATE_6356_ref_toks_0;
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l212_l218_DUPLICATE_6356_var_dim_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l212_l218_DUPLICATE_6356_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l212_l218_DUPLICATE_6356_return_output := VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l212_l218_DUPLICATE_6356_return_output;

     -- device_index_MUX[uxn_device_h_l214_c7_b460] LATENCY=0
     -- Inputs
     device_index_MUX_uxn_device_h_l214_c7_b460_cond <= VAR_device_index_MUX_uxn_device_h_l214_c7_b460_cond;
     device_index_MUX_uxn_device_h_l214_c7_b460_iftrue <= VAR_device_index_MUX_uxn_device_h_l214_c7_b460_iftrue;
     device_index_MUX_uxn_device_h_l214_c7_b460_iffalse <= VAR_device_index_MUX_uxn_device_h_l214_c7_b460_iffalse;
     -- Outputs
     VAR_device_index_MUX_uxn_device_h_l214_c7_b460_return_output := device_index_MUX_uxn_device_h_l214_c7_b460_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l220_c1_7f19] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_7f19_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_7f19_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_7f19_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_7f19_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_7f19_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_7f19_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_7f19_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_7f19_return_output;

     -- device_port_MUX[uxn_device_h_l214_c7_b460] LATENCY=0
     -- Inputs
     device_port_MUX_uxn_device_h_l214_c7_b460_cond <= VAR_device_port_MUX_uxn_device_h_l214_c7_b460_cond;
     device_port_MUX_uxn_device_h_l214_c7_b460_iftrue <= VAR_device_port_MUX_uxn_device_h_l214_c7_b460_iftrue;
     device_port_MUX_uxn_device_h_l214_c7_b460_iffalse <= VAR_device_port_MUX_uxn_device_h_l214_c7_b460_iffalse;
     -- Outputs
     VAR_device_port_MUX_uxn_device_h_l214_c7_b460_return_output := device_port_MUX_uxn_device_h_l214_c7_b460_return_output;

     -- Submodule level 3
     VAR_emu_deo_uxn_device_h_l221_c12_8586_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c1_7f19_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l212_c24_d608_left := VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l212_l218_DUPLICATE_6356_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l218_c24_b380_left := VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l212_l218_DUPLICATE_6356_return_output;
     VAR_device_index_MUX_uxn_device_h_l206_c2_90c4_iffalse := VAR_device_index_MUX_uxn_device_h_l214_c7_b460_return_output;
     VAR_device_port_MUX_uxn_device_h_l206_c2_90c4_iffalse := VAR_device_port_MUX_uxn_device_h_l214_c7_b460_return_output;
     -- device_index_MUX[uxn_device_h_l206_c2_90c4] LATENCY=0
     -- Inputs
     device_index_MUX_uxn_device_h_l206_c2_90c4_cond <= VAR_device_index_MUX_uxn_device_h_l206_c2_90c4_cond;
     device_index_MUX_uxn_device_h_l206_c2_90c4_iftrue <= VAR_device_index_MUX_uxn_device_h_l206_c2_90c4_iftrue;
     device_index_MUX_uxn_device_h_l206_c2_90c4_iffalse <= VAR_device_index_MUX_uxn_device_h_l206_c2_90c4_iffalse;
     -- Outputs
     VAR_device_index_MUX_uxn_device_h_l206_c2_90c4_return_output := device_index_MUX_uxn_device_h_l206_c2_90c4_return_output;

     -- device_port_MUX[uxn_device_h_l206_c2_90c4] LATENCY=0
     -- Inputs
     device_port_MUX_uxn_device_h_l206_c2_90c4_cond <= VAR_device_port_MUX_uxn_device_h_l206_c2_90c4_cond;
     device_port_MUX_uxn_device_h_l206_c2_90c4_iftrue <= VAR_device_port_MUX_uxn_device_h_l206_c2_90c4_iftrue;
     device_port_MUX_uxn_device_h_l206_c2_90c4_iffalse <= VAR_device_port_MUX_uxn_device_h_l206_c2_90c4_iffalse;
     -- Outputs
     VAR_device_port_MUX_uxn_device_h_l206_c2_90c4_return_output := device_port_MUX_uxn_device_h_l206_c2_90c4_return_output;

     -- emu_deo[uxn_device_h_l221_c12_8586] LATENCY=0
     -- Clock enable
     emu_deo_uxn_device_h_l221_c12_8586_CLOCK_ENABLE <= VAR_emu_deo_uxn_device_h_l221_c12_8586_CLOCK_ENABLE;
     -- Inputs
     emu_deo_uxn_device_h_l221_c12_8586_device_index <= VAR_emu_deo_uxn_device_h_l221_c12_8586_device_index;
     emu_deo_uxn_device_h_l221_c12_8586_device_port <= VAR_emu_deo_uxn_device_h_l221_c12_8586_device_port;
     emu_deo_uxn_device_h_l221_c12_8586_phase <= VAR_emu_deo_uxn_device_h_l221_c12_8586_phase;
     emu_deo_uxn_device_h_l221_c12_8586_previous_device_ram_read <= VAR_emu_deo_uxn_device_h_l221_c12_8586_previous_device_ram_read;
     -- Outputs
     VAR_emu_deo_uxn_device_h_l221_c12_8586_return_output := emu_deo_uxn_device_h_l221_c12_8586_return_output;

     -- BIN_OP_EQ[uxn_device_h_l218_c24_b380] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l218_c24_b380_left <= VAR_BIN_OP_EQ_uxn_device_h_l218_c24_b380_left;
     BIN_OP_EQ_uxn_device_h_l218_c24_b380_right <= VAR_BIN_OP_EQ_uxn_device_h_l218_c24_b380_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l218_c24_b380_return_output := BIN_OP_EQ_uxn_device_h_l218_c24_b380_return_output;

     -- BIN_OP_EQ[uxn_device_h_l212_c24_d608] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l212_c24_d608_left <= VAR_BIN_OP_EQ_uxn_device_h_l212_c24_d608_left;
     BIN_OP_EQ_uxn_device_h_l212_c24_d608_right <= VAR_BIN_OP_EQ_uxn_device_h_l212_c24_d608_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l212_c24_d608_return_output := BIN_OP_EQ_uxn_device_h_l212_c24_d608_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l212_c24_d5f5_cond := VAR_BIN_OP_EQ_uxn_device_h_l212_c24_d608_return_output;
     VAR_MUX_uxn_device_h_l218_c24_4536_cond := VAR_BIN_OP_EQ_uxn_device_h_l218_c24_b380_return_output;
     REG_VAR_device_index := VAR_device_index_MUX_uxn_device_h_l206_c2_90c4_return_output;
     REG_VAR_device_port := VAR_device_port_MUX_uxn_device_h_l206_c2_90c4_return_output;
     VAR_result_MUX_uxn_device_h_l214_c7_b460_iffalse := VAR_emu_deo_uxn_device_h_l221_c12_8586_return_output;
     -- MUX[uxn_device_h_l212_c24_d5f5] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l212_c24_d5f5_cond <= VAR_MUX_uxn_device_h_l212_c24_d5f5_cond;
     MUX_uxn_device_h_l212_c24_d5f5_iftrue <= VAR_MUX_uxn_device_h_l212_c24_d5f5_iftrue;
     MUX_uxn_device_h_l212_c24_d5f5_iffalse <= VAR_MUX_uxn_device_h_l212_c24_d5f5_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l212_c24_d5f5_return_output := MUX_uxn_device_h_l212_c24_d5f5_return_output;

     -- MUX[uxn_device_h_l218_c24_4536] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l218_c24_4536_cond <= VAR_MUX_uxn_device_h_l218_c24_4536_cond;
     MUX_uxn_device_h_l218_c24_4536_iftrue <= VAR_MUX_uxn_device_h_l218_c24_4536_iftrue;
     MUX_uxn_device_h_l218_c24_4536_iffalse <= VAR_MUX_uxn_device_h_l218_c24_4536_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l218_c24_4536_return_output := MUX_uxn_device_h_l218_c24_4536_return_output;

     -- Submodule level 5
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cf24[uxn_device_h_l214_c7_b460] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cf24_uxn_device_h_l214_c7_b460_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_cf24(
     result,
     to_unsigned(0, 1),
     VAR_MUX_uxn_device_h_l218_c24_4536_return_output);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_3666[uxn_device_h_l206_c2_90c4] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_3666_uxn_device_h_l206_c2_90c4_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_3666(
     result,
     to_unsigned(1, 1),
     VAR_device_address,
     VAR_value,
     VAR_MUX_uxn_device_h_l212_c24_d5f5_return_output);

     -- Submodule level 6
     VAR_result_MUX_uxn_device_h_l206_c2_90c4_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_3666_uxn_device_h_l206_c2_90c4_return_output;
     VAR_result_MUX_uxn_device_h_l214_c7_b460_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cf24_uxn_device_h_l214_c7_b460_return_output;
     -- result_MUX[uxn_device_h_l214_c7_b460] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l214_c7_b460_cond <= VAR_result_MUX_uxn_device_h_l214_c7_b460_cond;
     result_MUX_uxn_device_h_l214_c7_b460_iftrue <= VAR_result_MUX_uxn_device_h_l214_c7_b460_iftrue;
     result_MUX_uxn_device_h_l214_c7_b460_iffalse <= VAR_result_MUX_uxn_device_h_l214_c7_b460_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l214_c7_b460_return_output := result_MUX_uxn_device_h_l214_c7_b460_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_device_h_l206_c2_90c4_iffalse := VAR_result_MUX_uxn_device_h_l214_c7_b460_return_output;
     -- result_MUX[uxn_device_h_l206_c2_90c4] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l206_c2_90c4_cond <= VAR_result_MUX_uxn_device_h_l206_c2_90c4_cond;
     result_MUX_uxn_device_h_l206_c2_90c4_iftrue <= VAR_result_MUX_uxn_device_h_l206_c2_90c4_iftrue;
     result_MUX_uxn_device_h_l206_c2_90c4_iffalse <= VAR_result_MUX_uxn_device_h_l206_c2_90c4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l206_c2_90c4_return_output := result_MUX_uxn_device_h_l206_c2_90c4_return_output;

     -- Submodule level 8
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l206_c2_90c4_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l206_c2_90c4_return_output;
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
