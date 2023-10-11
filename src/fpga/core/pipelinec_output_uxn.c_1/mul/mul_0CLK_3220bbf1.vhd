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
-- Submodules: 59
entity mul_0CLK_3220bbf1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end mul_0CLK_3220bbf1;
architecture arch of mul_0CLK_3220bbf1 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2139_c6_cd12]
signal BIN_OP_EQ_uxn_opcodes_h_l2139_c6_cd12_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2139_c6_cd12_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2139_c6_cd12_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2139_c1_8724]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2139_c1_8724_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2139_c1_8724_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2139_c1_8724_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2139_c1_8724_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2139_c2_514c]
signal n8_MUX_uxn_opcodes_h_l2139_c2_514c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2139_c2_514c_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2139_c2_514c]
signal t8_MUX_uxn_opcodes_h_l2139_c2_514c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2139_c2_514c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2139_c2_514c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2139_c2_514c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2139_c2_514c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2139_c2_514c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c2_514c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c2_514c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2139_c2_514c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c2_514c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c2_514c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2139_c2_514c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c2_514c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c2_514c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2139_c2_514c]
signal result_stack_value_MUX_uxn_opcodes_h_l2139_c2_514c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2139_c2_514c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2139_c2_514c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2139_c2_514c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2139_c2_514c_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2140_c3_5b9d[uxn_opcodes_h_l2140_c3_5b9d]
signal printf_uxn_opcodes_h_l2140_c3_5b9d_uxn_opcodes_h_l2140_c3_5b9d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2144_c11_cf70]
signal BIN_OP_EQ_uxn_opcodes_h_l2144_c11_cf70_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2144_c11_cf70_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2144_c11_cf70_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2144_c7_094f]
signal n8_MUX_uxn_opcodes_h_l2144_c7_094f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2144_c7_094f_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2144_c7_094f]
signal t8_MUX_uxn_opcodes_h_l2144_c7_094f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2144_c7_094f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2144_c7_094f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_094f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_094f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2144_c7_094f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_094f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_094f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2144_c7_094f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_094f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_094f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2144_c7_094f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_094f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_094f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2144_c7_094f]
signal result_stack_value_MUX_uxn_opcodes_h_l2144_c7_094f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2144_c7_094f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2144_c7_094f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_094f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_094f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2147_c11_f08e]
signal BIN_OP_EQ_uxn_opcodes_h_l2147_c11_f08e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2147_c11_f08e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2147_c11_f08e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2147_c7_68ef]
signal n8_MUX_uxn_opcodes_h_l2147_c7_68ef_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2147_c7_68ef]
signal t8_MUX_uxn_opcodes_h_l2147_c7_68ef_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2147_c7_68ef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_68ef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2147_c7_68ef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2147_c7_68ef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_68ef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2147_c7_68ef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2147_c7_68ef]
signal result_stack_value_MUX_uxn_opcodes_h_l2147_c7_68ef_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2147_c7_68ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_68ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2151_c11_f071]
signal BIN_OP_EQ_uxn_opcodes_h_l2151_c11_f071_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2151_c11_f071_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2151_c11_f071_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2151_c7_d3ff]
signal n8_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2151_c7_d3ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2151_c7_d3ff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2151_c7_d3ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2151_c7_d3ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2151_c7_d3ff]
signal result_stack_value_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2151_c7_d3ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2154_c11_a391]
signal BIN_OP_EQ_uxn_opcodes_h_l2154_c11_a391_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2154_c11_a391_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2154_c11_a391_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2154_c7_754f]
signal n8_MUX_uxn_opcodes_h_l2154_c7_754f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2154_c7_754f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2154_c7_754f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_754f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_754f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2154_c7_754f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_754f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_754f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2154_c7_754f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_754f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_754f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2154_c7_754f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_754f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_754f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2154_c7_754f]
signal result_stack_value_MUX_uxn_opcodes_h_l2154_c7_754f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2154_c7_754f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2154_c7_754f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_754f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_754f_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2157_c32_8a71]
signal BIN_OP_AND_uxn_opcodes_h_l2157_c32_8a71_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2157_c32_8a71_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2157_c32_8a71_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2157_c32_4421]
signal BIN_OP_GT_uxn_opcodes_h_l2157_c32_4421_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2157_c32_4421_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2157_c32_4421_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2157_c32_b5c0]
signal MUX_uxn_opcodes_h_l2157_c32_b5c0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2157_c32_b5c0_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2157_c32_b5c0_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2157_c32_b5c0_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2159_c11_d444]
signal BIN_OP_EQ_uxn_opcodes_h_l2159_c11_d444_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2159_c11_d444_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2159_c11_d444_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2159_c7_18f6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_18f6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2159_c7_18f6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_18f6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2159_c7_18f6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_18f6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2159_c7_18f6]
signal result_stack_value_MUX_uxn_opcodes_h_l2159_c7_18f6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2159_c7_18f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_18f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output : unsigned(0 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2163_c24_ba69]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2163_c24_ba69_left : unsigned(7 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2163_c24_ba69_right : unsigned(7 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2163_c24_ba69_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2165_c11_d22b]
signal BIN_OP_EQ_uxn_opcodes_h_l2165_c11_d22b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2165_c11_d22b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2165_c11_d22b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2165_c7_cfc3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2165_c7_cfc3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2165_c7_cfc3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2165_c7_cfc3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2165_c7_cfc3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2165_c7_cfc3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2165_c7_cfc3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2165_c7_cfc3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2165_c7_cfc3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2165_c7_cfc3_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_09c5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2139_c6_cd12
BIN_OP_EQ_uxn_opcodes_h_l2139_c6_cd12 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2139_c6_cd12_left,
BIN_OP_EQ_uxn_opcodes_h_l2139_c6_cd12_right,
BIN_OP_EQ_uxn_opcodes_h_l2139_c6_cd12_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2139_c1_8724
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2139_c1_8724 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2139_c1_8724_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2139_c1_8724_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2139_c1_8724_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2139_c1_8724_return_output);

-- n8_MUX_uxn_opcodes_h_l2139_c2_514c
n8_MUX_uxn_opcodes_h_l2139_c2_514c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2139_c2_514c_cond,
n8_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue,
n8_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse,
n8_MUX_uxn_opcodes_h_l2139_c2_514c_return_output);

-- t8_MUX_uxn_opcodes_h_l2139_c2_514c
t8_MUX_uxn_opcodes_h_l2139_c2_514c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2139_c2_514c_cond,
t8_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue,
t8_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse,
t8_MUX_uxn_opcodes_h_l2139_c2_514c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2139_c2_514c
result_is_stack_write_MUX_uxn_opcodes_h_l2139_c2_514c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2139_c2_514c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2139_c2_514c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c2_514c
result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c2_514c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c2_514c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c2_514c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c2_514c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c2_514c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c2_514c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c2_514c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c2_514c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c2_514c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c2_514c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c2_514c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2139_c2_514c
result_stack_value_MUX_uxn_opcodes_h_l2139_c2_514c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2139_c2_514c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2139_c2_514c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2139_c2_514c
result_is_opc_done_MUX_uxn_opcodes_h_l2139_c2_514c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2139_c2_514c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2139_c2_514c_return_output);

-- printf_uxn_opcodes_h_l2140_c3_5b9d_uxn_opcodes_h_l2140_c3_5b9d
printf_uxn_opcodes_h_l2140_c3_5b9d_uxn_opcodes_h_l2140_c3_5b9d : entity work.printf_uxn_opcodes_h_l2140_c3_5b9d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2140_c3_5b9d_uxn_opcodes_h_l2140_c3_5b9d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2144_c11_cf70
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_cf70 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_cf70_left,
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_cf70_right,
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_cf70_return_output);

-- n8_MUX_uxn_opcodes_h_l2144_c7_094f
n8_MUX_uxn_opcodes_h_l2144_c7_094f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2144_c7_094f_cond,
n8_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue,
n8_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse,
n8_MUX_uxn_opcodes_h_l2144_c7_094f_return_output);

-- t8_MUX_uxn_opcodes_h_l2144_c7_094f
t8_MUX_uxn_opcodes_h_l2144_c7_094f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2144_c7_094f_cond,
t8_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue,
t8_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse,
t8_MUX_uxn_opcodes_h_l2144_c7_094f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_094f
result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_094f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_094f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_094f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_094f
result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_094f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_094f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_094f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_094f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_094f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_094f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_094f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_094f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_094f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_094f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_094f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2144_c7_094f
result_stack_value_MUX_uxn_opcodes_h_l2144_c7_094f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2144_c7_094f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2144_c7_094f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_094f
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_094f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_094f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_094f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2147_c11_f08e
BIN_OP_EQ_uxn_opcodes_h_l2147_c11_f08e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2147_c11_f08e_left,
BIN_OP_EQ_uxn_opcodes_h_l2147_c11_f08e_right,
BIN_OP_EQ_uxn_opcodes_h_l2147_c11_f08e_return_output);

-- n8_MUX_uxn_opcodes_h_l2147_c7_68ef
n8_MUX_uxn_opcodes_h_l2147_c7_68ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2147_c7_68ef_cond,
n8_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue,
n8_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse,
n8_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output);

-- t8_MUX_uxn_opcodes_h_l2147_c7_68ef
t8_MUX_uxn_opcodes_h_l2147_c7_68ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2147_c7_68ef_cond,
t8_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue,
t8_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse,
t8_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_68ef
result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_68ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_68ef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_68ef
result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_68ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_68ef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_68ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_68ef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_68ef
result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_68ef : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2147_c7_68ef
result_stack_value_MUX_uxn_opcodes_h_l2147_c7_68ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2147_c7_68ef_cond,
result_stack_value_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_68ef
result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_68ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_68ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2151_c11_f071
BIN_OP_EQ_uxn_opcodes_h_l2151_c11_f071 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2151_c11_f071_left,
BIN_OP_EQ_uxn_opcodes_h_l2151_c11_f071_right,
BIN_OP_EQ_uxn_opcodes_h_l2151_c11_f071_return_output);

-- n8_MUX_uxn_opcodes_h_l2151_c7_d3ff
n8_MUX_uxn_opcodes_h_l2151_c7_d3ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond,
n8_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue,
n8_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse,
n8_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_d3ff
result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_d3ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff
result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_d3ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_d3ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2151_c7_d3ff
result_stack_value_MUX_uxn_opcodes_h_l2151_c7_d3ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond,
result_stack_value_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_d3ff
result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_d3ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2154_c11_a391
BIN_OP_EQ_uxn_opcodes_h_l2154_c11_a391 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2154_c11_a391_left,
BIN_OP_EQ_uxn_opcodes_h_l2154_c11_a391_right,
BIN_OP_EQ_uxn_opcodes_h_l2154_c11_a391_return_output);

-- n8_MUX_uxn_opcodes_h_l2154_c7_754f
n8_MUX_uxn_opcodes_h_l2154_c7_754f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2154_c7_754f_cond,
n8_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue,
n8_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse,
n8_MUX_uxn_opcodes_h_l2154_c7_754f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_754f
result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_754f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_754f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_754f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_754f
result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_754f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_754f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_754f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_754f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_754f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_754f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_754f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_754f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_754f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_754f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_754f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2154_c7_754f
result_stack_value_MUX_uxn_opcodes_h_l2154_c7_754f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2154_c7_754f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2154_c7_754f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_754f
result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_754f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_754f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_754f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2157_c32_8a71
BIN_OP_AND_uxn_opcodes_h_l2157_c32_8a71 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2157_c32_8a71_left,
BIN_OP_AND_uxn_opcodes_h_l2157_c32_8a71_right,
BIN_OP_AND_uxn_opcodes_h_l2157_c32_8a71_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2157_c32_4421
BIN_OP_GT_uxn_opcodes_h_l2157_c32_4421 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2157_c32_4421_left,
BIN_OP_GT_uxn_opcodes_h_l2157_c32_4421_right,
BIN_OP_GT_uxn_opcodes_h_l2157_c32_4421_return_output);

-- MUX_uxn_opcodes_h_l2157_c32_b5c0
MUX_uxn_opcodes_h_l2157_c32_b5c0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2157_c32_b5c0_cond,
MUX_uxn_opcodes_h_l2157_c32_b5c0_iftrue,
MUX_uxn_opcodes_h_l2157_c32_b5c0_iffalse,
MUX_uxn_opcodes_h_l2157_c32_b5c0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2159_c11_d444
BIN_OP_EQ_uxn_opcodes_h_l2159_c11_d444 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2159_c11_d444_left,
BIN_OP_EQ_uxn_opcodes_h_l2159_c11_d444_right,
BIN_OP_EQ_uxn_opcodes_h_l2159_c11_d444_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_18f6
result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_18f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_18f6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_18f6
result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_18f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_18f6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_18f6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_18f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_18f6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2159_c7_18f6
result_stack_value_MUX_uxn_opcodes_h_l2159_c7_18f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2159_c7_18f6_cond,
result_stack_value_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_18f6
result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_18f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_18f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2163_c24_ba69
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2163_c24_ba69 : entity work.BIN_OP_INFERRED_MULT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2163_c24_ba69_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2163_c24_ba69_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2163_c24_ba69_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2165_c11_d22b
BIN_OP_EQ_uxn_opcodes_h_l2165_c11_d22b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2165_c11_d22b_left,
BIN_OP_EQ_uxn_opcodes_h_l2165_c11_d22b_right,
BIN_OP_EQ_uxn_opcodes_h_l2165_c11_d22b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2165_c7_cfc3
result_is_stack_write_MUX_uxn_opcodes_h_l2165_c7_cfc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2165_c7_cfc3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2165_c7_cfc3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2165_c7_cfc3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2165_c7_cfc3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2165_c7_cfc3
result_is_opc_done_MUX_uxn_opcodes_h_l2165_c7_cfc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2165_c7_cfc3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2165_c7_cfc3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2165_c7_cfc3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2165_c7_cfc3_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2139_c6_cd12_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2139_c1_8724_return_output,
 n8_MUX_uxn_opcodes_h_l2139_c2_514c_return_output,
 t8_MUX_uxn_opcodes_h_l2139_c2_514c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2139_c2_514c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c2_514c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c2_514c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c2_514c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2139_c2_514c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2139_c2_514c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2144_c11_cf70_return_output,
 n8_MUX_uxn_opcodes_h_l2144_c7_094f_return_output,
 t8_MUX_uxn_opcodes_h_l2144_c7_094f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_094f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_094f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_094f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_094f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2144_c7_094f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_094f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2147_c11_f08e_return_output,
 n8_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output,
 t8_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2151_c11_f071_return_output,
 n8_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2154_c11_a391_return_output,
 n8_MUX_uxn_opcodes_h_l2154_c7_754f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_754f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_754f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_754f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_754f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2154_c7_754f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_754f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2157_c32_8a71_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2157_c32_4421_return_output,
 MUX_uxn_opcodes_h_l2157_c32_b5c0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2159_c11_d444_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2163_c24_ba69_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2165_c11_d22b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2165_c7_cfc3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2165_c7_cfc3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c6_cd12_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c6_cd12_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c6_cd12_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2139_c1_8724_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2139_c1_8724_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2139_c1_8724_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2139_c1_8724_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2144_c7_094f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2139_c2_514c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2139_c2_514c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2144_c7_094f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2139_c2_514c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2139_c2_514c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_094f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c2_514c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c2_514c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_094f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c2_514c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c2_514c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2141_c3_7534 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_094f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c2_514c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c2_514c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_094f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c2_514c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c2_514c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2144_c7_094f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2139_c2_514c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2139_c2_514c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_094f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c2_514c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c2_514c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2140_c3_5b9d_uxn_opcodes_h_l2140_c3_5b9d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_cf70_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_cf70_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_cf70_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2144_c7_094f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2144_c7_094f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_094f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_094f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2145_c3_5e00 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_094f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_094f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2144_c7_094f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_094f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_f08e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_f08e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_f08e_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2147_c7_68ef_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2147_c7_68ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_68ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2149_c3_48e6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_68ef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2147_c7_68ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_68ef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_f071_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_f071_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_f071_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2154_c7_754f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_754f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_754f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2152_c3_24fa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_754f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_754f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c7_754f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_754f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_a391_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_a391_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_a391_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2154_c7_754f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_754f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_754f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_754f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_754f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c7_754f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_754f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2157_c32_b5c0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2157_c32_b5c0_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2157_c32_b5c0_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2157_c32_8a71_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2157_c32_8a71_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2157_c32_8a71_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2157_c32_4421_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2157_c32_4421_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2157_c32_4421_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2157_c32_b5c0_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_d444_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_d444_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_d444_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2165_c7_cfc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_18f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_18f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2162_c3_b553 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_18f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_uxn_opcodes_h_l2163_c3_30b7 : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2159_c7_18f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2165_c7_cfc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_18f6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2163_c24_ba69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2163_c24_ba69_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2163_c24_ba69_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2165_c11_d22b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2165_c11_d22b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2165_c11_d22b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2165_c7_cfc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2165_c7_cfc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2165_c7_cfc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2165_c7_cfc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2165_c7_cfc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2165_c7_cfc3_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2165_l2154_DUPLICATE_f062_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2159_DUPLICATE_b2c5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2154_DUPLICATE_e9ed_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2159_l2154_DUPLICATE_0d40_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2165_l2159_l2154_DUPLICATE_4fdf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2154_l2159_DUPLICATE_f5bf_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2170_l2135_DUPLICATE_611f_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2162_c3_b553 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2162_c3_b553;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_f08e_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_d444_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2149_c3_48e6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2149_c3_48e6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2141_c3_7534 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2141_c3_7534;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2157_c32_8a71_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_f071_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2145_c3_5e00 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2145_c3_5e00;
     VAR_MUX_uxn_opcodes_h_l2157_c32_b5c0_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2152_c3_24fa := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2152_c3_24fa;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2165_c7_cfc3_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2157_c32_b5c0_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2139_c1_8724_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_a391_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c6_cd12_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2157_c32_4421_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2165_c11_d22b_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2165_c7_cfc3_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_cf70_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2139_c1_8724_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2157_c32_8a71_left := VAR_ins;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2163_c24_ba69_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c6_cd12_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_cf70_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_f08e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_f071_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_a391_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_d444_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2165_c11_d22b_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2163_c24_ba69_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2154_l2159_DUPLICATE_f5bf LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2154_l2159_DUPLICATE_f5bf_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2154_DUPLICATE_e9ed LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2154_DUPLICATE_e9ed_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2159_DUPLICATE_b2c5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2159_DUPLICATE_b2c5_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2139_c6_cd12] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2139_c6_cd12_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c6_cd12_left;
     BIN_OP_EQ_uxn_opcodes_h_l2139_c6_cd12_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c6_cd12_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c6_cd12_return_output := BIN_OP_EQ_uxn_opcodes_h_l2139_c6_cd12_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2165_l2159_l2154_DUPLICATE_4fdf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2165_l2159_l2154_DUPLICATE_4fdf_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2165_c11_d22b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2165_c11_d22b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2165_c11_d22b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2165_c11_d22b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2165_c11_d22b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2165_c11_d22b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2165_c11_d22b_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2157_c32_8a71] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2157_c32_8a71_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2157_c32_8a71_left;
     BIN_OP_AND_uxn_opcodes_h_l2157_c32_8a71_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2157_c32_8a71_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2157_c32_8a71_return_output := BIN_OP_AND_uxn_opcodes_h_l2157_c32_8a71_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2147_c11_f08e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2147_c11_f08e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_f08e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2147_c11_f08e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_f08e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_f08e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2147_c11_f08e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2165_l2154_DUPLICATE_f062 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2165_l2154_DUPLICATE_f062_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2144_c11_cf70] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2144_c11_cf70_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_cf70_left;
     BIN_OP_EQ_uxn_opcodes_h_l2144_c11_cf70_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_cf70_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_cf70_return_output := BIN_OP_EQ_uxn_opcodes_h_l2144_c11_cf70_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2151_c11_f071] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2151_c11_f071_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_f071_left;
     BIN_OP_EQ_uxn_opcodes_h_l2151_c11_f071_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_f071_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_f071_return_output := BIN_OP_EQ_uxn_opcodes_h_l2151_c11_f071_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2163_c24_ba69] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2163_c24_ba69_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2163_c24_ba69_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2163_c24_ba69_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2163_c24_ba69_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2163_c24_ba69_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2163_c24_ba69_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2159_c11_d444] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2159_c11_d444_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_d444_left;
     BIN_OP_EQ_uxn_opcodes_h_l2159_c11_d444_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_d444_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_d444_return_output := BIN_OP_EQ_uxn_opcodes_h_l2159_c11_d444_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2159_l2154_DUPLICATE_0d40 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2159_l2154_DUPLICATE_0d40_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2154_c11_a391] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2154_c11_a391_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_a391_left;
     BIN_OP_EQ_uxn_opcodes_h_l2154_c11_a391_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_a391_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_a391_return_output := BIN_OP_EQ_uxn_opcodes_h_l2154_c11_a391_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2157_c32_4421_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2157_c32_8a71_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2139_c1_8724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c6_cd12_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2139_c2_514c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c6_cd12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c2_514c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c6_cd12_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c2_514c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c6_cd12_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c2_514c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c6_cd12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c2_514c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c6_cd12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c2_514c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c6_cd12_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2139_c2_514c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c6_cd12_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2139_c2_514c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c6_cd12_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2144_c7_094f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_cf70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_094f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_cf70_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_094f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_cf70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_094f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_cf70_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_094f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_cf70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_094f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_cf70_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2144_c7_094f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_cf70_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2144_c7_094f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_cf70_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2147_c7_68ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_f08e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_68ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_f08e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_f08e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_68ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_f08e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_f08e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_68ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_f08e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2147_c7_68ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_f08e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2147_c7_68ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_f08e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_f071_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_f071_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_f071_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_f071_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_f071_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_f071_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_f071_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2154_c7_754f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_a391_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_754f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_a391_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_754f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_a391_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_754f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_a391_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_754f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_a391_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_754f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_a391_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c7_754f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_a391_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_18f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_d444_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_18f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_d444_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_18f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_d444_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_18f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_d444_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2159_c7_18f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_d444_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2165_c7_cfc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2165_c11_d22b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2165_c7_cfc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2165_c11_d22b_return_output;
     VAR_result_stack_value_uxn_opcodes_h_l2163_c3_30b7 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2163_c24_ba69_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2154_DUPLICATE_e9ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2154_DUPLICATE_e9ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2154_DUPLICATE_e9ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2154_DUPLICATE_e9ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2154_DUPLICATE_e9ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2165_l2159_l2154_DUPLICATE_4fdf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2165_l2159_l2154_DUPLICATE_4fdf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2165_l2159_l2154_DUPLICATE_4fdf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2165_l2159_l2154_DUPLICATE_4fdf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2165_l2159_l2154_DUPLICATE_4fdf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2165_c7_cfc3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2165_l2159_l2154_DUPLICATE_4fdf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2159_DUPLICATE_b2c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2159_DUPLICATE_b2c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2159_DUPLICATE_b2c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2159_DUPLICATE_b2c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2159_DUPLICATE_b2c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2165_l2154_DUPLICATE_f062_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2165_l2154_DUPLICATE_f062_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2165_l2154_DUPLICATE_f062_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2165_l2154_DUPLICATE_f062_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2165_l2154_DUPLICATE_f062_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2165_c7_cfc3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2165_l2154_DUPLICATE_f062_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2154_l2159_DUPLICATE_f5bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2154_l2159_DUPLICATE_f5bf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2159_l2154_DUPLICATE_0d40_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2159_l2154_DUPLICATE_0d40_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2159_l2154_DUPLICATE_0d40_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2159_l2154_DUPLICATE_0d40_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2159_l2154_DUPLICATE_0d40_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2151_l2147_l2144_l2139_l2159_l2154_DUPLICATE_0d40_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue := VAR_result_stack_value_uxn_opcodes_h_l2163_c3_30b7;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2159_c7_18f6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_18f6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_18f6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2159_c7_18f6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2159_c7_18f6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2159_c7_18f6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output := result_stack_value_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2165_c7_cfc3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2165_c7_cfc3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2165_c7_cfc3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2165_c7_cfc3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2165_c7_cfc3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2165_c7_cfc3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2165_c7_cfc3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2165_c7_cfc3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2165_c7_cfc3_return_output;

     -- n8_MUX[uxn_opcodes_h_l2154_c7_754f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2154_c7_754f_cond <= VAR_n8_MUX_uxn_opcodes_h_l2154_c7_754f_cond;
     n8_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue;
     n8_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2154_c7_754f_return_output := n8_MUX_uxn_opcodes_h_l2154_c7_754f_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2157_c32_4421] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2157_c32_4421_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2157_c32_4421_left;
     BIN_OP_GT_uxn_opcodes_h_l2157_c32_4421_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2157_c32_4421_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2157_c32_4421_return_output := BIN_OP_GT_uxn_opcodes_h_l2157_c32_4421_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2165_c7_cfc3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2165_c7_cfc3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2165_c7_cfc3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2165_c7_cfc3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2165_c7_cfc3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2165_c7_cfc3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2165_c7_cfc3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2165_c7_cfc3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2165_c7_cfc3_return_output;

     -- t8_MUX[uxn_opcodes_h_l2147_c7_68ef] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2147_c7_68ef_cond <= VAR_t8_MUX_uxn_opcodes_h_l2147_c7_68ef_cond;
     t8_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue;
     t8_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output := t8_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2139_c1_8724] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2139_c1_8724_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2139_c1_8724_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2139_c1_8724_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2139_c1_8724_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2139_c1_8724_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2139_c1_8724_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2139_c1_8724_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2139_c1_8724_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2159_c7_18f6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_18f6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_18f6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2157_c32_b5c0_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2157_c32_4421_return_output;
     VAR_printf_uxn_opcodes_h_l2140_c3_5b9d_uxn_opcodes_h_l2140_c3_5b9d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2139_c1_8724_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2154_c7_754f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2165_c7_cfc3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2165_c7_cfc3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output;
     -- printf_uxn_opcodes_h_l2140_c3_5b9d[uxn_opcodes_h_l2140_c3_5b9d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2140_c3_5b9d_uxn_opcodes_h_l2140_c3_5b9d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2140_c3_5b9d_uxn_opcodes_h_l2140_c3_5b9d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l2157_c32_b5c0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2157_c32_b5c0_cond <= VAR_MUX_uxn_opcodes_h_l2157_c32_b5c0_cond;
     MUX_uxn_opcodes_h_l2157_c32_b5c0_iftrue <= VAR_MUX_uxn_opcodes_h_l2157_c32_b5c0_iftrue;
     MUX_uxn_opcodes_h_l2157_c32_b5c0_iffalse <= VAR_MUX_uxn_opcodes_h_l2157_c32_b5c0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2157_c32_b5c0_return_output := MUX_uxn_opcodes_h_l2157_c32_b5c0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2159_c7_18f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_18f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_18f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output;

     -- n8_MUX[uxn_opcodes_h_l2151_c7_d3ff] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond <= VAR_n8_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond;
     n8_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue;
     n8_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output := n8_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2154_c7_754f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2154_c7_754f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c7_754f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c7_754f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2154_c7_754f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2154_c7_754f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_754f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_754f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_754f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_754f_return_output;

     -- t8_MUX[uxn_opcodes_h_l2144_c7_094f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2144_c7_094f_cond <= VAR_t8_MUX_uxn_opcodes_h_l2144_c7_094f_cond;
     t8_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue;
     t8_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2144_c7_094f_return_output := t8_MUX_uxn_opcodes_h_l2144_c7_094f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2159_c7_18f6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_18f6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_18f6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_18f6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_18f6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2154_c7_754f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_754f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_754f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_754f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_754f_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue := VAR_MUX_uxn_opcodes_h_l2157_c32_b5c0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_754f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_18f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_754f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c7_754f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2144_c7_094f_return_output;
     -- t8_MUX[uxn_opcodes_h_l2139_c2_514c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2139_c2_514c_cond <= VAR_t8_MUX_uxn_opcodes_h_l2139_c2_514c_cond;
     t8_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue;
     t8_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2139_c2_514c_return_output := t8_MUX_uxn_opcodes_h_l2139_c2_514c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2151_c7_d3ff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2154_c7_754f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_754f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_754f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_754f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_754f_return_output;

     -- n8_MUX[uxn_opcodes_h_l2147_c7_68ef] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2147_c7_68ef_cond <= VAR_n8_MUX_uxn_opcodes_h_l2147_c7_68ef_cond;
     n8_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue;
     n8_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output := n8_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2151_c7_d3ff] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output := result_stack_value_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2154_c7_754f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_754f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_754f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_754f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_754f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2154_c7_754f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_754f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_754f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_754f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_754f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_754f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_754f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2151_c7_d3ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_754f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_754f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_754f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2139_c2_514c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2147_c7_68ef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2147_c7_68ef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_68ef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_68ef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2147_c7_68ef] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2147_c7_68ef_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2147_c7_68ef_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output := result_stack_value_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2151_c7_d3ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output;

     -- n8_MUX[uxn_opcodes_h_l2144_c7_094f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2144_c7_094f_cond <= VAR_n8_MUX_uxn_opcodes_h_l2144_c7_094f_cond;
     n8_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue;
     n8_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2144_c7_094f_return_output := n8_MUX_uxn_opcodes_h_l2144_c7_094f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2151_c7_d3ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2151_c7_d3ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_d3ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_d3ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_d3ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2144_c7_094f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_d3ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2147_c7_68ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_68ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_68ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2147_c7_68ef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output;

     -- n8_MUX[uxn_opcodes_h_l2139_c2_514c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2139_c2_514c_cond <= VAR_n8_MUX_uxn_opcodes_h_l2139_c2_514c_cond;
     n8_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue;
     n8_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2139_c2_514c_return_output := n8_MUX_uxn_opcodes_h_l2139_c2_514c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2147_c7_68ef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_68ef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_68ef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_68ef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_68ef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2144_c7_094f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_094f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_094f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_094f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_094f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2144_c7_094f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2144_c7_094f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2144_c7_094f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2144_c7_094f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2144_c7_094f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2144_c7_094f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_094f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_094f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_094f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_094f_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2139_c2_514c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_094f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_68ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_094f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2144_c7_094f_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2139_c2_514c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2139_c2_514c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2139_c2_514c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2139_c2_514c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2139_c2_514c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2139_c2_514c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c2_514c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c2_514c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c2_514c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c2_514c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2144_c7_094f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_094f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_094f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_094f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_094f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2139_c2_514c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c2_514c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c2_514c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c2_514c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c2_514c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2144_c7_094f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_094f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_094f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_094f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_094f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2144_c7_094f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_094f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_094f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_094f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_094f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_094f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_094f_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_094f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_094f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_094f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2139_c2_514c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2139_c2_514c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c2_514c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c2_514c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2139_c2_514c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2139_c2_514c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c2_514c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c2_514c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c2_514c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c2_514c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2139_c2_514c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2139_c2_514c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c2_514c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c2_514c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c2_514c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c2_514c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2139_c2_514c_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2170_l2135_DUPLICATE_611f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2170_l2135_DUPLICATE_611f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c2_514c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c2_514c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c2_514c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c2_514c_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2139_c2_514c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c2_514c_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2170_l2135_DUPLICATE_611f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2170_l2135_DUPLICATE_611f_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
