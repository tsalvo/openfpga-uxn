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
entity device_out_0CLK_b285e9e3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 value : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end device_out_0CLK_b285e9e3;
architecture arch of device_out_0CLK_b285e9e3 is
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
-- BIN_OP_EQ[uxn_device_h_l216_c6_112f]
signal BIN_OP_EQ_uxn_device_h_l216_c6_112f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l216_c6_112f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l216_c6_112f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l224_c7_f628]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l224_c7_f628_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l224_c7_f628_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l224_c7_f628_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l224_c7_f628_return_output : unsigned(0 downto 0);

-- device_port_MUX[uxn_device_h_l216_c2_07e3]
signal device_port_MUX_uxn_device_h_l216_c2_07e3_cond : unsigned(0 downto 0);
signal device_port_MUX_uxn_device_h_l216_c2_07e3_iftrue : unsigned(3 downto 0);
signal device_port_MUX_uxn_device_h_l216_c2_07e3_iffalse : unsigned(3 downto 0);
signal device_port_MUX_uxn_device_h_l216_c2_07e3_return_output : unsigned(3 downto 0);

-- device_index_MUX[uxn_device_h_l216_c2_07e3]
signal device_index_MUX_uxn_device_h_l216_c2_07e3_cond : unsigned(0 downto 0);
signal device_index_MUX_uxn_device_h_l216_c2_07e3_iftrue : unsigned(3 downto 0);
signal device_index_MUX_uxn_device_h_l216_c2_07e3_iffalse : unsigned(3 downto 0);
signal device_index_MUX_uxn_device_h_l216_c2_07e3_return_output : unsigned(3 downto 0);

-- result_MUX[uxn_device_h_l216_c2_07e3]
signal result_MUX_uxn_device_h_l216_c2_07e3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l216_c2_07e3_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l216_c2_07e3_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l216_c2_07e3_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_device_h_l220_c27_a83e]
signal BIN_OP_AND_uxn_device_h_l220_c27_a83e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l220_c27_a83e_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l220_c27_a83e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l222_c24_7202]
signal BIN_OP_EQ_uxn_device_h_l222_c24_7202_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_device_h_l222_c24_7202_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l222_c24_7202_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l222_c24_85ce]
signal MUX_uxn_device_h_l222_c24_85ce_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l222_c24_85ce_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l222_c24_85ce_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l222_c24_85ce_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l224_c11_a557]
signal BIN_OP_EQ_uxn_device_h_l224_c11_a557_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l224_c11_a557_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l224_c11_a557_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l230_c1_9ae8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9ae8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9ae8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9ae8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9ae8_return_output : unsigned(0 downto 0);

-- device_port_MUX[uxn_device_h_l224_c7_f628]
signal device_port_MUX_uxn_device_h_l224_c7_f628_cond : unsigned(0 downto 0);
signal device_port_MUX_uxn_device_h_l224_c7_f628_iftrue : unsigned(3 downto 0);
signal device_port_MUX_uxn_device_h_l224_c7_f628_iffalse : unsigned(3 downto 0);
signal device_port_MUX_uxn_device_h_l224_c7_f628_return_output : unsigned(3 downto 0);

-- device_index_MUX[uxn_device_h_l224_c7_f628]
signal device_index_MUX_uxn_device_h_l224_c7_f628_cond : unsigned(0 downto 0);
signal device_index_MUX_uxn_device_h_l224_c7_f628_iftrue : unsigned(3 downto 0);
signal device_index_MUX_uxn_device_h_l224_c7_f628_iffalse : unsigned(3 downto 0);
signal device_index_MUX_uxn_device_h_l224_c7_f628_return_output : unsigned(3 downto 0);

-- result_MUX[uxn_device_h_l224_c7_f628]
signal result_MUX_uxn_device_h_l224_c7_f628_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l224_c7_f628_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l224_c7_f628_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l224_c7_f628_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_device_h_l226_c27_15fa]
signal BIN_OP_AND_uxn_device_h_l226_c27_15fa_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l226_c27_15fa_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l226_c27_15fa_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l228_c24_b465]
signal BIN_OP_EQ_uxn_device_h_l228_c24_b465_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_device_h_l228_c24_b465_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l228_c24_b465_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l228_c24_e033]
signal MUX_uxn_device_h_l228_c24_e033_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l228_c24_e033_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l228_c24_e033_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l228_c24_e033_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l231_c47_db24]
signal BIN_OP_MINUS_uxn_device_h_l231_c47_db24_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l231_c47_db24_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l231_c47_db24_return_output : unsigned(7 downto 0);

-- emu_deo[uxn_device_h_l231_c12_3135]
signal emu_deo_uxn_device_h_l231_c12_3135_CLOCK_ENABLE : unsigned(0 downto 0);
signal emu_deo_uxn_device_h_l231_c12_3135_device_index : unsigned(3 downto 0);
signal emu_deo_uxn_device_h_l231_c12_3135_device_port : unsigned(3 downto 0);
signal emu_deo_uxn_device_h_l231_c12_3135_phase : unsigned(7 downto 0);
signal emu_deo_uxn_device_h_l231_c12_3135_previous_device_ram_read : unsigned(7 downto 0);
signal emu_deo_uxn_device_h_l231_c12_3135_return_output : device_out_result_t;

-- CONST_SR_4_uint8_t_uxn_device_h_l221_l227_DUPLICATE_ecf4
signal CONST_SR_4_uint8_t_uxn_device_h_l221_l227_DUPLICATE_ecf4_x : unsigned(7 downto 0);
signal CONST_SR_4_uint8_t_uxn_device_h_l221_l227_DUPLICATE_ecf4_return_output : unsigned(7 downto 0);

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l228_l222_DUPLICATE_498a
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l228_l222_DUPLICATE_498a_ref_toks_0 : uint16_t_16;
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l228_l222_DUPLICATE_498a_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l228_l222_DUPLICATE_498a_return_output : unsigned(15 downto 0);

function CAST_TO_uint4_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
    return return_output;
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_eaf4( ref_toks_0 : device_out_result_t;
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
      base.u8_value := ref_toks_3;
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
-- BIN_OP_EQ_uxn_device_h_l216_c6_112f
BIN_OP_EQ_uxn_device_h_l216_c6_112f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l216_c6_112f_left,
BIN_OP_EQ_uxn_device_h_l216_c6_112f_right,
BIN_OP_EQ_uxn_device_h_l216_c6_112f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l224_c7_f628
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l224_c7_f628 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l224_c7_f628_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l224_c7_f628_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l224_c7_f628_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l224_c7_f628_return_output);

-- device_port_MUX_uxn_device_h_l216_c2_07e3
device_port_MUX_uxn_device_h_l216_c2_07e3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
device_port_MUX_uxn_device_h_l216_c2_07e3_cond,
device_port_MUX_uxn_device_h_l216_c2_07e3_iftrue,
device_port_MUX_uxn_device_h_l216_c2_07e3_iffalse,
device_port_MUX_uxn_device_h_l216_c2_07e3_return_output);

-- device_index_MUX_uxn_device_h_l216_c2_07e3
device_index_MUX_uxn_device_h_l216_c2_07e3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
device_index_MUX_uxn_device_h_l216_c2_07e3_cond,
device_index_MUX_uxn_device_h_l216_c2_07e3_iftrue,
device_index_MUX_uxn_device_h_l216_c2_07e3_iffalse,
device_index_MUX_uxn_device_h_l216_c2_07e3_return_output);

-- result_MUX_uxn_device_h_l216_c2_07e3
result_MUX_uxn_device_h_l216_c2_07e3 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l216_c2_07e3_cond,
result_MUX_uxn_device_h_l216_c2_07e3_iftrue,
result_MUX_uxn_device_h_l216_c2_07e3_iffalse,
result_MUX_uxn_device_h_l216_c2_07e3_return_output);

-- BIN_OP_AND_uxn_device_h_l220_c27_a83e
BIN_OP_AND_uxn_device_h_l220_c27_a83e : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l220_c27_a83e_left,
BIN_OP_AND_uxn_device_h_l220_c27_a83e_right,
BIN_OP_AND_uxn_device_h_l220_c27_a83e_return_output);

-- BIN_OP_EQ_uxn_device_h_l222_c24_7202
BIN_OP_EQ_uxn_device_h_l222_c24_7202 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l222_c24_7202_left,
BIN_OP_EQ_uxn_device_h_l222_c24_7202_right,
BIN_OP_EQ_uxn_device_h_l222_c24_7202_return_output);

-- MUX_uxn_device_h_l222_c24_85ce
MUX_uxn_device_h_l222_c24_85ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l222_c24_85ce_cond,
MUX_uxn_device_h_l222_c24_85ce_iftrue,
MUX_uxn_device_h_l222_c24_85ce_iffalse,
MUX_uxn_device_h_l222_c24_85ce_return_output);

-- BIN_OP_EQ_uxn_device_h_l224_c11_a557
BIN_OP_EQ_uxn_device_h_l224_c11_a557 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l224_c11_a557_left,
BIN_OP_EQ_uxn_device_h_l224_c11_a557_right,
BIN_OP_EQ_uxn_device_h_l224_c11_a557_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9ae8
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9ae8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9ae8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9ae8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9ae8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9ae8_return_output);

-- device_port_MUX_uxn_device_h_l224_c7_f628
device_port_MUX_uxn_device_h_l224_c7_f628 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
device_port_MUX_uxn_device_h_l224_c7_f628_cond,
device_port_MUX_uxn_device_h_l224_c7_f628_iftrue,
device_port_MUX_uxn_device_h_l224_c7_f628_iffalse,
device_port_MUX_uxn_device_h_l224_c7_f628_return_output);

-- device_index_MUX_uxn_device_h_l224_c7_f628
device_index_MUX_uxn_device_h_l224_c7_f628 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
device_index_MUX_uxn_device_h_l224_c7_f628_cond,
device_index_MUX_uxn_device_h_l224_c7_f628_iftrue,
device_index_MUX_uxn_device_h_l224_c7_f628_iffalse,
device_index_MUX_uxn_device_h_l224_c7_f628_return_output);

-- result_MUX_uxn_device_h_l224_c7_f628
result_MUX_uxn_device_h_l224_c7_f628 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l224_c7_f628_cond,
result_MUX_uxn_device_h_l224_c7_f628_iftrue,
result_MUX_uxn_device_h_l224_c7_f628_iffalse,
result_MUX_uxn_device_h_l224_c7_f628_return_output);

-- BIN_OP_AND_uxn_device_h_l226_c27_15fa
BIN_OP_AND_uxn_device_h_l226_c27_15fa : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l226_c27_15fa_left,
BIN_OP_AND_uxn_device_h_l226_c27_15fa_right,
BIN_OP_AND_uxn_device_h_l226_c27_15fa_return_output);

-- BIN_OP_EQ_uxn_device_h_l228_c24_b465
BIN_OP_EQ_uxn_device_h_l228_c24_b465 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l228_c24_b465_left,
BIN_OP_EQ_uxn_device_h_l228_c24_b465_right,
BIN_OP_EQ_uxn_device_h_l228_c24_b465_return_output);

-- MUX_uxn_device_h_l228_c24_e033
MUX_uxn_device_h_l228_c24_e033 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l228_c24_e033_cond,
MUX_uxn_device_h_l228_c24_e033_iftrue,
MUX_uxn_device_h_l228_c24_e033_iffalse,
MUX_uxn_device_h_l228_c24_e033_return_output);

-- BIN_OP_MINUS_uxn_device_h_l231_c47_db24
BIN_OP_MINUS_uxn_device_h_l231_c47_db24 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l231_c47_db24_left,
BIN_OP_MINUS_uxn_device_h_l231_c47_db24_right,
BIN_OP_MINUS_uxn_device_h_l231_c47_db24_return_output);

-- emu_deo_uxn_device_h_l231_c12_3135
emu_deo_uxn_device_h_l231_c12_3135 : entity work.emu_deo_0CLK_b0b1169a port map (
clk,
emu_deo_uxn_device_h_l231_c12_3135_CLOCK_ENABLE,
emu_deo_uxn_device_h_l231_c12_3135_device_index,
emu_deo_uxn_device_h_l231_c12_3135_device_port,
emu_deo_uxn_device_h_l231_c12_3135_phase,
emu_deo_uxn_device_h_l231_c12_3135_previous_device_ram_read,
emu_deo_uxn_device_h_l231_c12_3135_return_output);

-- CONST_SR_4_uint8_t_uxn_device_h_l221_l227_DUPLICATE_ecf4
CONST_SR_4_uint8_t_uxn_device_h_l221_l227_DUPLICATE_ecf4 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uint8_t_uxn_device_h_l221_l227_DUPLICATE_ecf4_x,
CONST_SR_4_uint8_t_uxn_device_h_l221_l227_DUPLICATE_ecf4_return_output);

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l228_l222_DUPLICATE_498a
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l228_l222_DUPLICATE_498a : entity work.VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_0CLK_763c90e8 port map (
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l228_l222_DUPLICATE_498a_ref_toks_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l228_l222_DUPLICATE_498a_var_dim_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l228_l222_DUPLICATE_498a_return_output);



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
 BIN_OP_EQ_uxn_device_h_l216_c6_112f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l224_c7_f628_return_output,
 device_port_MUX_uxn_device_h_l216_c2_07e3_return_output,
 device_index_MUX_uxn_device_h_l216_c2_07e3_return_output,
 result_MUX_uxn_device_h_l216_c2_07e3_return_output,
 BIN_OP_AND_uxn_device_h_l220_c27_a83e_return_output,
 BIN_OP_EQ_uxn_device_h_l222_c24_7202_return_output,
 MUX_uxn_device_h_l222_c24_85ce_return_output,
 BIN_OP_EQ_uxn_device_h_l224_c11_a557_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9ae8_return_output,
 device_port_MUX_uxn_device_h_l224_c7_f628_return_output,
 device_index_MUX_uxn_device_h_l224_c7_f628_return_output,
 result_MUX_uxn_device_h_l224_c7_f628_return_output,
 BIN_OP_AND_uxn_device_h_l226_c27_15fa_return_output,
 BIN_OP_EQ_uxn_device_h_l228_c24_b465_return_output,
 MUX_uxn_device_h_l228_c24_e033_return_output,
 BIN_OP_MINUS_uxn_device_h_l231_c47_db24_return_output,
 emu_deo_uxn_device_h_l231_c12_3135_return_output,
 CONST_SR_4_uint8_t_uxn_device_h_l221_l227_DUPLICATE_ecf4_return_output,
 VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l228_l222_DUPLICATE_498a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_value : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l216_c6_112f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l216_c6_112f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l216_c6_112f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l224_c7_f628_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l224_c7_f628_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l224_c7_f628_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l224_c7_f628_iffalse : unsigned(0 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l216_c2_07e3_iftrue : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l216_c2_07e3_iffalse : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l224_c7_f628_return_output : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l216_c2_07e3_return_output : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l216_c2_07e3_cond : unsigned(0 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l216_c2_07e3_iftrue : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l216_c2_07e3_iffalse : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l224_c7_f628_return_output : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l216_c2_07e3_return_output : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l216_c2_07e3_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l216_c2_07e3_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_eaf4_uxn_device_h_l216_c2_07e3_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l216_c2_07e3_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l224_c7_f628_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l216_c2_07e3_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l216_c2_07e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l220_c27_a83e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l220_c27_a83e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l220_c27_a83e_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l220_c17_802f_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_device_h_l222_c24_85ce_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l222_c24_85ce_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l222_c24_85ce_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l222_c24_7202_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l222_c24_7202_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l222_c24_7202_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l222_c24_85ce_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l224_c11_a557_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l224_c11_a557_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l224_c11_a557_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9ae8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9ae8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9ae8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9ae8_iffalse : unsigned(0 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l224_c7_f628_iftrue : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l224_c7_f628_iffalse : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l224_c7_f628_cond : unsigned(0 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l224_c7_f628_iftrue : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l224_c7_f628_iffalse : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l224_c7_f628_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l224_c7_f628_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cf24_uxn_device_h_l224_c7_f628_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l224_c7_f628_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l224_c7_f628_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l226_c27_15fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l226_c27_15fa_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l226_c27_15fa_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l226_c17_3b4e_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_device_h_l228_c24_e033_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l228_c24_e033_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l228_c24_e033_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l228_c24_b465_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l228_c24_b465_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l228_c24_b465_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l228_c24_e033_return_output : unsigned(0 downto 0);
 variable VAR_emu_deo_uxn_device_h_l231_c12_3135_device_index : unsigned(3 downto 0);
 variable VAR_emu_deo_uxn_device_h_l231_c12_3135_device_port : unsigned(3 downto 0);
 variable VAR_emu_deo_uxn_device_h_l231_c12_3135_phase : unsigned(7 downto 0);
 variable VAR_emu_deo_uxn_device_h_l231_c12_3135_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l231_c47_db24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l231_c47_db24_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l231_c47_db24_return_output : unsigned(7 downto 0);
 variable VAR_emu_deo_uxn_device_h_l231_c12_3135_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_emu_deo_uxn_device_h_l231_c12_3135_return_output : device_out_result_t;
 variable VAR_CONST_SR_4_uint8_t_uxn_device_h_l221_l227_DUPLICATE_ecf4_x : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uint8_t_uxn_device_h_l221_l227_DUPLICATE_ecf4_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l227_l221_DUPLICATE_0943_return_output : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l228_l222_DUPLICATE_498a_ref_toks_0 : uint16_t_16;
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l228_l222_DUPLICATE_498a_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l228_l222_DUPLICATE_498a_return_output : unsigned(15 downto 0);
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
     VAR_MUX_uxn_device_h_l228_c24_e033_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l226_c27_15fa_right := to_unsigned(15, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9ae8_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l222_c24_85ce_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l228_c24_b465_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l216_c6_112f_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l222_c24_85ce_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l231_c47_db24_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l224_c11_a557_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l228_c24_e033_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l222_c24_7202_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l224_c7_f628_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l220_c27_a83e_right := to_unsigned(15, 4);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l224_c7_f628_iffalse := VAR_CLOCK_ENABLE;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l228_l222_DUPLICATE_498a_ref_toks_0 := deo_mask;
     REG_VAR_deo_mask := deo_mask;
     VAR_BIN_OP_AND_uxn_device_h_l220_c27_a83e_left := VAR_device_address;
     VAR_BIN_OP_AND_uxn_device_h_l226_c27_15fa_left := VAR_device_address;
     VAR_CONST_SR_4_uint8_t_uxn_device_h_l221_l227_DUPLICATE_ecf4_x := VAR_device_address;
     VAR_device_index_MUX_uxn_device_h_l224_c7_f628_iffalse := device_index;
     VAR_emu_deo_uxn_device_h_l231_c12_3135_device_index := device_index;
     VAR_device_port_MUX_uxn_device_h_l224_c7_f628_iffalse := device_port;
     VAR_emu_deo_uxn_device_h_l231_c12_3135_device_port := device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l216_c6_112f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l224_c11_a557_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l231_c47_db24_left := VAR_phase;
     VAR_emu_deo_uxn_device_h_l231_c12_3135_previous_device_ram_read := VAR_previous_device_ram_read;
     -- BIN_OP_AND[uxn_device_h_l220_c27_a83e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l220_c27_a83e_left <= VAR_BIN_OP_AND_uxn_device_h_l220_c27_a83e_left;
     BIN_OP_AND_uxn_device_h_l220_c27_a83e_right <= VAR_BIN_OP_AND_uxn_device_h_l220_c27_a83e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l220_c27_a83e_return_output := BIN_OP_AND_uxn_device_h_l220_c27_a83e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l224_c11_a557] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l224_c11_a557_left <= VAR_BIN_OP_EQ_uxn_device_h_l224_c11_a557_left;
     BIN_OP_EQ_uxn_device_h_l224_c11_a557_right <= VAR_BIN_OP_EQ_uxn_device_h_l224_c11_a557_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l224_c11_a557_return_output := BIN_OP_EQ_uxn_device_h_l224_c11_a557_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l231_c47_db24] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l231_c47_db24_left <= VAR_BIN_OP_MINUS_uxn_device_h_l231_c47_db24_left;
     BIN_OP_MINUS_uxn_device_h_l231_c47_db24_right <= VAR_BIN_OP_MINUS_uxn_device_h_l231_c47_db24_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l231_c47_db24_return_output := BIN_OP_MINUS_uxn_device_h_l231_c47_db24_return_output;

     -- BIN_OP_AND[uxn_device_h_l226_c27_15fa] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l226_c27_15fa_left <= VAR_BIN_OP_AND_uxn_device_h_l226_c27_15fa_left;
     BIN_OP_AND_uxn_device_h_l226_c27_15fa_right <= VAR_BIN_OP_AND_uxn_device_h_l226_c27_15fa_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l226_c27_15fa_return_output := BIN_OP_AND_uxn_device_h_l226_c27_15fa_return_output;

     -- CONST_SR_4_uint8_t_uxn_device_h_l221_l227_DUPLICATE_ecf4 LATENCY=0
     -- Inputs
     CONST_SR_4_uint8_t_uxn_device_h_l221_l227_DUPLICATE_ecf4_x <= VAR_CONST_SR_4_uint8_t_uxn_device_h_l221_l227_DUPLICATE_ecf4_x;
     -- Outputs
     VAR_CONST_SR_4_uint8_t_uxn_device_h_l221_l227_DUPLICATE_ecf4_return_output := CONST_SR_4_uint8_t_uxn_device_h_l221_l227_DUPLICATE_ecf4_return_output;

     -- BIN_OP_EQ[uxn_device_h_l216_c6_112f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l216_c6_112f_left <= VAR_BIN_OP_EQ_uxn_device_h_l216_c6_112f_left;
     BIN_OP_EQ_uxn_device_h_l216_c6_112f_right <= VAR_BIN_OP_EQ_uxn_device_h_l216_c6_112f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l216_c6_112f_return_output := BIN_OP_EQ_uxn_device_h_l216_c6_112f_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l224_c7_f628_cond := VAR_BIN_OP_EQ_uxn_device_h_l216_c6_112f_return_output;
     VAR_device_index_MUX_uxn_device_h_l216_c2_07e3_cond := VAR_BIN_OP_EQ_uxn_device_h_l216_c6_112f_return_output;
     VAR_device_port_MUX_uxn_device_h_l216_c2_07e3_cond := VAR_BIN_OP_EQ_uxn_device_h_l216_c6_112f_return_output;
     VAR_result_MUX_uxn_device_h_l216_c2_07e3_cond := VAR_BIN_OP_EQ_uxn_device_h_l216_c6_112f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9ae8_cond := VAR_BIN_OP_EQ_uxn_device_h_l224_c11_a557_return_output;
     VAR_device_index_MUX_uxn_device_h_l224_c7_f628_cond := VAR_BIN_OP_EQ_uxn_device_h_l224_c11_a557_return_output;
     VAR_device_port_MUX_uxn_device_h_l224_c7_f628_cond := VAR_BIN_OP_EQ_uxn_device_h_l224_c11_a557_return_output;
     VAR_result_MUX_uxn_device_h_l224_c7_f628_cond := VAR_BIN_OP_EQ_uxn_device_h_l224_c11_a557_return_output;
     VAR_emu_deo_uxn_device_h_l231_c12_3135_phase := VAR_BIN_OP_MINUS_uxn_device_h_l231_c47_db24_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l224_c7_f628] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l224_c7_f628_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l224_c7_f628_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l224_c7_f628_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l224_c7_f628_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l224_c7_f628_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l224_c7_f628_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l224_c7_f628_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l224_c7_f628_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l220_c17_802f] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l220_c17_802f_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_BIN_OP_AND_uxn_device_h_l220_c27_a83e_return_output);

     -- CAST_TO_uint4_t_uint8_t_uxn_device_h_l227_l221_DUPLICATE_0943 LATENCY=0
     VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l227_l221_DUPLICATE_0943_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uint8_t_uxn_device_h_l221_l227_DUPLICATE_ecf4_return_output);

     -- CAST_TO_uint4_t[uxn_device_h_l226_c17_3b4e] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l226_c17_3b4e_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_BIN_OP_AND_uxn_device_h_l226_c27_15fa_return_output);

     -- Submodule level 2
     VAR_device_port_MUX_uxn_device_h_l216_c2_07e3_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l220_c17_802f_return_output;
     VAR_device_port_MUX_uxn_device_h_l224_c7_f628_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l226_c17_3b4e_return_output;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l228_l222_DUPLICATE_498a_var_dim_0 := VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l227_l221_DUPLICATE_0943_return_output;
     VAR_device_index_MUX_uxn_device_h_l216_c2_07e3_iftrue := VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l227_l221_DUPLICATE_0943_return_output;
     VAR_device_index_MUX_uxn_device_h_l224_c7_f628_iftrue := VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l227_l221_DUPLICATE_0943_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9ae8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l224_c7_f628_return_output;
     -- device_index_MUX[uxn_device_h_l224_c7_f628] LATENCY=0
     -- Inputs
     device_index_MUX_uxn_device_h_l224_c7_f628_cond <= VAR_device_index_MUX_uxn_device_h_l224_c7_f628_cond;
     device_index_MUX_uxn_device_h_l224_c7_f628_iftrue <= VAR_device_index_MUX_uxn_device_h_l224_c7_f628_iftrue;
     device_index_MUX_uxn_device_h_l224_c7_f628_iffalse <= VAR_device_index_MUX_uxn_device_h_l224_c7_f628_iffalse;
     -- Outputs
     VAR_device_index_MUX_uxn_device_h_l224_c7_f628_return_output := device_index_MUX_uxn_device_h_l224_c7_f628_return_output;

     -- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l228_l222_DUPLICATE_498a LATENCY=0
     -- Inputs
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l228_l222_DUPLICATE_498a_ref_toks_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l228_l222_DUPLICATE_498a_ref_toks_0;
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l228_l222_DUPLICATE_498a_var_dim_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l228_l222_DUPLICATE_498a_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l228_l222_DUPLICATE_498a_return_output := VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l228_l222_DUPLICATE_498a_return_output;

     -- device_port_MUX[uxn_device_h_l224_c7_f628] LATENCY=0
     -- Inputs
     device_port_MUX_uxn_device_h_l224_c7_f628_cond <= VAR_device_port_MUX_uxn_device_h_l224_c7_f628_cond;
     device_port_MUX_uxn_device_h_l224_c7_f628_iftrue <= VAR_device_port_MUX_uxn_device_h_l224_c7_f628_iftrue;
     device_port_MUX_uxn_device_h_l224_c7_f628_iffalse <= VAR_device_port_MUX_uxn_device_h_l224_c7_f628_iffalse;
     -- Outputs
     VAR_device_port_MUX_uxn_device_h_l224_c7_f628_return_output := device_port_MUX_uxn_device_h_l224_c7_f628_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l230_c1_9ae8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9ae8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9ae8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9ae8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9ae8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9ae8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9ae8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9ae8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9ae8_return_output;

     -- Submodule level 3
     VAR_emu_deo_uxn_device_h_l231_c12_3135_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9ae8_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l222_c24_7202_left := VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l228_l222_DUPLICATE_498a_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l228_c24_b465_left := VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l228_l222_DUPLICATE_498a_return_output;
     VAR_device_index_MUX_uxn_device_h_l216_c2_07e3_iffalse := VAR_device_index_MUX_uxn_device_h_l224_c7_f628_return_output;
     VAR_device_port_MUX_uxn_device_h_l216_c2_07e3_iffalse := VAR_device_port_MUX_uxn_device_h_l224_c7_f628_return_output;
     -- device_port_MUX[uxn_device_h_l216_c2_07e3] LATENCY=0
     -- Inputs
     device_port_MUX_uxn_device_h_l216_c2_07e3_cond <= VAR_device_port_MUX_uxn_device_h_l216_c2_07e3_cond;
     device_port_MUX_uxn_device_h_l216_c2_07e3_iftrue <= VAR_device_port_MUX_uxn_device_h_l216_c2_07e3_iftrue;
     device_port_MUX_uxn_device_h_l216_c2_07e3_iffalse <= VAR_device_port_MUX_uxn_device_h_l216_c2_07e3_iffalse;
     -- Outputs
     VAR_device_port_MUX_uxn_device_h_l216_c2_07e3_return_output := device_port_MUX_uxn_device_h_l216_c2_07e3_return_output;

     -- device_index_MUX[uxn_device_h_l216_c2_07e3] LATENCY=0
     -- Inputs
     device_index_MUX_uxn_device_h_l216_c2_07e3_cond <= VAR_device_index_MUX_uxn_device_h_l216_c2_07e3_cond;
     device_index_MUX_uxn_device_h_l216_c2_07e3_iftrue <= VAR_device_index_MUX_uxn_device_h_l216_c2_07e3_iftrue;
     device_index_MUX_uxn_device_h_l216_c2_07e3_iffalse <= VAR_device_index_MUX_uxn_device_h_l216_c2_07e3_iffalse;
     -- Outputs
     VAR_device_index_MUX_uxn_device_h_l216_c2_07e3_return_output := device_index_MUX_uxn_device_h_l216_c2_07e3_return_output;

     -- BIN_OP_EQ[uxn_device_h_l222_c24_7202] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l222_c24_7202_left <= VAR_BIN_OP_EQ_uxn_device_h_l222_c24_7202_left;
     BIN_OP_EQ_uxn_device_h_l222_c24_7202_right <= VAR_BIN_OP_EQ_uxn_device_h_l222_c24_7202_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l222_c24_7202_return_output := BIN_OP_EQ_uxn_device_h_l222_c24_7202_return_output;

     -- emu_deo[uxn_device_h_l231_c12_3135] LATENCY=0
     -- Clock enable
     emu_deo_uxn_device_h_l231_c12_3135_CLOCK_ENABLE <= VAR_emu_deo_uxn_device_h_l231_c12_3135_CLOCK_ENABLE;
     -- Inputs
     emu_deo_uxn_device_h_l231_c12_3135_device_index <= VAR_emu_deo_uxn_device_h_l231_c12_3135_device_index;
     emu_deo_uxn_device_h_l231_c12_3135_device_port <= VAR_emu_deo_uxn_device_h_l231_c12_3135_device_port;
     emu_deo_uxn_device_h_l231_c12_3135_phase <= VAR_emu_deo_uxn_device_h_l231_c12_3135_phase;
     emu_deo_uxn_device_h_l231_c12_3135_previous_device_ram_read <= VAR_emu_deo_uxn_device_h_l231_c12_3135_previous_device_ram_read;
     -- Outputs
     VAR_emu_deo_uxn_device_h_l231_c12_3135_return_output := emu_deo_uxn_device_h_l231_c12_3135_return_output;

     -- BIN_OP_EQ[uxn_device_h_l228_c24_b465] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l228_c24_b465_left <= VAR_BIN_OP_EQ_uxn_device_h_l228_c24_b465_left;
     BIN_OP_EQ_uxn_device_h_l228_c24_b465_right <= VAR_BIN_OP_EQ_uxn_device_h_l228_c24_b465_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l228_c24_b465_return_output := BIN_OP_EQ_uxn_device_h_l228_c24_b465_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l222_c24_85ce_cond := VAR_BIN_OP_EQ_uxn_device_h_l222_c24_7202_return_output;
     VAR_MUX_uxn_device_h_l228_c24_e033_cond := VAR_BIN_OP_EQ_uxn_device_h_l228_c24_b465_return_output;
     REG_VAR_device_index := VAR_device_index_MUX_uxn_device_h_l216_c2_07e3_return_output;
     REG_VAR_device_port := VAR_device_port_MUX_uxn_device_h_l216_c2_07e3_return_output;
     VAR_result_MUX_uxn_device_h_l224_c7_f628_iffalse := VAR_emu_deo_uxn_device_h_l231_c12_3135_return_output;
     -- MUX[uxn_device_h_l228_c24_e033] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l228_c24_e033_cond <= VAR_MUX_uxn_device_h_l228_c24_e033_cond;
     MUX_uxn_device_h_l228_c24_e033_iftrue <= VAR_MUX_uxn_device_h_l228_c24_e033_iftrue;
     MUX_uxn_device_h_l228_c24_e033_iffalse <= VAR_MUX_uxn_device_h_l228_c24_e033_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l228_c24_e033_return_output := MUX_uxn_device_h_l228_c24_e033_return_output;

     -- MUX[uxn_device_h_l222_c24_85ce] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l222_c24_85ce_cond <= VAR_MUX_uxn_device_h_l222_c24_85ce_cond;
     MUX_uxn_device_h_l222_c24_85ce_iftrue <= VAR_MUX_uxn_device_h_l222_c24_85ce_iftrue;
     MUX_uxn_device_h_l222_c24_85ce_iffalse <= VAR_MUX_uxn_device_h_l222_c24_85ce_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l222_c24_85ce_return_output := MUX_uxn_device_h_l222_c24_85ce_return_output;

     -- Submodule level 5
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_eaf4[uxn_device_h_l216_c2_07e3] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_eaf4_uxn_device_h_l216_c2_07e3_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_eaf4(
     result,
     to_unsigned(1, 1),
     VAR_device_address,
     VAR_value,
     VAR_MUX_uxn_device_h_l222_c24_85ce_return_output);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cf24[uxn_device_h_l224_c7_f628] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cf24_uxn_device_h_l224_c7_f628_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_cf24(
     result,
     to_unsigned(0, 1),
     VAR_MUX_uxn_device_h_l228_c24_e033_return_output);

     -- Submodule level 6
     VAR_result_MUX_uxn_device_h_l224_c7_f628_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cf24_uxn_device_h_l224_c7_f628_return_output;
     VAR_result_MUX_uxn_device_h_l216_c2_07e3_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_eaf4_uxn_device_h_l216_c2_07e3_return_output;
     -- result_MUX[uxn_device_h_l224_c7_f628] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l224_c7_f628_cond <= VAR_result_MUX_uxn_device_h_l224_c7_f628_cond;
     result_MUX_uxn_device_h_l224_c7_f628_iftrue <= VAR_result_MUX_uxn_device_h_l224_c7_f628_iftrue;
     result_MUX_uxn_device_h_l224_c7_f628_iffalse <= VAR_result_MUX_uxn_device_h_l224_c7_f628_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l224_c7_f628_return_output := result_MUX_uxn_device_h_l224_c7_f628_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_device_h_l216_c2_07e3_iffalse := VAR_result_MUX_uxn_device_h_l224_c7_f628_return_output;
     -- result_MUX[uxn_device_h_l216_c2_07e3] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l216_c2_07e3_cond <= VAR_result_MUX_uxn_device_h_l216_c2_07e3_cond;
     result_MUX_uxn_device_h_l216_c2_07e3_iftrue <= VAR_result_MUX_uxn_device_h_l216_c2_07e3_iftrue;
     result_MUX_uxn_device_h_l216_c2_07e3_iffalse <= VAR_result_MUX_uxn_device_h_l216_c2_07e3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l216_c2_07e3_return_output := result_MUX_uxn_device_h_l216_c2_07e3_return_output;

     -- Submodule level 8
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l216_c2_07e3_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l216_c2_07e3_return_output;
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
