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
-- Submodules: 22
entity device_out_0CLK_95124a2a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 value : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end device_out_0CLK_95124a2a;
architecture arch of device_out_0CLK_95124a2a is
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
u16_addr => to_unsigned(0, 16),
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
-- BIN_OP_EQ[uxn_device_h_l252_c6_399a]
signal BIN_OP_EQ_uxn_device_h_l252_c6_399a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l252_c6_399a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l252_c6_399a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l261_c7_a20b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l261_c7_a20b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l261_c7_a20b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l261_c7_a20b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l261_c7_a20b_return_output : unsigned(0 downto 0);

-- device_port_MUX[uxn_device_h_l252_c2_8e50]
signal device_port_MUX_uxn_device_h_l252_c2_8e50_cond : unsigned(0 downto 0);
signal device_port_MUX_uxn_device_h_l252_c2_8e50_iftrue : unsigned(3 downto 0);
signal device_port_MUX_uxn_device_h_l252_c2_8e50_iffalse : unsigned(3 downto 0);
signal device_port_MUX_uxn_device_h_l252_c2_8e50_return_output : unsigned(3 downto 0);

-- device_index_MUX[uxn_device_h_l252_c2_8e50]
signal device_index_MUX_uxn_device_h_l252_c2_8e50_cond : unsigned(0 downto 0);
signal device_index_MUX_uxn_device_h_l252_c2_8e50_iftrue : unsigned(3 downto 0);
signal device_index_MUX_uxn_device_h_l252_c2_8e50_iffalse : unsigned(3 downto 0);
signal device_index_MUX_uxn_device_h_l252_c2_8e50_return_output : unsigned(3 downto 0);

-- result_MUX[uxn_device_h_l252_c2_8e50]
signal result_MUX_uxn_device_h_l252_c2_8e50_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l252_c2_8e50_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l252_c2_8e50_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l252_c2_8e50_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_device_h_l257_c27_02e5]
signal BIN_OP_AND_uxn_device_h_l257_c27_02e5_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l257_c27_02e5_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l257_c27_02e5_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_device_h_l258_c28_eeff]
signal CONST_SR_4_uxn_device_h_l258_c28_eeff_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l258_c28_eeff_return_output : unsigned(7 downto 0);

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d[uxn_device_h_l259_c24_14fe]
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l259_c24_14fe_ref_toks_0 : uint16_t_16;
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l259_c24_14fe_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l259_c24_14fe_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l259_c24_9c20]
signal BIN_OP_EQ_uxn_device_h_l259_c24_9c20_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_device_h_l259_c24_9c20_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l259_c24_9c20_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l259_c24_0cd6]
signal MUX_uxn_device_h_l259_c24_0cd6_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l259_c24_0cd6_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l259_c24_0cd6_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l259_c24_0cd6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l261_c11_cc88]
signal BIN_OP_EQ_uxn_device_h_l261_c11_cc88_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l261_c11_cc88_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l261_c11_cc88_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l265_c1_82b6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l265_c1_82b6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l265_c1_82b6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l265_c1_82b6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l265_c1_82b6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l261_c7_a20b]
signal result_MUX_uxn_device_h_l261_c7_a20b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l261_c7_a20b_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l261_c7_a20b_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l261_c7_a20b_return_output : device_out_result_t;

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d[uxn_device_h_l263_c24_e4dc]
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l263_c24_e4dc_ref_toks_0 : uint16_t_16;
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l263_c24_e4dc_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l263_c24_e4dc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l263_c24_8abf]
signal BIN_OP_EQ_uxn_device_h_l263_c24_8abf_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_device_h_l263_c24_8abf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l263_c24_8abf_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l263_c24_8053]
signal MUX_uxn_device_h_l263_c24_8053_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l263_c24_8053_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l263_c24_8053_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l263_c24_8053_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l266_c47_9652]
signal BIN_OP_MINUS_uxn_device_h_l266_c47_9652_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l266_c47_9652_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l266_c47_9652_return_output : unsigned(7 downto 0);

-- emu_deo[uxn_device_h_l266_c12_dfdd]
signal emu_deo_uxn_device_h_l266_c12_dfdd_CLOCK_ENABLE : unsigned(0 downto 0);
signal emu_deo_uxn_device_h_l266_c12_dfdd_device_index : unsigned(3 downto 0);
signal emu_deo_uxn_device_h_l266_c12_dfdd_device_port : unsigned(3 downto 0);
signal emu_deo_uxn_device_h_l266_c12_dfdd_phase : unsigned(7 downto 0);
signal emu_deo_uxn_device_h_l266_c12_dfdd_previous_device_ram_read : unsigned(7 downto 0);
signal emu_deo_uxn_device_h_l266_c12_dfdd_previous_ram_read : unsigned(7 downto 0);
signal emu_deo_uxn_device_h_l266_c12_dfdd_return_output : device_out_result_t;

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
-- BIN_OP_EQ_uxn_device_h_l252_c6_399a
BIN_OP_EQ_uxn_device_h_l252_c6_399a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l252_c6_399a_left,
BIN_OP_EQ_uxn_device_h_l252_c6_399a_right,
BIN_OP_EQ_uxn_device_h_l252_c6_399a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l261_c7_a20b
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l261_c7_a20b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l261_c7_a20b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l261_c7_a20b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l261_c7_a20b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l261_c7_a20b_return_output);

-- device_port_MUX_uxn_device_h_l252_c2_8e50
device_port_MUX_uxn_device_h_l252_c2_8e50 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
device_port_MUX_uxn_device_h_l252_c2_8e50_cond,
device_port_MUX_uxn_device_h_l252_c2_8e50_iftrue,
device_port_MUX_uxn_device_h_l252_c2_8e50_iffalse,
device_port_MUX_uxn_device_h_l252_c2_8e50_return_output);

-- device_index_MUX_uxn_device_h_l252_c2_8e50
device_index_MUX_uxn_device_h_l252_c2_8e50 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
device_index_MUX_uxn_device_h_l252_c2_8e50_cond,
device_index_MUX_uxn_device_h_l252_c2_8e50_iftrue,
device_index_MUX_uxn_device_h_l252_c2_8e50_iffalse,
device_index_MUX_uxn_device_h_l252_c2_8e50_return_output);

-- result_MUX_uxn_device_h_l252_c2_8e50
result_MUX_uxn_device_h_l252_c2_8e50 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l252_c2_8e50_cond,
result_MUX_uxn_device_h_l252_c2_8e50_iftrue,
result_MUX_uxn_device_h_l252_c2_8e50_iffalse,
result_MUX_uxn_device_h_l252_c2_8e50_return_output);

-- BIN_OP_AND_uxn_device_h_l257_c27_02e5
BIN_OP_AND_uxn_device_h_l257_c27_02e5 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l257_c27_02e5_left,
BIN_OP_AND_uxn_device_h_l257_c27_02e5_right,
BIN_OP_AND_uxn_device_h_l257_c27_02e5_return_output);

-- CONST_SR_4_uxn_device_h_l258_c28_eeff
CONST_SR_4_uxn_device_h_l258_c28_eeff : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l258_c28_eeff_x,
CONST_SR_4_uxn_device_h_l258_c28_eeff_return_output);

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l259_c24_14fe
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l259_c24_14fe : entity work.VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_0CLK_763c90e8 port map (
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l259_c24_14fe_ref_toks_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l259_c24_14fe_var_dim_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l259_c24_14fe_return_output);

-- BIN_OP_EQ_uxn_device_h_l259_c24_9c20
BIN_OP_EQ_uxn_device_h_l259_c24_9c20 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l259_c24_9c20_left,
BIN_OP_EQ_uxn_device_h_l259_c24_9c20_right,
BIN_OP_EQ_uxn_device_h_l259_c24_9c20_return_output);

-- MUX_uxn_device_h_l259_c24_0cd6
MUX_uxn_device_h_l259_c24_0cd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l259_c24_0cd6_cond,
MUX_uxn_device_h_l259_c24_0cd6_iftrue,
MUX_uxn_device_h_l259_c24_0cd6_iffalse,
MUX_uxn_device_h_l259_c24_0cd6_return_output);

-- BIN_OP_EQ_uxn_device_h_l261_c11_cc88
BIN_OP_EQ_uxn_device_h_l261_c11_cc88 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l261_c11_cc88_left,
BIN_OP_EQ_uxn_device_h_l261_c11_cc88_right,
BIN_OP_EQ_uxn_device_h_l261_c11_cc88_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l265_c1_82b6
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l265_c1_82b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l265_c1_82b6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l265_c1_82b6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l265_c1_82b6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l265_c1_82b6_return_output);

-- result_MUX_uxn_device_h_l261_c7_a20b
result_MUX_uxn_device_h_l261_c7_a20b : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l261_c7_a20b_cond,
result_MUX_uxn_device_h_l261_c7_a20b_iftrue,
result_MUX_uxn_device_h_l261_c7_a20b_iffalse,
result_MUX_uxn_device_h_l261_c7_a20b_return_output);

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l263_c24_e4dc
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l263_c24_e4dc : entity work.VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_0CLK_763c90e8 port map (
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l263_c24_e4dc_ref_toks_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l263_c24_e4dc_var_dim_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l263_c24_e4dc_return_output);

-- BIN_OP_EQ_uxn_device_h_l263_c24_8abf
BIN_OP_EQ_uxn_device_h_l263_c24_8abf : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l263_c24_8abf_left,
BIN_OP_EQ_uxn_device_h_l263_c24_8abf_right,
BIN_OP_EQ_uxn_device_h_l263_c24_8abf_return_output);

-- MUX_uxn_device_h_l263_c24_8053
MUX_uxn_device_h_l263_c24_8053 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l263_c24_8053_cond,
MUX_uxn_device_h_l263_c24_8053_iftrue,
MUX_uxn_device_h_l263_c24_8053_iffalse,
MUX_uxn_device_h_l263_c24_8053_return_output);

-- BIN_OP_MINUS_uxn_device_h_l266_c47_9652
BIN_OP_MINUS_uxn_device_h_l266_c47_9652 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l266_c47_9652_left,
BIN_OP_MINUS_uxn_device_h_l266_c47_9652_right,
BIN_OP_MINUS_uxn_device_h_l266_c47_9652_return_output);

-- emu_deo_uxn_device_h_l266_c12_dfdd
emu_deo_uxn_device_h_l266_c12_dfdd : entity work.emu_deo_0CLK_228df8c6 port map (
clk,
emu_deo_uxn_device_h_l266_c12_dfdd_CLOCK_ENABLE,
emu_deo_uxn_device_h_l266_c12_dfdd_device_index,
emu_deo_uxn_device_h_l266_c12_dfdd_device_port,
emu_deo_uxn_device_h_l266_c12_dfdd_phase,
emu_deo_uxn_device_h_l266_c12_dfdd_previous_device_ram_read,
emu_deo_uxn_device_h_l266_c12_dfdd_previous_ram_read,
emu_deo_uxn_device_h_l266_c12_dfdd_return_output);



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
 BIN_OP_EQ_uxn_device_h_l252_c6_399a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l261_c7_a20b_return_output,
 device_port_MUX_uxn_device_h_l252_c2_8e50_return_output,
 device_index_MUX_uxn_device_h_l252_c2_8e50_return_output,
 result_MUX_uxn_device_h_l252_c2_8e50_return_output,
 BIN_OP_AND_uxn_device_h_l257_c27_02e5_return_output,
 CONST_SR_4_uxn_device_h_l258_c28_eeff_return_output,
 VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l259_c24_14fe_return_output,
 BIN_OP_EQ_uxn_device_h_l259_c24_9c20_return_output,
 MUX_uxn_device_h_l259_c24_0cd6_return_output,
 BIN_OP_EQ_uxn_device_h_l261_c11_cc88_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l265_c1_82b6_return_output,
 result_MUX_uxn_device_h_l261_c7_a20b_return_output,
 VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l263_c24_e4dc_return_output,
 BIN_OP_EQ_uxn_device_h_l263_c24_8abf_return_output,
 MUX_uxn_device_h_l263_c24_8053_return_output,
 BIN_OP_MINUS_uxn_device_h_l266_c47_9652_return_output,
 emu_deo_uxn_device_h_l266_c12_dfdd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_value : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l252_c6_399a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l252_c6_399a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l252_c6_399a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l261_c7_a20b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l261_c7_a20b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l261_c7_a20b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l261_c7_a20b_iffalse : unsigned(0 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l252_c2_8e50_iftrue : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l252_c2_8e50_iffalse : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l252_c2_8e50_return_output : unsigned(3 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l252_c2_8e50_cond : unsigned(0 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l252_c2_8e50_iftrue : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l252_c2_8e50_iffalse : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l252_c2_8e50_return_output : unsigned(3 downto 0);
 variable VAR_device_index_MUX_uxn_device_h_l252_c2_8e50_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l252_c2_8e50_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_e500_uxn_device_h_l252_c2_8e50_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l252_c2_8e50_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l261_c7_a20b_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l252_c2_8e50_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l252_c2_8e50_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l257_c27_02e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l257_c27_02e5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l257_c27_02e5_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l257_c17_ba48_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l258_c28_eeff_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l258_c28_eeff_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l258_c18_ee18_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_device_h_l259_c24_0cd6_cond : unsigned(0 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l259_c24_14fe_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l259_c24_14fe_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l259_c24_9c20_left : unsigned(15 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l259_c24_14fe_ref_toks_0 : uint16_t_16;
 variable VAR_BIN_OP_EQ_uxn_device_h_l259_c24_9c20_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l259_c24_9c20_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l259_c24_0cd6_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l259_c24_0cd6_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l259_c24_0cd6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l261_c11_cc88_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l261_c11_cc88_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l261_c11_cc88_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l265_c1_82b6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l265_c1_82b6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l265_c1_82b6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l265_c1_82b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l261_c7_a20b_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cf24_uxn_device_h_l261_c7_a20b_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l261_c7_a20b_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l261_c7_a20b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l263_c24_8053_cond : unsigned(0 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l263_c24_e4dc_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l263_c24_e4dc_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l263_c24_8abf_left : unsigned(15 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l263_c24_e4dc_ref_toks_0 : uint16_t_16;
 variable VAR_BIN_OP_EQ_uxn_device_h_l263_c24_8abf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l263_c24_8abf_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l263_c24_8053_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l263_c24_8053_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l263_c24_8053_return_output : unsigned(0 downto 0);
 variable VAR_emu_deo_uxn_device_h_l266_c12_dfdd_device_index : unsigned(3 downto 0);
 variable VAR_emu_deo_uxn_device_h_l266_c12_dfdd_device_port : unsigned(3 downto 0);
 variable VAR_emu_deo_uxn_device_h_l266_c12_dfdd_phase : unsigned(7 downto 0);
 variable VAR_emu_deo_uxn_device_h_l266_c12_dfdd_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_emu_deo_uxn_device_h_l266_c12_dfdd_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l266_c47_9652_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l266_c47_9652_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l266_c47_9652_return_output : unsigned(7 downto 0);
 variable VAR_emu_deo_uxn_device_h_l266_c12_dfdd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_emu_deo_uxn_device_h_l266_c12_dfdd_return_output : device_out_result_t;
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
     VAR_BIN_OP_EQ_uxn_device_h_l261_c11_cc88_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l263_c24_8053_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l261_c7_a20b_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l259_c24_0cd6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l266_c47_9652_right := to_unsigned(2, 2);
     VAR_BIN_OP_AND_uxn_device_h_l257_c27_02e5_right := to_unsigned(15, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l265_c1_82b6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l263_c24_8abf_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l259_c24_9c20_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l259_c24_0cd6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l252_c6_399a_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l263_c24_8053_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l261_c7_a20b_iffalse := VAR_CLOCK_ENABLE;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l259_c24_14fe_ref_toks_0 := deo_mask;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l263_c24_e4dc_ref_toks_0 := deo_mask;
     REG_VAR_deo_mask := deo_mask;
     VAR_BIN_OP_AND_uxn_device_h_l257_c27_02e5_left := VAR_device_address;
     VAR_CONST_SR_4_uxn_device_h_l258_c28_eeff_x := VAR_device_address;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l263_c24_e4dc_var_dim_0 := device_index;
     VAR_device_index_MUX_uxn_device_h_l252_c2_8e50_iffalse := device_index;
     VAR_emu_deo_uxn_device_h_l266_c12_dfdd_device_index := device_index;
     VAR_device_port_MUX_uxn_device_h_l252_c2_8e50_iffalse := device_port;
     VAR_emu_deo_uxn_device_h_l266_c12_dfdd_device_port := device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l252_c6_399a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l261_c11_cc88_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l266_c47_9652_left := VAR_phase;
     VAR_emu_deo_uxn_device_h_l266_c12_dfdd_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_emu_deo_uxn_device_h_l266_c12_dfdd_previous_ram_read := VAR_previous_ram_read;
     -- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d[uxn_device_h_l263_c24_e4dc] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l263_c24_e4dc_ref_toks_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l263_c24_e4dc_ref_toks_0;
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l263_c24_e4dc_var_dim_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l263_c24_e4dc_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l263_c24_e4dc_return_output := VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l263_c24_e4dc_return_output;

     -- BIN_OP_EQ[uxn_device_h_l261_c11_cc88] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l261_c11_cc88_left <= VAR_BIN_OP_EQ_uxn_device_h_l261_c11_cc88_left;
     BIN_OP_EQ_uxn_device_h_l261_c11_cc88_right <= VAR_BIN_OP_EQ_uxn_device_h_l261_c11_cc88_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l261_c11_cc88_return_output := BIN_OP_EQ_uxn_device_h_l261_c11_cc88_return_output;

     -- CONST_SR_4[uxn_device_h_l258_c28_eeff] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l258_c28_eeff_x <= VAR_CONST_SR_4_uxn_device_h_l258_c28_eeff_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l258_c28_eeff_return_output := CONST_SR_4_uxn_device_h_l258_c28_eeff_return_output;

     -- BIN_OP_AND[uxn_device_h_l257_c27_02e5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l257_c27_02e5_left <= VAR_BIN_OP_AND_uxn_device_h_l257_c27_02e5_left;
     BIN_OP_AND_uxn_device_h_l257_c27_02e5_right <= VAR_BIN_OP_AND_uxn_device_h_l257_c27_02e5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l257_c27_02e5_return_output := BIN_OP_AND_uxn_device_h_l257_c27_02e5_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l266_c47_9652] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l266_c47_9652_left <= VAR_BIN_OP_MINUS_uxn_device_h_l266_c47_9652_left;
     BIN_OP_MINUS_uxn_device_h_l266_c47_9652_right <= VAR_BIN_OP_MINUS_uxn_device_h_l266_c47_9652_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l266_c47_9652_return_output := BIN_OP_MINUS_uxn_device_h_l266_c47_9652_return_output;

     -- BIN_OP_EQ[uxn_device_h_l252_c6_399a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l252_c6_399a_left <= VAR_BIN_OP_EQ_uxn_device_h_l252_c6_399a_left;
     BIN_OP_EQ_uxn_device_h_l252_c6_399a_right <= VAR_BIN_OP_EQ_uxn_device_h_l252_c6_399a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l252_c6_399a_return_output := BIN_OP_EQ_uxn_device_h_l252_c6_399a_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l261_c7_a20b_cond := VAR_BIN_OP_EQ_uxn_device_h_l252_c6_399a_return_output;
     VAR_device_index_MUX_uxn_device_h_l252_c2_8e50_cond := VAR_BIN_OP_EQ_uxn_device_h_l252_c6_399a_return_output;
     VAR_device_port_MUX_uxn_device_h_l252_c2_8e50_cond := VAR_BIN_OP_EQ_uxn_device_h_l252_c6_399a_return_output;
     VAR_result_MUX_uxn_device_h_l252_c2_8e50_cond := VAR_BIN_OP_EQ_uxn_device_h_l252_c6_399a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l265_c1_82b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l261_c11_cc88_return_output;
     VAR_result_MUX_uxn_device_h_l261_c7_a20b_cond := VAR_BIN_OP_EQ_uxn_device_h_l261_c11_cc88_return_output;
     VAR_emu_deo_uxn_device_h_l266_c12_dfdd_phase := VAR_BIN_OP_MINUS_uxn_device_h_l266_c47_9652_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l263_c24_8abf_left := VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l263_c24_e4dc_return_output;
     -- CAST_TO_uint4_t[uxn_device_h_l258_c18_ee18] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l258_c18_ee18_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_CONST_SR_4_uxn_device_h_l258_c28_eeff_return_output);

     -- CAST_TO_uint4_t[uxn_device_h_l257_c17_ba48] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l257_c17_ba48_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_BIN_OP_AND_uxn_device_h_l257_c27_02e5_return_output);

     -- BIN_OP_EQ[uxn_device_h_l263_c24_8abf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l263_c24_8abf_left <= VAR_BIN_OP_EQ_uxn_device_h_l263_c24_8abf_left;
     BIN_OP_EQ_uxn_device_h_l263_c24_8abf_right <= VAR_BIN_OP_EQ_uxn_device_h_l263_c24_8abf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l263_c24_8abf_return_output := BIN_OP_EQ_uxn_device_h_l263_c24_8abf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l261_c7_a20b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l261_c7_a20b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l261_c7_a20b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l261_c7_a20b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l261_c7_a20b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l261_c7_a20b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l261_c7_a20b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l261_c7_a20b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l261_c7_a20b_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_device_h_l263_c24_8053_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c24_8abf_return_output;
     VAR_device_port_MUX_uxn_device_h_l252_c2_8e50_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l257_c17_ba48_return_output;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l259_c24_14fe_var_dim_0 := VAR_CAST_TO_uint4_t_uxn_device_h_l258_c18_ee18_return_output;
     VAR_device_index_MUX_uxn_device_h_l252_c2_8e50_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l258_c18_ee18_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l265_c1_82b6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l261_c7_a20b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l265_c1_82b6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l265_c1_82b6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l265_c1_82b6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l265_c1_82b6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l265_c1_82b6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l265_c1_82b6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l265_c1_82b6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l265_c1_82b6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l265_c1_82b6_return_output;

     -- device_index_MUX[uxn_device_h_l252_c2_8e50] LATENCY=0
     -- Inputs
     device_index_MUX_uxn_device_h_l252_c2_8e50_cond <= VAR_device_index_MUX_uxn_device_h_l252_c2_8e50_cond;
     device_index_MUX_uxn_device_h_l252_c2_8e50_iftrue <= VAR_device_index_MUX_uxn_device_h_l252_c2_8e50_iftrue;
     device_index_MUX_uxn_device_h_l252_c2_8e50_iffalse <= VAR_device_index_MUX_uxn_device_h_l252_c2_8e50_iffalse;
     -- Outputs
     VAR_device_index_MUX_uxn_device_h_l252_c2_8e50_return_output := device_index_MUX_uxn_device_h_l252_c2_8e50_return_output;

     -- MUX[uxn_device_h_l263_c24_8053] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l263_c24_8053_cond <= VAR_MUX_uxn_device_h_l263_c24_8053_cond;
     MUX_uxn_device_h_l263_c24_8053_iftrue <= VAR_MUX_uxn_device_h_l263_c24_8053_iftrue;
     MUX_uxn_device_h_l263_c24_8053_iffalse <= VAR_MUX_uxn_device_h_l263_c24_8053_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l263_c24_8053_return_output := MUX_uxn_device_h_l263_c24_8053_return_output;

     -- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d[uxn_device_h_l259_c24_14fe] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l259_c24_14fe_ref_toks_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l259_c24_14fe_ref_toks_0;
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l259_c24_14fe_var_dim_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l259_c24_14fe_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l259_c24_14fe_return_output := VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l259_c24_14fe_return_output;

     -- device_port_MUX[uxn_device_h_l252_c2_8e50] LATENCY=0
     -- Inputs
     device_port_MUX_uxn_device_h_l252_c2_8e50_cond <= VAR_device_port_MUX_uxn_device_h_l252_c2_8e50_cond;
     device_port_MUX_uxn_device_h_l252_c2_8e50_iftrue <= VAR_device_port_MUX_uxn_device_h_l252_c2_8e50_iftrue;
     device_port_MUX_uxn_device_h_l252_c2_8e50_iffalse <= VAR_device_port_MUX_uxn_device_h_l252_c2_8e50_iffalse;
     -- Outputs
     VAR_device_port_MUX_uxn_device_h_l252_c2_8e50_return_output := device_port_MUX_uxn_device_h_l252_c2_8e50_return_output;

     -- Submodule level 3
     VAR_emu_deo_uxn_device_h_l266_c12_dfdd_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l265_c1_82b6_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l259_c24_9c20_left := VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l259_c24_14fe_return_output;
     REG_VAR_device_index := VAR_device_index_MUX_uxn_device_h_l252_c2_8e50_return_output;
     REG_VAR_device_port := VAR_device_port_MUX_uxn_device_h_l252_c2_8e50_return_output;
     -- BIN_OP_EQ[uxn_device_h_l259_c24_9c20] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l259_c24_9c20_left <= VAR_BIN_OP_EQ_uxn_device_h_l259_c24_9c20_left;
     BIN_OP_EQ_uxn_device_h_l259_c24_9c20_right <= VAR_BIN_OP_EQ_uxn_device_h_l259_c24_9c20_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l259_c24_9c20_return_output := BIN_OP_EQ_uxn_device_h_l259_c24_9c20_return_output;

     -- emu_deo[uxn_device_h_l266_c12_dfdd] LATENCY=0
     -- Clock enable
     emu_deo_uxn_device_h_l266_c12_dfdd_CLOCK_ENABLE <= VAR_emu_deo_uxn_device_h_l266_c12_dfdd_CLOCK_ENABLE;
     -- Inputs
     emu_deo_uxn_device_h_l266_c12_dfdd_device_index <= VAR_emu_deo_uxn_device_h_l266_c12_dfdd_device_index;
     emu_deo_uxn_device_h_l266_c12_dfdd_device_port <= VAR_emu_deo_uxn_device_h_l266_c12_dfdd_device_port;
     emu_deo_uxn_device_h_l266_c12_dfdd_phase <= VAR_emu_deo_uxn_device_h_l266_c12_dfdd_phase;
     emu_deo_uxn_device_h_l266_c12_dfdd_previous_device_ram_read <= VAR_emu_deo_uxn_device_h_l266_c12_dfdd_previous_device_ram_read;
     emu_deo_uxn_device_h_l266_c12_dfdd_previous_ram_read <= VAR_emu_deo_uxn_device_h_l266_c12_dfdd_previous_ram_read;
     -- Outputs
     VAR_emu_deo_uxn_device_h_l266_c12_dfdd_return_output := emu_deo_uxn_device_h_l266_c12_dfdd_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cf24[uxn_device_h_l261_c7_a20b] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cf24_uxn_device_h_l261_c7_a20b_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_cf24(
     result,
     to_unsigned(0, 1),
     VAR_MUX_uxn_device_h_l263_c24_8053_return_output);

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l259_c24_0cd6_cond := VAR_BIN_OP_EQ_uxn_device_h_l259_c24_9c20_return_output;
     VAR_result_MUX_uxn_device_h_l261_c7_a20b_iffalse := VAR_emu_deo_uxn_device_h_l266_c12_dfdd_return_output;
     VAR_result_MUX_uxn_device_h_l261_c7_a20b_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cf24_uxn_device_h_l261_c7_a20b_return_output;
     -- MUX[uxn_device_h_l259_c24_0cd6] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l259_c24_0cd6_cond <= VAR_MUX_uxn_device_h_l259_c24_0cd6_cond;
     MUX_uxn_device_h_l259_c24_0cd6_iftrue <= VAR_MUX_uxn_device_h_l259_c24_0cd6_iftrue;
     MUX_uxn_device_h_l259_c24_0cd6_iffalse <= VAR_MUX_uxn_device_h_l259_c24_0cd6_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l259_c24_0cd6_return_output := MUX_uxn_device_h_l259_c24_0cd6_return_output;

     -- result_MUX[uxn_device_h_l261_c7_a20b] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l261_c7_a20b_cond <= VAR_result_MUX_uxn_device_h_l261_c7_a20b_cond;
     result_MUX_uxn_device_h_l261_c7_a20b_iftrue <= VAR_result_MUX_uxn_device_h_l261_c7_a20b_iftrue;
     result_MUX_uxn_device_h_l261_c7_a20b_iffalse <= VAR_result_MUX_uxn_device_h_l261_c7_a20b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l261_c7_a20b_return_output := result_MUX_uxn_device_h_l261_c7_a20b_return_output;

     -- Submodule level 5
     VAR_result_MUX_uxn_device_h_l252_c2_8e50_iffalse := VAR_result_MUX_uxn_device_h_l261_c7_a20b_return_output;
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_e500[uxn_device_h_l252_c2_8e50] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_e500_uxn_device_h_l252_c2_8e50_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_e500(
     result,
     to_unsigned(0, 1),
     to_unsigned(1, 1),
     VAR_device_address,
     VAR_value,
     VAR_MUX_uxn_device_h_l259_c24_0cd6_return_output);

     -- Submodule level 6
     VAR_result_MUX_uxn_device_h_l252_c2_8e50_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_e500_uxn_device_h_l252_c2_8e50_return_output;
     -- result_MUX[uxn_device_h_l252_c2_8e50] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l252_c2_8e50_cond <= VAR_result_MUX_uxn_device_h_l252_c2_8e50_cond;
     result_MUX_uxn_device_h_l252_c2_8e50_iftrue <= VAR_result_MUX_uxn_device_h_l252_c2_8e50_iftrue;
     result_MUX_uxn_device_h_l252_c2_8e50_iffalse <= VAR_result_MUX_uxn_device_h_l252_c2_8e50_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l252_c2_8e50_return_output := result_MUX_uxn_device_h_l252_c2_8e50_return_output;

     -- Submodule level 7
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l252_c2_8e50_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l252_c2_8e50_return_output;
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
