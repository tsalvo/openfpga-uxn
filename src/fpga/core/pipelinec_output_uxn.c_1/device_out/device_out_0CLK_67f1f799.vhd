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
entity device_out_0CLK_67f1f799 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 value : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end device_out_0CLK_67f1f799;
architecture arch of device_out_0CLK_67f1f799 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : device_out_result_t := (
is_device_ram_write => to_unsigned(0, 1),
is_device_ram_read => to_unsigned(0, 1),
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
-- printf_uxn_device_h_l218_c2_36f1[uxn_device_h_l218_c2_36f1]
signal printf_uxn_device_h_l218_c2_36f1_uxn_device_h_l218_c2_36f1_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l218_c2_36f1_uxn_device_h_l218_c2_36f1_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l218_c2_36f1_uxn_device_h_l218_c2_36f1_arg1 : unsigned(31 downto 0);
signal printf_uxn_device_h_l218_c2_36f1_uxn_device_h_l218_c2_36f1_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l220_c6_6841]
signal BIN_OP_EQ_uxn_device_h_l220_c6_6841_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l220_c6_6841_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l220_c6_6841_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l229_c7_2253]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c7_2253_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c7_2253_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c7_2253_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c7_2253_return_output : unsigned(0 downto 0);

-- device_index_MUX[uxn_device_h_l220_c2_e63e]
signal device_index_MUX_uxn_device_h_l220_c2_e63e_cond : unsigned(0 downto 0);
signal device_index_MUX_uxn_device_h_l220_c2_e63e_iftrue : unsigned(3 downto 0);
signal device_index_MUX_uxn_device_h_l220_c2_e63e_iffalse : unsigned(3 downto 0);
signal device_index_MUX_uxn_device_h_l220_c2_e63e_return_output : unsigned(3 downto 0);

-- result_MUX[uxn_device_h_l220_c2_e63e]
signal result_MUX_uxn_device_h_l220_c2_e63e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l220_c2_e63e_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l220_c2_e63e_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l220_c2_e63e_return_output : device_out_result_t;

-- device_port_MUX[uxn_device_h_l220_c2_e63e]
signal device_port_MUX_uxn_device_h_l220_c2_e63e_cond : unsigned(0 downto 0);
signal device_port_MUX_uxn_device_h_l220_c2_e63e_iftrue : unsigned(3 downto 0);
signal device_port_MUX_uxn_device_h_l220_c2_e63e_iffalse : unsigned(3 downto 0);
signal device_port_MUX_uxn_device_h_l220_c2_e63e_return_output : unsigned(3 downto 0);

-- BIN_OP_AND[uxn_device_h_l225_c27_ed14]
signal BIN_OP_AND_uxn_device_h_l225_c27_ed14_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l225_c27_ed14_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l225_c27_ed14_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l227_c24_16fb]
signal BIN_OP_EQ_uxn_device_h_l227_c24_16fb_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_device_h_l227_c24_16fb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l227_c24_16fb_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l227_c24_ce3e]
signal MUX_uxn_device_h_l227_c24_ce3e_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l227_c24_ce3e_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l227_c24_ce3e_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l227_c24_ce3e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l229_c11_0469]
signal BIN_OP_EQ_uxn_device_h_l229_c11_0469_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l229_c11_0469_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l229_c11_0469_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l234_c1_7c5e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l234_c1_7c5e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l234_c1_7c5e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l234_c1_7c5e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l234_c1_7c5e_return_output : unsigned(0 downto 0);

-- device_index_MUX[uxn_device_h_l229_c7_2253]
signal device_index_MUX_uxn_device_h_l229_c7_2253_cond : unsigned(0 downto 0);
signal device_index_MUX_uxn_device_h_l229_c7_2253_iftrue : unsigned(3 downto 0);
signal device_index_MUX_uxn_device_h_l229_c7_2253_iffalse : unsigned(3 downto 0);
signal device_index_MUX_uxn_device_h_l229_c7_2253_return_output : unsigned(3 downto 0);

-- result_MUX[uxn_device_h_l229_c7_2253]
signal result_MUX_uxn_device_h_l229_c7_2253_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l229_c7_2253_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l229_c7_2253_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l229_c7_2253_return_output : device_out_result_t;

-- device_port_MUX[uxn_device_h_l229_c7_2253]
signal device_port_MUX_uxn_device_h_l229_c7_2253_cond : unsigned(0 downto 0);
signal device_port_MUX_uxn_device_h_l229_c7_2253_iftrue : unsigned(3 downto 0);
signal device_port_MUX_uxn_device_h_l229_c7_2253_iffalse : unsigned(3 downto 0);
signal device_port_MUX_uxn_device_h_l229_c7_2253_return_output : unsigned(3 downto 0);

-- BIN_OP_AND[uxn_device_h_l230_c27_681b]
signal BIN_OP_AND_uxn_device_h_l230_c27_681b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l230_c27_681b_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l230_c27_681b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l232_c24_647f]
signal BIN_OP_EQ_uxn_device_h_l232_c24_647f_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_device_h_l232_c24_647f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l232_c24_647f_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l232_c24_1301]
signal MUX_uxn_device_h_l232_c24_1301_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l232_c24_1301_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l232_c24_1301_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l232_c24_1301_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l235_c47_3a53]
signal BIN_OP_MINUS_uxn_device_h_l235_c47_3a53_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l235_c47_3a53_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l235_c47_3a53_return_output : unsigned(7 downto 0);

-- emu_deo[uxn_device_h_l235_c12_9a12]
signal emu_deo_uxn_device_h_l235_c12_9a12_CLOCK_ENABLE : unsigned(0 downto 0);
signal emu_deo_uxn_device_h_l235_c12_9a12_device_index : unsigned(3 downto 0);
signal emu_deo_uxn_device_h_l235_c12_9a12_device_port : unsigned(3 downto 0);
signal emu_deo_uxn_device_h_l235_c12_9a12_phase : unsigned(7 downto 0);
signal emu_deo_uxn_device_h_l235_c12_9a12_previous_device_ram_read : unsigned(7 downto 0);
signal emu_deo_uxn_device_h_l235_c12_9a12_return_output : device_out_result_t;

-- CONST_SR_4_uint8_t_uxn_device_h_l231_l226_DUPLICATE_a8bc
signal CONST_SR_4_uint8_t_uxn_device_h_l231_l226_DUPLICATE_a8bc_x : unsigned(7 downto 0);
signal CONST_SR_4_uint8_t_uxn_device_h_l231_l226_DUPLICATE_a8bc_return_output : unsigned(7 downto 0);

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l227_l232_DUPLICATE_bff3
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l227_l232_DUPLICATE_bff3_ref_toks_0 : uint16_t_16;
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l227_l232_DUPLICATE_bff3_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l227_l232_DUPLICATE_bff3_return_output : unsigned(15 downto 0);

function CAST_TO_uint4_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
    return return_output;
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_4849( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_device_ram_read := ref_toks_1;
      base.is_device_ram_write := ref_toks_2;
      base.device_ram_address := ref_toks_3;
      base.device_ram_value := ref_toks_4;
      base.is_deo_done := ref_toks_5;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_37d8( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_deo_done := ref_toks_1;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- printf_uxn_device_h_l218_c2_36f1_uxn_device_h_l218_c2_36f1
printf_uxn_device_h_l218_c2_36f1_uxn_device_h_l218_c2_36f1 : entity work.printf_uxn_device_h_l218_c2_36f1_0CLK_de264c78 port map (
printf_uxn_device_h_l218_c2_36f1_uxn_device_h_l218_c2_36f1_CLOCK_ENABLE,
printf_uxn_device_h_l218_c2_36f1_uxn_device_h_l218_c2_36f1_arg0,
printf_uxn_device_h_l218_c2_36f1_uxn_device_h_l218_c2_36f1_arg1,
printf_uxn_device_h_l218_c2_36f1_uxn_device_h_l218_c2_36f1_arg2);

-- BIN_OP_EQ_uxn_device_h_l220_c6_6841
BIN_OP_EQ_uxn_device_h_l220_c6_6841 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l220_c6_6841_left,
BIN_OP_EQ_uxn_device_h_l220_c6_6841_right,
BIN_OP_EQ_uxn_device_h_l220_c6_6841_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c7_2253
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c7_2253 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c7_2253_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c7_2253_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c7_2253_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c7_2253_return_output);

-- device_index_MUX_uxn_device_h_l220_c2_e63e
device_index_MUX_uxn_device_h_l220_c2_e63e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
device_index_MUX_uxn_device_h_l220_c2_e63e_cond,
device_index_MUX_uxn_device_h_l220_c2_e63e_iftrue,
device_index_MUX_uxn_device_h_l220_c2_e63e_iffalse,
device_index_MUX_uxn_device_h_l220_c2_e63e_return_output);

-- result_MUX_uxn_device_h_l220_c2_e63e
result_MUX_uxn_device_h_l220_c2_e63e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l220_c2_e63e_cond,
result_MUX_uxn_device_h_l220_c2_e63e_iftrue,
result_MUX_uxn_device_h_l220_c2_e63e_iffalse,
result_MUX_uxn_device_h_l220_c2_e63e_return_output);

-- device_port_MUX_uxn_device_h_l220_c2_e63e
device_port_MUX_uxn_device_h_l220_c2_e63e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
device_port_MUX_uxn_device_h_l220_c2_e63e_cond,
device_port_MUX_uxn_device_h_l220_c2_e63e_iftrue,
device_port_MUX_uxn_device_h_l220_c2_e63e_iffalse,
device_port_MUX_uxn_device_h_l220_c2_e63e_return_output);

-- BIN_OP_AND_uxn_device_h_l225_c27_ed14
BIN_OP_AND_uxn_device_h_l225_c27_ed14 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l225_c27_ed14_left,
BIN_OP_AND_uxn_device_h_l225_c27_ed14_right,
BIN_OP_AND_uxn_device_h_l225_c27_ed14_return_output);

-- BIN_OP_EQ_uxn_device_h_l227_c24_16fb
BIN_OP_EQ_uxn_device_h_l227_c24_16fb : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l227_c24_16fb_left,
BIN_OP_EQ_uxn_device_h_l227_c24_16fb_right,
BIN_OP_EQ_uxn_device_h_l227_c24_16fb_return_output);

-- MUX_uxn_device_h_l227_c24_ce3e
MUX_uxn_device_h_l227_c24_ce3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l227_c24_ce3e_cond,
MUX_uxn_device_h_l227_c24_ce3e_iftrue,
MUX_uxn_device_h_l227_c24_ce3e_iffalse,
MUX_uxn_device_h_l227_c24_ce3e_return_output);

-- BIN_OP_EQ_uxn_device_h_l229_c11_0469
BIN_OP_EQ_uxn_device_h_l229_c11_0469 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l229_c11_0469_left,
BIN_OP_EQ_uxn_device_h_l229_c11_0469_right,
BIN_OP_EQ_uxn_device_h_l229_c11_0469_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l234_c1_7c5e
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l234_c1_7c5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l234_c1_7c5e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l234_c1_7c5e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l234_c1_7c5e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l234_c1_7c5e_return_output);

-- device_index_MUX_uxn_device_h_l229_c7_2253
device_index_MUX_uxn_device_h_l229_c7_2253 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
device_index_MUX_uxn_device_h_l229_c7_2253_cond,
device_index_MUX_uxn_device_h_l229_c7_2253_iftrue,
device_index_MUX_uxn_device_h_l229_c7_2253_iffalse,
device_index_MUX_uxn_device_h_l229_c7_2253_return_output);

-- result_MUX_uxn_device_h_l229_c7_2253
result_MUX_uxn_device_h_l229_c7_2253 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l229_c7_2253_cond,
result_MUX_uxn_device_h_l229_c7_2253_iftrue,
result_MUX_uxn_device_h_l229_c7_2253_iffalse,
result_MUX_uxn_device_h_l229_c7_2253_return_output);

-- device_port_MUX_uxn_device_h_l229_c7_2253
device_port_MUX_uxn_device_h_l229_c7_2253 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
device_port_MUX_uxn_device_h_l229_c7_2253_cond,
device_port_MUX_uxn_device_h_l229_c7_2253_iftrue,
device_port_MUX_uxn_device_h_l229_c7_2253_iffalse,
device_port_MUX_uxn_device_h_l229_c7_2253_return_output);

-- BIN_OP_AND_uxn_device_h_l230_c27_681b
BIN_OP_AND_uxn_device_h_l230_c27_681b : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l230_c27_681b_left,
BIN_OP_AND_uxn_device_h_l230_c27_681b_right,
BIN_OP_AND_uxn_device_h_l230_c27_681b_return_output);

-- BIN_OP_EQ_uxn_device_h_l232_c24_647f
BIN_OP_EQ_uxn_device_h_l232_c24_647f : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l232_c24_647f_left,
BIN_OP_EQ_uxn_device_h_l232_c24_647f_right,
BIN_OP_EQ_uxn_device_h_l232_c24_647f_return_output);

-- MUX_uxn_device_h_l232_c24_1301
MUX_uxn_device_h_l232_c24_1301 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l232_c24_1301_cond,
MUX_uxn_device_h_l232_c24_1301_iftrue,
MUX_uxn_device_h_l232_c24_1301_iffalse,
MUX_uxn_device_h_l232_c24_1301_return_output);

-- BIN_OP_MINUS_uxn_device_h_l235_c47_3a53
BIN_OP_MINUS_uxn_device_h_l235_c47_3a53 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l235_c47_3a53_left,
BIN_OP_MINUS_uxn_device_h_l235_c47_3a53_right,
BIN_OP_MINUS_uxn_device_h_l235_c47_3a53_return_output);

-- emu_deo_uxn_device_h_l235_c12_9a12
emu_deo_uxn_device_h_l235_c12_9a12 : entity work.emu_deo_0CLK_31e2dbe1 port map (
clk,
emu_deo_uxn_device_h_l235_c12_9a12_CLOCK_ENABLE,
emu_deo_uxn_device_h_l235_c12_9a12_device_index,
emu_deo_uxn_device_h_l235_c12_9a12_device_port,
emu_deo_uxn_device_h_l235_c12_9a12_phase,
emu_deo_uxn_device_h_l235_c12_9a12_previous_device_ram_read,
emu_deo_uxn_device_h_l235_c12_9a12_return_output);

-- CONST_SR_4_uint8_t_uxn_device_h_l231_l226_DUPLICATE_a8bc
CONST_SR_4_uint8_t_uxn_device_h_l231_l226_DUPLICATE_a8bc : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uint8_t_uxn_device_h_l231_l226_DUPLICATE_a8bc_x,
CONST_SR_4_uint8_t_uxn_device_h_l231_l226_DUPLICATE_a8bc_return_output);

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l227_l232_DUPLICATE_bff3
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l227_l232_DUPLICATE_bff3 : entity work.VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_0CLK_763c90e8 port map (
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l227_l232_DUPLICATE_bff3_ref_toks_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l227_l232_DUPLICATE_bff3_var_dim_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l227_l232_DUPLICATE_bff3_return_output);



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
 BIN_OP_EQ_uxn_device_h_l220_c6_6841_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c7_2253_return_output,
 device_index_MUX_uxn_device_h_l220_c2_e63e_return_output,
 result_MUX_uxn_device_h_l220_c2_e63e_return_output,
 device_port_MUX_uxn_device_h_l220_c2_e63e_return_output,
 BIN_OP_AND_uxn_device_h_l225_c27_ed14_return_output,
 BIN_OP_EQ_uxn_device_h_l227_c24_16fb_return_output,
 MUX_uxn_device_h_l227_c24_ce3e_return_output,
 BIN_OP_EQ_uxn_device_h_l229_c11_0469_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l234_c1_7c5e_return_output,
 device_index_MUX_uxn_device_h_l229_c7_2253_return_output,
 result_MUX_uxn_device_h_l229_c7_2253_return_output,
 device_port_MUX_uxn_device_h_l229_c7_2253_return_output,
 BIN_OP_AND_uxn_device_h_l230_c27_681b_return_output,
 BIN_OP_EQ_uxn_device_h_l232_c24_647f_return_output,
 MUX_uxn_device_h_l232_c24_1301_return_output,
 BIN_OP_MINUS_uxn_device_h_l235_c47_3a53_return_output,
 emu_deo_uxn_device_h_l235_c12_9a12_return_output,
 CONST_SR_4_uint8_t_uxn_device_h_l231_l226_DUPLICATE_a8bc_return_output,
 VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l227_l232_DUPLICATE_bff3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_value : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_printf_uxn_device_h_l218_c2_36f1_uxn_device_h_l218_c2_36f1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l218_c2_36f1_uxn_device_h_l218_c2_36f1_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l218_c2_36f1_uxn_device_h_l218_c2_36f1_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l218_c2_36f1_uxn_device_h_l218_c2_36f1_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l220_c6_6841_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l220_c6_6841_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l220_c6_6841_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c7_2253_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c7_2253_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c7_2253_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c7_2253_iffalse : unsigned(0 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l220_c2_e63e_iftrue : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l220_c2_e63e_iffalse : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l229_c7_2253_return_output : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l220_c2_e63e_return_output : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l220_c2_e63e_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l220_c2_e63e_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_4849_uxn_device_h_l220_c2_e63e_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l220_c2_e63e_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l229_c7_2253_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l220_c2_e63e_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l220_c2_e63e_cond : unsigned(0 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l220_c2_e63e_iftrue : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l220_c2_e63e_iffalse : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l229_c7_2253_return_output : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l220_c2_e63e_return_output : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l220_c2_e63e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l225_c27_ed14_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l225_c27_ed14_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l225_c27_ed14_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l225_c17_f79c_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_device_h_l227_c24_ce3e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l227_c24_ce3e_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l227_c24_ce3e_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l227_c24_16fb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l227_c24_16fb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l227_c24_16fb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l227_c24_ce3e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l229_c11_0469_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l229_c11_0469_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l229_c11_0469_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l234_c1_7c5e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l234_c1_7c5e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l234_c1_7c5e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l234_c1_7c5e_iffalse : unsigned(0 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l229_c7_2253_iftrue : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l229_c7_2253_iffalse : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l229_c7_2253_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l229_c7_2253_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_37d8_uxn_device_h_l229_c7_2253_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l229_c7_2253_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l229_c7_2253_cond : unsigned(0 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l229_c7_2253_iftrue : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l229_c7_2253_iffalse : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l229_c7_2253_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l230_c27_681b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l230_c27_681b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l230_c27_681b_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l230_c17_76ac_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_device_h_l232_c24_1301_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l232_c24_1301_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l232_c24_1301_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l232_c24_647f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l232_c24_647f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l232_c24_647f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l232_c24_1301_return_output : unsigned(0 downto 0);
 variable VAR_emu_deo_uxn_device_h_l235_c12_9a12_device_index : unsigned(3 downto 0);
 variable VAR_emu_deo_uxn_device_h_l235_c12_9a12_device_port : unsigned(3 downto 0);
 variable VAR_emu_deo_uxn_device_h_l235_c12_9a12_phase : unsigned(7 downto 0);
 variable VAR_emu_deo_uxn_device_h_l235_c12_9a12_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l235_c47_3a53_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l235_c47_3a53_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l235_c47_3a53_return_output : unsigned(7 downto 0);
 variable VAR_emu_deo_uxn_device_h_l235_c12_9a12_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_emu_deo_uxn_device_h_l235_c12_9a12_return_output : device_out_result_t;
 variable VAR_CONST_SR_4_uint8_t_uxn_device_h_l231_l226_DUPLICATE_a8bc_x : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uint8_t_uxn_device_h_l231_l226_DUPLICATE_a8bc_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l226_l231_DUPLICATE_2a28_return_output : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l227_l232_DUPLICATE_bff3_ref_toks_0 : uint16_t_16;
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l227_l232_DUPLICATE_bff3_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l227_l232_DUPLICATE_bff3_return_output : unsigned(15 downto 0);
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
     VAR_BIN_OP_AND_uxn_device_h_l225_c27_ed14_right := to_unsigned(15, 4);
     VAR_BIN_OP_AND_uxn_device_h_l230_c27_681b_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l232_c24_647f_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l227_c24_ce3e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l220_c6_6841_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l229_c11_0469_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l235_c47_3a53_right := to_unsigned(2, 2);
     VAR_MUX_uxn_device_h_l227_c24_ce3e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l227_c24_16fb_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c7_2253_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l234_c1_7c5e_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l232_c24_1301_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l232_c24_1301_iftrue := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c7_2253_iffalse := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_device_h_l218_c2_36f1_uxn_device_h_l218_c2_36f1_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l227_l232_DUPLICATE_bff3_ref_toks_0 := deo_mask;
     REG_VAR_deo_mask := deo_mask;
     VAR_BIN_OP_AND_uxn_device_h_l225_c27_ed14_left := VAR_device_address;
     VAR_BIN_OP_AND_uxn_device_h_l230_c27_681b_left := VAR_device_address;
     VAR_CONST_SR_4_uint8_t_uxn_device_h_l231_l226_DUPLICATE_a8bc_x := VAR_device_address;
     VAR_printf_uxn_device_h_l218_c2_36f1_uxn_device_h_l218_c2_36f1_arg0 := resize(VAR_device_address, 32);
     VAR_device_index_MUX_uxn_device_h_l229_c7_2253_iffalse := device_index;
     VAR_emu_deo_uxn_device_h_l235_c12_9a12_device_index := device_index;
     VAR_device_port_MUX_uxn_device_h_l229_c7_2253_iffalse := device_port;
     VAR_emu_deo_uxn_device_h_l235_c12_9a12_device_port := device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l220_c6_6841_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l229_c11_0469_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l235_c47_3a53_left := VAR_phase;
     VAR_printf_uxn_device_h_l218_c2_36f1_uxn_device_h_l218_c2_36f1_arg2 := resize(VAR_phase, 32);
     VAR_emu_deo_uxn_device_h_l235_c12_9a12_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_printf_uxn_device_h_l218_c2_36f1_uxn_device_h_l218_c2_36f1_arg1 := resize(VAR_value, 32);
     -- BIN_OP_AND[uxn_device_h_l225_c27_ed14] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l225_c27_ed14_left <= VAR_BIN_OP_AND_uxn_device_h_l225_c27_ed14_left;
     BIN_OP_AND_uxn_device_h_l225_c27_ed14_right <= VAR_BIN_OP_AND_uxn_device_h_l225_c27_ed14_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l225_c27_ed14_return_output := BIN_OP_AND_uxn_device_h_l225_c27_ed14_return_output;

     -- CONST_SR_4_uint8_t_uxn_device_h_l231_l226_DUPLICATE_a8bc LATENCY=0
     -- Inputs
     CONST_SR_4_uint8_t_uxn_device_h_l231_l226_DUPLICATE_a8bc_x <= VAR_CONST_SR_4_uint8_t_uxn_device_h_l231_l226_DUPLICATE_a8bc_x;
     -- Outputs
     VAR_CONST_SR_4_uint8_t_uxn_device_h_l231_l226_DUPLICATE_a8bc_return_output := CONST_SR_4_uint8_t_uxn_device_h_l231_l226_DUPLICATE_a8bc_return_output;

     -- BIN_OP_EQ[uxn_device_h_l220_c6_6841] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l220_c6_6841_left <= VAR_BIN_OP_EQ_uxn_device_h_l220_c6_6841_left;
     BIN_OP_EQ_uxn_device_h_l220_c6_6841_right <= VAR_BIN_OP_EQ_uxn_device_h_l220_c6_6841_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l220_c6_6841_return_output := BIN_OP_EQ_uxn_device_h_l220_c6_6841_return_output;

     -- BIN_OP_EQ[uxn_device_h_l229_c11_0469] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l229_c11_0469_left <= VAR_BIN_OP_EQ_uxn_device_h_l229_c11_0469_left;
     BIN_OP_EQ_uxn_device_h_l229_c11_0469_right <= VAR_BIN_OP_EQ_uxn_device_h_l229_c11_0469_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l229_c11_0469_return_output := BIN_OP_EQ_uxn_device_h_l229_c11_0469_return_output;

     -- printf_uxn_device_h_l218_c2_36f1[uxn_device_h_l218_c2_36f1] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l218_c2_36f1_uxn_device_h_l218_c2_36f1_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l218_c2_36f1_uxn_device_h_l218_c2_36f1_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l218_c2_36f1_uxn_device_h_l218_c2_36f1_arg0 <= VAR_printf_uxn_device_h_l218_c2_36f1_uxn_device_h_l218_c2_36f1_arg0;
     printf_uxn_device_h_l218_c2_36f1_uxn_device_h_l218_c2_36f1_arg1 <= VAR_printf_uxn_device_h_l218_c2_36f1_uxn_device_h_l218_c2_36f1_arg1;
     printf_uxn_device_h_l218_c2_36f1_uxn_device_h_l218_c2_36f1_arg2 <= VAR_printf_uxn_device_h_l218_c2_36f1_uxn_device_h_l218_c2_36f1_arg2;
     -- Outputs

     -- BIN_OP_AND[uxn_device_h_l230_c27_681b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l230_c27_681b_left <= VAR_BIN_OP_AND_uxn_device_h_l230_c27_681b_left;
     BIN_OP_AND_uxn_device_h_l230_c27_681b_right <= VAR_BIN_OP_AND_uxn_device_h_l230_c27_681b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l230_c27_681b_return_output := BIN_OP_AND_uxn_device_h_l230_c27_681b_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l235_c47_3a53] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l235_c47_3a53_left <= VAR_BIN_OP_MINUS_uxn_device_h_l235_c47_3a53_left;
     BIN_OP_MINUS_uxn_device_h_l235_c47_3a53_right <= VAR_BIN_OP_MINUS_uxn_device_h_l235_c47_3a53_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l235_c47_3a53_return_output := BIN_OP_MINUS_uxn_device_h_l235_c47_3a53_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c7_2253_cond := VAR_BIN_OP_EQ_uxn_device_h_l220_c6_6841_return_output;
     VAR_device_index_MUX_uxn_device_h_l220_c2_e63e_cond := VAR_BIN_OP_EQ_uxn_device_h_l220_c6_6841_return_output;
     VAR_device_port_MUX_uxn_device_h_l220_c2_e63e_cond := VAR_BIN_OP_EQ_uxn_device_h_l220_c6_6841_return_output;
     VAR_result_MUX_uxn_device_h_l220_c2_e63e_cond := VAR_BIN_OP_EQ_uxn_device_h_l220_c6_6841_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l234_c1_7c5e_cond := VAR_BIN_OP_EQ_uxn_device_h_l229_c11_0469_return_output;
     VAR_device_index_MUX_uxn_device_h_l229_c7_2253_cond := VAR_BIN_OP_EQ_uxn_device_h_l229_c11_0469_return_output;
     VAR_device_port_MUX_uxn_device_h_l229_c7_2253_cond := VAR_BIN_OP_EQ_uxn_device_h_l229_c11_0469_return_output;
     VAR_result_MUX_uxn_device_h_l229_c7_2253_cond := VAR_BIN_OP_EQ_uxn_device_h_l229_c11_0469_return_output;
     VAR_emu_deo_uxn_device_h_l235_c12_9a12_phase := VAR_BIN_OP_MINUS_uxn_device_h_l235_c47_3a53_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l229_c7_2253] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c7_2253_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c7_2253_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c7_2253_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c7_2253_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c7_2253_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c7_2253_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c7_2253_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c7_2253_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l230_c17_76ac] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l230_c17_76ac_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_BIN_OP_AND_uxn_device_h_l230_c27_681b_return_output);

     -- CAST_TO_uint4_t[uxn_device_h_l225_c17_f79c] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l225_c17_f79c_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_BIN_OP_AND_uxn_device_h_l225_c27_ed14_return_output);

     -- CAST_TO_uint4_t_uint8_t_uxn_device_h_l226_l231_DUPLICATE_2a28 LATENCY=0
     VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l226_l231_DUPLICATE_2a28_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uint8_t_uxn_device_h_l231_l226_DUPLICATE_a8bc_return_output);

     -- Submodule level 2
     VAR_device_port_MUX_uxn_device_h_l220_c2_e63e_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l225_c17_f79c_return_output;
     VAR_device_port_MUX_uxn_device_h_l229_c7_2253_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l230_c17_76ac_return_output;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l227_l232_DUPLICATE_bff3_var_dim_0 := VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l226_l231_DUPLICATE_2a28_return_output;
     VAR_device_index_MUX_uxn_device_h_l220_c2_e63e_iftrue := VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l226_l231_DUPLICATE_2a28_return_output;
     VAR_device_index_MUX_uxn_device_h_l229_c7_2253_iftrue := VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l226_l231_DUPLICATE_2a28_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l234_c1_7c5e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c7_2253_return_output;
     -- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l227_l232_DUPLICATE_bff3 LATENCY=0
     -- Inputs
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l227_l232_DUPLICATE_bff3_ref_toks_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l227_l232_DUPLICATE_bff3_ref_toks_0;
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l227_l232_DUPLICATE_bff3_var_dim_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l227_l232_DUPLICATE_bff3_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l227_l232_DUPLICATE_bff3_return_output := VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l227_l232_DUPLICATE_bff3_return_output;

     -- device_port_MUX[uxn_device_h_l229_c7_2253] LATENCY=0
     -- Inputs
     device_port_MUX_uxn_device_h_l229_c7_2253_cond <= VAR_device_port_MUX_uxn_device_h_l229_c7_2253_cond;
     device_port_MUX_uxn_device_h_l229_c7_2253_iftrue <= VAR_device_port_MUX_uxn_device_h_l229_c7_2253_iftrue;
     device_port_MUX_uxn_device_h_l229_c7_2253_iffalse <= VAR_device_port_MUX_uxn_device_h_l229_c7_2253_iffalse;
     -- Outputs
     VAR_device_port_MUX_uxn_device_h_l229_c7_2253_return_output := device_port_MUX_uxn_device_h_l229_c7_2253_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l234_c1_7c5e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l234_c1_7c5e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l234_c1_7c5e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l234_c1_7c5e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l234_c1_7c5e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l234_c1_7c5e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l234_c1_7c5e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l234_c1_7c5e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l234_c1_7c5e_return_output;

     -- device_index_MUX[uxn_device_h_l229_c7_2253] LATENCY=0
     -- Inputs
     device_index_MUX_uxn_device_h_l229_c7_2253_cond <= VAR_device_index_MUX_uxn_device_h_l229_c7_2253_cond;
     device_index_MUX_uxn_device_h_l229_c7_2253_iftrue <= VAR_device_index_MUX_uxn_device_h_l229_c7_2253_iftrue;
     device_index_MUX_uxn_device_h_l229_c7_2253_iffalse <= VAR_device_index_MUX_uxn_device_h_l229_c7_2253_iffalse;
     -- Outputs
     VAR_device_index_MUX_uxn_device_h_l229_c7_2253_return_output := device_index_MUX_uxn_device_h_l229_c7_2253_return_output;

     -- Submodule level 3
     VAR_emu_deo_uxn_device_h_l235_c12_9a12_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l234_c1_7c5e_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l227_c24_16fb_left := VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l227_l232_DUPLICATE_bff3_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l232_c24_647f_left := VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l227_l232_DUPLICATE_bff3_return_output;
     VAR_device_index_MUX_uxn_device_h_l220_c2_e63e_iffalse := VAR_device_index_MUX_uxn_device_h_l229_c7_2253_return_output;
     VAR_device_port_MUX_uxn_device_h_l220_c2_e63e_iffalse := VAR_device_port_MUX_uxn_device_h_l229_c7_2253_return_output;
     -- BIN_OP_EQ[uxn_device_h_l227_c24_16fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l227_c24_16fb_left <= VAR_BIN_OP_EQ_uxn_device_h_l227_c24_16fb_left;
     BIN_OP_EQ_uxn_device_h_l227_c24_16fb_right <= VAR_BIN_OP_EQ_uxn_device_h_l227_c24_16fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l227_c24_16fb_return_output := BIN_OP_EQ_uxn_device_h_l227_c24_16fb_return_output;

     -- BIN_OP_EQ[uxn_device_h_l232_c24_647f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l232_c24_647f_left <= VAR_BIN_OP_EQ_uxn_device_h_l232_c24_647f_left;
     BIN_OP_EQ_uxn_device_h_l232_c24_647f_right <= VAR_BIN_OP_EQ_uxn_device_h_l232_c24_647f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l232_c24_647f_return_output := BIN_OP_EQ_uxn_device_h_l232_c24_647f_return_output;

     -- emu_deo[uxn_device_h_l235_c12_9a12] LATENCY=0
     -- Clock enable
     emu_deo_uxn_device_h_l235_c12_9a12_CLOCK_ENABLE <= VAR_emu_deo_uxn_device_h_l235_c12_9a12_CLOCK_ENABLE;
     -- Inputs
     emu_deo_uxn_device_h_l235_c12_9a12_device_index <= VAR_emu_deo_uxn_device_h_l235_c12_9a12_device_index;
     emu_deo_uxn_device_h_l235_c12_9a12_device_port <= VAR_emu_deo_uxn_device_h_l235_c12_9a12_device_port;
     emu_deo_uxn_device_h_l235_c12_9a12_phase <= VAR_emu_deo_uxn_device_h_l235_c12_9a12_phase;
     emu_deo_uxn_device_h_l235_c12_9a12_previous_device_ram_read <= VAR_emu_deo_uxn_device_h_l235_c12_9a12_previous_device_ram_read;
     -- Outputs
     VAR_emu_deo_uxn_device_h_l235_c12_9a12_return_output := emu_deo_uxn_device_h_l235_c12_9a12_return_output;

     -- device_port_MUX[uxn_device_h_l220_c2_e63e] LATENCY=0
     -- Inputs
     device_port_MUX_uxn_device_h_l220_c2_e63e_cond <= VAR_device_port_MUX_uxn_device_h_l220_c2_e63e_cond;
     device_port_MUX_uxn_device_h_l220_c2_e63e_iftrue <= VAR_device_port_MUX_uxn_device_h_l220_c2_e63e_iftrue;
     device_port_MUX_uxn_device_h_l220_c2_e63e_iffalse <= VAR_device_port_MUX_uxn_device_h_l220_c2_e63e_iffalse;
     -- Outputs
     VAR_device_port_MUX_uxn_device_h_l220_c2_e63e_return_output := device_port_MUX_uxn_device_h_l220_c2_e63e_return_output;

     -- device_index_MUX[uxn_device_h_l220_c2_e63e] LATENCY=0
     -- Inputs
     device_index_MUX_uxn_device_h_l220_c2_e63e_cond <= VAR_device_index_MUX_uxn_device_h_l220_c2_e63e_cond;
     device_index_MUX_uxn_device_h_l220_c2_e63e_iftrue <= VAR_device_index_MUX_uxn_device_h_l220_c2_e63e_iftrue;
     device_index_MUX_uxn_device_h_l220_c2_e63e_iffalse <= VAR_device_index_MUX_uxn_device_h_l220_c2_e63e_iffalse;
     -- Outputs
     VAR_device_index_MUX_uxn_device_h_l220_c2_e63e_return_output := device_index_MUX_uxn_device_h_l220_c2_e63e_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l227_c24_ce3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l227_c24_16fb_return_output;
     VAR_MUX_uxn_device_h_l232_c24_1301_cond := VAR_BIN_OP_EQ_uxn_device_h_l232_c24_647f_return_output;
     REG_VAR_device_index := VAR_device_index_MUX_uxn_device_h_l220_c2_e63e_return_output;
     REG_VAR_device_port := VAR_device_port_MUX_uxn_device_h_l220_c2_e63e_return_output;
     VAR_result_MUX_uxn_device_h_l229_c7_2253_iffalse := VAR_emu_deo_uxn_device_h_l235_c12_9a12_return_output;
     -- MUX[uxn_device_h_l232_c24_1301] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l232_c24_1301_cond <= VAR_MUX_uxn_device_h_l232_c24_1301_cond;
     MUX_uxn_device_h_l232_c24_1301_iftrue <= VAR_MUX_uxn_device_h_l232_c24_1301_iftrue;
     MUX_uxn_device_h_l232_c24_1301_iffalse <= VAR_MUX_uxn_device_h_l232_c24_1301_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l232_c24_1301_return_output := MUX_uxn_device_h_l232_c24_1301_return_output;

     -- MUX[uxn_device_h_l227_c24_ce3e] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l227_c24_ce3e_cond <= VAR_MUX_uxn_device_h_l227_c24_ce3e_cond;
     MUX_uxn_device_h_l227_c24_ce3e_iftrue <= VAR_MUX_uxn_device_h_l227_c24_ce3e_iftrue;
     MUX_uxn_device_h_l227_c24_ce3e_iffalse <= VAR_MUX_uxn_device_h_l227_c24_ce3e_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l227_c24_ce3e_return_output := MUX_uxn_device_h_l227_c24_ce3e_return_output;

     -- Submodule level 5
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_37d8[uxn_device_h_l229_c7_2253] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_37d8_uxn_device_h_l229_c7_2253_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_37d8(
     result,
     VAR_MUX_uxn_device_h_l232_c24_1301_return_output);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_4849[uxn_device_h_l220_c2_e63e] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_4849_uxn_device_h_l220_c2_e63e_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_4849(
     result,
     to_unsigned(0, 1),
     to_unsigned(1, 1),
     VAR_device_address,
     VAR_value,
     VAR_MUX_uxn_device_h_l227_c24_ce3e_return_output);

     -- Submodule level 6
     VAR_result_MUX_uxn_device_h_l229_c7_2253_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_37d8_uxn_device_h_l229_c7_2253_return_output;
     VAR_result_MUX_uxn_device_h_l220_c2_e63e_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_4849_uxn_device_h_l220_c2_e63e_return_output;
     -- result_MUX[uxn_device_h_l229_c7_2253] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l229_c7_2253_cond <= VAR_result_MUX_uxn_device_h_l229_c7_2253_cond;
     result_MUX_uxn_device_h_l229_c7_2253_iftrue <= VAR_result_MUX_uxn_device_h_l229_c7_2253_iftrue;
     result_MUX_uxn_device_h_l229_c7_2253_iffalse <= VAR_result_MUX_uxn_device_h_l229_c7_2253_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l229_c7_2253_return_output := result_MUX_uxn_device_h_l229_c7_2253_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_device_h_l220_c2_e63e_iffalse := VAR_result_MUX_uxn_device_h_l229_c7_2253_return_output;
     -- result_MUX[uxn_device_h_l220_c2_e63e] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l220_c2_e63e_cond <= VAR_result_MUX_uxn_device_h_l220_c2_e63e_cond;
     result_MUX_uxn_device_h_l220_c2_e63e_iftrue <= VAR_result_MUX_uxn_device_h_l220_c2_e63e_iftrue;
     result_MUX_uxn_device_h_l220_c2_e63e_iffalse <= VAR_result_MUX_uxn_device_h_l220_c2_e63e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l220_c2_e63e_return_output := result_MUX_uxn_device_h_l220_c2_e63e_return_output;

     -- Submodule level 8
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l220_c2_e63e_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l220_c2_e63e_return_output;
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
