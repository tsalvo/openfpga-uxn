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
entity device_out_0CLK_8af766d2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 value : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end device_out_0CLK_8af766d2;
architecture arch of device_out_0CLK_8af766d2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : device_out_result_t := (
is_device_ram_write => to_unsigned(0, 1),
is_device_ram_16bit => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
vram_address => to_unsigned(0, 24),
u16_value => to_unsigned(0, 16),
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
-- BIN_OP_EQ[uxn_device_h_l241_c6_8d13]
signal BIN_OP_EQ_uxn_device_h_l241_c6_8d13_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l241_c6_8d13_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l241_c6_8d13_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l250_c7_b176]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l250_c7_b176_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l250_c7_b176_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l250_c7_b176_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l250_c7_b176_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l241_c2_cea4]
signal result_MUX_uxn_device_h_l241_c2_cea4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l241_c2_cea4_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l241_c2_cea4_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l241_c2_cea4_return_output : device_out_result_t;

-- device_port_MUX[uxn_device_h_l241_c2_cea4]
signal device_port_MUX_uxn_device_h_l241_c2_cea4_cond : unsigned(0 downto 0);
signal device_port_MUX_uxn_device_h_l241_c2_cea4_iftrue : unsigned(3 downto 0);
signal device_port_MUX_uxn_device_h_l241_c2_cea4_iffalse : unsigned(3 downto 0);
signal device_port_MUX_uxn_device_h_l241_c2_cea4_return_output : unsigned(3 downto 0);

-- device_index_MUX[uxn_device_h_l241_c2_cea4]
signal device_index_MUX_uxn_device_h_l241_c2_cea4_cond : unsigned(0 downto 0);
signal device_index_MUX_uxn_device_h_l241_c2_cea4_iftrue : unsigned(3 downto 0);
signal device_index_MUX_uxn_device_h_l241_c2_cea4_iffalse : unsigned(3 downto 0);
signal device_index_MUX_uxn_device_h_l241_c2_cea4_return_output : unsigned(3 downto 0);

-- BIN_OP_AND[uxn_device_h_l246_c27_696a]
signal BIN_OP_AND_uxn_device_h_l246_c27_696a_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l246_c27_696a_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l246_c27_696a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l248_c24_ca87]
signal BIN_OP_EQ_uxn_device_h_l248_c24_ca87_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_device_h_l248_c24_ca87_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l248_c24_ca87_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l248_c24_f308]
signal MUX_uxn_device_h_l248_c24_f308_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l248_c24_f308_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l248_c24_f308_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l248_c24_f308_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l250_c11_4f3c]
signal BIN_OP_EQ_uxn_device_h_l250_c11_4f3c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l250_c11_4f3c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l250_c11_4f3c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l256_c1_a0d3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l256_c1_a0d3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l256_c1_a0d3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l256_c1_a0d3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l256_c1_a0d3_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l250_c7_b176]
signal result_MUX_uxn_device_h_l250_c7_b176_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l250_c7_b176_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l250_c7_b176_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l250_c7_b176_return_output : device_out_result_t;

-- device_port_MUX[uxn_device_h_l250_c7_b176]
signal device_port_MUX_uxn_device_h_l250_c7_b176_cond : unsigned(0 downto 0);
signal device_port_MUX_uxn_device_h_l250_c7_b176_iftrue : unsigned(3 downto 0);
signal device_port_MUX_uxn_device_h_l250_c7_b176_iffalse : unsigned(3 downto 0);
signal device_port_MUX_uxn_device_h_l250_c7_b176_return_output : unsigned(3 downto 0);

-- device_index_MUX[uxn_device_h_l250_c7_b176]
signal device_index_MUX_uxn_device_h_l250_c7_b176_cond : unsigned(0 downto 0);
signal device_index_MUX_uxn_device_h_l250_c7_b176_iftrue : unsigned(3 downto 0);
signal device_index_MUX_uxn_device_h_l250_c7_b176_iffalse : unsigned(3 downto 0);
signal device_index_MUX_uxn_device_h_l250_c7_b176_return_output : unsigned(3 downto 0);

-- BIN_OP_AND[uxn_device_h_l252_c27_6b32]
signal BIN_OP_AND_uxn_device_h_l252_c27_6b32_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l252_c27_6b32_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l252_c27_6b32_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l254_c24_3c8d]
signal BIN_OP_EQ_uxn_device_h_l254_c24_3c8d_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_device_h_l254_c24_3c8d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l254_c24_3c8d_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l254_c24_d437]
signal MUX_uxn_device_h_l254_c24_d437_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l254_c24_d437_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l254_c24_d437_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l254_c24_d437_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l257_c47_4961]
signal BIN_OP_MINUS_uxn_device_h_l257_c47_4961_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l257_c47_4961_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l257_c47_4961_return_output : unsigned(7 downto 0);

-- emu_deo[uxn_device_h_l257_c12_eb7e]
signal emu_deo_uxn_device_h_l257_c12_eb7e_CLOCK_ENABLE : unsigned(0 downto 0);
signal emu_deo_uxn_device_h_l257_c12_eb7e_device_index : unsigned(3 downto 0);
signal emu_deo_uxn_device_h_l257_c12_eb7e_device_port : unsigned(3 downto 0);
signal emu_deo_uxn_device_h_l257_c12_eb7e_phase : unsigned(7 downto 0);
signal emu_deo_uxn_device_h_l257_c12_eb7e_previous_device_ram_read : unsigned(15 downto 0);
signal emu_deo_uxn_device_h_l257_c12_eb7e_previous_ram_read : unsigned(7 downto 0);
signal emu_deo_uxn_device_h_l257_c12_eb7e_return_output : device_out_result_t;

-- CONST_SR_4_uint8_t_uxn_device_h_l253_l247_DUPLICATE_9e28
signal CONST_SR_4_uint8_t_uxn_device_h_l253_l247_DUPLICATE_9e28_x : unsigned(7 downto 0);
signal CONST_SR_4_uint8_t_uxn_device_h_l253_l247_DUPLICATE_9e28_return_output : unsigned(7 downto 0);

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l254_l248_DUPLICATE_f5ac
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l254_l248_DUPLICATE_f5ac_ref_toks_0 : uint16_t_16;
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l254_l248_DUPLICATE_f5ac_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l254_l248_DUPLICATE_f5ac_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_device_h_l241_c6_8d13
BIN_OP_EQ_uxn_device_h_l241_c6_8d13 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l241_c6_8d13_left,
BIN_OP_EQ_uxn_device_h_l241_c6_8d13_right,
BIN_OP_EQ_uxn_device_h_l241_c6_8d13_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l250_c7_b176
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l250_c7_b176 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l250_c7_b176_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l250_c7_b176_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l250_c7_b176_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l250_c7_b176_return_output);

-- result_MUX_uxn_device_h_l241_c2_cea4
result_MUX_uxn_device_h_l241_c2_cea4 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l241_c2_cea4_cond,
result_MUX_uxn_device_h_l241_c2_cea4_iftrue,
result_MUX_uxn_device_h_l241_c2_cea4_iffalse,
result_MUX_uxn_device_h_l241_c2_cea4_return_output);

-- device_port_MUX_uxn_device_h_l241_c2_cea4
device_port_MUX_uxn_device_h_l241_c2_cea4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
device_port_MUX_uxn_device_h_l241_c2_cea4_cond,
device_port_MUX_uxn_device_h_l241_c2_cea4_iftrue,
device_port_MUX_uxn_device_h_l241_c2_cea4_iffalse,
device_port_MUX_uxn_device_h_l241_c2_cea4_return_output);

-- device_index_MUX_uxn_device_h_l241_c2_cea4
device_index_MUX_uxn_device_h_l241_c2_cea4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
device_index_MUX_uxn_device_h_l241_c2_cea4_cond,
device_index_MUX_uxn_device_h_l241_c2_cea4_iftrue,
device_index_MUX_uxn_device_h_l241_c2_cea4_iffalse,
device_index_MUX_uxn_device_h_l241_c2_cea4_return_output);

-- BIN_OP_AND_uxn_device_h_l246_c27_696a
BIN_OP_AND_uxn_device_h_l246_c27_696a : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l246_c27_696a_left,
BIN_OP_AND_uxn_device_h_l246_c27_696a_right,
BIN_OP_AND_uxn_device_h_l246_c27_696a_return_output);

-- BIN_OP_EQ_uxn_device_h_l248_c24_ca87
BIN_OP_EQ_uxn_device_h_l248_c24_ca87 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l248_c24_ca87_left,
BIN_OP_EQ_uxn_device_h_l248_c24_ca87_right,
BIN_OP_EQ_uxn_device_h_l248_c24_ca87_return_output);

-- MUX_uxn_device_h_l248_c24_f308
MUX_uxn_device_h_l248_c24_f308 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l248_c24_f308_cond,
MUX_uxn_device_h_l248_c24_f308_iftrue,
MUX_uxn_device_h_l248_c24_f308_iffalse,
MUX_uxn_device_h_l248_c24_f308_return_output);

-- BIN_OP_EQ_uxn_device_h_l250_c11_4f3c
BIN_OP_EQ_uxn_device_h_l250_c11_4f3c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l250_c11_4f3c_left,
BIN_OP_EQ_uxn_device_h_l250_c11_4f3c_right,
BIN_OP_EQ_uxn_device_h_l250_c11_4f3c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l256_c1_a0d3
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l256_c1_a0d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l256_c1_a0d3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l256_c1_a0d3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l256_c1_a0d3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l256_c1_a0d3_return_output);

-- result_MUX_uxn_device_h_l250_c7_b176
result_MUX_uxn_device_h_l250_c7_b176 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l250_c7_b176_cond,
result_MUX_uxn_device_h_l250_c7_b176_iftrue,
result_MUX_uxn_device_h_l250_c7_b176_iffalse,
result_MUX_uxn_device_h_l250_c7_b176_return_output);

-- device_port_MUX_uxn_device_h_l250_c7_b176
device_port_MUX_uxn_device_h_l250_c7_b176 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
device_port_MUX_uxn_device_h_l250_c7_b176_cond,
device_port_MUX_uxn_device_h_l250_c7_b176_iftrue,
device_port_MUX_uxn_device_h_l250_c7_b176_iffalse,
device_port_MUX_uxn_device_h_l250_c7_b176_return_output);

-- device_index_MUX_uxn_device_h_l250_c7_b176
device_index_MUX_uxn_device_h_l250_c7_b176 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
device_index_MUX_uxn_device_h_l250_c7_b176_cond,
device_index_MUX_uxn_device_h_l250_c7_b176_iftrue,
device_index_MUX_uxn_device_h_l250_c7_b176_iffalse,
device_index_MUX_uxn_device_h_l250_c7_b176_return_output);

-- BIN_OP_AND_uxn_device_h_l252_c27_6b32
BIN_OP_AND_uxn_device_h_l252_c27_6b32 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l252_c27_6b32_left,
BIN_OP_AND_uxn_device_h_l252_c27_6b32_right,
BIN_OP_AND_uxn_device_h_l252_c27_6b32_return_output);

-- BIN_OP_EQ_uxn_device_h_l254_c24_3c8d
BIN_OP_EQ_uxn_device_h_l254_c24_3c8d : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l254_c24_3c8d_left,
BIN_OP_EQ_uxn_device_h_l254_c24_3c8d_right,
BIN_OP_EQ_uxn_device_h_l254_c24_3c8d_return_output);

-- MUX_uxn_device_h_l254_c24_d437
MUX_uxn_device_h_l254_c24_d437 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l254_c24_d437_cond,
MUX_uxn_device_h_l254_c24_d437_iftrue,
MUX_uxn_device_h_l254_c24_d437_iffalse,
MUX_uxn_device_h_l254_c24_d437_return_output);

-- BIN_OP_MINUS_uxn_device_h_l257_c47_4961
BIN_OP_MINUS_uxn_device_h_l257_c47_4961 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l257_c47_4961_left,
BIN_OP_MINUS_uxn_device_h_l257_c47_4961_right,
BIN_OP_MINUS_uxn_device_h_l257_c47_4961_return_output);

-- emu_deo_uxn_device_h_l257_c12_eb7e
emu_deo_uxn_device_h_l257_c12_eb7e : entity work.emu_deo_0CLK_f2e2ec25 port map (
clk,
emu_deo_uxn_device_h_l257_c12_eb7e_CLOCK_ENABLE,
emu_deo_uxn_device_h_l257_c12_eb7e_device_index,
emu_deo_uxn_device_h_l257_c12_eb7e_device_port,
emu_deo_uxn_device_h_l257_c12_eb7e_phase,
emu_deo_uxn_device_h_l257_c12_eb7e_previous_device_ram_read,
emu_deo_uxn_device_h_l257_c12_eb7e_previous_ram_read,
emu_deo_uxn_device_h_l257_c12_eb7e_return_output);

-- CONST_SR_4_uint8_t_uxn_device_h_l253_l247_DUPLICATE_9e28
CONST_SR_4_uint8_t_uxn_device_h_l253_l247_DUPLICATE_9e28 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uint8_t_uxn_device_h_l253_l247_DUPLICATE_9e28_x,
CONST_SR_4_uint8_t_uxn_device_h_l253_l247_DUPLICATE_9e28_return_output);

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l254_l248_DUPLICATE_f5ac
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l254_l248_DUPLICATE_f5ac : entity work.VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_0CLK_763c90e8 port map (
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l254_l248_DUPLICATE_f5ac_ref_toks_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l254_l248_DUPLICATE_f5ac_var_dim_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l254_l248_DUPLICATE_f5ac_return_output);



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
 BIN_OP_EQ_uxn_device_h_l241_c6_8d13_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l250_c7_b176_return_output,
 result_MUX_uxn_device_h_l241_c2_cea4_return_output,
 device_port_MUX_uxn_device_h_l241_c2_cea4_return_output,
 device_index_MUX_uxn_device_h_l241_c2_cea4_return_output,
 BIN_OP_AND_uxn_device_h_l246_c27_696a_return_output,
 BIN_OP_EQ_uxn_device_h_l248_c24_ca87_return_output,
 MUX_uxn_device_h_l248_c24_f308_return_output,
 BIN_OP_EQ_uxn_device_h_l250_c11_4f3c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l256_c1_a0d3_return_output,
 result_MUX_uxn_device_h_l250_c7_b176_return_output,
 device_port_MUX_uxn_device_h_l250_c7_b176_return_output,
 device_index_MUX_uxn_device_h_l250_c7_b176_return_output,
 BIN_OP_AND_uxn_device_h_l252_c27_6b32_return_output,
 BIN_OP_EQ_uxn_device_h_l254_c24_3c8d_return_output,
 MUX_uxn_device_h_l254_c24_d437_return_output,
 BIN_OP_MINUS_uxn_device_h_l257_c47_4961_return_output,
 emu_deo_uxn_device_h_l257_c12_eb7e_return_output,
 CONST_SR_4_uint8_t_uxn_device_h_l253_l247_DUPLICATE_9e28_return_output,
 VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l254_l248_DUPLICATE_f5ac_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_value : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l241_c6_8d13_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l241_c6_8d13_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l241_c6_8d13_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l250_c7_b176_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l250_c7_b176_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l250_c7_b176_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l250_c7_b176_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l241_c2_cea4_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_e500_uxn_device_h_l241_c2_cea4_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l241_c2_cea4_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l250_c7_b176_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l241_c2_cea4_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l241_c2_cea4_cond : unsigned(0 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l241_c2_cea4_iftrue : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l241_c2_cea4_iffalse : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l250_c7_b176_return_output : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l241_c2_cea4_return_output : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l241_c2_cea4_cond : unsigned(0 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l241_c2_cea4_iftrue : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l241_c2_cea4_iffalse : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l250_c7_b176_return_output : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l241_c2_cea4_return_output : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l241_c2_cea4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l246_c27_696a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l246_c27_696a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l246_c27_696a_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l246_c17_2ace_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_device_h_l248_c24_f308_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l248_c24_ca87_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l248_c24_ca87_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l248_c24_ca87_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l248_c24_f308_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l248_c24_f308_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l248_c24_f308_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l250_c11_4f3c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l250_c11_4f3c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l250_c11_4f3c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l256_c1_a0d3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l256_c1_a0d3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l256_c1_a0d3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l256_c1_a0d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l250_c7_b176_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cf24_uxn_device_h_l250_c7_b176_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l250_c7_b176_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l250_c7_b176_cond : unsigned(0 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l250_c7_b176_iftrue : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l250_c7_b176_iffalse : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l250_c7_b176_cond : unsigned(0 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l250_c7_b176_iftrue : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l250_c7_b176_iffalse : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l250_c7_b176_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l252_c27_6b32_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l252_c27_6b32_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l252_c27_6b32_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l252_c17_2d6b_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_device_h_l254_c24_d437_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l254_c24_3c8d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l254_c24_3c8d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l254_c24_3c8d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l254_c24_d437_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l254_c24_d437_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l254_c24_d437_return_output : unsigned(0 downto 0);
 variable VAR_emu_deo_uxn_device_h_l257_c12_eb7e_device_index : unsigned(3 downto 0);
 variable VAR_emu_deo_uxn_device_h_l257_c12_eb7e_device_port : unsigned(3 downto 0);
 variable VAR_emu_deo_uxn_device_h_l257_c12_eb7e_phase : unsigned(7 downto 0);
 variable VAR_emu_deo_uxn_device_h_l257_c12_eb7e_previous_device_ram_read : unsigned(15 downto 0);
 variable VAR_emu_deo_uxn_device_h_l257_c12_eb7e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l257_c47_4961_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l257_c47_4961_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l257_c47_4961_return_output : unsigned(7 downto 0);
 variable VAR_emu_deo_uxn_device_h_l257_c12_eb7e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_emu_deo_uxn_device_h_l257_c12_eb7e_return_output : device_out_result_t;
 variable VAR_CONST_SR_4_uint8_t_uxn_device_h_l253_l247_DUPLICATE_9e28_x : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uint8_t_uxn_device_h_l253_l247_DUPLICATE_9e28_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l247_l253_DUPLICATE_9d9f_return_output : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l254_l248_DUPLICATE_f5ac_ref_toks_0 : uint16_t_16;
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l254_l248_DUPLICATE_f5ac_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l254_l248_DUPLICATE_f5ac_return_output : unsigned(15 downto 0);
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
     VAR_BIN_OP_EQ_uxn_device_h_l248_c24_ca87_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l256_c1_a0d3_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l248_c24_f308_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l241_c6_8d13_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l246_c27_696a_right := to_unsigned(15, 8);
     VAR_MUX_uxn_device_h_l254_c24_d437_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l254_c24_d437_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l250_c11_4f3c_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l248_c24_f308_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l257_c47_4961_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l254_c24_3c8d_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l250_c7_b176_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l252_c27_6b32_right := to_unsigned(15, 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l250_c7_b176_iffalse := VAR_CLOCK_ENABLE;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l254_l248_DUPLICATE_f5ac_ref_toks_0 := deo_mask;
     REG_VAR_deo_mask := deo_mask;
     VAR_BIN_OP_AND_uxn_device_h_l246_c27_696a_left := VAR_device_address;
     VAR_BIN_OP_AND_uxn_device_h_l252_c27_6b32_left := VAR_device_address;
     VAR_CONST_SR_4_uint8_t_uxn_device_h_l253_l247_DUPLICATE_9e28_x := VAR_device_address;
     VAR_device_index_MUX_uxn_device_h_l250_c7_b176_iffalse := device_index;
     VAR_emu_deo_uxn_device_h_l257_c12_eb7e_device_index := device_index;
     VAR_device_port_MUX_uxn_device_h_l250_c7_b176_iffalse := device_port;
     VAR_emu_deo_uxn_device_h_l257_c12_eb7e_device_port := device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l241_c6_8d13_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l250_c11_4f3c_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l257_c47_4961_left := VAR_phase;
     VAR_emu_deo_uxn_device_h_l257_c12_eb7e_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_emu_deo_uxn_device_h_l257_c12_eb7e_previous_ram_read := VAR_previous_ram_read;
     -- CONST_SR_4_uint8_t_uxn_device_h_l253_l247_DUPLICATE_9e28 LATENCY=0
     -- Inputs
     CONST_SR_4_uint8_t_uxn_device_h_l253_l247_DUPLICATE_9e28_x <= VAR_CONST_SR_4_uint8_t_uxn_device_h_l253_l247_DUPLICATE_9e28_x;
     -- Outputs
     VAR_CONST_SR_4_uint8_t_uxn_device_h_l253_l247_DUPLICATE_9e28_return_output := CONST_SR_4_uint8_t_uxn_device_h_l253_l247_DUPLICATE_9e28_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l257_c47_4961] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l257_c47_4961_left <= VAR_BIN_OP_MINUS_uxn_device_h_l257_c47_4961_left;
     BIN_OP_MINUS_uxn_device_h_l257_c47_4961_right <= VAR_BIN_OP_MINUS_uxn_device_h_l257_c47_4961_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l257_c47_4961_return_output := BIN_OP_MINUS_uxn_device_h_l257_c47_4961_return_output;

     -- BIN_OP_AND[uxn_device_h_l252_c27_6b32] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l252_c27_6b32_left <= VAR_BIN_OP_AND_uxn_device_h_l252_c27_6b32_left;
     BIN_OP_AND_uxn_device_h_l252_c27_6b32_right <= VAR_BIN_OP_AND_uxn_device_h_l252_c27_6b32_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l252_c27_6b32_return_output := BIN_OP_AND_uxn_device_h_l252_c27_6b32_return_output;

     -- BIN_OP_EQ[uxn_device_h_l241_c6_8d13] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l241_c6_8d13_left <= VAR_BIN_OP_EQ_uxn_device_h_l241_c6_8d13_left;
     BIN_OP_EQ_uxn_device_h_l241_c6_8d13_right <= VAR_BIN_OP_EQ_uxn_device_h_l241_c6_8d13_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l241_c6_8d13_return_output := BIN_OP_EQ_uxn_device_h_l241_c6_8d13_return_output;

     -- BIN_OP_EQ[uxn_device_h_l250_c11_4f3c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l250_c11_4f3c_left <= VAR_BIN_OP_EQ_uxn_device_h_l250_c11_4f3c_left;
     BIN_OP_EQ_uxn_device_h_l250_c11_4f3c_right <= VAR_BIN_OP_EQ_uxn_device_h_l250_c11_4f3c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l250_c11_4f3c_return_output := BIN_OP_EQ_uxn_device_h_l250_c11_4f3c_return_output;

     -- BIN_OP_AND[uxn_device_h_l246_c27_696a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l246_c27_696a_left <= VAR_BIN_OP_AND_uxn_device_h_l246_c27_696a_left;
     BIN_OP_AND_uxn_device_h_l246_c27_696a_right <= VAR_BIN_OP_AND_uxn_device_h_l246_c27_696a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l246_c27_696a_return_output := BIN_OP_AND_uxn_device_h_l246_c27_696a_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l250_c7_b176_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c6_8d13_return_output;
     VAR_device_index_MUX_uxn_device_h_l241_c2_cea4_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c6_8d13_return_output;
     VAR_device_port_MUX_uxn_device_h_l241_c2_cea4_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c6_8d13_return_output;
     VAR_result_MUX_uxn_device_h_l241_c2_cea4_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c6_8d13_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l256_c1_a0d3_cond := VAR_BIN_OP_EQ_uxn_device_h_l250_c11_4f3c_return_output;
     VAR_device_index_MUX_uxn_device_h_l250_c7_b176_cond := VAR_BIN_OP_EQ_uxn_device_h_l250_c11_4f3c_return_output;
     VAR_device_port_MUX_uxn_device_h_l250_c7_b176_cond := VAR_BIN_OP_EQ_uxn_device_h_l250_c11_4f3c_return_output;
     VAR_result_MUX_uxn_device_h_l250_c7_b176_cond := VAR_BIN_OP_EQ_uxn_device_h_l250_c11_4f3c_return_output;
     VAR_emu_deo_uxn_device_h_l257_c12_eb7e_phase := VAR_BIN_OP_MINUS_uxn_device_h_l257_c47_4961_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l250_c7_b176] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l250_c7_b176_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l250_c7_b176_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l250_c7_b176_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l250_c7_b176_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l250_c7_b176_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l250_c7_b176_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l250_c7_b176_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l250_c7_b176_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l246_c17_2ace] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l246_c17_2ace_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_BIN_OP_AND_uxn_device_h_l246_c27_696a_return_output);

     -- CAST_TO_uint4_t[uxn_device_h_l252_c17_2d6b] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l252_c17_2d6b_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_BIN_OP_AND_uxn_device_h_l252_c27_6b32_return_output);

     -- CAST_TO_uint4_t_uint8_t_uxn_device_h_l247_l253_DUPLICATE_9d9f LATENCY=0
     VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l247_l253_DUPLICATE_9d9f_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uint8_t_uxn_device_h_l253_l247_DUPLICATE_9e28_return_output);

     -- Submodule level 2
     VAR_device_port_MUX_uxn_device_h_l241_c2_cea4_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l246_c17_2ace_return_output;
     VAR_device_port_MUX_uxn_device_h_l250_c7_b176_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l252_c17_2d6b_return_output;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l254_l248_DUPLICATE_f5ac_var_dim_0 := VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l247_l253_DUPLICATE_9d9f_return_output;
     VAR_device_index_MUX_uxn_device_h_l241_c2_cea4_iftrue := VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l247_l253_DUPLICATE_9d9f_return_output;
     VAR_device_index_MUX_uxn_device_h_l250_c7_b176_iftrue := VAR_CAST_TO_uint4_t_uint8_t_uxn_device_h_l247_l253_DUPLICATE_9d9f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l256_c1_a0d3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l250_c7_b176_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l256_c1_a0d3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l256_c1_a0d3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l256_c1_a0d3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l256_c1_a0d3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l256_c1_a0d3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l256_c1_a0d3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l256_c1_a0d3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l256_c1_a0d3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l256_c1_a0d3_return_output;

     -- device_port_MUX[uxn_device_h_l250_c7_b176] LATENCY=0
     -- Inputs
     device_port_MUX_uxn_device_h_l250_c7_b176_cond <= VAR_device_port_MUX_uxn_device_h_l250_c7_b176_cond;
     device_port_MUX_uxn_device_h_l250_c7_b176_iftrue <= VAR_device_port_MUX_uxn_device_h_l250_c7_b176_iftrue;
     device_port_MUX_uxn_device_h_l250_c7_b176_iffalse <= VAR_device_port_MUX_uxn_device_h_l250_c7_b176_iffalse;
     -- Outputs
     VAR_device_port_MUX_uxn_device_h_l250_c7_b176_return_output := device_port_MUX_uxn_device_h_l250_c7_b176_return_output;

     -- device_index_MUX[uxn_device_h_l250_c7_b176] LATENCY=0
     -- Inputs
     device_index_MUX_uxn_device_h_l250_c7_b176_cond <= VAR_device_index_MUX_uxn_device_h_l250_c7_b176_cond;
     device_index_MUX_uxn_device_h_l250_c7_b176_iftrue <= VAR_device_index_MUX_uxn_device_h_l250_c7_b176_iftrue;
     device_index_MUX_uxn_device_h_l250_c7_b176_iffalse <= VAR_device_index_MUX_uxn_device_h_l250_c7_b176_iffalse;
     -- Outputs
     VAR_device_index_MUX_uxn_device_h_l250_c7_b176_return_output := device_index_MUX_uxn_device_h_l250_c7_b176_return_output;

     -- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l254_l248_DUPLICATE_f5ac LATENCY=0
     -- Inputs
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l254_l248_DUPLICATE_f5ac_ref_toks_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l254_l248_DUPLICATE_f5ac_ref_toks_0;
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l254_l248_DUPLICATE_f5ac_var_dim_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l254_l248_DUPLICATE_f5ac_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l254_l248_DUPLICATE_f5ac_return_output := VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l254_l248_DUPLICATE_f5ac_return_output;

     -- Submodule level 3
     VAR_emu_deo_uxn_device_h_l257_c12_eb7e_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l256_c1_a0d3_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l248_c24_ca87_left := VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l254_l248_DUPLICATE_f5ac_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l254_c24_3c8d_left := VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l254_l248_DUPLICATE_f5ac_return_output;
     VAR_device_index_MUX_uxn_device_h_l241_c2_cea4_iffalse := VAR_device_index_MUX_uxn_device_h_l250_c7_b176_return_output;
     VAR_device_port_MUX_uxn_device_h_l241_c2_cea4_iffalse := VAR_device_port_MUX_uxn_device_h_l250_c7_b176_return_output;
     -- BIN_OP_EQ[uxn_device_h_l254_c24_3c8d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l254_c24_3c8d_left <= VAR_BIN_OP_EQ_uxn_device_h_l254_c24_3c8d_left;
     BIN_OP_EQ_uxn_device_h_l254_c24_3c8d_right <= VAR_BIN_OP_EQ_uxn_device_h_l254_c24_3c8d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l254_c24_3c8d_return_output := BIN_OP_EQ_uxn_device_h_l254_c24_3c8d_return_output;

     -- emu_deo[uxn_device_h_l257_c12_eb7e] LATENCY=0
     -- Clock enable
     emu_deo_uxn_device_h_l257_c12_eb7e_CLOCK_ENABLE <= VAR_emu_deo_uxn_device_h_l257_c12_eb7e_CLOCK_ENABLE;
     -- Inputs
     emu_deo_uxn_device_h_l257_c12_eb7e_device_index <= VAR_emu_deo_uxn_device_h_l257_c12_eb7e_device_index;
     emu_deo_uxn_device_h_l257_c12_eb7e_device_port <= VAR_emu_deo_uxn_device_h_l257_c12_eb7e_device_port;
     emu_deo_uxn_device_h_l257_c12_eb7e_phase <= VAR_emu_deo_uxn_device_h_l257_c12_eb7e_phase;
     emu_deo_uxn_device_h_l257_c12_eb7e_previous_device_ram_read <= VAR_emu_deo_uxn_device_h_l257_c12_eb7e_previous_device_ram_read;
     emu_deo_uxn_device_h_l257_c12_eb7e_previous_ram_read <= VAR_emu_deo_uxn_device_h_l257_c12_eb7e_previous_ram_read;
     -- Outputs
     VAR_emu_deo_uxn_device_h_l257_c12_eb7e_return_output := emu_deo_uxn_device_h_l257_c12_eb7e_return_output;

     -- device_index_MUX[uxn_device_h_l241_c2_cea4] LATENCY=0
     -- Inputs
     device_index_MUX_uxn_device_h_l241_c2_cea4_cond <= VAR_device_index_MUX_uxn_device_h_l241_c2_cea4_cond;
     device_index_MUX_uxn_device_h_l241_c2_cea4_iftrue <= VAR_device_index_MUX_uxn_device_h_l241_c2_cea4_iftrue;
     device_index_MUX_uxn_device_h_l241_c2_cea4_iffalse <= VAR_device_index_MUX_uxn_device_h_l241_c2_cea4_iffalse;
     -- Outputs
     VAR_device_index_MUX_uxn_device_h_l241_c2_cea4_return_output := device_index_MUX_uxn_device_h_l241_c2_cea4_return_output;

     -- BIN_OP_EQ[uxn_device_h_l248_c24_ca87] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l248_c24_ca87_left <= VAR_BIN_OP_EQ_uxn_device_h_l248_c24_ca87_left;
     BIN_OP_EQ_uxn_device_h_l248_c24_ca87_right <= VAR_BIN_OP_EQ_uxn_device_h_l248_c24_ca87_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l248_c24_ca87_return_output := BIN_OP_EQ_uxn_device_h_l248_c24_ca87_return_output;

     -- device_port_MUX[uxn_device_h_l241_c2_cea4] LATENCY=0
     -- Inputs
     device_port_MUX_uxn_device_h_l241_c2_cea4_cond <= VAR_device_port_MUX_uxn_device_h_l241_c2_cea4_cond;
     device_port_MUX_uxn_device_h_l241_c2_cea4_iftrue <= VAR_device_port_MUX_uxn_device_h_l241_c2_cea4_iftrue;
     device_port_MUX_uxn_device_h_l241_c2_cea4_iffalse <= VAR_device_port_MUX_uxn_device_h_l241_c2_cea4_iffalse;
     -- Outputs
     VAR_device_port_MUX_uxn_device_h_l241_c2_cea4_return_output := device_port_MUX_uxn_device_h_l241_c2_cea4_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l248_c24_f308_cond := VAR_BIN_OP_EQ_uxn_device_h_l248_c24_ca87_return_output;
     VAR_MUX_uxn_device_h_l254_c24_d437_cond := VAR_BIN_OP_EQ_uxn_device_h_l254_c24_3c8d_return_output;
     REG_VAR_device_index := VAR_device_index_MUX_uxn_device_h_l241_c2_cea4_return_output;
     REG_VAR_device_port := VAR_device_port_MUX_uxn_device_h_l241_c2_cea4_return_output;
     VAR_result_MUX_uxn_device_h_l250_c7_b176_iffalse := VAR_emu_deo_uxn_device_h_l257_c12_eb7e_return_output;
     -- MUX[uxn_device_h_l254_c24_d437] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l254_c24_d437_cond <= VAR_MUX_uxn_device_h_l254_c24_d437_cond;
     MUX_uxn_device_h_l254_c24_d437_iftrue <= VAR_MUX_uxn_device_h_l254_c24_d437_iftrue;
     MUX_uxn_device_h_l254_c24_d437_iffalse <= VAR_MUX_uxn_device_h_l254_c24_d437_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l254_c24_d437_return_output := MUX_uxn_device_h_l254_c24_d437_return_output;

     -- MUX[uxn_device_h_l248_c24_f308] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l248_c24_f308_cond <= VAR_MUX_uxn_device_h_l248_c24_f308_cond;
     MUX_uxn_device_h_l248_c24_f308_iftrue <= VAR_MUX_uxn_device_h_l248_c24_f308_iftrue;
     MUX_uxn_device_h_l248_c24_f308_iffalse <= VAR_MUX_uxn_device_h_l248_c24_f308_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l248_c24_f308_return_output := MUX_uxn_device_h_l248_c24_f308_return_output;

     -- Submodule level 5
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_e500[uxn_device_h_l241_c2_cea4] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_e500_uxn_device_h_l241_c2_cea4_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_e500(
     result,
     to_unsigned(0, 1),
     to_unsigned(1, 1),
     VAR_device_address,
     VAR_value,
     VAR_MUX_uxn_device_h_l248_c24_f308_return_output);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cf24[uxn_device_h_l250_c7_b176] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cf24_uxn_device_h_l250_c7_b176_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_cf24(
     result,
     to_unsigned(0, 1),
     VAR_MUX_uxn_device_h_l254_c24_d437_return_output);

     -- Submodule level 6
     VAR_result_MUX_uxn_device_h_l250_c7_b176_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cf24_uxn_device_h_l250_c7_b176_return_output;
     VAR_result_MUX_uxn_device_h_l241_c2_cea4_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_e500_uxn_device_h_l241_c2_cea4_return_output;
     -- result_MUX[uxn_device_h_l250_c7_b176] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l250_c7_b176_cond <= VAR_result_MUX_uxn_device_h_l250_c7_b176_cond;
     result_MUX_uxn_device_h_l250_c7_b176_iftrue <= VAR_result_MUX_uxn_device_h_l250_c7_b176_iftrue;
     result_MUX_uxn_device_h_l250_c7_b176_iffalse <= VAR_result_MUX_uxn_device_h_l250_c7_b176_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l250_c7_b176_return_output := result_MUX_uxn_device_h_l250_c7_b176_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_device_h_l241_c2_cea4_iffalse := VAR_result_MUX_uxn_device_h_l250_c7_b176_return_output;
     -- result_MUX[uxn_device_h_l241_c2_cea4] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l241_c2_cea4_cond <= VAR_result_MUX_uxn_device_h_l241_c2_cea4_cond;
     result_MUX_uxn_device_h_l241_c2_cea4_iftrue <= VAR_result_MUX_uxn_device_h_l241_c2_cea4_iftrue;
     result_MUX_uxn_device_h_l241_c2_cea4_iffalse <= VAR_result_MUX_uxn_device_h_l241_c2_cea4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l241_c2_cea4_return_output := result_MUX_uxn_device_h_l241_c2_cea4_return_output;

     -- Submodule level 8
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l241_c2_cea4_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l241_c2_cea4_return_output;
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
