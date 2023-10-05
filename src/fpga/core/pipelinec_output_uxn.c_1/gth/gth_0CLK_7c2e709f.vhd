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
-- Submodules: 65
entity gth_0CLK_7c2e709f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth_0CLK_7c2e709f;
architecture arch of gth_0CLK_7c2e709f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1621_c6_2531]
signal BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1621_c1_d383]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1621_c1_d383_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1621_c1_d383_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1621_c1_d383_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1621_c1_d383_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1621_c2_92d7]
signal n8_MUX_uxn_opcodes_h_l1621_c2_92d7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1621_c2_92d7]
signal t8_MUX_uxn_opcodes_h_l1621_c2_92d7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1621_c2_92d7]
signal result_stack_value_MUX_uxn_opcodes_h_l1621_c2_92d7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1621_c2_92d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c2_92d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1621_c2_92d7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1621_c2_92d7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1621_c2_92d7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1621_c2_92d7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1621_c2_92d7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1621_c2_92d7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1621_c2_92d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1621_c2_92d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1622_c3_9873[uxn_opcodes_h_l1622_c3_9873]
signal printf_uxn_opcodes_h_l1622_c3_9873_uxn_opcodes_h_l1622_c3_9873_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1627_c11_d175]
signal BIN_OP_EQ_uxn_opcodes_h_l1627_c11_d175_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1627_c11_d175_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1627_c11_d175_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1627_c7_c3c6]
signal n8_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1627_c7_c3c6]
signal t8_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1627_c7_c3c6]
signal result_stack_value_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1627_c7_c3c6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1627_c7_c3c6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1627_c7_c3c6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1627_c7_c3c6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1627_c7_c3c6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1627_c7_c3c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1630_c11_4979]
signal BIN_OP_EQ_uxn_opcodes_h_l1630_c11_4979_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1630_c11_4979_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1630_c11_4979_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1630_c7_5523]
signal n8_MUX_uxn_opcodes_h_l1630_c7_5523_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1630_c7_5523_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1630_c7_5523]
signal t8_MUX_uxn_opcodes_h_l1630_c7_5523_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1630_c7_5523_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1630_c7_5523]
signal result_stack_value_MUX_uxn_opcodes_h_l1630_c7_5523_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1630_c7_5523_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1630_c7_5523]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_5523_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_5523_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1630_c7_5523]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_5523_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_5523_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1630_c7_5523]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1630_c7_5523_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1630_c7_5523_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1630_c7_5523]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1630_c7_5523_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1630_c7_5523_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1630_c7_5523]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_5523_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_5523_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1630_c7_5523]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_5523_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_5523_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1634_c11_da55]
signal BIN_OP_EQ_uxn_opcodes_h_l1634_c11_da55_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1634_c11_da55_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1634_c11_da55_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1634_c7_ec6d]
signal n8_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1634_c7_ec6d]
signal result_stack_value_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1634_c7_ec6d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1634_c7_ec6d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1634_c7_ec6d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1634_c7_ec6d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1634_c7_ec6d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1634_c7_ec6d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1637_c11_3256]
signal BIN_OP_EQ_uxn_opcodes_h_l1637_c11_3256_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1637_c11_3256_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1637_c11_3256_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1637_c7_01fb]
signal n8_MUX_uxn_opcodes_h_l1637_c7_01fb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1637_c7_01fb]
signal result_stack_value_MUX_uxn_opcodes_h_l1637_c7_01fb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1637_c7_01fb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_01fb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1637_c7_01fb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1637_c7_01fb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_01fb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1637_c7_01fb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1637_c7_01fb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_01fb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1637_c7_01fb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_01fb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1641_c32_c7c9]
signal BIN_OP_AND_uxn_opcodes_h_l1641_c32_c7c9_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1641_c32_c7c9_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1641_c32_c7c9_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1641_c32_e662]
signal BIN_OP_GT_uxn_opcodes_h_l1641_c32_e662_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1641_c32_e662_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1641_c32_e662_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1641_c32_ae2a]
signal MUX_uxn_opcodes_h_l1641_c32_ae2a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1641_c32_ae2a_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1641_c32_ae2a_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1641_c32_ae2a_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1643_c11_2e21]
signal BIN_OP_EQ_uxn_opcodes_h_l1643_c11_2e21_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1643_c11_2e21_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1643_c11_2e21_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1643_c7_e3f1]
signal result_stack_value_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1643_c7_e3f1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1643_c7_e3f1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1643_c7_e3f1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1643_c7_e3f1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1647_c24_8ca4]
signal BIN_OP_GT_uxn_opcodes_h_l1647_c24_8ca4_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1647_c24_8ca4_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1647_c24_8ca4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1647_c24_ea7e]
signal MUX_uxn_opcodes_h_l1647_c24_ea7e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1647_c24_ea7e_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1647_c24_ea7e_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1647_c24_ea7e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1649_c11_75bf]
signal BIN_OP_EQ_uxn_opcodes_h_l1649_c11_75bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1649_c11_75bf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1649_c11_75bf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1649_c7_b070]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1649_c7_b070_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1649_c7_b070_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1649_c7_b070_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1649_c7_b070_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1649_c7_b070]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_b070_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_b070_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_b070_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_b070_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_df93( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531
BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531_left,
BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531_right,
BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1621_c1_d383
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1621_c1_d383 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1621_c1_d383_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1621_c1_d383_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1621_c1_d383_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1621_c1_d383_return_output);

-- n8_MUX_uxn_opcodes_h_l1621_c2_92d7
n8_MUX_uxn_opcodes_h_l1621_c2_92d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1621_c2_92d7_cond,
n8_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue,
n8_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse,
n8_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output);

-- t8_MUX_uxn_opcodes_h_l1621_c2_92d7
t8_MUX_uxn_opcodes_h_l1621_c2_92d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1621_c2_92d7_cond,
t8_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue,
t8_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse,
t8_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1621_c2_92d7
result_stack_value_MUX_uxn_opcodes_h_l1621_c2_92d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1621_c2_92d7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c2_92d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c2_92d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c2_92d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c2_92d7
result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c2_92d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1621_c2_92d7
result_is_stack_read_MUX_uxn_opcodes_h_l1621_c2_92d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1621_c2_92d7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c2_92d7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c2_92d7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1621_c2_92d7
result_is_stack_write_MUX_uxn_opcodes_h_l1621_c2_92d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1621_c2_92d7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1621_c2_92d7
result_is_opc_done_MUX_uxn_opcodes_h_l1621_c2_92d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1621_c2_92d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output);

-- printf_uxn_opcodes_h_l1622_c3_9873_uxn_opcodes_h_l1622_c3_9873
printf_uxn_opcodes_h_l1622_c3_9873_uxn_opcodes_h_l1622_c3_9873 : entity work.printf_uxn_opcodes_h_l1622_c3_9873_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1622_c3_9873_uxn_opcodes_h_l1622_c3_9873_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1627_c11_d175
BIN_OP_EQ_uxn_opcodes_h_l1627_c11_d175 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1627_c11_d175_left,
BIN_OP_EQ_uxn_opcodes_h_l1627_c11_d175_right,
BIN_OP_EQ_uxn_opcodes_h_l1627_c11_d175_return_output);

-- n8_MUX_uxn_opcodes_h_l1627_c7_c3c6
n8_MUX_uxn_opcodes_h_l1627_c7_c3c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond,
n8_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue,
n8_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse,
n8_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output);

-- t8_MUX_uxn_opcodes_h_l1627_c7_c3c6
t8_MUX_uxn_opcodes_h_l1627_c7_c3c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond,
t8_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue,
t8_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse,
t8_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1627_c7_c3c6
result_stack_value_MUX_uxn_opcodes_h_l1627_c7_c3c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_c3c6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_c3c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6
result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_c3c6
result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_c3c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_c3c6
result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_c3c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_c3c6
result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_c3c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1630_c11_4979
BIN_OP_EQ_uxn_opcodes_h_l1630_c11_4979 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1630_c11_4979_left,
BIN_OP_EQ_uxn_opcodes_h_l1630_c11_4979_right,
BIN_OP_EQ_uxn_opcodes_h_l1630_c11_4979_return_output);

-- n8_MUX_uxn_opcodes_h_l1630_c7_5523
n8_MUX_uxn_opcodes_h_l1630_c7_5523 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1630_c7_5523_cond,
n8_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue,
n8_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse,
n8_MUX_uxn_opcodes_h_l1630_c7_5523_return_output);

-- t8_MUX_uxn_opcodes_h_l1630_c7_5523
t8_MUX_uxn_opcodes_h_l1630_c7_5523 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1630_c7_5523_cond,
t8_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue,
t8_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse,
t8_MUX_uxn_opcodes_h_l1630_c7_5523_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1630_c7_5523
result_stack_value_MUX_uxn_opcodes_h_l1630_c7_5523 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1630_c7_5523_cond,
result_stack_value_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1630_c7_5523_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_5523
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_5523 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_5523_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_5523_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_5523
result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_5523 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_5523_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_5523_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1630_c7_5523
result_is_stack_read_MUX_uxn_opcodes_h_l1630_c7_5523 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1630_c7_5523_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1630_c7_5523_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1630_c7_5523
result_sp_relative_shift_MUX_uxn_opcodes_h_l1630_c7_5523 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1630_c7_5523_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1630_c7_5523_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_5523
result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_5523 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_5523_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_5523_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_5523
result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_5523 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_5523_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_5523_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1634_c11_da55
BIN_OP_EQ_uxn_opcodes_h_l1634_c11_da55 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1634_c11_da55_left,
BIN_OP_EQ_uxn_opcodes_h_l1634_c11_da55_right,
BIN_OP_EQ_uxn_opcodes_h_l1634_c11_da55_return_output);

-- n8_MUX_uxn_opcodes_h_l1634_c7_ec6d
n8_MUX_uxn_opcodes_h_l1634_c7_ec6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond,
n8_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue,
n8_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse,
n8_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1634_c7_ec6d
result_stack_value_MUX_uxn_opcodes_h_l1634_c7_ec6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_ec6d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_ec6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d
result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1634_c7_ec6d
result_is_stack_read_MUX_uxn_opcodes_h_l1634_c7_ec6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_ec6d
result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_ec6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_ec6d
result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_ec6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1637_c11_3256
BIN_OP_EQ_uxn_opcodes_h_l1637_c11_3256 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1637_c11_3256_left,
BIN_OP_EQ_uxn_opcodes_h_l1637_c11_3256_right,
BIN_OP_EQ_uxn_opcodes_h_l1637_c11_3256_return_output);

-- n8_MUX_uxn_opcodes_h_l1637_c7_01fb
n8_MUX_uxn_opcodes_h_l1637_c7_01fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1637_c7_01fb_cond,
n8_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue,
n8_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse,
n8_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1637_c7_01fb
result_stack_value_MUX_uxn_opcodes_h_l1637_c7_01fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1637_c7_01fb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_01fb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_01fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_01fb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_01fb
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_01fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_01fb
result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_01fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_01fb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_01fb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_01fb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_01fb
result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_01fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_01fb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_01fb
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_01fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_01fb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1641_c32_c7c9
BIN_OP_AND_uxn_opcodes_h_l1641_c32_c7c9 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1641_c32_c7c9_left,
BIN_OP_AND_uxn_opcodes_h_l1641_c32_c7c9_right,
BIN_OP_AND_uxn_opcodes_h_l1641_c32_c7c9_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1641_c32_e662
BIN_OP_GT_uxn_opcodes_h_l1641_c32_e662 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1641_c32_e662_left,
BIN_OP_GT_uxn_opcodes_h_l1641_c32_e662_right,
BIN_OP_GT_uxn_opcodes_h_l1641_c32_e662_return_output);

-- MUX_uxn_opcodes_h_l1641_c32_ae2a
MUX_uxn_opcodes_h_l1641_c32_ae2a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1641_c32_ae2a_cond,
MUX_uxn_opcodes_h_l1641_c32_ae2a_iftrue,
MUX_uxn_opcodes_h_l1641_c32_ae2a_iffalse,
MUX_uxn_opcodes_h_l1641_c32_ae2a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1643_c11_2e21
BIN_OP_EQ_uxn_opcodes_h_l1643_c11_2e21 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1643_c11_2e21_left,
BIN_OP_EQ_uxn_opcodes_h_l1643_c11_2e21_right,
BIN_OP_EQ_uxn_opcodes_h_l1643_c11_2e21_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1643_c7_e3f1
result_stack_value_MUX_uxn_opcodes_h_l1643_c7_e3f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_e3f1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_e3f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_e3f1
result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_e3f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1643_c7_e3f1
result_is_stack_write_MUX_uxn_opcodes_h_l1643_c7_e3f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_e3f1
result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_e3f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1647_c24_8ca4
BIN_OP_GT_uxn_opcodes_h_l1647_c24_8ca4 : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1647_c24_8ca4_left,
BIN_OP_GT_uxn_opcodes_h_l1647_c24_8ca4_right,
BIN_OP_GT_uxn_opcodes_h_l1647_c24_8ca4_return_output);

-- MUX_uxn_opcodes_h_l1647_c24_ea7e
MUX_uxn_opcodes_h_l1647_c24_ea7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1647_c24_ea7e_cond,
MUX_uxn_opcodes_h_l1647_c24_ea7e_iftrue,
MUX_uxn_opcodes_h_l1647_c24_ea7e_iffalse,
MUX_uxn_opcodes_h_l1647_c24_ea7e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1649_c11_75bf
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_75bf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_75bf_left,
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_75bf_right,
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_75bf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1649_c7_b070
result_is_stack_write_MUX_uxn_opcodes_h_l1649_c7_b070 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1649_c7_b070_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1649_c7_b070_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1649_c7_b070_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1649_c7_b070_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_b070
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_b070 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_b070_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_b070_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_b070_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_b070_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1621_c1_d383_return_output,
 n8_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output,
 t8_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1627_c11_d175_return_output,
 n8_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output,
 t8_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1630_c11_4979_return_output,
 n8_MUX_uxn_opcodes_h_l1630_c7_5523_return_output,
 t8_MUX_uxn_opcodes_h_l1630_c7_5523_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1630_c7_5523_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_5523_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_5523_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1630_c7_5523_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1630_c7_5523_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_5523_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_5523_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1634_c11_da55_return_output,
 n8_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1637_c11_3256_return_output,
 n8_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1641_c32_c7c9_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1641_c32_e662_return_output,
 MUX_uxn_opcodes_h_l1641_c32_ae2a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1643_c11_2e21_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1647_c24_8ca4_return_output,
 MUX_uxn_opcodes_h_l1647_c24_ea7e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1649_c11_75bf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1649_c7_b070_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_b070_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1621_c1_d383_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1621_c1_d383_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1621_c1_d383_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1621_c1_d383_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1621_c2_92d7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1621_c2_92d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c2_92d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1624_c3_a7dc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c2_92d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c2_92d7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c2_92d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c2_92d7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1622_c3_9873_uxn_opcodes_h_l1622_c3_9873_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_d175_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_d175_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_d175_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1630_c7_5523_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1630_c7_5523_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1630_c7_5523_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1628_c3_6147 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_5523_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_5523_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1630_c7_5523_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1630_c7_5523_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_5523_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_5523_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_4979_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_4979_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_4979_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1630_c7_5523_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1630_c7_5523_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1630_c7_5523_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1632_c3_d6e8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_5523_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_5523_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1630_c7_5523_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1630_c7_5523_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_5523_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_5523_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_da55_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_da55_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_da55_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1635_c3_c39e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_3256_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_3256_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_3256_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1637_c7_01fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_01fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_01fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_01fb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_01fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_01fb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1641_c32_ae2a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1641_c32_ae2a_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1641_c32_ae2a_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1641_c32_c7c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1641_c32_c7c9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1641_c32_c7c9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1641_c32_e662_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1641_c32_e662_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1641_c32_e662_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1641_c32_ae2a_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_2e21_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_2e21_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_2e21_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1646_c3_d0d0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1649_c7_b070_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_b070_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1647_c24_ea7e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1647_c24_ea7e_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1647_c24_ea7e_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1647_c24_8ca4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1647_c24_8ca4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1647_c24_8ca4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1647_c24_ea7e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_75bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_75bf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_75bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1649_c7_b070_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1649_c7_b070_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1649_c7_b070_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_b070_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_b070_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_b070_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1643_l1637_l1634_l1630_l1627_l1621_DUPLICATE_e95d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1643_l1634_l1630_l1627_l1621_DUPLICATE_1001_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1637_l1634_l1630_l1627_l1621_DUPLICATE_d287_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1649_l1637_l1634_l1630_l1627_l1621_DUPLICATE_db29_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1634_l1627_l1637_l1630_DUPLICATE_d2fa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1649_l1643_l1637_l1634_l1630_l1627_DUPLICATE_6a4c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1637_l1643_DUPLICATE_6406_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1654_l1617_DUPLICATE_06cf_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l1641_c32_ae2a_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_b070_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1632_c3_d6e8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1632_c3_d6e8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_d175_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1641_c32_c7c9_right := to_unsigned(128, 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1641_c32_e662_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1646_c3_d0d0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1646_c3_d0d0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_3256_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1628_c3_6147 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1628_c3_6147;
     VAR_MUX_uxn_opcodes_h_l1647_c24_ea7e_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_4979_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1624_c3_a7dc := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1624_c3_a7dc;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1641_c32_ae2a_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1621_c1_d383_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1635_c3_c39e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1635_c3_c39e;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_75bf_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l1647_c24_ea7e_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1649_c7_b070_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_da55_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_2e21_right := to_unsigned(5, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1621_c1_d383_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1641_c32_c7c9_left := VAR_ins;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1647_c24_8ca4_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_d175_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_4979_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_da55_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_3256_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_2e21_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_75bf_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1647_c24_8ca4_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1627_c11_d175] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1627_c11_d175_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_d175_left;
     BIN_OP_EQ_uxn_opcodes_h_l1627_c11_d175_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_d175_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_d175_return_output := BIN_OP_EQ_uxn_opcodes_h_l1627_c11_d175_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1649_l1637_l1634_l1630_l1627_l1621_DUPLICATE_db29 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1649_l1637_l1634_l1630_l1627_l1621_DUPLICATE_db29_return_output := result.is_stack_write;

     -- BIN_OP_AND[uxn_opcodes_h_l1641_c32_c7c9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1641_c32_c7c9_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1641_c32_c7c9_left;
     BIN_OP_AND_uxn_opcodes_h_l1641_c32_c7c9_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1641_c32_c7c9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1641_c32_c7c9_return_output := BIN_OP_AND_uxn_opcodes_h_l1641_c32_c7c9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1643_c11_2e21] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1643_c11_2e21_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_2e21_left;
     BIN_OP_EQ_uxn_opcodes_h_l1643_c11_2e21_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_2e21_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_2e21_return_output := BIN_OP_EQ_uxn_opcodes_h_l1643_c11_2e21_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1649_c11_75bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1649_c11_75bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_75bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1649_c11_75bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_75bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_75bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1649_c11_75bf_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1637_l1634_l1630_l1627_l1621_DUPLICATE_d287 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1637_l1634_l1630_l1627_l1621_DUPLICATE_d287_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1649_l1643_l1637_l1634_l1630_l1627_DUPLICATE_6a4c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1649_l1643_l1637_l1634_l1630_l1627_DUPLICATE_6a4c_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1643_l1637_l1634_l1630_l1627_l1621_DUPLICATE_e95d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1643_l1637_l1634_l1630_l1627_l1621_DUPLICATE_e95d_return_output := result.stack_value;

     -- BIN_OP_GT[uxn_opcodes_h_l1647_c24_8ca4] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1647_c24_8ca4_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1647_c24_8ca4_left;
     BIN_OP_GT_uxn_opcodes_h_l1647_c24_8ca4_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1647_c24_8ca4_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1647_c24_8ca4_return_output := BIN_OP_GT_uxn_opcodes_h_l1647_c24_8ca4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1643_l1634_l1630_l1627_l1621_DUPLICATE_1001 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1643_l1634_l1630_l1627_l1621_DUPLICATE_1001_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1637_c11_3256] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1637_c11_3256_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_3256_left;
     BIN_OP_EQ_uxn_opcodes_h_l1637_c11_3256_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_3256_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_3256_return_output := BIN_OP_EQ_uxn_opcodes_h_l1637_c11_3256_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1637_l1643_DUPLICATE_6406 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1637_l1643_DUPLICATE_6406_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1621_c6_2531] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531_left;
     BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531_return_output := BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1634_l1627_l1637_l1630_DUPLICATE_d2fa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1634_l1627_l1637_l1630_DUPLICATE_d2fa_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1630_c11_4979] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1630_c11_4979_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_4979_left;
     BIN_OP_EQ_uxn_opcodes_h_l1630_c11_4979_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_4979_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_4979_return_output := BIN_OP_EQ_uxn_opcodes_h_l1630_c11_4979_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1634_c11_da55] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1634_c11_da55_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_da55_left;
     BIN_OP_EQ_uxn_opcodes_h_l1634_c11_da55_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_da55_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_da55_return_output := BIN_OP_EQ_uxn_opcodes_h_l1634_c11_da55_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1641_c32_e662_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1641_c32_c7c9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1621_c1_d383_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1621_c2_92d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c2_92d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c2_92d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c2_92d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c2_92d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c2_92d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1621_c2_92d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c6_2531_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_d175_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_d175_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_d175_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_d175_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_d175_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_d175_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_d175_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_d175_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_d175_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1630_c7_5523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_4979_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_5523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_4979_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_5523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_4979_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1630_c7_5523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_4979_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_5523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_4979_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1630_c7_5523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_4979_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_5523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_4979_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1630_c7_5523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_4979_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1630_c7_5523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_4979_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_da55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_da55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_da55_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_da55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_da55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_da55_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_da55_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_da55_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1637_c7_01fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_3256_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_01fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_3256_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_3256_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_01fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_3256_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_01fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_3256_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_3256_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_01fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_3256_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_01fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_3256_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_2e21_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_2e21_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_2e21_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_2e21_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_2e21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_b070_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_75bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1649_c7_b070_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_75bf_return_output;
     VAR_MUX_uxn_opcodes_h_l1647_c24_ea7e_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1647_c24_8ca4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1637_l1634_l1630_l1627_l1621_DUPLICATE_d287_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1637_l1634_l1630_l1627_l1621_DUPLICATE_d287_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1637_l1634_l1630_l1627_l1621_DUPLICATE_d287_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1637_l1634_l1630_l1627_l1621_DUPLICATE_d287_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1637_l1634_l1630_l1627_l1621_DUPLICATE_d287_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1649_l1643_l1637_l1634_l1630_l1627_DUPLICATE_6a4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1649_l1643_l1637_l1634_l1630_l1627_DUPLICATE_6a4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1649_l1643_l1637_l1634_l1630_l1627_DUPLICATE_6a4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1649_l1643_l1637_l1634_l1630_l1627_DUPLICATE_6a4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1649_l1643_l1637_l1634_l1630_l1627_DUPLICATE_6a4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_b070_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1649_l1643_l1637_l1634_l1630_l1627_DUPLICATE_6a4c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1643_l1634_l1630_l1627_l1621_DUPLICATE_1001_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1643_l1634_l1630_l1627_l1621_DUPLICATE_1001_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1643_l1634_l1630_l1627_l1621_DUPLICATE_1001_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1643_l1634_l1630_l1627_l1621_DUPLICATE_1001_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1643_l1634_l1630_l1627_l1621_DUPLICATE_1001_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1634_l1627_l1637_l1630_DUPLICATE_d2fa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1634_l1627_l1637_l1630_DUPLICATE_d2fa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1634_l1627_l1637_l1630_DUPLICATE_d2fa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1634_l1627_l1637_l1630_DUPLICATE_d2fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1649_l1637_l1634_l1630_l1627_l1621_DUPLICATE_db29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1649_l1637_l1634_l1630_l1627_l1621_DUPLICATE_db29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1649_l1637_l1634_l1630_l1627_l1621_DUPLICATE_db29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1649_l1637_l1634_l1630_l1627_l1621_DUPLICATE_db29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1649_l1637_l1634_l1630_l1627_l1621_DUPLICATE_db29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1649_c7_b070_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1649_l1637_l1634_l1630_l1627_l1621_DUPLICATE_db29_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1637_l1643_DUPLICATE_6406_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1637_l1643_DUPLICATE_6406_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1643_l1637_l1634_l1630_l1627_l1621_DUPLICATE_e95d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1643_l1637_l1634_l1630_l1627_l1621_DUPLICATE_e95d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1643_l1637_l1634_l1630_l1627_l1621_DUPLICATE_e95d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1643_l1637_l1634_l1630_l1627_l1621_DUPLICATE_e95d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1643_l1637_l1634_l1630_l1627_l1621_DUPLICATE_e95d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1643_l1637_l1634_l1630_l1627_l1621_DUPLICATE_e95d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1643_c7_e3f1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1649_c7_b070] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_b070_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_b070_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_b070_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_b070_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_b070_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_b070_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_b070_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_b070_return_output;

     -- n8_MUX[uxn_opcodes_h_l1637_c7_01fb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1637_c7_01fb_cond <= VAR_n8_MUX_uxn_opcodes_h_l1637_c7_01fb_cond;
     n8_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue;
     n8_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output := n8_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1637_c7_01fb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_01fb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_01fb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output;

     -- t8_MUX[uxn_opcodes_h_l1630_c7_5523] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1630_c7_5523_cond <= VAR_t8_MUX_uxn_opcodes_h_l1630_c7_5523_cond;
     t8_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue;
     t8_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1630_c7_5523_return_output := t8_MUX_uxn_opcodes_h_l1630_c7_5523_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1641_c32_e662] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1641_c32_e662_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1641_c32_e662_left;
     BIN_OP_GT_uxn_opcodes_h_l1641_c32_e662_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1641_c32_e662_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1641_c32_e662_return_output := BIN_OP_GT_uxn_opcodes_h_l1641_c32_e662_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1649_c7_b070] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1649_c7_b070_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1649_c7_b070_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1649_c7_b070_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1649_c7_b070_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1649_c7_b070_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1649_c7_b070_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1649_c7_b070_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1649_c7_b070_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1643_c7_e3f1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output;

     -- MUX[uxn_opcodes_h_l1647_c24_ea7e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1647_c24_ea7e_cond <= VAR_MUX_uxn_opcodes_h_l1647_c24_ea7e_cond;
     MUX_uxn_opcodes_h_l1647_c24_ea7e_iftrue <= VAR_MUX_uxn_opcodes_h_l1647_c24_ea7e_iftrue;
     MUX_uxn_opcodes_h_l1647_c24_ea7e_iffalse <= VAR_MUX_uxn_opcodes_h_l1647_c24_ea7e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1647_c24_ea7e_return_output := MUX_uxn_opcodes_h_l1647_c24_ea7e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1621_c1_d383] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1621_c1_d383_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1621_c1_d383_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1621_c1_d383_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1621_c1_d383_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1621_c1_d383_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1621_c1_d383_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1621_c1_d383_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1621_c1_d383_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1641_c32_ae2a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1641_c32_e662_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue := VAR_MUX_uxn_opcodes_h_l1647_c24_ea7e_return_output;
     VAR_printf_uxn_opcodes_h_l1622_c3_9873_uxn_opcodes_h_l1622_c3_9873_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1621_c1_d383_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_b070_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1649_c7_b070_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1630_c7_5523_return_output;
     -- t8_MUX[uxn_opcodes_h_l1627_c7_c3c6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond <= VAR_t8_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond;
     t8_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue;
     t8_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output := t8_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1643_c7_e3f1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1634_c7_ec6d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1637_c7_01fb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1643_c7_e3f1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output;

     -- printf_uxn_opcodes_h_l1622_c3_9873[uxn_opcodes_h_l1622_c3_9873] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1622_c3_9873_uxn_opcodes_h_l1622_c3_9873_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1622_c3_9873_uxn_opcodes_h_l1622_c3_9873_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1637_c7_01fb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_01fb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_01fb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1643_c7_e3f1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_e3f1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_e3f1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_e3f1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output;

     -- MUX[uxn_opcodes_h_l1641_c32_ae2a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1641_c32_ae2a_cond <= VAR_MUX_uxn_opcodes_h_l1641_c32_ae2a_cond;
     MUX_uxn_opcodes_h_l1641_c32_ae2a_iftrue <= VAR_MUX_uxn_opcodes_h_l1641_c32_ae2a_iftrue;
     MUX_uxn_opcodes_h_l1641_c32_ae2a_iffalse <= VAR_MUX_uxn_opcodes_h_l1641_c32_ae2a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1641_c32_ae2a_return_output := MUX_uxn_opcodes_h_l1641_c32_ae2a_return_output;

     -- n8_MUX[uxn_opcodes_h_l1634_c7_ec6d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond <= VAR_n8_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond;
     n8_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue;
     n8_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output := n8_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue := VAR_MUX_uxn_opcodes_h_l1641_c32_ae2a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1643_c7_e3f1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1634_c7_ec6d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1637_c7_01fb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_01fb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_01fb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output;

     -- n8_MUX[uxn_opcodes_h_l1630_c7_5523] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1630_c7_5523_cond <= VAR_n8_MUX_uxn_opcodes_h_l1630_c7_5523_cond;
     n8_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue;
     n8_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1630_c7_5523_return_output := n8_MUX_uxn_opcodes_h_l1630_c7_5523_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1637_c7_01fb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1637_c7_01fb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_01fb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1637_c7_01fb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_01fb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_01fb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output;

     -- t8_MUX[uxn_opcodes_h_l1621_c2_92d7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1621_c2_92d7_cond <= VAR_t8_MUX_uxn_opcodes_h_l1621_c2_92d7_cond;
     t8_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue;
     t8_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output := t8_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1637_c7_01fb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1634_c7_ec6d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1630_c7_5523] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1630_c7_5523_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1630_c7_5523_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1630_c7_5523_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1630_c7_5523_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1630_c7_5523_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1630_c7_5523_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_01fb_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1627_c7_c3c6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1630_c7_5523] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_5523_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_5523_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_5523_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_5523_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1634_c7_ec6d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output;

     -- n8_MUX[uxn_opcodes_h_l1627_c7_c3c6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond <= VAR_n8_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond;
     n8_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue;
     n8_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output := n8_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1634_c7_ec6d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1634_c7_ec6d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1634_c7_ec6d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1630_c7_5523] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_5523_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_5523_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_5523_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_5523_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_5523_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_5523_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1634_c7_ec6d_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1630_c7_5523] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1630_c7_5523_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1630_c7_5523_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1630_c7_5523_return_output := result_stack_value_MUX_uxn_opcodes_h_l1630_c7_5523_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1630_c7_5523] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_5523_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_5523_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_5523_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_5523_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1630_c7_5523] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1630_c7_5523_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1630_c7_5523_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1630_c7_5523_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1630_c7_5523_return_output;

     -- n8_MUX[uxn_opcodes_h_l1621_c2_92d7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1621_c2_92d7_cond <= VAR_n8_MUX_uxn_opcodes_h_l1621_c2_92d7_cond;
     n8_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue;
     n8_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output := n8_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1627_c7_c3c6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1627_c7_c3c6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1630_c7_5523] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_5523_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_5523_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_5523_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_5523_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_5523_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_5523_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1621_c2_92d7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1621_c2_92d7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c2_92d7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_5523_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_5523_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1630_c7_5523_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1630_c7_5523_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1627_c7_c3c6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1621_c2_92d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c2_92d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c2_92d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1621_c2_92d7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1627_c7_c3c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1627_c7_c3c6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1627_c7_c3c6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_c3c6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_c3c6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_c3c6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_c3c6_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1621_c2_92d7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1621_c2_92d7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c2_92d7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1621_c2_92d7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1621_c2_92d7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c2_92d7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1621_c2_92d7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1621_c2_92d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1621_c2_92d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c2_92d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c2_92d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c2_92d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1654_l1617_DUPLICATE_06cf LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1654_l1617_DUPLICATE_06cf_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c2_92d7_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1654_l1617_DUPLICATE_06cf_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1654_l1617_DUPLICATE_06cf_return_output;
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
