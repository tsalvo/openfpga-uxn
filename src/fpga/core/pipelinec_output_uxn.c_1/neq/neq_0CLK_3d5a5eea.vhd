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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 58
entity neq_0CLK_3d5a5eea is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq_0CLK_3d5a5eea;
architecture arch of neq_0CLK_3d5a5eea is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1345_c6_0dbf]
signal BIN_OP_EQ_uxn_opcodes_h_l1345_c6_0dbf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1345_c6_0dbf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1345_c6_0dbf_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1345_c2_a259]
signal n8_MUX_uxn_opcodes_h_l1345_c2_a259_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1345_c2_a259_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1345_c2_a259]
signal t8_MUX_uxn_opcodes_h_l1345_c2_a259_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1345_c2_a259_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1345_c2_a259]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_a259_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_a259_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1345_c2_a259]
signal result_stack_value_MUX_uxn_opcodes_h_l1345_c2_a259_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1345_c2_a259_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1345_c2_a259]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_a259_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_a259_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1345_c2_a259]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_a259_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_a259_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1345_c2_a259]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_a259_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_a259_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1345_c2_a259]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_a259_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_a259_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1350_c11_944e]
signal BIN_OP_EQ_uxn_opcodes_h_l1350_c11_944e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1350_c11_944e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1350_c11_944e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1350_c7_6751]
signal n8_MUX_uxn_opcodes_h_l1350_c7_6751_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1350_c7_6751_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1350_c7_6751]
signal t8_MUX_uxn_opcodes_h_l1350_c7_6751_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1350_c7_6751_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1350_c7_6751]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_6751_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_6751_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1350_c7_6751]
signal result_stack_value_MUX_uxn_opcodes_h_l1350_c7_6751_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1350_c7_6751_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1350_c7_6751]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_6751_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_6751_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1350_c7_6751]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_6751_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_6751_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1350_c7_6751]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_6751_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_6751_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1350_c7_6751]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_6751_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_6751_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1353_c11_c174]
signal BIN_OP_EQ_uxn_opcodes_h_l1353_c11_c174_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1353_c11_c174_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1353_c11_c174_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1353_c7_b178]
signal n8_MUX_uxn_opcodes_h_l1353_c7_b178_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1353_c7_b178_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1353_c7_b178]
signal t8_MUX_uxn_opcodes_h_l1353_c7_b178_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1353_c7_b178_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1353_c7_b178]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_b178_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_b178_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1353_c7_b178]
signal result_stack_value_MUX_uxn_opcodes_h_l1353_c7_b178_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1353_c7_b178_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1353_c7_b178]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_b178_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_b178_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1353_c7_b178]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_b178_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_b178_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1353_c7_b178]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_b178_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_b178_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1353_c7_b178]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_b178_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_b178_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1357_c11_83cd]
signal BIN_OP_EQ_uxn_opcodes_h_l1357_c11_83cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1357_c11_83cd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1357_c11_83cd_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1357_c7_1898]
signal n8_MUX_uxn_opcodes_h_l1357_c7_1898_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1357_c7_1898_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1357_c7_1898]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1357_c7_1898]
signal result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1357_c7_1898]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1357_c7_1898]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1357_c7_1898]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1357_c7_1898]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1360_c11_b6f9]
signal BIN_OP_EQ_uxn_opcodes_h_l1360_c11_b6f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1360_c11_b6f9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1360_c11_b6f9_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1360_c7_68e3]
signal n8_MUX_uxn_opcodes_h_l1360_c7_68e3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1360_c7_68e3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1360_c7_68e3]
signal result_stack_value_MUX_uxn_opcodes_h_l1360_c7_68e3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1360_c7_68e3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_68e3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1360_c7_68e3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1360_c7_68e3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_68e3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1360_c7_68e3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_68e3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1363_c32_ae6e]
signal BIN_OP_AND_uxn_opcodes_h_l1363_c32_ae6e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1363_c32_ae6e_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1363_c32_ae6e_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1363_c32_3f13]
signal BIN_OP_GT_uxn_opcodes_h_l1363_c32_3f13_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1363_c32_3f13_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1363_c32_3f13_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1363_c32_6038]
signal MUX_uxn_opcodes_h_l1363_c32_6038_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1363_c32_6038_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1363_c32_6038_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1363_c32_6038_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1365_c11_3dd5]
signal BIN_OP_EQ_uxn_opcodes_h_l1365_c11_3dd5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1365_c11_3dd5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1365_c11_3dd5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1365_c7_862e]
signal result_stack_value_MUX_uxn_opcodes_h_l1365_c7_862e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1365_c7_862e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1365_c7_862e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_862e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_862e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1365_c7_862e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_862e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_862e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1365_c7_862e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_862e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_862e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1365_c7_862e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_862e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_862e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1369_c24_290e]
signal BIN_OP_EQ_uxn_opcodes_h_l1369_c24_290e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1369_c24_290e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1369_c24_290e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1369_c24_7e0f]
signal MUX_uxn_opcodes_h_l1369_c24_7e0f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1369_c24_7e0f_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1369_c24_7e0f_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1369_c24_7e0f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1371_c11_b639]
signal BIN_OP_EQ_uxn_opcodes_h_l1371_c11_b639_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1371_c11_b639_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1371_c11_b639_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1371_c7_b352]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_b352_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_b352_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_b352_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_b352_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1371_c7_b352]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_b352_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_b352_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_b352_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_b352_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1345_c6_0dbf
BIN_OP_EQ_uxn_opcodes_h_l1345_c6_0dbf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1345_c6_0dbf_left,
BIN_OP_EQ_uxn_opcodes_h_l1345_c6_0dbf_right,
BIN_OP_EQ_uxn_opcodes_h_l1345_c6_0dbf_return_output);

-- n8_MUX_uxn_opcodes_h_l1345_c2_a259
n8_MUX_uxn_opcodes_h_l1345_c2_a259 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1345_c2_a259_cond,
n8_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue,
n8_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse,
n8_MUX_uxn_opcodes_h_l1345_c2_a259_return_output);

-- t8_MUX_uxn_opcodes_h_l1345_c2_a259
t8_MUX_uxn_opcodes_h_l1345_c2_a259 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1345_c2_a259_cond,
t8_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue,
t8_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse,
t8_MUX_uxn_opcodes_h_l1345_c2_a259_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_a259
result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_a259 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_a259_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_a259_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1345_c2_a259
result_stack_value_MUX_uxn_opcodes_h_l1345_c2_a259 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1345_c2_a259_cond,
result_stack_value_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1345_c2_a259_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_a259
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_a259 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_a259_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_a259_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_a259
result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_a259 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_a259_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_a259_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_a259
result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_a259 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_a259_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_a259_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_a259
result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_a259 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_a259_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_a259_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1350_c11_944e
BIN_OP_EQ_uxn_opcodes_h_l1350_c11_944e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1350_c11_944e_left,
BIN_OP_EQ_uxn_opcodes_h_l1350_c11_944e_right,
BIN_OP_EQ_uxn_opcodes_h_l1350_c11_944e_return_output);

-- n8_MUX_uxn_opcodes_h_l1350_c7_6751
n8_MUX_uxn_opcodes_h_l1350_c7_6751 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1350_c7_6751_cond,
n8_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue,
n8_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse,
n8_MUX_uxn_opcodes_h_l1350_c7_6751_return_output);

-- t8_MUX_uxn_opcodes_h_l1350_c7_6751
t8_MUX_uxn_opcodes_h_l1350_c7_6751 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1350_c7_6751_cond,
t8_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue,
t8_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse,
t8_MUX_uxn_opcodes_h_l1350_c7_6751_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_6751
result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_6751 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_6751_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_6751_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1350_c7_6751
result_stack_value_MUX_uxn_opcodes_h_l1350_c7_6751 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1350_c7_6751_cond,
result_stack_value_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1350_c7_6751_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_6751
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_6751 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_6751_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_6751_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_6751
result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_6751 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_6751_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_6751_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_6751
result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_6751 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_6751_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_6751_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_6751
result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_6751 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_6751_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_6751_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1353_c11_c174
BIN_OP_EQ_uxn_opcodes_h_l1353_c11_c174 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1353_c11_c174_left,
BIN_OP_EQ_uxn_opcodes_h_l1353_c11_c174_right,
BIN_OP_EQ_uxn_opcodes_h_l1353_c11_c174_return_output);

-- n8_MUX_uxn_opcodes_h_l1353_c7_b178
n8_MUX_uxn_opcodes_h_l1353_c7_b178 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1353_c7_b178_cond,
n8_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue,
n8_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse,
n8_MUX_uxn_opcodes_h_l1353_c7_b178_return_output);

-- t8_MUX_uxn_opcodes_h_l1353_c7_b178
t8_MUX_uxn_opcodes_h_l1353_c7_b178 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1353_c7_b178_cond,
t8_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue,
t8_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse,
t8_MUX_uxn_opcodes_h_l1353_c7_b178_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_b178
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_b178 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_b178_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_b178_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1353_c7_b178
result_stack_value_MUX_uxn_opcodes_h_l1353_c7_b178 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1353_c7_b178_cond,
result_stack_value_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1353_c7_b178_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_b178
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_b178 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_b178_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_b178_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_b178
result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_b178 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_b178_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_b178_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_b178
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_b178 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_b178_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_b178_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_b178
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_b178 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_b178_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_b178_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1357_c11_83cd
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_83cd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_83cd_left,
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_83cd_right,
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_83cd_return_output);

-- n8_MUX_uxn_opcodes_h_l1357_c7_1898
n8_MUX_uxn_opcodes_h_l1357_c7_1898 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1357_c7_1898_cond,
n8_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue,
n8_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse,
n8_MUX_uxn_opcodes_h_l1357_c7_1898_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898
result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898
result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_cond,
result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898
result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1360_c11_b6f9
BIN_OP_EQ_uxn_opcodes_h_l1360_c11_b6f9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1360_c11_b6f9_left,
BIN_OP_EQ_uxn_opcodes_h_l1360_c11_b6f9_right,
BIN_OP_EQ_uxn_opcodes_h_l1360_c11_b6f9_return_output);

-- n8_MUX_uxn_opcodes_h_l1360_c7_68e3
n8_MUX_uxn_opcodes_h_l1360_c7_68e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1360_c7_68e3_cond,
n8_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue,
n8_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse,
n8_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_68e3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_68e3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1360_c7_68e3
result_stack_value_MUX_uxn_opcodes_h_l1360_c7_68e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1360_c7_68e3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_68e3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_68e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_68e3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_68e3
result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_68e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_68e3
result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_68e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_68e3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_68e3
result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_68e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_68e3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1363_c32_ae6e
BIN_OP_AND_uxn_opcodes_h_l1363_c32_ae6e : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1363_c32_ae6e_left,
BIN_OP_AND_uxn_opcodes_h_l1363_c32_ae6e_right,
BIN_OP_AND_uxn_opcodes_h_l1363_c32_ae6e_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1363_c32_3f13
BIN_OP_GT_uxn_opcodes_h_l1363_c32_3f13 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1363_c32_3f13_left,
BIN_OP_GT_uxn_opcodes_h_l1363_c32_3f13_right,
BIN_OP_GT_uxn_opcodes_h_l1363_c32_3f13_return_output);

-- MUX_uxn_opcodes_h_l1363_c32_6038
MUX_uxn_opcodes_h_l1363_c32_6038 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1363_c32_6038_cond,
MUX_uxn_opcodes_h_l1363_c32_6038_iftrue,
MUX_uxn_opcodes_h_l1363_c32_6038_iffalse,
MUX_uxn_opcodes_h_l1363_c32_6038_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1365_c11_3dd5
BIN_OP_EQ_uxn_opcodes_h_l1365_c11_3dd5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1365_c11_3dd5_left,
BIN_OP_EQ_uxn_opcodes_h_l1365_c11_3dd5_right,
BIN_OP_EQ_uxn_opcodes_h_l1365_c11_3dd5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1365_c7_862e
result_stack_value_MUX_uxn_opcodes_h_l1365_c7_862e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1365_c7_862e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1365_c7_862e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_862e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_862e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_862e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_862e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_862e
result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_862e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_862e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_862e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_862e
result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_862e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_862e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_862e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_862e
result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_862e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_862e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_862e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1369_c24_290e
BIN_OP_EQ_uxn_opcodes_h_l1369_c24_290e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1369_c24_290e_left,
BIN_OP_EQ_uxn_opcodes_h_l1369_c24_290e_right,
BIN_OP_EQ_uxn_opcodes_h_l1369_c24_290e_return_output);

-- MUX_uxn_opcodes_h_l1369_c24_7e0f
MUX_uxn_opcodes_h_l1369_c24_7e0f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1369_c24_7e0f_cond,
MUX_uxn_opcodes_h_l1369_c24_7e0f_iftrue,
MUX_uxn_opcodes_h_l1369_c24_7e0f_iffalse,
MUX_uxn_opcodes_h_l1369_c24_7e0f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1371_c11_b639
BIN_OP_EQ_uxn_opcodes_h_l1371_c11_b639 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1371_c11_b639_left,
BIN_OP_EQ_uxn_opcodes_h_l1371_c11_b639_right,
BIN_OP_EQ_uxn_opcodes_h_l1371_c11_b639_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_b352
result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_b352 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_b352_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_b352_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_b352_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_b352_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_b352
result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_b352 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_b352_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_b352_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_b352_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_b352_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1345_c6_0dbf_return_output,
 n8_MUX_uxn_opcodes_h_l1345_c2_a259_return_output,
 t8_MUX_uxn_opcodes_h_l1345_c2_a259_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_a259_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1345_c2_a259_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_a259_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_a259_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_a259_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_a259_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1350_c11_944e_return_output,
 n8_MUX_uxn_opcodes_h_l1350_c7_6751_return_output,
 t8_MUX_uxn_opcodes_h_l1350_c7_6751_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_6751_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1350_c7_6751_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_6751_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_6751_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_6751_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_6751_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1353_c11_c174_return_output,
 n8_MUX_uxn_opcodes_h_l1353_c7_b178_return_output,
 t8_MUX_uxn_opcodes_h_l1353_c7_b178_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_b178_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1353_c7_b178_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_b178_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_b178_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_b178_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_b178_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1357_c11_83cd_return_output,
 n8_MUX_uxn_opcodes_h_l1357_c7_1898_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1360_c11_b6f9_return_output,
 n8_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1363_c32_ae6e_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1363_c32_3f13_return_output,
 MUX_uxn_opcodes_h_l1363_c32_6038_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1365_c11_3dd5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1365_c7_862e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_862e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_862e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_862e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_862e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1369_c24_290e_return_output,
 MUX_uxn_opcodes_h_l1369_c24_7e0f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1371_c11_b639_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_b352_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_b352_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_0dbf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_0dbf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_0dbf_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1350_c7_6751_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1345_c2_a259_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1345_c2_a259_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1350_c7_6751_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1345_c2_a259_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1345_c2_a259_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_6751_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_a259_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_a259_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_6751_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1345_c2_a259_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1345_c2_a259_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1347_c3_4862 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_6751_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_a259_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_a259_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_6751_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_a259_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_a259_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_6751_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_a259_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_a259_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_6751_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_a259_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_a259_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_944e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_944e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_944e_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1353_c7_b178_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1350_c7_6751_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1353_c7_b178_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1350_c7_6751_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_b178_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_6751_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_b178_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_6751_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1351_c3_acbe : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_b178_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_6751_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_b178_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_6751_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_b178_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_6751_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_b178_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_6751_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_c174_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_c174_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_c174_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1357_c7_1898_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1353_c7_b178_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1353_c7_b178_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_b178_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_b178_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1355_c3_b2b5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_b178_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_b178_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_b178_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_b178_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_83cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_83cd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_83cd_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1357_c7_1898_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1358_c3_38d0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_b6f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_b6f9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_b6f9_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1360_c7_68e3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_862e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1360_c7_68e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_862e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_68e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_862e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_862e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_68e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_862e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_68e3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1363_c32_6038_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1363_c32_6038_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1363_c32_6038_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1363_c32_ae6e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1363_c32_ae6e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1363_c32_ae6e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1363_c32_3f13_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1363_c32_3f13_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1363_c32_3f13_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1363_c32_6038_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_3dd5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_3dd5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_3dd5_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_862e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1368_c3_b226 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_862e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_862e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_b352_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_862e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_b352_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_862e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1369_c24_7e0f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1369_c24_7e0f_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1369_c24_7e0f_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c24_290e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c24_290e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c24_290e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1369_c24_7e0f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_b639_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_b639_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_b639_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_b352_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_b352_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_b352_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_b352_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_b352_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_b352_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1345_l1360_l1357_l1353_l1350_DUPLICATE_83e2_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1345_l1365_l1360_l1357_l1353_l1350_DUPLICATE_7243_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1345_l1365_l1357_l1353_l1350_DUPLICATE_f883_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1345_l1371_l1360_l1357_l1353_l1350_DUPLICATE_2350_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1371_l1365_l1360_l1357_l1353_l1350_DUPLICATE_bd47_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1365_l1360_DUPLICATE_c515_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1376_l1341_DUPLICATE_eaf2_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_b352_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1363_c32_3f13_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_944e_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1368_c3_b226 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1368_c3_b226;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_3dd5_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l1363_c32_6038_iffalse := resize(to_signed(-1, 2), 8);
     VAR_MUX_uxn_opcodes_h_l1369_c24_7e0f_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_0dbf_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1351_c3_acbe := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1351_c3_acbe;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1355_c3_b2b5 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1355_c3_b2b5;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_83cd_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_b6f9_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l1363_c32_6038_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_c174_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l1369_c24_7e0f_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_b639_right := to_unsigned(6, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1363_c32_ae6e_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_b352_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1347_c3_4862 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1347_c3_4862;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1358_c3_38d0 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1358_c3_38d0;

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l1363_c32_ae6e_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c24_290e_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_0dbf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_944e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_c174_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_83cd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_b6f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_3dd5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_b639_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c24_290e_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1371_l1365_l1360_l1357_l1353_l1350_DUPLICATE_bd47 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1371_l1365_l1360_l1357_l1353_l1350_DUPLICATE_bd47_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1345_l1365_l1360_l1357_l1353_l1350_DUPLICATE_7243 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1345_l1365_l1360_l1357_l1353_l1350_DUPLICATE_7243_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1357_c11_83cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1357_c11_83cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_83cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1357_c11_83cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_83cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_83cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1357_c11_83cd_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1345_l1371_l1360_l1357_l1353_l1350_DUPLICATE_2350 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1345_l1371_l1360_l1357_l1353_l1350_DUPLICATE_2350_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1353_c11_c174] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1353_c11_c174_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_c174_left;
     BIN_OP_EQ_uxn_opcodes_h_l1353_c11_c174_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_c174_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_c174_return_output := BIN_OP_EQ_uxn_opcodes_h_l1353_c11_c174_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1371_c11_b639] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1371_c11_b639_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_b639_left;
     BIN_OP_EQ_uxn_opcodes_h_l1371_c11_b639_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_b639_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_b639_return_output := BIN_OP_EQ_uxn_opcodes_h_l1371_c11_b639_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1360_c11_b6f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1360_c11_b6f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_b6f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1360_c11_b6f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_b6f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_b6f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1360_c11_b6f9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1365_c11_3dd5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1365_c11_3dd5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_3dd5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1365_c11_3dd5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_3dd5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_3dd5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1365_c11_3dd5_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1345_l1360_l1357_l1353_l1350_DUPLICATE_83e2 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1345_l1360_l1357_l1353_l1350_DUPLICATE_83e2_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1350_c11_944e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1350_c11_944e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_944e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1350_c11_944e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_944e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_944e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1350_c11_944e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1365_l1360_DUPLICATE_c515 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1365_l1360_DUPLICATE_c515_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1369_c24_290e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1369_c24_290e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c24_290e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1369_c24_290e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c24_290e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c24_290e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1369_c24_290e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1345_l1365_l1357_l1353_l1350_DUPLICATE_f883 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1345_l1365_l1357_l1353_l1350_DUPLICATE_f883_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l1363_c32_ae6e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1363_c32_ae6e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1363_c32_ae6e_left;
     BIN_OP_AND_uxn_opcodes_h_l1363_c32_ae6e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1363_c32_ae6e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1363_c32_ae6e_return_output := BIN_OP_AND_uxn_opcodes_h_l1363_c32_ae6e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1345_c6_0dbf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1345_c6_0dbf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_0dbf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1345_c6_0dbf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_0dbf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_0dbf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1345_c6_0dbf_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1363_c32_3f13_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1363_c32_ae6e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1345_c2_a259_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_0dbf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_a259_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_0dbf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_a259_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_0dbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_a259_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_0dbf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_a259_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_0dbf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_a259_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_0dbf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1345_c2_a259_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_0dbf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1345_c2_a259_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_0dbf_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1350_c7_6751_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_944e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_6751_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_944e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_6751_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_944e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_6751_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_944e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_6751_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_944e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_6751_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_944e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_6751_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_944e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1350_c7_6751_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_944e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1353_c7_b178_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_c174_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_b178_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_c174_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_b178_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_c174_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_b178_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_c174_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_b178_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_c174_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_b178_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_c174_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_b178_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_c174_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1353_c7_b178_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_c174_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1357_c7_1898_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_83cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_83cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_83cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_83cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_83cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_83cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_83cd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1360_c7_68e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_b6f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_68e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_b6f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_b6f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_68e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_b6f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_b6f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_68e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_b6f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1360_c7_68e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_b6f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_862e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_3dd5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_862e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_3dd5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_862e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_3dd5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_862e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_3dd5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_862e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_3dd5_return_output;
     VAR_MUX_uxn_opcodes_h_l1369_c24_7e0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c24_290e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_b352_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_b639_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_b352_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_b639_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1345_l1360_l1357_l1353_l1350_DUPLICATE_83e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1345_l1360_l1357_l1353_l1350_DUPLICATE_83e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1345_l1360_l1357_l1353_l1350_DUPLICATE_83e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1345_l1360_l1357_l1353_l1350_DUPLICATE_83e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1345_l1360_l1357_l1353_l1350_DUPLICATE_83e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1371_l1365_l1360_l1357_l1353_l1350_DUPLICATE_bd47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1371_l1365_l1360_l1357_l1353_l1350_DUPLICATE_bd47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1371_l1365_l1360_l1357_l1353_l1350_DUPLICATE_bd47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1371_l1365_l1360_l1357_l1353_l1350_DUPLICATE_bd47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1371_l1365_l1360_l1357_l1353_l1350_DUPLICATE_bd47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_b352_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1371_l1365_l1360_l1357_l1353_l1350_DUPLICATE_bd47_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1345_l1365_l1357_l1353_l1350_DUPLICATE_f883_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1345_l1365_l1357_l1353_l1350_DUPLICATE_f883_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1345_l1365_l1357_l1353_l1350_DUPLICATE_f883_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1345_l1365_l1357_l1353_l1350_DUPLICATE_f883_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1345_l1365_l1357_l1353_l1350_DUPLICATE_f883_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1345_l1371_l1360_l1357_l1353_l1350_DUPLICATE_2350_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1345_l1371_l1360_l1357_l1353_l1350_DUPLICATE_2350_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1345_l1371_l1360_l1357_l1353_l1350_DUPLICATE_2350_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1345_l1371_l1360_l1357_l1353_l1350_DUPLICATE_2350_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1345_l1371_l1360_l1357_l1353_l1350_DUPLICATE_2350_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_b352_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1345_l1371_l1360_l1357_l1353_l1350_DUPLICATE_2350_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1365_l1360_DUPLICATE_c515_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1365_l1360_DUPLICATE_c515_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1345_l1365_l1360_l1357_l1353_l1350_DUPLICATE_7243_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1345_l1365_l1360_l1357_l1353_l1350_DUPLICATE_7243_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1345_l1365_l1360_l1357_l1353_l1350_DUPLICATE_7243_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1345_l1365_l1360_l1357_l1353_l1350_DUPLICATE_7243_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1345_l1365_l1360_l1357_l1353_l1350_DUPLICATE_7243_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1345_l1365_l1360_l1357_l1353_l1350_DUPLICATE_7243_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1365_c7_862e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_862e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_862e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_862e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_862e_return_output;

     -- MUX[uxn_opcodes_h_l1369_c24_7e0f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1369_c24_7e0f_cond <= VAR_MUX_uxn_opcodes_h_l1369_c24_7e0f_cond;
     MUX_uxn_opcodes_h_l1369_c24_7e0f_iftrue <= VAR_MUX_uxn_opcodes_h_l1369_c24_7e0f_iftrue;
     MUX_uxn_opcodes_h_l1369_c24_7e0f_iffalse <= VAR_MUX_uxn_opcodes_h_l1369_c24_7e0f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1369_c24_7e0f_return_output := MUX_uxn_opcodes_h_l1369_c24_7e0f_return_output;

     -- n8_MUX[uxn_opcodes_h_l1360_c7_68e3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1360_c7_68e3_cond <= VAR_n8_MUX_uxn_opcodes_h_l1360_c7_68e3_cond;
     n8_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue;
     n8_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output := n8_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1365_c7_862e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_862e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_862e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_862e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_862e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1371_c7_b352] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_b352_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_b352_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_b352_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_b352_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_b352_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_b352_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_b352_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_b352_return_output;

     -- t8_MUX[uxn_opcodes_h_l1353_c7_b178] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1353_c7_b178_cond <= VAR_t8_MUX_uxn_opcodes_h_l1353_c7_b178_cond;
     t8_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue;
     t8_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1353_c7_b178_return_output := t8_MUX_uxn_opcodes_h_l1353_c7_b178_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1363_c32_3f13] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1363_c32_3f13_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1363_c32_3f13_left;
     BIN_OP_GT_uxn_opcodes_h_l1363_c32_3f13_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1363_c32_3f13_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1363_c32_3f13_return_output := BIN_OP_GT_uxn_opcodes_h_l1363_c32_3f13_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1371_c7_b352] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_b352_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_b352_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_b352_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_b352_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_b352_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_b352_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_b352_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_b352_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1363_c32_6038_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1363_c32_3f13_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue := VAR_MUX_uxn_opcodes_h_l1369_c24_7e0f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_b352_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_862e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_b352_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_862e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1353_c7_b178_return_output;
     -- n8_MUX[uxn_opcodes_h_l1357_c7_1898] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1357_c7_1898_cond <= VAR_n8_MUX_uxn_opcodes_h_l1357_c7_1898_cond;
     n8_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue;
     n8_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1357_c7_1898_return_output := n8_MUX_uxn_opcodes_h_l1357_c7_1898_return_output;

     -- t8_MUX[uxn_opcodes_h_l1350_c7_6751] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1350_c7_6751_cond <= VAR_t8_MUX_uxn_opcodes_h_l1350_c7_6751_cond;
     t8_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue;
     t8_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1350_c7_6751_return_output := t8_MUX_uxn_opcodes_h_l1350_c7_6751_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1360_c7_68e3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_68e3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_68e3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output;

     -- MUX[uxn_opcodes_h_l1363_c32_6038] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1363_c32_6038_cond <= VAR_MUX_uxn_opcodes_h_l1363_c32_6038_cond;
     MUX_uxn_opcodes_h_l1363_c32_6038_iftrue <= VAR_MUX_uxn_opcodes_h_l1363_c32_6038_iftrue;
     MUX_uxn_opcodes_h_l1363_c32_6038_iffalse <= VAR_MUX_uxn_opcodes_h_l1363_c32_6038_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1363_c32_6038_return_output := MUX_uxn_opcodes_h_l1363_c32_6038_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1365_c7_862e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_862e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_862e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_862e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_862e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1365_c7_862e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_862e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_862e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_862e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_862e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1365_c7_862e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1365_c7_862e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_862e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_862e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_862e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_862e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1365_c7_862e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1360_c7_68e3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue := VAR_MUX_uxn_opcodes_h_l1363_c32_6038_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1357_c7_1898_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_862e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_862e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_862e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1350_c7_6751_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1357_c7_1898] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_return_output;

     -- n8_MUX[uxn_opcodes_h_l1353_c7_b178] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1353_c7_b178_cond <= VAR_n8_MUX_uxn_opcodes_h_l1353_c7_b178_cond;
     n8_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue;
     n8_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1353_c7_b178_return_output := n8_MUX_uxn_opcodes_h_l1353_c7_b178_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1360_c7_68e3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_68e3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_68e3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1360_c7_68e3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1360_c7_68e3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_68e3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_68e3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1357_c7_1898] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_return_output;

     -- t8_MUX[uxn_opcodes_h_l1345_c2_a259] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1345_c2_a259_cond <= VAR_t8_MUX_uxn_opcodes_h_l1345_c2_a259_cond;
     t8_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue;
     t8_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1345_c2_a259_return_output := t8_MUX_uxn_opcodes_h_l1345_c2_a259_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1360_c7_68e3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1360_c7_68e3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1360_c7_68e3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1360_c7_68e3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1360_c7_68e3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1353_c7_b178_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1360_c7_68e3_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1345_c2_a259_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1353_c7_b178] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_b178_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_b178_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_b178_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_b178_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1357_c7_1898] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_return_output := result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1357_c7_1898] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_return_output;

     -- n8_MUX[uxn_opcodes_h_l1350_c7_6751] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1350_c7_6751_cond <= VAR_n8_MUX_uxn_opcodes_h_l1350_c7_6751_cond;
     n8_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue;
     n8_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1350_c7_6751_return_output := n8_MUX_uxn_opcodes_h_l1350_c7_6751_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1357_c7_1898] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1357_c7_1898] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1353_c7_b178] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_b178_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_b178_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_b178_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_b178_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1350_c7_6751_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_b178_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_b178_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1350_c7_6751] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_6751_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_6751_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_6751_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_6751_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1353_c7_b178] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1353_c7_b178_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_b178_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_b178_return_output := result_stack_value_MUX_uxn_opcodes_h_l1353_c7_b178_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1353_c7_b178] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_b178_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_b178_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_b178_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_b178_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1350_c7_6751] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_6751_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_6751_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_6751_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_6751_return_output;

     -- n8_MUX[uxn_opcodes_h_l1345_c2_a259] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1345_c2_a259_cond <= VAR_n8_MUX_uxn_opcodes_h_l1345_c2_a259_cond;
     n8_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue;
     n8_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1345_c2_a259_return_output := n8_MUX_uxn_opcodes_h_l1345_c2_a259_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1353_c7_b178] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_b178_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_b178_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_b178_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_b178_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1353_c7_b178] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_b178_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_b178_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_b178_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_b178_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_b178_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_b178_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1345_c2_a259_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_b178_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_6751_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_b178_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_b178_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_6751_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_b178_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1350_c7_6751] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1350_c7_6751_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_6751_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_6751_return_output := result_stack_value_MUX_uxn_opcodes_h_l1350_c7_6751_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1350_c7_6751] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_6751_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_6751_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_6751_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_6751_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1350_c7_6751] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_6751_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_6751_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_6751_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_6751_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1345_c2_a259] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_a259_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_a259_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_a259_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_a259_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1345_c2_a259] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_a259_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_a259_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_a259_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_a259_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1350_c7_6751] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_6751_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_6751_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_6751_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_6751_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_6751_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_6751_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_6751_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_6751_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_6751_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_6751_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1345_c2_a259] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_a259_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_a259_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_a259_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_a259_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1345_c2_a259] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1345_c2_a259_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1345_c2_a259_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1345_c2_a259_return_output := result_stack_value_MUX_uxn_opcodes_h_l1345_c2_a259_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1345_c2_a259] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_a259_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_a259_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_a259_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_a259_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1345_c2_a259] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_a259_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_a259_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_a259_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_a259_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_a259_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_a259_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1376_l1341_DUPLICATE_eaf2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1376_l1341_DUPLICATE_eaf2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_a259_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1345_c2_a259_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_a259_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_a259_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_a259_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_a259_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1376_l1341_DUPLICATE_eaf2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1376_l1341_DUPLICATE_eaf2_return_output;
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
