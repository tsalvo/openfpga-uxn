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
-- Submodules: 96
entity rot_0CLK_9c3c4e32 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot_0CLK_9c3c4e32;
architecture arch of rot_0CLK_9c3c4e32 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal l8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_l8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2420_c6_b6ca]
signal BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2420_c1_9e13]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2420_c1_9e13_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2420_c1_9e13_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2420_c1_9e13_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2420_c1_9e13_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2420_c2_dd00]
signal t8_MUX_uxn_opcodes_h_l2420_c2_dd00_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2420_c2_dd00]
signal l8_MUX_uxn_opcodes_h_l2420_c2_dd00_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2420_c2_dd00]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2420_c2_dd00]
signal result_stack_value_MUX_uxn_opcodes_h_l2420_c2_dd00_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2420_c2_dd00]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2420_c2_dd00]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2420_c2_dd00_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2420_c2_dd00]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2420_c2_dd00_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2420_c2_dd00]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c2_dd00_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2420_c2_dd00]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2420_c2_dd00_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2420_c2_dd00]
signal n8_MUX_uxn_opcodes_h_l2420_c2_dd00_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2421_c3_33f7[uxn_opcodes_h_l2421_c3_33f7]
signal printf_uxn_opcodes_h_l2421_c3_33f7_uxn_opcodes_h_l2421_c3_33f7_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2426_c11_fb73]
signal BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2426_c7_1e42]
signal t8_MUX_uxn_opcodes_h_l2426_c7_1e42_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2426_c7_1e42]
signal l8_MUX_uxn_opcodes_h_l2426_c7_1e42_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2426_c7_1e42]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2426_c7_1e42]
signal result_stack_value_MUX_uxn_opcodes_h_l2426_c7_1e42_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2426_c7_1e42]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2426_c7_1e42]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2426_c7_1e42_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2426_c7_1e42]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2426_c7_1e42_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2426_c7_1e42]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2426_c7_1e42_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2426_c7_1e42]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2426_c7_1e42_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2426_c7_1e42]
signal n8_MUX_uxn_opcodes_h_l2426_c7_1e42_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2429_c11_0c94]
signal BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2429_c7_d876]
signal t8_MUX_uxn_opcodes_h_l2429_c7_d876_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2429_c7_d876_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2429_c7_d876]
signal l8_MUX_uxn_opcodes_h_l2429_c7_d876_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2429_c7_d876_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2429_c7_d876]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2429_c7_d876_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2429_c7_d876_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2429_c7_d876]
signal result_stack_value_MUX_uxn_opcodes_h_l2429_c7_d876_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2429_c7_d876_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2429_c7_d876]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2429_c7_d876_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2429_c7_d876_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2429_c7_d876]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_d876_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_d876_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2429_c7_d876]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_d876_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_d876_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2429_c7_d876]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2429_c7_d876_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2429_c7_d876_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2429_c7_d876]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2429_c7_d876_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2429_c7_d876_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2429_c7_d876]
signal n8_MUX_uxn_opcodes_h_l2429_c7_d876_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2429_c7_d876_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2433_c11_5870]
signal BIN_OP_EQ_uxn_opcodes_h_l2433_c11_5870_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2433_c11_5870_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2433_c11_5870_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2433_c7_ddea]
signal l8_MUX_uxn_opcodes_h_l2433_c7_ddea_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2433_c7_ddea]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2433_c7_ddea]
signal result_stack_value_MUX_uxn_opcodes_h_l2433_c7_ddea_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2433_c7_ddea]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2433_c7_ddea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_ddea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2433_c7_ddea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_ddea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2433_c7_ddea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_ddea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2433_c7_ddea]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2433_c7_ddea_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2433_c7_ddea]
signal n8_MUX_uxn_opcodes_h_l2433_c7_ddea_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2436_c11_f3ad]
signal BIN_OP_EQ_uxn_opcodes_h_l2436_c11_f3ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2436_c11_f3ad_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2436_c11_f3ad_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2436_c7_059d]
signal l8_MUX_uxn_opcodes_h_l2436_c7_059d_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2436_c7_059d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2436_c7_059d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2436_c7_059d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2436_c7_059d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2436_c7_059d]
signal result_stack_value_MUX_uxn_opcodes_h_l2436_c7_059d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2436_c7_059d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2436_c7_059d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2436_c7_059d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2436_c7_059d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2436_c7_059d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_059d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_059d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2436_c7_059d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_059d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_059d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2436_c7_059d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_059d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_059d_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2436_c7_059d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2436_c7_059d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2436_c7_059d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2436_c7_059d]
signal n8_MUX_uxn_opcodes_h_l2436_c7_059d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2436_c7_059d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2440_c11_5aef]
signal BIN_OP_EQ_uxn_opcodes_h_l2440_c11_5aef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2440_c11_5aef_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2440_c11_5aef_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2440_c7_48ae]
signal l8_MUX_uxn_opcodes_h_l2440_c7_48ae_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2440_c7_48ae]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2440_c7_48ae]
signal result_stack_value_MUX_uxn_opcodes_h_l2440_c7_48ae_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2440_c7_48ae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2440_c7_48ae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_48ae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2440_c7_48ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_48ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2440_c7_48ae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c7_48ae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2440_c7_48ae]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2440_c7_48ae_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2443_c11_8371]
signal BIN_OP_EQ_uxn_opcodes_h_l2443_c11_8371_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2443_c11_8371_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2443_c11_8371_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2443_c7_f46d]
signal l8_MUX_uxn_opcodes_h_l2443_c7_f46d_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2443_c7_f46d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2443_c7_f46d]
signal result_stack_value_MUX_uxn_opcodes_h_l2443_c7_f46d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2443_c7_f46d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2443_c7_f46d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2443_c7_f46d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2443_c7_f46d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2443_c7_f46d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2443_c7_f46d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2443_c7_f46d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2443_c7_f46d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2443_c7_f46d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2447_c32_74d9]
signal BIN_OP_AND_uxn_opcodes_h_l2447_c32_74d9_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2447_c32_74d9_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2447_c32_74d9_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2447_c32_7f56]
signal BIN_OP_GT_uxn_opcodes_h_l2447_c32_7f56_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2447_c32_7f56_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2447_c32_7f56_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2447_c32_4e14]
signal MUX_uxn_opcodes_h_l2447_c32_4e14_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2447_c32_4e14_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2447_c32_4e14_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2447_c32_4e14_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2449_c11_3b17]
signal BIN_OP_EQ_uxn_opcodes_h_l2449_c11_3b17_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2449_c11_3b17_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2449_c11_3b17_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2449_c7_1e08]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_1e08_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2449_c7_1e08]
signal result_stack_value_MUX_uxn_opcodes_h_l2449_c7_1e08_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2449_c7_1e08]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_1e08_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2449_c7_1e08]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_1e08_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2449_c7_1e08]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_1e08_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2455_c11_1b33]
signal BIN_OP_EQ_uxn_opcodes_h_l2455_c11_1b33_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2455_c11_1b33_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2455_c11_1b33_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2455_c7_251c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_251c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_251c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_251c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_251c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2455_c7_251c]
signal result_stack_value_MUX_uxn_opcodes_h_l2455_c7_251c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2455_c7_251c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2455_c7_251c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2455_c7_251c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2455_c7_251c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_251c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_251c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_251c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_251c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2455_c7_251c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_251c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_251c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_251c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_251c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2459_c11_c268]
signal BIN_OP_EQ_uxn_opcodes_h_l2459_c11_c268_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2459_c11_c268_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2459_c11_c268_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2459_c7_563b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_563b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_563b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_563b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_563b_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2459_c7_563b]
signal result_stack_value_MUX_uxn_opcodes_h_l2459_c7_563b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2459_c7_563b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2459_c7_563b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2459_c7_563b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2459_c7_563b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_563b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_563b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_563b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_563b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2459_c7_563b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_563b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_563b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_563b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_563b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2463_c11_0981]
signal BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0981_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0981_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0981_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2463_c7_90a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_90a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_90a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_90a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_90a8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2463_c7_90a8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_90a8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_90a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_90a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_90a8_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_e56b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca
BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca_left,
BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca_right,
BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2420_c1_9e13
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2420_c1_9e13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2420_c1_9e13_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2420_c1_9e13_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2420_c1_9e13_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2420_c1_9e13_return_output);

-- t8_MUX_uxn_opcodes_h_l2420_c2_dd00
t8_MUX_uxn_opcodes_h_l2420_c2_dd00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2420_c2_dd00_cond,
t8_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue,
t8_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse,
t8_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output);

-- l8_MUX_uxn_opcodes_h_l2420_c2_dd00
l8_MUX_uxn_opcodes_h_l2420_c2_dd00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2420_c2_dd00_cond,
l8_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue,
l8_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse,
l8_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c2_dd00
result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c2_dd00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2420_c2_dd00
result_stack_value_MUX_uxn_opcodes_h_l2420_c2_dd00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2420_c2_dd00_cond,
result_stack_value_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c2_dd00
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c2_dd00 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2420_c2_dd00
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c2_dd00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c2_dd00_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2420_c2_dd00
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c2_dd00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c2_dd00_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c2_dd00
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c2_dd00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c2_dd00_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2420_c2_dd00
result_is_stack_read_MUX_uxn_opcodes_h_l2420_c2_dd00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2420_c2_dd00_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output);

-- n8_MUX_uxn_opcodes_h_l2420_c2_dd00
n8_MUX_uxn_opcodes_h_l2420_c2_dd00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2420_c2_dd00_cond,
n8_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue,
n8_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse,
n8_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output);

-- printf_uxn_opcodes_h_l2421_c3_33f7_uxn_opcodes_h_l2421_c3_33f7
printf_uxn_opcodes_h_l2421_c3_33f7_uxn_opcodes_h_l2421_c3_33f7 : entity work.printf_uxn_opcodes_h_l2421_c3_33f7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2421_c3_33f7_uxn_opcodes_h_l2421_c3_33f7_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73
BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73_left,
BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73_right,
BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73_return_output);

-- t8_MUX_uxn_opcodes_h_l2426_c7_1e42
t8_MUX_uxn_opcodes_h_l2426_c7_1e42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2426_c7_1e42_cond,
t8_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue,
t8_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse,
t8_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output);

-- l8_MUX_uxn_opcodes_h_l2426_c7_1e42
l8_MUX_uxn_opcodes_h_l2426_c7_1e42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2426_c7_1e42_cond,
l8_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue,
l8_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse,
l8_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2426_c7_1e42
result_is_sp_shift_MUX_uxn_opcodes_h_l2426_c7_1e42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2426_c7_1e42
result_stack_value_MUX_uxn_opcodes_h_l2426_c7_1e42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2426_c7_1e42_cond,
result_stack_value_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2426_c7_1e42
result_sp_relative_shift_MUX_uxn_opcodes_h_l2426_c7_1e42 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2426_c7_1e42
result_is_stack_write_MUX_uxn_opcodes_h_l2426_c7_1e42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2426_c7_1e42_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2426_c7_1e42
result_is_opc_done_MUX_uxn_opcodes_h_l2426_c7_1e42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2426_c7_1e42_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2426_c7_1e42
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2426_c7_1e42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2426_c7_1e42_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2426_c7_1e42
result_is_stack_read_MUX_uxn_opcodes_h_l2426_c7_1e42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2426_c7_1e42_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output);

-- n8_MUX_uxn_opcodes_h_l2426_c7_1e42
n8_MUX_uxn_opcodes_h_l2426_c7_1e42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2426_c7_1e42_cond,
n8_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue,
n8_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse,
n8_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94
BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94_left,
BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94_right,
BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94_return_output);

-- t8_MUX_uxn_opcodes_h_l2429_c7_d876
t8_MUX_uxn_opcodes_h_l2429_c7_d876 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2429_c7_d876_cond,
t8_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue,
t8_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse,
t8_MUX_uxn_opcodes_h_l2429_c7_d876_return_output);

-- l8_MUX_uxn_opcodes_h_l2429_c7_d876
l8_MUX_uxn_opcodes_h_l2429_c7_d876 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2429_c7_d876_cond,
l8_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue,
l8_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse,
l8_MUX_uxn_opcodes_h_l2429_c7_d876_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2429_c7_d876
result_is_sp_shift_MUX_uxn_opcodes_h_l2429_c7_d876 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2429_c7_d876_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2429_c7_d876_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2429_c7_d876
result_stack_value_MUX_uxn_opcodes_h_l2429_c7_d876 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2429_c7_d876_cond,
result_stack_value_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2429_c7_d876_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2429_c7_d876
result_sp_relative_shift_MUX_uxn_opcodes_h_l2429_c7_d876 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2429_c7_d876_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2429_c7_d876_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_d876
result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_d876 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_d876_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_d876_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_d876
result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_d876 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_d876_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_d876_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2429_c7_d876
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2429_c7_d876 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2429_c7_d876_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2429_c7_d876_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2429_c7_d876
result_is_stack_read_MUX_uxn_opcodes_h_l2429_c7_d876 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2429_c7_d876_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2429_c7_d876_return_output);

-- n8_MUX_uxn_opcodes_h_l2429_c7_d876
n8_MUX_uxn_opcodes_h_l2429_c7_d876 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2429_c7_d876_cond,
n8_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue,
n8_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse,
n8_MUX_uxn_opcodes_h_l2429_c7_d876_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2433_c11_5870
BIN_OP_EQ_uxn_opcodes_h_l2433_c11_5870 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2433_c11_5870_left,
BIN_OP_EQ_uxn_opcodes_h_l2433_c11_5870_right,
BIN_OP_EQ_uxn_opcodes_h_l2433_c11_5870_return_output);

-- l8_MUX_uxn_opcodes_h_l2433_c7_ddea
l8_MUX_uxn_opcodes_h_l2433_c7_ddea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2433_c7_ddea_cond,
l8_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue,
l8_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse,
l8_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c7_ddea
result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c7_ddea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2433_c7_ddea
result_stack_value_MUX_uxn_opcodes_h_l2433_c7_ddea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2433_c7_ddea_cond,
result_stack_value_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c7_ddea
result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c7_ddea : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_ddea
result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_ddea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_ddea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_ddea
result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_ddea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_ddea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_ddea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_ddea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_ddea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2433_c7_ddea
result_is_stack_read_MUX_uxn_opcodes_h_l2433_c7_ddea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2433_c7_ddea_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output);

-- n8_MUX_uxn_opcodes_h_l2433_c7_ddea
n8_MUX_uxn_opcodes_h_l2433_c7_ddea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2433_c7_ddea_cond,
n8_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue,
n8_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse,
n8_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2436_c11_f3ad
BIN_OP_EQ_uxn_opcodes_h_l2436_c11_f3ad : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2436_c11_f3ad_left,
BIN_OP_EQ_uxn_opcodes_h_l2436_c11_f3ad_right,
BIN_OP_EQ_uxn_opcodes_h_l2436_c11_f3ad_return_output);

-- l8_MUX_uxn_opcodes_h_l2436_c7_059d
l8_MUX_uxn_opcodes_h_l2436_c7_059d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2436_c7_059d_cond,
l8_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue,
l8_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse,
l8_MUX_uxn_opcodes_h_l2436_c7_059d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2436_c7_059d
result_is_sp_shift_MUX_uxn_opcodes_h_l2436_c7_059d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2436_c7_059d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2436_c7_059d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2436_c7_059d
result_stack_value_MUX_uxn_opcodes_h_l2436_c7_059d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2436_c7_059d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2436_c7_059d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2436_c7_059d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2436_c7_059d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2436_c7_059d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2436_c7_059d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_059d
result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_059d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_059d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_059d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_059d
result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_059d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_059d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_059d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_059d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_059d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_059d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_059d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2436_c7_059d
result_is_stack_read_MUX_uxn_opcodes_h_l2436_c7_059d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2436_c7_059d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2436_c7_059d_return_output);

-- n8_MUX_uxn_opcodes_h_l2436_c7_059d
n8_MUX_uxn_opcodes_h_l2436_c7_059d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2436_c7_059d_cond,
n8_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue,
n8_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse,
n8_MUX_uxn_opcodes_h_l2436_c7_059d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2440_c11_5aef
BIN_OP_EQ_uxn_opcodes_h_l2440_c11_5aef : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2440_c11_5aef_left,
BIN_OP_EQ_uxn_opcodes_h_l2440_c11_5aef_right,
BIN_OP_EQ_uxn_opcodes_h_l2440_c11_5aef_return_output);

-- l8_MUX_uxn_opcodes_h_l2440_c7_48ae
l8_MUX_uxn_opcodes_h_l2440_c7_48ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2440_c7_48ae_cond,
l8_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue,
l8_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse,
l8_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c7_48ae
result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c7_48ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2440_c7_48ae
result_stack_value_MUX_uxn_opcodes_h_l2440_c7_48ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2440_c7_48ae_cond,
result_stack_value_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c7_48ae
result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c7_48ae : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_48ae
result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_48ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_48ae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_48ae
result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_48ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_48ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c7_48ae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c7_48ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c7_48ae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2440_c7_48ae
result_is_stack_read_MUX_uxn_opcodes_h_l2440_c7_48ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2440_c7_48ae_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2443_c11_8371
BIN_OP_EQ_uxn_opcodes_h_l2443_c11_8371 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2443_c11_8371_left,
BIN_OP_EQ_uxn_opcodes_h_l2443_c11_8371_right,
BIN_OP_EQ_uxn_opcodes_h_l2443_c11_8371_return_output);

-- l8_MUX_uxn_opcodes_h_l2443_c7_f46d
l8_MUX_uxn_opcodes_h_l2443_c7_f46d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2443_c7_f46d_cond,
l8_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue,
l8_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse,
l8_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2443_c7_f46d
result_is_sp_shift_MUX_uxn_opcodes_h_l2443_c7_f46d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2443_c7_f46d
result_stack_value_MUX_uxn_opcodes_h_l2443_c7_f46d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2443_c7_f46d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2443_c7_f46d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2443_c7_f46d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2443_c7_f46d
result_is_stack_write_MUX_uxn_opcodes_h_l2443_c7_f46d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2443_c7_f46d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2443_c7_f46d
result_is_opc_done_MUX_uxn_opcodes_h_l2443_c7_f46d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2443_c7_f46d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2443_c7_f46d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2443_c7_f46d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2443_c7_f46d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2443_c7_f46d
result_is_stack_read_MUX_uxn_opcodes_h_l2443_c7_f46d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2443_c7_f46d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2447_c32_74d9
BIN_OP_AND_uxn_opcodes_h_l2447_c32_74d9 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2447_c32_74d9_left,
BIN_OP_AND_uxn_opcodes_h_l2447_c32_74d9_right,
BIN_OP_AND_uxn_opcodes_h_l2447_c32_74d9_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2447_c32_7f56
BIN_OP_GT_uxn_opcodes_h_l2447_c32_7f56 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2447_c32_7f56_left,
BIN_OP_GT_uxn_opcodes_h_l2447_c32_7f56_right,
BIN_OP_GT_uxn_opcodes_h_l2447_c32_7f56_return_output);

-- MUX_uxn_opcodes_h_l2447_c32_4e14
MUX_uxn_opcodes_h_l2447_c32_4e14 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2447_c32_4e14_cond,
MUX_uxn_opcodes_h_l2447_c32_4e14_iftrue,
MUX_uxn_opcodes_h_l2447_c32_4e14_iffalse,
MUX_uxn_opcodes_h_l2447_c32_4e14_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2449_c11_3b17
BIN_OP_EQ_uxn_opcodes_h_l2449_c11_3b17 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2449_c11_3b17_left,
BIN_OP_EQ_uxn_opcodes_h_l2449_c11_3b17_right,
BIN_OP_EQ_uxn_opcodes_h_l2449_c11_3b17_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_1e08
result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_1e08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_1e08_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2449_c7_1e08
result_stack_value_MUX_uxn_opcodes_h_l2449_c7_1e08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2449_c7_1e08_cond,
result_stack_value_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_1e08
result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_1e08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_1e08_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_1e08
result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_1e08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_1e08_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_1e08
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_1e08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_1e08_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2455_c11_1b33
BIN_OP_EQ_uxn_opcodes_h_l2455_c11_1b33 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2455_c11_1b33_left,
BIN_OP_EQ_uxn_opcodes_h_l2455_c11_1b33_right,
BIN_OP_EQ_uxn_opcodes_h_l2455_c11_1b33_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_251c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_251c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_251c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_251c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_251c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_251c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2455_c7_251c
result_stack_value_MUX_uxn_opcodes_h_l2455_c7_251c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2455_c7_251c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2455_c7_251c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2455_c7_251c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2455_c7_251c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_251c
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_251c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_251c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_251c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_251c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_251c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_251c
result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_251c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_251c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_251c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_251c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_251c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2459_c11_c268
BIN_OP_EQ_uxn_opcodes_h_l2459_c11_c268 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2459_c11_c268_left,
BIN_OP_EQ_uxn_opcodes_h_l2459_c11_c268_right,
BIN_OP_EQ_uxn_opcodes_h_l2459_c11_c268_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_563b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_563b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_563b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_563b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_563b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_563b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2459_c7_563b
result_stack_value_MUX_uxn_opcodes_h_l2459_c7_563b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2459_c7_563b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2459_c7_563b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2459_c7_563b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2459_c7_563b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_563b
result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_563b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_563b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_563b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_563b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_563b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_563b
result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_563b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_563b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_563b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_563b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_563b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0981
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0981 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0981_left,
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0981_right,
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0981_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_90a8
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_90a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_90a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_90a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_90a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_90a8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_90a8
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_90a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_90a8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_90a8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_90a8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_90a8_return_output);



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
 l8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2420_c1_9e13_return_output,
 t8_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output,
 l8_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output,
 n8_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73_return_output,
 t8_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output,
 l8_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output,
 n8_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94_return_output,
 t8_MUX_uxn_opcodes_h_l2429_c7_d876_return_output,
 l8_MUX_uxn_opcodes_h_l2429_c7_d876_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2429_c7_d876_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2429_c7_d876_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2429_c7_d876_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_d876_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_d876_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2429_c7_d876_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2429_c7_d876_return_output,
 n8_MUX_uxn_opcodes_h_l2429_c7_d876_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2433_c11_5870_return_output,
 l8_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output,
 n8_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2436_c11_f3ad_return_output,
 l8_MUX_uxn_opcodes_h_l2436_c7_059d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2436_c7_059d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2436_c7_059d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2436_c7_059d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_059d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_059d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_059d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2436_c7_059d_return_output,
 n8_MUX_uxn_opcodes_h_l2436_c7_059d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2440_c11_5aef_return_output,
 l8_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2443_c11_8371_return_output,
 l8_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2447_c32_74d9_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2447_c32_7f56_return_output,
 MUX_uxn_opcodes_h_l2447_c32_4e14_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2449_c11_3b17_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2455_c11_1b33_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_251c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2455_c7_251c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_251c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_251c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2459_c11_c268_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_563b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2459_c7_563b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_563b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_563b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0981_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_90a8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_90a8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2420_c1_9e13_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2420_c1_9e13_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2420_c1_9e13_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2420_c1_9e13_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2420_c2_dd00_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2420_c2_dd00_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c2_dd00_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c2_dd00_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c2_dd00_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2423_c3_ece5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c2_dd00_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c2_dd00_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2420_c2_dd00_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2421_c3_33f7_uxn_opcodes_h_l2421_c3_33f7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2429_c7_d876_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2426_c7_1e42_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2429_c7_d876_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2426_c7_1e42_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2429_c7_d876_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2429_c7_d876_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2426_c7_1e42_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2429_c7_d876_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_d876_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2426_c7_1e42_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_d876_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2426_c7_1e42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2427_c3_ad97 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2429_c7_d876_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2426_c7_1e42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2429_c7_d876_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2426_c7_1e42_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2429_c7_d876_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2426_c7_1e42_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2429_c7_d876_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2429_c7_d876_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2429_c7_d876_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2429_c7_d876_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2429_c7_d876_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_d876_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_d876_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2431_c3_e9b4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2429_c7_d876_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2429_c7_d876_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2429_c7_d876_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c11_5870_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c11_5870_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c11_5870_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2436_c7_059d_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2433_c7_ddea_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2436_c7_059d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2436_c7_059d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c7_ddea_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2436_c7_059d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_059d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_ddea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_059d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_ddea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2434_c3_1417 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_059d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_ddea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2436_c7_059d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2433_c7_ddea_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2436_c7_059d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2433_c7_ddea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2436_c11_f3ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2436_c11_f3ad_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2436_c11_f3ad_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2436_c7_059d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2436_c7_059d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2436_c7_059d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2436_c7_059d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_059d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_059d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2438_c3_16ef : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_059d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2436_c7_059d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2436_c7_059d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c11_5aef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c11_5aef_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c11_5aef_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2440_c7_48ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2440_c7_48ae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_48ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_48ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2441_c3_ad13 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c7_48ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2440_c7_48ae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2443_c11_8371_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2443_c11_8371_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2443_c11_8371_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2443_c7_f46d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2443_c7_f46d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2443_c7_f46d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2443_c7_f46d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2443_c7_f46d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2443_c7_f46d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2447_c32_4e14_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2447_c32_4e14_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2447_c32_4e14_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2447_c32_74d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2447_c32_74d9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2447_c32_74d9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2447_c32_7f56_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2447_c32_7f56_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2447_c32_7f56_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2447_c32_4e14_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_3b17_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_3b17_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_3b17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_1e08_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2455_c7_251c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2449_c7_1e08_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_251c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_1e08_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_251c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_1e08_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2452_c3_fc96 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_251c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_1e08_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_1b33_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_1b33_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_1b33_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_251c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2456_c3_ad56 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_251c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_563b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_251c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2455_c7_251c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2455_c7_251c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2459_c7_563b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2455_c7_251c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_251c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_251c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_563b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_251c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_251c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_251c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_563b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_251c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_c268_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_c268_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_c268_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_563b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2460_c3_acfd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_563b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_563b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2459_c7_563b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2459_c7_563b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2459_c7_563b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_563b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_563b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_90a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_563b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_563b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_563b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_90a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_563b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0981_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0981_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0981_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_90a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_90a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_90a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_90a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_90a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_90a8_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2433_l2429_l2426_l2449_l2420_l2440_l2436_DUPLICATE_1313_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2426_l2420_l2443_l2440_l2436_DUPLICATE_a701_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2433_l2429_l2426_l2420_l2443_l2440_l2436_DUPLICATE_4a8f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2455_l2426_l2420_l2443_l2440_l2436_l2463_DUPLICATE_04aa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2455_l2426_l2449_l2443_l2440_l2436_l2463_DUPLICATE_7b43_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2433_l2429_l2426_l2443_l2440_l2436_DUPLICATE_a908_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2443_l2459_DUPLICATE_9f62_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2468_l2416_DUPLICATE_c396_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_l8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_l8 := l8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2443_c11_8371_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_c268_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2427_c3_ad97 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2427_c3_ad97;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2423_c3_ece5 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2423_c3_ece5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2441_c3_ad13 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2441_c3_ad13;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c11_5aef_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2460_c3_acfd := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_563b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2460_c3_acfd;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_90a8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2420_c1_9e13_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0981_right := to_unsigned(10, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_90a8_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2447_c32_4e14_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c11_5870_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2456_c3_ad56 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_251c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2456_c3_ad56;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2438_c3_16ef := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2438_c3_16ef;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2447_c32_7f56_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2431_c3_e9b4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2431_c3_e9b4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2434_c3_1417 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2434_c3_1417;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2447_c32_74d9_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2447_c32_4e14_iftrue := signed(std_logic_vector(resize(to_unsigned(3, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2436_c11_f3ad_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_3b17_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2452_c3_fc96 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2452_c3_fc96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_1b33_right := to_unsigned(8, 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2420_c1_9e13_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2447_c32_74d9_left := VAR_ins;
     VAR_l8_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse := l8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue := l8;
     VAR_n8_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2459_c7_563b_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c11_5870_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2436_c11_f3ad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c11_5aef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2443_c11_8371_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_3b17_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_1b33_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_c268_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0981_left := VAR_phase;
     VAR_l8_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue := VAR_previous_stack_read;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2455_c7_251c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2426_c11_fb73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73_left;
     BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73_return_output := BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2443_l2459_DUPLICATE_9f62 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2443_l2459_DUPLICATE_9f62_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2455_l2426_l2449_l2443_l2440_l2436_l2463_DUPLICATE_7b43 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2455_l2426_l2449_l2443_l2440_l2436_l2463_DUPLICATE_7b43_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2455_c11_1b33] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2455_c11_1b33_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_1b33_left;
     BIN_OP_EQ_uxn_opcodes_h_l2455_c11_1b33_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_1b33_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_1b33_return_output := BIN_OP_EQ_uxn_opcodes_h_l2455_c11_1b33_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2447_c32_74d9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2447_c32_74d9_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2447_c32_74d9_left;
     BIN_OP_AND_uxn_opcodes_h_l2447_c32_74d9_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2447_c32_74d9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2447_c32_74d9_return_output := BIN_OP_AND_uxn_opcodes_h_l2447_c32_74d9_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2433_l2429_l2426_l2420_l2443_l2440_l2436_DUPLICATE_4a8f LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2433_l2429_l2426_l2420_l2443_l2440_l2436_DUPLICATE_4a8f_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2426_l2420_l2443_l2440_l2436_DUPLICATE_a701 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2426_l2420_l2443_l2440_l2436_DUPLICATE_a701_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2449_c11_3b17] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2449_c11_3b17_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_3b17_left;
     BIN_OP_EQ_uxn_opcodes_h_l2449_c11_3b17_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_3b17_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_3b17_return_output := BIN_OP_EQ_uxn_opcodes_h_l2449_c11_3b17_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2455_l2426_l2420_l2443_l2440_l2436_l2463_DUPLICATE_04aa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2455_l2426_l2420_l2443_l2440_l2436_l2463_DUPLICATE_04aa_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2433_l2429_l2426_l2443_l2440_l2436_DUPLICATE_a908 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2433_l2429_l2426_l2443_l2440_l2436_DUPLICATE_a908_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2429_c11_0c94] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94_left;
     BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94_return_output := BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2463_c11_0981] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0981_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0981_left;
     BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0981_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0981_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0981_return_output := BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0981_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2433_l2429_l2426_l2449_l2420_l2440_l2436_DUPLICATE_1313 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2433_l2429_l2426_l2449_l2420_l2440_l2436_DUPLICATE_1313_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2443_c11_8371] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2443_c11_8371_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2443_c11_8371_left;
     BIN_OP_EQ_uxn_opcodes_h_l2443_c11_8371_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2443_c11_8371_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2443_c11_8371_return_output := BIN_OP_EQ_uxn_opcodes_h_l2443_c11_8371_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2440_c11_5aef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2440_c11_5aef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c11_5aef_left;
     BIN_OP_EQ_uxn_opcodes_h_l2440_c11_5aef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c11_5aef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c11_5aef_return_output := BIN_OP_EQ_uxn_opcodes_h_l2440_c11_5aef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2459_c11_c268] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2459_c11_c268_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_c268_left;
     BIN_OP_EQ_uxn_opcodes_h_l2459_c11_c268_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_c268_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_c268_return_output := BIN_OP_EQ_uxn_opcodes_h_l2459_c11_c268_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2420_c6_b6ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2433_c11_5870] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2433_c11_5870_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c11_5870_left;
     BIN_OP_EQ_uxn_opcodes_h_l2433_c11_5870_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c11_5870_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c11_5870_return_output := BIN_OP_EQ_uxn_opcodes_h_l2433_c11_5870_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2436_c11_f3ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2436_c11_f3ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2436_c11_f3ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l2436_c11_f3ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2436_c11_f3ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2436_c11_f3ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l2436_c11_f3ad_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2447_c32_7f56_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2447_c32_74d9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2420_c1_9e13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2420_c2_dd00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2420_c2_dd00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c2_dd00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c2_dd00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c2_dd00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c2_dd00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c2_dd00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2420_c2_dd00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c6_b6ca_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2426_c7_1e42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2426_c7_1e42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2426_c7_1e42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2426_c7_1e42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2426_c7_1e42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2426_c7_1e42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2426_c7_1e42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2426_c7_1e42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2426_c11_fb73_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2429_c7_d876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2429_c7_d876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_d876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2429_c7_d876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2429_c7_d876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_d876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2429_c7_d876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2429_c7_d876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2429_c7_d876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2429_c7_d876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2429_c11_0c94_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2433_c7_ddea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c11_5870_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2433_c7_ddea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c11_5870_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_ddea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c11_5870_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c11_5870_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2433_c7_ddea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c11_5870_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_ddea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c11_5870_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c11_5870_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_ddea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c11_5870_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c7_ddea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c11_5870_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2436_c7_059d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2436_c11_f3ad_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2436_c7_059d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2436_c11_f3ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_059d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2436_c11_f3ad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2436_c7_059d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2436_c11_f3ad_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2436_c7_059d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2436_c11_f3ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_059d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2436_c11_f3ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2436_c7_059d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2436_c11_f3ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_059d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2436_c11_f3ad_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2436_c7_059d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2436_c11_f3ad_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2440_c7_48ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c11_5aef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_48ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c11_5aef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c11_5aef_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2440_c7_48ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c11_5aef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_48ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c11_5aef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c11_5aef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c7_48ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c11_5aef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2440_c7_48ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c11_5aef_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2443_c7_f46d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2443_c11_8371_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2443_c7_f46d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2443_c11_8371_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2443_c11_8371_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2443_c7_f46d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2443_c11_8371_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2443_c7_f46d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2443_c11_8371_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2443_c11_8371_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2443_c7_f46d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2443_c11_8371_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2443_c7_f46d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2443_c11_8371_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_1e08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_3b17_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_1e08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_3b17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_1e08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_3b17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_1e08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_3b17_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2449_c7_1e08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_3b17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_251c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_1b33_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_251c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_1b33_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_251c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_1b33_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2455_c7_251c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_1b33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_563b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_c268_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_563b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_c268_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_563b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_c268_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2459_c7_563b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_c268_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_90a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0981_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_90a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0981_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2433_l2429_l2426_l2420_l2443_l2440_l2436_DUPLICATE_4a8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2433_l2429_l2426_l2420_l2443_l2440_l2436_DUPLICATE_4a8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2433_l2429_l2426_l2420_l2443_l2440_l2436_DUPLICATE_4a8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2433_l2429_l2426_l2420_l2443_l2440_l2436_DUPLICATE_4a8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2433_l2429_l2426_l2420_l2443_l2440_l2436_DUPLICATE_4a8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2433_l2429_l2426_l2420_l2443_l2440_l2436_DUPLICATE_4a8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2433_l2429_l2426_l2420_l2443_l2440_l2436_DUPLICATE_4a8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2455_l2426_l2449_l2443_l2440_l2436_l2463_DUPLICATE_7b43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2455_l2426_l2449_l2443_l2440_l2436_l2463_DUPLICATE_7b43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2455_l2426_l2449_l2443_l2440_l2436_l2463_DUPLICATE_7b43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2455_l2426_l2449_l2443_l2440_l2436_l2463_DUPLICATE_7b43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2455_l2426_l2449_l2443_l2440_l2436_l2463_DUPLICATE_7b43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2455_l2426_l2449_l2443_l2440_l2436_l2463_DUPLICATE_7b43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2455_l2426_l2449_l2443_l2440_l2436_l2463_DUPLICATE_7b43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_251c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2455_l2426_l2449_l2443_l2440_l2436_l2463_DUPLICATE_7b43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_563b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2455_l2426_l2449_l2443_l2440_l2436_l2463_DUPLICATE_7b43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_90a8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2455_l2426_l2449_l2443_l2440_l2436_l2463_DUPLICATE_7b43_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2433_l2429_l2426_l2449_l2420_l2440_l2436_DUPLICATE_1313_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2433_l2429_l2426_l2449_l2420_l2440_l2436_DUPLICATE_1313_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2433_l2429_l2426_l2449_l2420_l2440_l2436_DUPLICATE_1313_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2433_l2429_l2426_l2449_l2420_l2440_l2436_DUPLICATE_1313_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2433_l2429_l2426_l2449_l2420_l2440_l2436_DUPLICATE_1313_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2433_l2429_l2426_l2449_l2420_l2440_l2436_DUPLICATE_1313_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2433_l2429_l2426_l2449_l2420_l2440_l2436_DUPLICATE_1313_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2433_l2429_l2426_l2443_l2440_l2436_DUPLICATE_a908_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2433_l2429_l2426_l2443_l2440_l2436_DUPLICATE_a908_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2433_l2429_l2426_l2443_l2440_l2436_DUPLICATE_a908_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2433_l2429_l2426_l2443_l2440_l2436_DUPLICATE_a908_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2433_l2429_l2426_l2443_l2440_l2436_DUPLICATE_a908_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2433_l2429_l2426_l2443_l2440_l2436_DUPLICATE_a908_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2455_l2426_l2420_l2443_l2440_l2436_l2463_DUPLICATE_04aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2455_l2426_l2420_l2443_l2440_l2436_l2463_DUPLICATE_04aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2455_l2426_l2420_l2443_l2440_l2436_l2463_DUPLICATE_04aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2455_l2426_l2420_l2443_l2440_l2436_l2463_DUPLICATE_04aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2455_l2426_l2420_l2443_l2440_l2436_l2463_DUPLICATE_04aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2455_l2426_l2420_l2443_l2440_l2436_l2463_DUPLICATE_04aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2455_l2426_l2420_l2443_l2440_l2436_l2463_DUPLICATE_04aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_251c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2455_l2426_l2420_l2443_l2440_l2436_l2463_DUPLICATE_04aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_563b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2455_l2426_l2420_l2443_l2440_l2436_l2463_DUPLICATE_04aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_90a8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2455_l2426_l2420_l2443_l2440_l2436_l2463_DUPLICATE_04aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2443_l2459_DUPLICATE_9f62_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_563b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2443_l2459_DUPLICATE_9f62_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2426_l2420_l2443_l2440_l2436_DUPLICATE_a701_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2426_l2420_l2443_l2440_l2436_DUPLICATE_a701_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2426_l2420_l2443_l2440_l2436_DUPLICATE_a701_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2426_l2420_l2443_l2440_l2436_DUPLICATE_a701_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2426_l2420_l2443_l2440_l2436_DUPLICATE_a701_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2426_l2420_l2443_l2440_l2436_DUPLICATE_a701_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2426_l2420_l2443_l2440_l2436_DUPLICATE_a701_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2459_c7_563b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2433_l2459_l2429_l2426_l2420_l2443_l2440_l2436_DUPLICATE_a701_return_output;
     -- t8_MUX[uxn_opcodes_h_l2429_c7_d876] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2429_c7_d876_cond <= VAR_t8_MUX_uxn_opcodes_h_l2429_c7_d876_cond;
     t8_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue;
     t8_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2429_c7_d876_return_output := t8_MUX_uxn_opcodes_h_l2429_c7_d876_return_output;

     -- l8_MUX[uxn_opcodes_h_l2443_c7_f46d] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2443_c7_f46d_cond <= VAR_l8_MUX_uxn_opcodes_h_l2443_c7_f46d_cond;
     l8_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue;
     l8_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output := l8_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2447_c32_7f56] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2447_c32_7f56_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2447_c32_7f56_left;
     BIN_OP_GT_uxn_opcodes_h_l2447_c32_7f56_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2447_c32_7f56_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2447_c32_7f56_return_output := BIN_OP_GT_uxn_opcodes_h_l2447_c32_7f56_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2459_c7_563b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_563b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_563b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_563b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_563b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_563b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_563b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_563b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_563b_return_output;

     -- n8_MUX[uxn_opcodes_h_l2436_c7_059d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2436_c7_059d_cond <= VAR_n8_MUX_uxn_opcodes_h_l2436_c7_059d_cond;
     n8_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue;
     n8_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2436_c7_059d_return_output := n8_MUX_uxn_opcodes_h_l2436_c7_059d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2443_c7_f46d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2443_c7_f46d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2443_c7_f46d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2449_c7_1e08] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_1e08_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_1e08_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2463_c7_90a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_90a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_90a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_90a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_90a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_90a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_90a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_90a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_90a8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2463_c7_90a8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_90a8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_90a8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_90a8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_90a8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_90a8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_90a8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_90a8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_90a8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2420_c1_9e13] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2420_c1_9e13_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2420_c1_9e13_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2420_c1_9e13_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2420_c1_9e13_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2420_c1_9e13_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2420_c1_9e13_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2420_c1_9e13_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2420_c1_9e13_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2459_c7_563b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2459_c7_563b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2459_c7_563b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2459_c7_563b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2459_c7_563b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2459_c7_563b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2459_c7_563b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2459_c7_563b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2459_c7_563b_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2447_c32_4e14_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2447_c32_7f56_return_output;
     VAR_printf_uxn_opcodes_h_l2421_c3_33f7_uxn_opcodes_h_l2421_c3_33f7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2420_c1_9e13_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2436_c7_059d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_563b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_90a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_563b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_90a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_251c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_563b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2455_c7_251c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2459_c7_563b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2429_c7_d876_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2455_c7_251c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2455_c7_251c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2455_c7_251c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2455_c7_251c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2455_c7_251c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2455_c7_251c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2455_c7_251c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2455_c7_251c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2455_c7_251c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2440_c7_48ae] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2440_c7_48ae_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2440_c7_48ae_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output;

     -- MUX[uxn_opcodes_h_l2447_c32_4e14] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2447_c32_4e14_cond <= VAR_MUX_uxn_opcodes_h_l2447_c32_4e14_cond;
     MUX_uxn_opcodes_h_l2447_c32_4e14_iftrue <= VAR_MUX_uxn_opcodes_h_l2447_c32_4e14_iftrue;
     MUX_uxn_opcodes_h_l2447_c32_4e14_iffalse <= VAR_MUX_uxn_opcodes_h_l2447_c32_4e14_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2447_c32_4e14_return_output := MUX_uxn_opcodes_h_l2447_c32_4e14_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2443_c7_f46d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2459_c7_563b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_563b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_563b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_563b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_563b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_563b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_563b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_563b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_563b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2459_c7_563b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_563b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_563b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_563b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_563b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_563b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_563b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_563b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_563b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2455_c7_251c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_251c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_251c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_251c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_251c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_251c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_251c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_251c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_251c_return_output;

     -- printf_uxn_opcodes_h_l2421_c3_33f7[uxn_opcodes_h_l2421_c3_33f7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2421_c3_33f7_uxn_opcodes_h_l2421_c3_33f7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2421_c3_33f7_uxn_opcodes_h_l2421_c3_33f7_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l2426_c7_1e42] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2426_c7_1e42_cond <= VAR_t8_MUX_uxn_opcodes_h_l2426_c7_1e42_cond;
     t8_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue;
     t8_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output := t8_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output;

     -- l8_MUX[uxn_opcodes_h_l2440_c7_48ae] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2440_c7_48ae_cond <= VAR_l8_MUX_uxn_opcodes_h_l2440_c7_48ae_cond;
     l8_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue;
     l8_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output := l8_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output;

     -- n8_MUX[uxn_opcodes_h_l2433_c7_ddea] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2433_c7_ddea_cond <= VAR_n8_MUX_uxn_opcodes_h_l2433_c7_ddea_cond;
     n8_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue;
     n8_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output := n8_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue := VAR_MUX_uxn_opcodes_h_l2447_c32_4e14_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_251c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_563b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_251c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_563b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_251c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2455_c7_251c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2455_c7_251c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_251c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_251c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_251c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_251c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_251c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_251c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_251c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_251c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2455_c7_251c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_251c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_251c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_251c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_251c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_251c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_251c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_251c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_251c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2449_c7_1e08] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_1e08_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_1e08_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output;

     -- l8_MUX[uxn_opcodes_h_l2436_c7_059d] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2436_c7_059d_cond <= VAR_l8_MUX_uxn_opcodes_h_l2436_c7_059d_cond;
     l8_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue;
     l8_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2436_c7_059d_return_output := l8_MUX_uxn_opcodes_h_l2436_c7_059d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2436_c7_059d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2436_c7_059d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2436_c7_059d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2436_c7_059d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2436_c7_059d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2449_c7_1e08] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2449_c7_1e08_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2449_c7_1e08_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output := result_stack_value_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2440_c7_48ae] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2443_c7_f46d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output;

     -- t8_MUX[uxn_opcodes_h_l2420_c2_dd00] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2420_c2_dd00_cond <= VAR_t8_MUX_uxn_opcodes_h_l2420_c2_dd00_cond;
     t8_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue;
     t8_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output := t8_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output;

     -- n8_MUX[uxn_opcodes_h_l2429_c7_d876] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2429_c7_d876_cond <= VAR_n8_MUX_uxn_opcodes_h_l2429_c7_d876_cond;
     n8_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue;
     n8_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2429_c7_d876_return_output := n8_MUX_uxn_opcodes_h_l2429_c7_d876_return_output;

     -- Submodule level 4
     VAR_l8_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2436_c7_059d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2429_c7_d876_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_251c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2436_c7_059d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_251c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2449_c7_1e08] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_1e08_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_1e08_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2440_c7_48ae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output;

     -- n8_MUX[uxn_opcodes_h_l2426_c7_1e42] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2426_c7_1e42_cond <= VAR_n8_MUX_uxn_opcodes_h_l2426_c7_1e42_cond;
     n8_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue;
     n8_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output := n8_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2436_c7_059d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2436_c7_059d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2436_c7_059d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2436_c7_059d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2436_c7_059d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2433_c7_ddea] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2433_c7_ddea_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2433_c7_ddea_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2443_c7_f46d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2443_c7_f46d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2443_c7_f46d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2443_c7_f46d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2443_c7_f46d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2443_c7_f46d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2449_c7_1e08] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_1e08_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_1e08_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_1e08_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_1e08_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output;

     -- l8_MUX[uxn_opcodes_h_l2433_c7_ddea] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2433_c7_ddea_cond <= VAR_l8_MUX_uxn_opcodes_h_l2433_c7_ddea_cond;
     l8_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue;
     l8_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output := l8_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output;

     -- Submodule level 5
     VAR_l8_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2436_c7_059d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_1e08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2440_c7_48ae] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2440_c7_48ae_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2440_c7_48ae_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output := result_stack_value_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output;

     -- l8_MUX[uxn_opcodes_h_l2429_c7_d876] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2429_c7_d876_cond <= VAR_l8_MUX_uxn_opcodes_h_l2429_c7_d876_cond;
     l8_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue;
     l8_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2429_c7_d876_return_output := l8_MUX_uxn_opcodes_h_l2429_c7_d876_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2443_c7_f46d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2443_c7_f46d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2443_c7_f46d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2433_c7_ddea] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2440_c7_48ae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c7_48ae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c7_48ae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2443_c7_f46d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2443_c7_f46d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2443_c7_f46d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2443_c7_f46d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2443_c7_f46d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2436_c7_059d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2436_c7_059d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2436_c7_059d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2436_c7_059d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2436_c7_059d_return_output;

     -- n8_MUX[uxn_opcodes_h_l2420_c2_dd00] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2420_c2_dd00_cond <= VAR_n8_MUX_uxn_opcodes_h_l2420_c2_dd00_cond;
     n8_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue;
     n8_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output := n8_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2429_c7_d876] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2429_c7_d876_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2429_c7_d876_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2429_c7_d876_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2429_c7_d876_return_output;

     -- Submodule level 6
     VAR_l8_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2429_c7_d876_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2429_c7_d876_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2443_c7_f46d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2436_c7_059d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2429_c7_d876] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2429_c7_d876_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2429_c7_d876_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2429_c7_d876_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2429_c7_d876_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2436_c7_059d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2436_c7_059d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2436_c7_059d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2436_c7_059d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2436_c7_059d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2426_c7_1e42] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2426_c7_1e42_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2426_c7_1e42_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output;

     -- l8_MUX[uxn_opcodes_h_l2426_c7_1e42] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2426_c7_1e42_cond <= VAR_l8_MUX_uxn_opcodes_h_l2426_c7_1e42_cond;
     l8_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue;
     l8_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output := l8_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2440_c7_48ae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_48ae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_48ae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2436_c7_059d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_059d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_059d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_059d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_059d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2440_c7_48ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_48ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_48ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_48ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_48ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2433_c7_ddea] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output;

     -- Submodule level 7
     VAR_l8_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2429_c7_d876_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_48ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_059d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2436_c7_059d_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2433_c7_ddea] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2433_c7_ddea_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c7_ddea_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output := result_stack_value_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2426_c7_1e42] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2433_c7_ddea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_ddea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_ddea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2436_c7_059d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_059d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_059d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_059d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_059d_return_output;

     -- l8_MUX[uxn_opcodes_h_l2420_c2_dd00] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2420_c2_dd00_cond <= VAR_l8_MUX_uxn_opcodes_h_l2420_c2_dd00_cond;
     l8_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue;
     l8_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output := l8_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2429_c7_d876] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2429_c7_d876_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2429_c7_d876_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2429_c7_d876_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2429_c7_d876_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2436_c7_059d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_059d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_059d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_059d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_059d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_059d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_059d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2420_c2_dd00] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2420_c2_dd00_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c2_dd00_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output;

     -- Submodule level 8
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_059d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_059d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2429_c7_d876_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2429_c7_d876] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2429_c7_d876_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2429_c7_d876_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2429_c7_d876_return_output := result_stack_value_MUX_uxn_opcodes_h_l2429_c7_d876_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2433_c7_ddea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_ddea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_ddea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2420_c2_dd00] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2429_c7_d876] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2429_c7_d876_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2429_c7_d876_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2429_c7_d876_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2429_c7_d876_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2426_c7_1e42] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2433_c7_ddea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_ddea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_ddea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_ddea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_ddea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_ddea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2429_c7_d876_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2429_c7_d876_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2420_c2_dd00] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2429_c7_d876] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_d876_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_d876_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_d876_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_d876_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2426_c7_1e42] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2426_c7_1e42_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2426_c7_1e42_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2426_c7_1e42] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2426_c7_1e42_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2426_c7_1e42_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output := result_stack_value_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2429_c7_d876] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_d876_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_d876_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_d876_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_d876_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_d876_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_d876_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_d876_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_d876_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2420_c2_dd00] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c2_dd00_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c2_dd00_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2426_c7_1e42] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2426_c7_1e42_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2426_c7_1e42_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2420_c2_dd00] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2420_c2_dd00_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c2_dd00_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output := result_stack_value_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2426_c7_1e42] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2426_c7_1e42_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2426_c7_1e42_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2426_c7_1e42_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2426_c7_1e42_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2426_c7_1e42_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2420_c2_dd00] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2420_c2_dd00_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c2_dd00_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2420_c2_dd00] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2420_c2_dd00_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c2_dd00_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c2_dd00_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c2_dd00_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2468_l2416_DUPLICATE_c396 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2468_l2416_DUPLICATE_c396_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c2_dd00_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2468_l2416_DUPLICATE_c396_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2468_l2416_DUPLICATE_c396_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_l8 <= REG_VAR_l8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     l8 <= REG_COMB_l8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
