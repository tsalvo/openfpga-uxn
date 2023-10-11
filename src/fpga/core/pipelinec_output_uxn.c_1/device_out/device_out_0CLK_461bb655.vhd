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
entity device_out_0CLK_461bb655 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 value : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end device_out_0CLK_461bb655;
architecture arch of device_out_0CLK_461bb655 is
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
-- printf_uxn_device_h_l201_c2_3eaf[uxn_device_h_l201_c2_3eaf]
signal printf_uxn_device_h_l201_c2_3eaf_uxn_device_h_l201_c2_3eaf_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l201_c2_3eaf_uxn_device_h_l201_c2_3eaf_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l201_c2_3eaf_uxn_device_h_l201_c2_3eaf_arg1 : unsigned(31 downto 0);
signal printf_uxn_device_h_l201_c2_3eaf_uxn_device_h_l201_c2_3eaf_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l203_c6_ed11]
signal BIN_OP_EQ_uxn_device_h_l203_c6_ed11_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l203_c6_ed11_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l203_c6_ed11_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l211_c7_ca73]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l211_c7_ca73_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l211_c7_ca73_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l211_c7_ca73_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l211_c7_ca73_return_output : unsigned(0 downto 0);

-- device_index_MUX[uxn_device_h_l203_c2_3ad3]
signal device_index_MUX_uxn_device_h_l203_c2_3ad3_cond : unsigned(0 downto 0);
signal device_index_MUX_uxn_device_h_l203_c2_3ad3_iftrue : unsigned(3 downto 0);
signal device_index_MUX_uxn_device_h_l203_c2_3ad3_iffalse : unsigned(3 downto 0);
signal device_index_MUX_uxn_device_h_l203_c2_3ad3_return_output : unsigned(3 downto 0);

-- result_MUX[uxn_device_h_l203_c2_3ad3]
signal result_MUX_uxn_device_h_l203_c2_3ad3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l203_c2_3ad3_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l203_c2_3ad3_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l203_c2_3ad3_return_output : device_out_result_t;

-- device_port_MUX[uxn_device_h_l203_c2_3ad3]
signal device_port_MUX_uxn_device_h_l203_c2_3ad3_cond : unsigned(0 downto 0);
signal device_port_MUX_uxn_device_h_l203_c2_3ad3_iftrue : unsigned(3 downto 0);
signal device_port_MUX_uxn_device_h_l203_c2_3ad3_iffalse : unsigned(3 downto 0);
signal device_port_MUX_uxn_device_h_l203_c2_3ad3_return_output : unsigned(3 downto 0);

-- BIN_OP_AND[uxn_device_h_l207_c27_999d]
signal BIN_OP_AND_uxn_device_h_l207_c27_999d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l207_c27_999d_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l207_c27_999d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l209_c24_34cf]
signal BIN_OP_EQ_uxn_device_h_l209_c24_34cf_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_device_h_l209_c24_34cf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l209_c24_34cf_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l209_c24_becc]
signal MUX_uxn_device_h_l209_c24_becc_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l209_c24_becc_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l209_c24_becc_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l209_c24_becc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l211_c11_9aa3]
signal BIN_OP_EQ_uxn_device_h_l211_c11_9aa3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l211_c11_9aa3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l211_c11_9aa3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l217_c1_86b0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l217_c1_86b0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l217_c1_86b0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l217_c1_86b0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l217_c1_86b0_return_output : unsigned(0 downto 0);

-- device_index_MUX[uxn_device_h_l211_c7_ca73]
signal device_index_MUX_uxn_device_h_l211_c7_ca73_cond : unsigned(0 downto 0);
signal device_index_MUX_uxn_device_h_l211_c7_ca73_iftrue : unsigned(3 downto 0);
signal device_index_MUX_uxn_device_h_l211_c7_ca73_iffalse : unsigned(3 downto 0);
signal device_index_MUX_uxn_device_h_l211_c7_ca73_return_output : unsigned(3 downto 0);

-- result_MUX[uxn_device_h_l211_c7_ca73]
signal result_MUX_uxn_device_h_l211_c7_ca73_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l211_c7_ca73_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l211_c7_ca73_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l211_c7_ca73_return_output : device_out_result_t;

-- device_port_MUX[uxn_device_h_l211_c7_ca73]
signal device_port_MUX_uxn_device_h_l211_c7_ca73_cond : unsigned(0 downto 0);
signal device_port_MUX_uxn_device_h_l211_c7_ca73_iftrue : unsigned(3 downto 0);
signal device_port_MUX_uxn_device_h_l211_c7_ca73_iffalse : unsigned(3 downto 0);
signal device_port_MUX_uxn_device_h_l211_c7_ca73_return_output : unsigned(3 downto 0);

-- BIN_OP_AND[uxn_device_h_l213_c27_2096]
signal BIN_OP_AND_uxn_device_h_l213_c27_2096_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l213_c27_2096_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l213_c27_2096_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l215_c24_2a36]
signal BIN_OP_EQ_uxn_device_h_l215_c24_2a36_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_device_h_l215_c24_2a36_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l215_c24_2a36_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l215_c24_2e7d]
signal MUX_uxn_device_h_l215_c24_2e7d_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l215_c24_2e7d_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l215_c24_2e7d_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l215_c24_2e7d_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l218_c47_3875]
signal BIN_OP_MINUS_uxn_device_h_l218_c47_3875_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l218_c47_3875_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l218_c47_3875_return_output : unsigned(7 downto 0);

-- emu_deo[uxn_device_h_l218_c12_ec19]
signal emu_deo_uxn_device_h_l218_c12_ec19_CLOCK_ENABLE : unsigned(0 downto 0);
signal emu_deo_uxn_device_h_l218_c12_ec19_device_index : unsigned(3 downto 0);
signal emu_deo_uxn_device_h_l218_c12_ec19_device_port : unsigned(3 downto 0);
signal emu_deo_uxn_device_h_l218_c12_ec19_phase : unsigned(7 downto 0);
signal emu_deo_uxn_device_h_l218_c12_ec19_previous_device_ram_read : unsigned(7 downto 0);
signal emu_deo_uxn_device_h_l218_c12_ec19_return_output : device_out_result_t;

-- CONST_SR_4_uint8_t_uxn_device_h_l214_l208_DUPLICATE_e2d7
signal CONST_SR_4_uint8_t_uxn_device_h_l214_l208_DUPLICATE_e2d7_x : unsigned(7 downto 0);
signal CONST_SR_4_uint8_t_uxn_device_h_l214_l208_DUPLICATE_e2d7_return_output : unsigned(7 downto 0);

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l209_l215_DUPLICATE_db0b
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l209_l215_DUPLICATE_db0b_ref_toks_0 : uint16_t_16;
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l209_l215_DUPLICATE_db0b_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l209_l215_DUPLICATE_db0b_return_output : unsigned(15 downto 0);

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
-- printf_uxn_device_h_l201_c2_3eaf_uxn_device_h_l201_c2_3eaf
printf_uxn_device_h_l201_c2_3eaf_uxn_device_h_l201_c2_3eaf : entity work.printf_uxn_device_h_l201_c2_3eaf_0CLK_de264c78 port map (
printf_uxn_device_h_l201_c2_3eaf_uxn_device_h_l201_c2_3eaf_CLOCK_ENABLE,
printf_uxn_device_h_l201_c2_3eaf_uxn_device_h_l201_c2_3eaf_arg0,
printf_uxn_device_h_l201_c2_3eaf_uxn_device_h_l201_c2_3eaf_arg1,
printf_uxn_device_h_l201_c2_3eaf_uxn_device_h_l201_c2_3eaf_arg2);

-- BIN_OP_EQ_uxn_device_h_l203_c6_ed11
BIN_OP_EQ_uxn_device_h_l203_c6_ed11 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l203_c6_ed11_left,
BIN_OP_EQ_uxn_device_h_l203_c6_ed11_right,
BIN_OP_EQ_uxn_device_h_l203_c6_ed11_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l211_c7_ca73
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l211_c7_ca73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l211_c7_ca73_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l211_c7_ca73_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l211_c7_ca73_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l211_c7_ca73_return_output);

-- device_index_MUX_uxn_device_h_l203_c2_3ad3
device_index_MUX_uxn_device_h_l203_c2_3ad3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
device_index_MUX_uxn_device_h_l203_c2_3ad3_cond,
device_index_MUX_uxn_device_h_l203_c2_3ad3_iftrue,
device_index_MUX_uxn_device_h_l203_c2_3ad3_iffalse,
device_index_MUX_uxn_device_h_l203_c2_3ad3_return_output);

-- result_MUX_uxn_device_h_l203_c2_3ad3
result_MUX_uxn_device_h_l203_c2_3ad3 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l203_c2_3ad3_cond,
result_MUX_uxn_device_h_l203_c2_3ad3_iftrue,
result_MUX_uxn_device_h_l203_c2_3ad3_iffalse,
result_MUX_uxn_device_h_l203_c2_3ad3_return_output);

-- device_port_MUX_uxn_device_h_l203_c2_3ad3
device_port_MUX_uxn_device_h_l203_c2_3ad3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
device_port_MUX_uxn_device_h_l203_c2_3ad3_cond,
device_port_MUX_uxn_device_h_l203_c2_3ad3_iftrue,
device_port_MUX_uxn_device_h_l203_c2_3ad3_iffalse,
device_port_MUX_uxn_device_h_l203_c2_3ad3_return_output);

-- BIN_OP_AND_uxn_device_h_l207_c27_999d
BIN_OP_AND_uxn_device_h_l207_c27_999d : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l207_c27_999d_left,
BIN_OP_AND_uxn_device_h_l207_c27_999d_right,
BIN_OP_AND_uxn_device_h_l207_c27_999d_return_output);

-- BIN_OP_EQ_uxn_device_h_l209_c24_34cf
BIN_OP_EQ_uxn_device_h_l209_c24_34cf : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l209_c24_34cf_left,
BIN_OP_EQ_uxn_device_h_l209_c24_34cf_right,
BIN_OP_EQ_uxn_device_h_l209_c24_34cf_return_output);

-- MUX_uxn_device_h_l209_c24_becc
MUX_uxn_device_h_l209_c24_becc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l209_c24_becc_cond,
MUX_uxn_device_h_l209_c24_becc_iftrue,
MUX_uxn_device_h_l209_c24_becc_iffalse,
MUX_uxn_device_h_l209_c24_becc_return_output);

-- BIN_OP_EQ_uxn_device_h_l211_c11_9aa3
BIN_OP_EQ_uxn_device_h_l211_c11_9aa3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l211_c11_9aa3_left,
BIN_OP_EQ_uxn_device_h_l211_c11_9aa3_right,
BIN_OP_EQ_uxn_device_h_l211_c11_9aa3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l217_c1_86b0
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l217_c1_86b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l217_c1_86b0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l217_c1_86b0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l217_c1_86b0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l217_c1_86b0_return_output);

-- device_index_MUX_uxn_device_h_l211_c7_ca73
device_index_MUX_uxn_device_h_l211_c7_ca73 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
device_index_MUX_uxn_device_h_l211_c7_ca73_cond,
device_index_MUX_uxn_device_h_l211_c7_ca73_iftrue,
device_index_MUX_uxn_device_h_l211_c7_ca73_iffalse,
device_index_MUX_uxn_device_h_l211_c7_ca73_return_output);

-- result_MUX_uxn_device_h_l211_c7_ca73
result_MUX_uxn_device_h_l211_c7_ca73 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l211_c7_ca73_cond,
result_MUX_uxn_device_h_l211_c7_ca73_iftrue,
result_MUX_uxn_device_h_l211_c7_ca73_iffalse,
result_MUX_uxn_device_h_l211_c7_ca73_return_output);

-- device_port_MUX_uxn_device_h_l211_c7_ca73
device_port_MUX_uxn_device_h_l211_c7_ca73 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
device_port_MUX_uxn_device_h_l211_c7_ca73_cond,
device_port_MUX_uxn_device_h_l211_c7_ca73_iftrue,
device_port_MUX_uxn_device_h_l211_c7_ca73_iffalse,
device_port_MUX_uxn_device_h_l211_c7_ca73_return_output);

-- BIN_OP_AND_uxn_device_h_l213_c27_2096
BIN_OP_AND_uxn_device_h_l213_c27_2096 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l213_c27_2096_left,
BIN_OP_AND_uxn_device_h_l213_c27_2096_right,
BIN_OP_AND_uxn_device_h_l213_c27_2096_return_output);

-- BIN_OP_EQ_uxn_device_h_l215_c24_2a36
BIN_OP_EQ_uxn_device_h_l215_c24_2a36 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l215_c24_2a36_left,
BIN_OP_EQ_uxn_device_h_l215_c24_2a36_right,
BIN_OP_EQ_uxn_device_h_l215_c24_2a36_return_output);

-- MUX_uxn_device_h_l215_c24_2e7d
MUX_uxn_device_h_l215_c24_2e7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l215_c24_2e7d_cond,
MUX_uxn_device_h_l215_c24_2e7d_iftrue,
MUX_uxn_device_h_l215_c24_2e7d_iffalse,
MUX_uxn_device_h_l215_c24_2e7d_return_output);

-- BIN_OP_MINUS_uxn_device_h_l218_c47_3875
BIN_OP_MINUS_uxn_device_h_l218_c47_3875 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l218_c47_3875_left,
BIN_OP_MINUS_uxn_device_h_l218_c47_3875_right,
BIN_OP_MINUS_uxn_device_h_l218_c47_3875_return_output);

-- emu_deo_uxn_device_h_l218_c12_ec19
emu_deo_uxn_device_h_l218_c12_ec19 : entity work.emu_deo_0CLK_30b2939b port map (
clk,
emu_deo_uxn_device_h_l218_c12_ec19_CLOCK_ENABLE,
emu_deo_uxn_device_h_l218_c12_ec19_device_index,
emu_deo_uxn_device_h_l218_c12_ec19_device_port,
emu_deo_uxn_device_h_l218_c12_ec19_phase,
emu_deo_uxn_device_h_l218_c12_ec19_previous_device_ram_read,
emu_deo_uxn_device_h_l218_c12_ec19_return_output);

-- CONST_SR_4_uint8_t_uxn_device_h_l214_l208_DUPLICATE_e2d7
CONST_SR_4_uint8_t_uxn_device_h_l214_l208_DUPLICATE_e2d7 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uint8_t_uxn_device_h_l214_l208_DUPLICATE_e2d7_x,
CONST_SR_4_uint8_t_uxn_device_h_l214_l208_DUPLICATE_e2d7_return_output);

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l209_l215_DUPLICATE_db0b
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l209_l215_DUPLICATE_db0b : entity work.VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_0CLK_763c90e8 port map (
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l209_l215_DUPLICATE_db0b_ref_toks_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l209_l215_DUPLICATE_db0b_var_dim_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l209_l215_DUPLICATE_db0b_return_output);



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
 BIN_OP_EQ_uxn_device_h_l203_c6_ed11_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l211_c7_ca73_return_output,
 device_index_MUX_uxn_device_h_l203_c2_3ad3_return_output,
 result_MUX_uxn_device_h_l203_c2_3ad3_return_output,
 device_port_MUX_uxn_device_h_l203_c2_3ad3_return_output,
 BIN_OP_AND_uxn_device_h_l207_c27_999d_return_output,
 BIN_OP_EQ_uxn_device_h_l209_c24_34cf_return_output,
 MUX_uxn_device_h_l209_c24_becc_return_output,
 BIN_OP_EQ_uxn_device_h_l211_c11_9aa3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l217_c1_86b0_return_output,
 device_index_MUX_uxn_device_h_l211_c7_ca73_return_output,
 result_MUX_uxn_device_h_l211_c7_ca73_return_output,
 device_port_MUX_uxn_device_h_l211_c7_ca73_return_output,
 BIN_OP_AND_uxn_device_h_l213_c27_2096_return_output,
 BIN_OP_EQ_uxn_device_h_l215_c24_2a36_return_output,
 MUX_uxn_device_h_l215_c24_2e7d_return_output,
 BIN_OP_MINUS_uxn_device_h_l218_c47_3875_return_output,
 emu_deo_uxn_device_h_l218_c12_ec19_return_output,
 CONST_SR_4_uint8_t_uxn_device_h_l214_l208_DUPLICATE_e2d7_return_output,
 VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l209_l215_DUPLICATE_db0b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_value : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_printf_uxn_device_h_l201_c2_3eaf_uxn_device_h_l201_c2_3eaf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l201_c2_3eaf_uxn_device_h_l201_c2_3eaf_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l201_c2_3eaf_uxn_device_h_l201_c2_3eaf_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l201_c2_3eaf_uxn_device_h_l201_c2_3eaf_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l203_c6_ed11_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l203_c6_ed11_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l203_c6_ed11_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l211_c7_ca73_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l211_c7_ca73_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l211_c7_ca73_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l211_c7_ca73_iffalse : unsigned(0 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l203_c2_3ad3_iftrue : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l203_c2_3ad3_iffalse : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l211_c7_ca73_return_output : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l203_c2_3ad3_return_output : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l203_c2_3ad3_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l203_c2_3ad3_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_3666_uxn_device_h_l203_c2_3ad3_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l203_c2_3ad3_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l211_c7_ca73_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l203_c2_3ad3_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l203_c2_3ad3_cond : unsigned(0 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l203_c2_3ad3_iftrue : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l203_c2_3ad3_iffalse : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l211_c7_ca73_return_output : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l203_c2_3ad3_return_output : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l203_c2_3ad3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l207_c27_999d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l207_c27_999d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l207_c27_999d_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l207_c17_c94d_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_device_h_l209_c24_becc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l209_c24_becc_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l209_c24_becc_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l209_c24_34cf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l209_c24_34cf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l209_c24_34cf_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l209_c24_becc_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l211_c11_9aa3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l211_c11_9aa3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l211_c11_9aa3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l217_c1_86b0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l217_c1_86b0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l217_c1_86b0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l217_c1_86b0_iffalse : unsigned(0 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l211_c7_ca73_iftrue : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l211_c7_ca73_iffalse : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l211_c7_ca73_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l211_c7_ca73_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cf24_uxn_device_h_l211_c7_ca73_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l211_c7_ca73_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l211_c7_ca73_cond : unsigned(0 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l211_c7_ca73_iftrue : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l211_c7_ca73_iffalse : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l211_c7_ca73_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l213_c27_2096_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l213_c27_2096_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l213_c27_2096_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l213_c17_c8f6_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_device_h_l215_c24_2e7d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l215_c24_2e7d_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l215_c24_2e7d_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l215_c24_2a36_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l215_c24_2a36_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l215_c24_2a36_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l215_c24_2e7d_return_output : unsigned(0 downto 0);
 variable VAR_emu_deo_uxn_device_h_l218_c12_ec19_device_index : unsigned(3 downto 0);
 variable VAR_emu_deo_uxn_device_h_l218_c12_ec19_device_port : unsigned(3 downto 0);
 variable VAR_emu_deo_uxn_device_h_l218_c12_ec19_phase : unsigned(7 downto 0);
 variable VAR_emu_deo_uxn_device_h_l218_c12_ec19_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l218_c47_3875_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l218_c47_3875_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l218_c47_3875_return_output : unsigned(7 downto 0);
 variable VAR_emu_deo_uxn_device_h_l218_c12_ec19_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_emu_deo_uxn_device_h_l218_c12_ec19_return_output : device_out_result_t;
 variable VAR_CONST_SR_4_uint8_t_uxn_device_h_l214_l208_DUPLICATE_e2d7_x : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uint8_t_uxn_device_h_l214_l208_DUPLICATE_e2d7_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l214_l208_DUPLICATE_1e3e_return_output : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l209_l215_DUPLICATE_db0b_ref_toks_0 : uint16_t_16;
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l209_l215_DUPLICATE_db0b_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l209_l215_DUPLICATE_db0b_return_output : unsigned(15 downto 0);
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l211_c7_ca73_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l215_c24_2e7d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l215_c24_2a36_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l211_c11_9aa3_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l213_c27_2096_right := to_unsigned(15, 4);
     VAR_MUX_uxn_device_h_l215_c24_2e7d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l217_c1_86b0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l203_c6_ed11_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l209_c24_becc_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l209_c24_becc_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l209_c24_34cf_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l207_c27_999d_right := to_unsigned(15, 4);
     VAR_BIN_OP_MINUS_uxn_device_h_l218_c47_3875_right := to_unsigned(2, 2);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l211_c7_ca73_iffalse := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_device_h_l201_c2_3eaf_uxn_device_h_l201_c2_3eaf_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l209_l215_DUPLICATE_db0b_ref_toks_0 := deo_mask;
     REG_VAR_deo_mask := deo_mask;
     VAR_BIN_OP_AND_uxn_device_h_l207_c27_999d_left := VAR_device_address;
     VAR_BIN_OP_AND_uxn_device_h_l213_c27_2096_left := VAR_device_address;
     VAR_CONST_SR_4_uint8_t_uxn_device_h_l214_l208_DUPLICATE_e2d7_x := VAR_device_address;
     VAR_printf_uxn_device_h_l201_c2_3eaf_uxn_device_h_l201_c2_3eaf_arg0 := resize(VAR_device_address, 32);
     VAR_device_index_MUX_uxn_device_h_l211_c7_ca73_iffalse := device_index;
     VAR_emu_deo_uxn_device_h_l218_c12_ec19_device_index := device_index;
     VAR_device_port_MUX_uxn_device_h_l211_c7_ca73_iffalse := device_port;
     VAR_emu_deo_uxn_device_h_l218_c12_ec19_device_port := device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l203_c6_ed11_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l211_c11_9aa3_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l218_c47_3875_left := VAR_phase;
     VAR_printf_uxn_device_h_l201_c2_3eaf_uxn_device_h_l201_c2_3eaf_arg2 := resize(VAR_phase, 32);
     VAR_emu_deo_uxn_device_h_l218_c12_ec19_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_printf_uxn_device_h_l201_c2_3eaf_uxn_device_h_l201_c2_3eaf_arg1 := resize(VAR_value, 32);
     -- BIN_OP_EQ[uxn_device_h_l211_c11_9aa3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l211_c11_9aa3_left <= VAR_BIN_OP_EQ_uxn_device_h_l211_c11_9aa3_left;
     BIN_OP_EQ_uxn_device_h_l211_c11_9aa3_right <= VAR_BIN_OP_EQ_uxn_device_h_l211_c11_9aa3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l211_c11_9aa3_return_output := BIN_OP_EQ_uxn_device_h_l211_c11_9aa3_return_output;

     -- BIN_OP_AND[uxn_device_h_l207_c27_999d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l207_c27_999d_left <= VAR_BIN_OP_AND_uxn_device_h_l207_c27_999d_left;
     BIN_OP_AND_uxn_device_h_l207_c27_999d_right <= VAR_BIN_OP_AND_uxn_device_h_l207_c27_999d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l207_c27_999d_return_output := BIN_OP_AND_uxn_device_h_l207_c27_999d_return_output;

     -- CONST_SR_4_uint8_t_uxn_device_h_l214_l208_DUPLICATE_e2d7 LATENCY=0
     -- Inputs
     CONST_SR_4_uint8_t_uxn_device_h_l214_l208_DUPLICATE_e2d7_x <= VAR_CONST_SR_4_uint8_t_uxn_device_h_l214_l208_DUPLICATE_e2d7_x;
     -- Outputs
     VAR_CONST_SR_4_uint8_t_uxn_device_h_l214_l208_DUPLICATE_e2d7_return_output := CONST_SR_4_uint8_t_uxn_device_h_l214_l208_DUPLICATE_e2d7_return_output;

     -- BIN_OP_EQ[uxn_device_h_l203_c6_ed11] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l203_c6_ed11_left <= VAR_BIN_OP_EQ_uxn_device_h_l203_c6_ed11_left;
     BIN_OP_EQ_uxn_device_h_l203_c6_ed11_right <= VAR_BIN_OP_EQ_uxn_device_h_l203_c6_ed11_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l203_c6_ed11_return_output := BIN_OP_EQ_uxn_device_h_l203_c6_ed11_return_output;

     -- BIN_OP_AND[uxn_device_h_l213_c27_2096] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l213_c27_2096_left <= VAR_BIN_OP_AND_uxn_device_h_l213_c27_2096_left;
     BIN_OP_AND_uxn_device_h_l213_c27_2096_right <= VAR_BIN_OP_AND_uxn_device_h_l213_c27_2096_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l213_c27_2096_return_output := BIN_OP_AND_uxn_device_h_l213_c27_2096_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l218_c47_3875] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l218_c47_3875_left <= VAR_BIN_OP_MINUS_uxn_device_h_l218_c47_3875_left;
     BIN_OP_MINUS_uxn_device_h_l218_c47_3875_right <= VAR_BIN_OP_MINUS_uxn_device_h_l218_c47_3875_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l218_c47_3875_return_output := BIN_OP_MINUS_uxn_device_h_l218_c47_3875_return_output;

     -- printf_uxn_device_h_l201_c2_3eaf[uxn_device_h_l201_c2_3eaf] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l201_c2_3eaf_uxn_device_h_l201_c2_3eaf_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l201_c2_3eaf_uxn_device_h_l201_c2_3eaf_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l201_c2_3eaf_uxn_device_h_l201_c2_3eaf_arg0 <= VAR_printf_uxn_device_h_l201_c2_3eaf_uxn_device_h_l201_c2_3eaf_arg0;
     printf_uxn_device_h_l201_c2_3eaf_uxn_device_h_l201_c2_3eaf_arg1 <= VAR_printf_uxn_device_h_l201_c2_3eaf_uxn_device_h_l201_c2_3eaf_arg1;
     printf_uxn_device_h_l201_c2_3eaf_uxn_device_h_l201_c2_3eaf_arg2 <= VAR_printf_uxn_device_h_l201_c2_3eaf_uxn_device_h_l201_c2_3eaf_arg2;
     -- Outputs

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l211_c7_ca73_cond := VAR_BIN_OP_EQ_uxn_device_h_l203_c6_ed11_return_output;
     VAR_device_index_MUX_uxn_device_h_l203_c2_3ad3_cond := VAR_BIN_OP_EQ_uxn_device_h_l203_c6_ed11_return_output;
     VAR_device_port_MUX_uxn_device_h_l203_c2_3ad3_cond := VAR_BIN_OP_EQ_uxn_device_h_l203_c6_ed11_return_output;
     VAR_result_MUX_uxn_device_h_l203_c2_3ad3_cond := VAR_BIN_OP_EQ_uxn_device_h_l203_c6_ed11_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l217_c1_86b0_cond := VAR_BIN_OP_EQ_uxn_device_h_l211_c11_9aa3_return_output;
     VAR_device_index_MUX_uxn_device_h_l211_c7_ca73_cond := VAR_BIN_OP_EQ_uxn_device_h_l211_c11_9aa3_return_output;
     VAR_device_port_MUX_uxn_device_h_l211_c7_ca73_cond := VAR_BIN_OP_EQ_uxn_device_h_l211_c11_9aa3_return_output;
     VAR_result_MUX_uxn_device_h_l211_c7_ca73_cond := VAR_BIN_OP_EQ_uxn_device_h_l211_c11_9aa3_return_output;
     VAR_emu_deo_uxn_device_h_l218_c12_ec19_phase := VAR_BIN_OP_MINUS_uxn_device_h_l218_c47_3875_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l211_c7_ca73] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l211_c7_ca73_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l211_c7_ca73_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l211_c7_ca73_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l211_c7_ca73_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l211_c7_ca73_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l211_c7_ca73_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l211_c7_ca73_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l211_c7_ca73_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l213_c17_c8f6] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l213_c17_c8f6_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_BIN_OP_AND_uxn_device_h_l213_c27_2096_return_output);

     -- CAST_TO_uint4_t_uint8_t_uxn_device_h_l214_l208_DUPLICATE_1e3e LATENCY=0
     VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l214_l208_DUPLICATE_1e3e_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uint8_t_uxn_device_h_l214_l208_DUPLICATE_e2d7_return_output);

     -- CAST_TO_uint4_t[uxn_device_h_l207_c17_c94d] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l207_c17_c94d_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_BIN_OP_AND_uxn_device_h_l207_c27_999d_return_output);

     -- Submodule level 2
     VAR_device_port_MUX_uxn_device_h_l203_c2_3ad3_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l207_c17_c94d_return_output;
     VAR_device_port_MUX_uxn_device_h_l211_c7_ca73_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l213_c17_c8f6_return_output;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l209_l215_DUPLICATE_db0b_var_dim_0 := VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l214_l208_DUPLICATE_1e3e_return_output;
     VAR_device_index_MUX_uxn_device_h_l203_c2_3ad3_iftrue := VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l214_l208_DUPLICATE_1e3e_return_output;
     VAR_device_index_MUX_uxn_device_h_l211_c7_ca73_iftrue := VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l214_l208_DUPLICATE_1e3e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l217_c1_86b0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l211_c7_ca73_return_output;
     -- device_index_MUX[uxn_device_h_l211_c7_ca73] LATENCY=0
     -- Inputs
     device_index_MUX_uxn_device_h_l211_c7_ca73_cond <= VAR_device_index_MUX_uxn_device_h_l211_c7_ca73_cond;
     device_index_MUX_uxn_device_h_l211_c7_ca73_iftrue <= VAR_device_index_MUX_uxn_device_h_l211_c7_ca73_iftrue;
     device_index_MUX_uxn_device_h_l211_c7_ca73_iffalse <= VAR_device_index_MUX_uxn_device_h_l211_c7_ca73_iffalse;
     -- Outputs
     VAR_device_index_MUX_uxn_device_h_l211_c7_ca73_return_output := device_index_MUX_uxn_device_h_l211_c7_ca73_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l217_c1_86b0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l217_c1_86b0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l217_c1_86b0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l217_c1_86b0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l217_c1_86b0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l217_c1_86b0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l217_c1_86b0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l217_c1_86b0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l217_c1_86b0_return_output;

     -- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l209_l215_DUPLICATE_db0b LATENCY=0
     -- Inputs
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l209_l215_DUPLICATE_db0b_ref_toks_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l209_l215_DUPLICATE_db0b_ref_toks_0;
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l209_l215_DUPLICATE_db0b_var_dim_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l209_l215_DUPLICATE_db0b_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l209_l215_DUPLICATE_db0b_return_output := VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l209_l215_DUPLICATE_db0b_return_output;

     -- device_port_MUX[uxn_device_h_l211_c7_ca73] LATENCY=0
     -- Inputs
     device_port_MUX_uxn_device_h_l211_c7_ca73_cond <= VAR_device_port_MUX_uxn_device_h_l211_c7_ca73_cond;
     device_port_MUX_uxn_device_h_l211_c7_ca73_iftrue <= VAR_device_port_MUX_uxn_device_h_l211_c7_ca73_iftrue;
     device_port_MUX_uxn_device_h_l211_c7_ca73_iffalse <= VAR_device_port_MUX_uxn_device_h_l211_c7_ca73_iffalse;
     -- Outputs
     VAR_device_port_MUX_uxn_device_h_l211_c7_ca73_return_output := device_port_MUX_uxn_device_h_l211_c7_ca73_return_output;

     -- Submodule level 3
     VAR_emu_deo_uxn_device_h_l218_c12_ec19_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l217_c1_86b0_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l209_c24_34cf_left := VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l209_l215_DUPLICATE_db0b_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l215_c24_2a36_left := VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l209_l215_DUPLICATE_db0b_return_output;
     VAR_device_index_MUX_uxn_device_h_l203_c2_3ad3_iffalse := VAR_device_index_MUX_uxn_device_h_l211_c7_ca73_return_output;
     VAR_device_port_MUX_uxn_device_h_l203_c2_3ad3_iffalse := VAR_device_port_MUX_uxn_device_h_l211_c7_ca73_return_output;
     -- BIN_OP_EQ[uxn_device_h_l215_c24_2a36] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l215_c24_2a36_left <= VAR_BIN_OP_EQ_uxn_device_h_l215_c24_2a36_left;
     BIN_OP_EQ_uxn_device_h_l215_c24_2a36_right <= VAR_BIN_OP_EQ_uxn_device_h_l215_c24_2a36_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l215_c24_2a36_return_output := BIN_OP_EQ_uxn_device_h_l215_c24_2a36_return_output;

     -- BIN_OP_EQ[uxn_device_h_l209_c24_34cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l209_c24_34cf_left <= VAR_BIN_OP_EQ_uxn_device_h_l209_c24_34cf_left;
     BIN_OP_EQ_uxn_device_h_l209_c24_34cf_right <= VAR_BIN_OP_EQ_uxn_device_h_l209_c24_34cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l209_c24_34cf_return_output := BIN_OP_EQ_uxn_device_h_l209_c24_34cf_return_output;

     -- emu_deo[uxn_device_h_l218_c12_ec19] LATENCY=0
     -- Clock enable
     emu_deo_uxn_device_h_l218_c12_ec19_CLOCK_ENABLE <= VAR_emu_deo_uxn_device_h_l218_c12_ec19_CLOCK_ENABLE;
     -- Inputs
     emu_deo_uxn_device_h_l218_c12_ec19_device_index <= VAR_emu_deo_uxn_device_h_l218_c12_ec19_device_index;
     emu_deo_uxn_device_h_l218_c12_ec19_device_port <= VAR_emu_deo_uxn_device_h_l218_c12_ec19_device_port;
     emu_deo_uxn_device_h_l218_c12_ec19_phase <= VAR_emu_deo_uxn_device_h_l218_c12_ec19_phase;
     emu_deo_uxn_device_h_l218_c12_ec19_previous_device_ram_read <= VAR_emu_deo_uxn_device_h_l218_c12_ec19_previous_device_ram_read;
     -- Outputs
     VAR_emu_deo_uxn_device_h_l218_c12_ec19_return_output := emu_deo_uxn_device_h_l218_c12_ec19_return_output;

     -- device_port_MUX[uxn_device_h_l203_c2_3ad3] LATENCY=0
     -- Inputs
     device_port_MUX_uxn_device_h_l203_c2_3ad3_cond <= VAR_device_port_MUX_uxn_device_h_l203_c2_3ad3_cond;
     device_port_MUX_uxn_device_h_l203_c2_3ad3_iftrue <= VAR_device_port_MUX_uxn_device_h_l203_c2_3ad3_iftrue;
     device_port_MUX_uxn_device_h_l203_c2_3ad3_iffalse <= VAR_device_port_MUX_uxn_device_h_l203_c2_3ad3_iffalse;
     -- Outputs
     VAR_device_port_MUX_uxn_device_h_l203_c2_3ad3_return_output := device_port_MUX_uxn_device_h_l203_c2_3ad3_return_output;

     -- device_index_MUX[uxn_device_h_l203_c2_3ad3] LATENCY=0
     -- Inputs
     device_index_MUX_uxn_device_h_l203_c2_3ad3_cond <= VAR_device_index_MUX_uxn_device_h_l203_c2_3ad3_cond;
     device_index_MUX_uxn_device_h_l203_c2_3ad3_iftrue <= VAR_device_index_MUX_uxn_device_h_l203_c2_3ad3_iftrue;
     device_index_MUX_uxn_device_h_l203_c2_3ad3_iffalse <= VAR_device_index_MUX_uxn_device_h_l203_c2_3ad3_iffalse;
     -- Outputs
     VAR_device_index_MUX_uxn_device_h_l203_c2_3ad3_return_output := device_index_MUX_uxn_device_h_l203_c2_3ad3_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l209_c24_becc_cond := VAR_BIN_OP_EQ_uxn_device_h_l209_c24_34cf_return_output;
     VAR_MUX_uxn_device_h_l215_c24_2e7d_cond := VAR_BIN_OP_EQ_uxn_device_h_l215_c24_2a36_return_output;
     REG_VAR_device_index := VAR_device_index_MUX_uxn_device_h_l203_c2_3ad3_return_output;
     REG_VAR_device_port := VAR_device_port_MUX_uxn_device_h_l203_c2_3ad3_return_output;
     VAR_result_MUX_uxn_device_h_l211_c7_ca73_iffalse := VAR_emu_deo_uxn_device_h_l218_c12_ec19_return_output;
     -- MUX[uxn_device_h_l215_c24_2e7d] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l215_c24_2e7d_cond <= VAR_MUX_uxn_device_h_l215_c24_2e7d_cond;
     MUX_uxn_device_h_l215_c24_2e7d_iftrue <= VAR_MUX_uxn_device_h_l215_c24_2e7d_iftrue;
     MUX_uxn_device_h_l215_c24_2e7d_iffalse <= VAR_MUX_uxn_device_h_l215_c24_2e7d_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l215_c24_2e7d_return_output := MUX_uxn_device_h_l215_c24_2e7d_return_output;

     -- MUX[uxn_device_h_l209_c24_becc] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l209_c24_becc_cond <= VAR_MUX_uxn_device_h_l209_c24_becc_cond;
     MUX_uxn_device_h_l209_c24_becc_iftrue <= VAR_MUX_uxn_device_h_l209_c24_becc_iftrue;
     MUX_uxn_device_h_l209_c24_becc_iffalse <= VAR_MUX_uxn_device_h_l209_c24_becc_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l209_c24_becc_return_output := MUX_uxn_device_h_l209_c24_becc_return_output;

     -- Submodule level 5
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_3666[uxn_device_h_l203_c2_3ad3] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_3666_uxn_device_h_l203_c2_3ad3_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_3666(
     result,
     to_unsigned(1, 1),
     VAR_device_address,
     VAR_value,
     VAR_MUX_uxn_device_h_l209_c24_becc_return_output);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cf24[uxn_device_h_l211_c7_ca73] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cf24_uxn_device_h_l211_c7_ca73_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_cf24(
     result,
     to_unsigned(0, 1),
     VAR_MUX_uxn_device_h_l215_c24_2e7d_return_output);

     -- Submodule level 6
     VAR_result_MUX_uxn_device_h_l203_c2_3ad3_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_3666_uxn_device_h_l203_c2_3ad3_return_output;
     VAR_result_MUX_uxn_device_h_l211_c7_ca73_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cf24_uxn_device_h_l211_c7_ca73_return_output;
     -- result_MUX[uxn_device_h_l211_c7_ca73] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l211_c7_ca73_cond <= VAR_result_MUX_uxn_device_h_l211_c7_ca73_cond;
     result_MUX_uxn_device_h_l211_c7_ca73_iftrue <= VAR_result_MUX_uxn_device_h_l211_c7_ca73_iftrue;
     result_MUX_uxn_device_h_l211_c7_ca73_iffalse <= VAR_result_MUX_uxn_device_h_l211_c7_ca73_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l211_c7_ca73_return_output := result_MUX_uxn_device_h_l211_c7_ca73_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_device_h_l203_c2_3ad3_iffalse := VAR_result_MUX_uxn_device_h_l211_c7_ca73_return_output;
     -- result_MUX[uxn_device_h_l203_c2_3ad3] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l203_c2_3ad3_cond <= VAR_result_MUX_uxn_device_h_l203_c2_3ad3_cond;
     result_MUX_uxn_device_h_l203_c2_3ad3_iftrue <= VAR_result_MUX_uxn_device_h_l203_c2_3ad3_iftrue;
     result_MUX_uxn_device_h_l203_c2_3ad3_iffalse <= VAR_result_MUX_uxn_device_h_l203_c2_3ad3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l203_c2_3ad3_return_output := result_MUX_uxn_device_h_l203_c2_3ad3_return_output;

     -- Submodule level 8
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l203_c2_3ad3_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l203_c2_3ad3_return_output;
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
