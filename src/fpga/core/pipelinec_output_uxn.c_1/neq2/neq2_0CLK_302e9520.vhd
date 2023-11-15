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
-- Submodules: 66
entity neq2_0CLK_302e9520 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq2_0CLK_302e9520;
architecture arch of neq2_0CLK_302e9520 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1212_c6_64dc]
signal BIN_OP_EQ_uxn_opcodes_h_l1212_c6_64dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1212_c6_64dc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1212_c6_64dc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1212_c1_f863]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1212_c1_f863_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1212_c1_f863_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1212_c1_f863_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1212_c1_f863_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1212_c2_f147]
signal n16_MUX_uxn_opcodes_h_l1212_c2_f147_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1212_c2_f147_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1212_c2_f147]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c2_f147_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c2_f147_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1212_c2_f147]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c2_f147_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c2_f147_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1212_c2_f147]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c2_f147_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c2_f147_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1212_c2_f147]
signal result_u8_value_MUX_uxn_opcodes_h_l1212_c2_f147_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1212_c2_f147_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1212_c2_f147]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c2_f147_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c2_f147_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1212_c2_f147]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c2_f147_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c2_f147_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1212_c2_f147]
signal t16_MUX_uxn_opcodes_h_l1212_c2_f147_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1212_c2_f147_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1213_c3_ce39[uxn_opcodes_h_l1213_c3_ce39]
signal printf_uxn_opcodes_h_l1213_c3_ce39_uxn_opcodes_h_l1213_c3_ce39_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1217_c11_92bc]
signal BIN_OP_EQ_uxn_opcodes_h_l1217_c11_92bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1217_c11_92bc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1217_c11_92bc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1217_c7_584d]
signal n16_MUX_uxn_opcodes_h_l1217_c7_584d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1217_c7_584d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1217_c7_584d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_584d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_584d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1217_c7_584d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_584d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_584d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1217_c7_584d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_584d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_584d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1217_c7_584d]
signal result_u8_value_MUX_uxn_opcodes_h_l1217_c7_584d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1217_c7_584d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1217_c7_584d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_584d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_584d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1217_c7_584d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_584d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_584d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1217_c7_584d]
signal t16_MUX_uxn_opcodes_h_l1217_c7_584d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1217_c7_584d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1220_c11_74e6]
signal BIN_OP_EQ_uxn_opcodes_h_l1220_c11_74e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1220_c11_74e6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1220_c11_74e6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1220_c7_ccc2]
signal n16_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1220_c7_ccc2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1220_c7_ccc2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1220_c7_ccc2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1220_c7_ccc2]
signal result_u8_value_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1220_c7_ccc2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1220_c7_ccc2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1220_c7_ccc2]
signal t16_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1225_c11_0bd3]
signal BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0bd3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0bd3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0bd3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1225_c7_0e7e]
signal n16_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1225_c7_0e7e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1225_c7_0e7e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1225_c7_0e7e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1225_c7_0e7e]
signal result_u8_value_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1225_c7_0e7e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1225_c7_0e7e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1225_c7_0e7e]
signal t16_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1226_c3_402b]
signal BIN_OP_OR_uxn_opcodes_h_l1226_c3_402b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1226_c3_402b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1226_c3_402b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1229_c11_e37b]
signal BIN_OP_EQ_uxn_opcodes_h_l1229_c11_e37b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1229_c11_e37b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1229_c11_e37b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1229_c7_bfaf]
signal n16_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1229_c7_bfaf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1229_c7_bfaf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1229_c7_bfaf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1229_c7_bfaf]
signal result_u8_value_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1229_c7_bfaf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1229_c7_bfaf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1233_c11_473b]
signal BIN_OP_EQ_uxn_opcodes_h_l1233_c11_473b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1233_c11_473b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1233_c11_473b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1233_c7_67f7]
signal n16_MUX_uxn_opcodes_h_l1233_c7_67f7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1233_c7_67f7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_67f7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1233_c7_67f7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_67f7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1233_c7_67f7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1233_c7_67f7]
signal result_u8_value_MUX_uxn_opcodes_h_l1233_c7_67f7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1233_c7_67f7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_67f7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1233_c7_67f7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1234_c3_91f1]
signal BIN_OP_OR_uxn_opcodes_h_l1234_c3_91f1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1234_c3_91f1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1234_c3_91f1_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1236_c30_5e40]
signal sp_relative_shift_uxn_opcodes_h_l1236_c30_5e40_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1236_c30_5e40_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1236_c30_5e40_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1236_c30_5e40_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1239_c21_518a]
signal BIN_OP_EQ_uxn_opcodes_h_l1239_c21_518a_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1239_c21_518a_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1239_c21_518a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1239_c21_4fa7]
signal MUX_uxn_opcodes_h_l1239_c21_4fa7_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1239_c21_4fa7_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1239_c21_4fa7_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1239_c21_4fa7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1241_c11_0225]
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_0225_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_0225_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_0225_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1241_c7_c010]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_c010_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_c010_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_c010_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_c010_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1241_c7_c010]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_c010_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_c010_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_c010_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_c010_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1241_c7_c010]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_c010_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_c010_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_c010_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_c010_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1222_l1231_DUPLICATE_87ab
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1222_l1231_DUPLICATE_87ab_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1222_l1231_DUPLICATE_87ab_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_c551( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1212_c6_64dc
BIN_OP_EQ_uxn_opcodes_h_l1212_c6_64dc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1212_c6_64dc_left,
BIN_OP_EQ_uxn_opcodes_h_l1212_c6_64dc_right,
BIN_OP_EQ_uxn_opcodes_h_l1212_c6_64dc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1212_c1_f863
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1212_c1_f863 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1212_c1_f863_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1212_c1_f863_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1212_c1_f863_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1212_c1_f863_return_output);

-- n16_MUX_uxn_opcodes_h_l1212_c2_f147
n16_MUX_uxn_opcodes_h_l1212_c2_f147 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1212_c2_f147_cond,
n16_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue,
n16_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse,
n16_MUX_uxn_opcodes_h_l1212_c2_f147_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1212_c2_f147
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c2_f147 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c2_f147_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c2_f147_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c2_f147
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c2_f147 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c2_f147_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c2_f147_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c2_f147
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c2_f147 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c2_f147_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c2_f147_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1212_c2_f147
result_u8_value_MUX_uxn_opcodes_h_l1212_c2_f147 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1212_c2_f147_cond,
result_u8_value_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1212_c2_f147_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1212_c2_f147
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c2_f147 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c2_f147_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c2_f147_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c2_f147
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c2_f147 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c2_f147_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c2_f147_return_output);

-- t16_MUX_uxn_opcodes_h_l1212_c2_f147
t16_MUX_uxn_opcodes_h_l1212_c2_f147 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1212_c2_f147_cond,
t16_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue,
t16_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse,
t16_MUX_uxn_opcodes_h_l1212_c2_f147_return_output);

-- printf_uxn_opcodes_h_l1213_c3_ce39_uxn_opcodes_h_l1213_c3_ce39
printf_uxn_opcodes_h_l1213_c3_ce39_uxn_opcodes_h_l1213_c3_ce39 : entity work.printf_uxn_opcodes_h_l1213_c3_ce39_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1213_c3_ce39_uxn_opcodes_h_l1213_c3_ce39_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1217_c11_92bc
BIN_OP_EQ_uxn_opcodes_h_l1217_c11_92bc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1217_c11_92bc_left,
BIN_OP_EQ_uxn_opcodes_h_l1217_c11_92bc_right,
BIN_OP_EQ_uxn_opcodes_h_l1217_c11_92bc_return_output);

-- n16_MUX_uxn_opcodes_h_l1217_c7_584d
n16_MUX_uxn_opcodes_h_l1217_c7_584d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1217_c7_584d_cond,
n16_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue,
n16_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse,
n16_MUX_uxn_opcodes_h_l1217_c7_584d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_584d
result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_584d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_584d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_584d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_584d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_584d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_584d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_584d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_584d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_584d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_584d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_584d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1217_c7_584d
result_u8_value_MUX_uxn_opcodes_h_l1217_c7_584d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1217_c7_584d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1217_c7_584d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_584d
result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_584d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_584d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_584d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_584d
result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_584d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_584d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_584d_return_output);

-- t16_MUX_uxn_opcodes_h_l1217_c7_584d
t16_MUX_uxn_opcodes_h_l1217_c7_584d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1217_c7_584d_cond,
t16_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue,
t16_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse,
t16_MUX_uxn_opcodes_h_l1217_c7_584d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1220_c11_74e6
BIN_OP_EQ_uxn_opcodes_h_l1220_c11_74e6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1220_c11_74e6_left,
BIN_OP_EQ_uxn_opcodes_h_l1220_c11_74e6_right,
BIN_OP_EQ_uxn_opcodes_h_l1220_c11_74e6_return_output);

-- n16_MUX_uxn_opcodes_h_l1220_c7_ccc2
n16_MUX_uxn_opcodes_h_l1220_c7_ccc2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond,
n16_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue,
n16_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse,
n16_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1220_c7_ccc2
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c7_ccc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c7_ccc2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c7_ccc2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1220_c7_ccc2
result_u8_value_MUX_uxn_opcodes_h_l1220_c7_ccc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1220_c7_ccc2
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c7_ccc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2
result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output);

-- t16_MUX_uxn_opcodes_h_l1220_c7_ccc2
t16_MUX_uxn_opcodes_h_l1220_c7_ccc2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond,
t16_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue,
t16_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse,
t16_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0bd3
BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0bd3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0bd3_left,
BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0bd3_right,
BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0bd3_return_output);

-- n16_MUX_uxn_opcodes_h_l1225_c7_0e7e
n16_MUX_uxn_opcodes_h_l1225_c7_0e7e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond,
n16_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue,
n16_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse,
n16_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_0e7e
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_0e7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_0e7e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_0e7e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1225_c7_0e7e
result_u8_value_MUX_uxn_opcodes_h_l1225_c7_0e7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_0e7e
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_0e7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output);

-- t16_MUX_uxn_opcodes_h_l1225_c7_0e7e
t16_MUX_uxn_opcodes_h_l1225_c7_0e7e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond,
t16_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue,
t16_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse,
t16_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1226_c3_402b
BIN_OP_OR_uxn_opcodes_h_l1226_c3_402b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1226_c3_402b_left,
BIN_OP_OR_uxn_opcodes_h_l1226_c3_402b_right,
BIN_OP_OR_uxn_opcodes_h_l1226_c3_402b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1229_c11_e37b
BIN_OP_EQ_uxn_opcodes_h_l1229_c11_e37b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1229_c11_e37b_left,
BIN_OP_EQ_uxn_opcodes_h_l1229_c11_e37b_right,
BIN_OP_EQ_uxn_opcodes_h_l1229_c11_e37b_return_output);

-- n16_MUX_uxn_opcodes_h_l1229_c7_bfaf
n16_MUX_uxn_opcodes_h_l1229_c7_bfaf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond,
n16_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue,
n16_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse,
n16_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1229_c7_bfaf
result_is_stack_write_MUX_uxn_opcodes_h_l1229_c7_bfaf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1229_c7_bfaf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1229_c7_bfaf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1229_c7_bfaf
result_u8_value_MUX_uxn_opcodes_h_l1229_c7_bfaf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond,
result_u8_value_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1229_c7_bfaf
result_is_opc_done_MUX_uxn_opcodes_h_l1229_c7_bfaf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf
result_is_sp_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1233_c11_473b
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_473b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_473b_left,
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_473b_right,
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_473b_return_output);

-- n16_MUX_uxn_opcodes_h_l1233_c7_67f7
n16_MUX_uxn_opcodes_h_l1233_c7_67f7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1233_c7_67f7_cond,
n16_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue,
n16_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse,
n16_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_67f7
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_67f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_67f7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_67f7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_67f7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_67f7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_67f7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_67f7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1233_c7_67f7
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_67f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_67f7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_67f7
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_67f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_67f7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_67f7
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_67f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1234_c3_91f1
BIN_OP_OR_uxn_opcodes_h_l1234_c3_91f1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1234_c3_91f1_left,
BIN_OP_OR_uxn_opcodes_h_l1234_c3_91f1_right,
BIN_OP_OR_uxn_opcodes_h_l1234_c3_91f1_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1236_c30_5e40
sp_relative_shift_uxn_opcodes_h_l1236_c30_5e40 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1236_c30_5e40_ins,
sp_relative_shift_uxn_opcodes_h_l1236_c30_5e40_x,
sp_relative_shift_uxn_opcodes_h_l1236_c30_5e40_y,
sp_relative_shift_uxn_opcodes_h_l1236_c30_5e40_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1239_c21_518a
BIN_OP_EQ_uxn_opcodes_h_l1239_c21_518a : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1239_c21_518a_left,
BIN_OP_EQ_uxn_opcodes_h_l1239_c21_518a_right,
BIN_OP_EQ_uxn_opcodes_h_l1239_c21_518a_return_output);

-- MUX_uxn_opcodes_h_l1239_c21_4fa7
MUX_uxn_opcodes_h_l1239_c21_4fa7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1239_c21_4fa7_cond,
MUX_uxn_opcodes_h_l1239_c21_4fa7_iftrue,
MUX_uxn_opcodes_h_l1239_c21_4fa7_iffalse,
MUX_uxn_opcodes_h_l1239_c21_4fa7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1241_c11_0225
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_0225 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_0225_left,
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_0225_right,
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_0225_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_c010
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_c010 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_c010_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_c010_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_c010_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_c010_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_c010
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_c010 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_c010_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_c010_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_c010_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_c010_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_c010
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_c010 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_c010_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_c010_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_c010_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_c010_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1222_l1231_DUPLICATE_87ab
CONST_SL_8_uint16_t_uxn_opcodes_h_l1222_l1231_DUPLICATE_87ab : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1222_l1231_DUPLICATE_87ab_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1222_l1231_DUPLICATE_87ab_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1212_c6_64dc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1212_c1_f863_return_output,
 n16_MUX_uxn_opcodes_h_l1212_c2_f147_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1212_c2_f147_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c2_f147_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c2_f147_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1212_c2_f147_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1212_c2_f147_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c2_f147_return_output,
 t16_MUX_uxn_opcodes_h_l1212_c2_f147_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1217_c11_92bc_return_output,
 n16_MUX_uxn_opcodes_h_l1217_c7_584d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_584d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_584d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_584d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1217_c7_584d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_584d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_584d_return_output,
 t16_MUX_uxn_opcodes_h_l1217_c7_584d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1220_c11_74e6_return_output,
 n16_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output,
 t16_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0bd3_return_output,
 n16_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output,
 t16_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1226_c3_402b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1229_c11_e37b_return_output,
 n16_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1233_c11_473b_return_output,
 n16_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1234_c3_91f1_return_output,
 sp_relative_shift_uxn_opcodes_h_l1236_c30_5e40_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1239_c21_518a_return_output,
 MUX_uxn_opcodes_h_l1239_c21_4fa7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1241_c11_0225_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_c010_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_c010_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_c010_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1222_l1231_DUPLICATE_87ab_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c6_64dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c6_64dc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c6_64dc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1212_c1_f863_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1212_c1_f863_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1212_c1_f863_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1212_c1_f863_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1217_c7_584d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1212_c2_f147_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1212_c2_f147_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_584d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c2_f147_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c2_f147_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1214_c3_897d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_584d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c2_f147_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c2_f147_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_584d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c2_f147_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c2_f147_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1217_c7_584d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1212_c2_f147_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1212_c2_f147_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_584d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c2_f147_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c2_f147_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_584d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c2_f147_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c2_f147_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1217_c7_584d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1212_c2_f147_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1212_c2_f147_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1213_c3_ce39_uxn_opcodes_h_l1213_c3_ce39_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_92bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_92bc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_92bc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1217_c7_584d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_584d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1218_c3_e6ae : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_584d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_584d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1217_c7_584d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_584d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_584d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1217_c7_584d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c11_74e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c11_74e6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c11_74e6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1223_c3_8881 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0bd3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0bd3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0bd3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1227_c3_13e4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1226_c3_402b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1226_c3_402b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1226_c3_402b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1229_c11_e37b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1229_c11_e37b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1229_c11_e37b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_473b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_473b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_473b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_67f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_c010_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_67f7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1238_c3_66ee : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_67f7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_67f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_c010_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_67f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_c010_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_91f1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_91f1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_91f1_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1236_c30_5e40_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1236_c30_5e40_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1236_c30_5e40_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1236_c30_5e40_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1239_c21_4fa7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1239_c21_4fa7_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1239_c21_4fa7_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c21_518a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c21_518a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c21_518a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1239_c21_4fa7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_0225_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_0225_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_0225_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_c010_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_c010_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_c010_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_c010_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_c010_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_c010_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_c010_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_c010_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_c010_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1241_l1229_l1225_l1220_l1217_l1212_DUPLICATE_138e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1229_l1225_l1220_l1217_l1212_DUPLICATE_6ec1_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1229_l1225_l1220_l1217_l1212_DUPLICATE_a5ab_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1241_l1229_l1225_l1220_l1217_l1212_DUPLICATE_3b4f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1233_l1229_l1225_l1220_l1217_DUPLICATE_c16c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1221_l1234_l1230_l1226_DUPLICATE_6524_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1222_l1231_DUPLICATE_87ab_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1222_l1231_DUPLICATE_87ab_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1229_l1233_DUPLICATE_79d7_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1208_l1247_DUPLICATE_a78f_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_0225_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c6_64dc_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c11_74e6_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1236_c30_5e40_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1218_c3_e6ae := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1218_c3_e6ae;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_473b_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0bd3_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_c010_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1239_c21_4fa7_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_c010_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_c010_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1223_c3_8881 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1223_c3_8881;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1229_c11_e37b_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1227_c3_13e4 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1227_c3_13e4;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1239_c21_4fa7_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1214_c3_897d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1214_c3_897d;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1212_c1_f863_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_92bc_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1238_c3_66ee := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1238_c3_66ee;
     VAR_sp_relative_shift_uxn_opcodes_h_l1236_c30_5e40_y := resize(to_signed(-3, 3), 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1212_c1_f863_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1236_c30_5e40_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_91f1_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c6_64dc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_92bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c11_74e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0bd3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1229_c11_e37b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_473b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_0225_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c21_518a_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1226_c3_402b_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse := t16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1221_l1234_l1230_l1226_DUPLICATE_6524 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1221_l1234_l1230_l1226_DUPLICATE_6524_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1225_c11_0bd3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0bd3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0bd3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0bd3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0bd3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0bd3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0bd3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1217_c11_92bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1217_c11_92bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_92bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1217_c11_92bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_92bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_92bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1217_c11_92bc_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1236_c30_5e40] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1236_c30_5e40_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1236_c30_5e40_ins;
     sp_relative_shift_uxn_opcodes_h_l1236_c30_5e40_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1236_c30_5e40_x;
     sp_relative_shift_uxn_opcodes_h_l1236_c30_5e40_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1236_c30_5e40_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1236_c30_5e40_return_output := sp_relative_shift_uxn_opcodes_h_l1236_c30_5e40_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1212_c6_64dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1212_c6_64dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c6_64dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1212_c6_64dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c6_64dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c6_64dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1212_c6_64dc_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1229_l1225_l1220_l1217_l1212_DUPLICATE_6ec1 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1229_l1225_l1220_l1217_l1212_DUPLICATE_6ec1_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1220_c11_74e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1220_c11_74e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c11_74e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1220_c11_74e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c11_74e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c11_74e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1220_c11_74e6_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1229_l1225_l1220_l1217_l1212_DUPLICATE_a5ab LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1229_l1225_l1220_l1217_l1212_DUPLICATE_a5ab_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1233_l1229_l1225_l1220_l1217_DUPLICATE_c16c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1233_l1229_l1225_l1220_l1217_DUPLICATE_c16c_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1241_c11_0225] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1241_c11_0225_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_0225_left;
     BIN_OP_EQ_uxn_opcodes_h_l1241_c11_0225_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_0225_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_0225_return_output := BIN_OP_EQ_uxn_opcodes_h_l1241_c11_0225_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1229_l1233_DUPLICATE_79d7 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1229_l1233_DUPLICATE_79d7_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1229_c11_e37b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1229_c11_e37b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1229_c11_e37b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1229_c11_e37b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1229_c11_e37b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1229_c11_e37b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1229_c11_e37b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1241_l1229_l1225_l1220_l1217_l1212_DUPLICATE_138e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1241_l1229_l1225_l1220_l1217_l1212_DUPLICATE_138e_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1233_c11_473b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1233_c11_473b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_473b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1233_c11_473b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_473b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_473b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1233_c11_473b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1241_l1229_l1225_l1220_l1217_l1212_DUPLICATE_3b4f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1241_l1229_l1225_l1220_l1217_l1212_DUPLICATE_3b4f_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1212_c1_f863_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c6_64dc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1212_c2_f147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c6_64dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c2_f147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c6_64dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c2_f147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c6_64dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c2_f147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c6_64dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c2_f147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c6_64dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c2_f147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c6_64dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1212_c2_f147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c6_64dc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1212_c2_f147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c6_64dc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1217_c7_584d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_92bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_584d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_92bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_584d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_92bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_584d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_92bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_584d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_92bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_584d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_92bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1217_c7_584d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_92bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1217_c7_584d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_92bc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c11_74e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c11_74e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c11_74e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c11_74e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c11_74e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c11_74e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c11_74e6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c11_74e6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0bd3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0bd3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0bd3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0bd3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0bd3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0bd3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0bd3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0bd3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1229_c11_e37b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1229_c11_e37b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1229_c11_e37b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1229_c11_e37b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1229_c11_e37b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1229_c11_e37b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1229_c11_e37b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_67f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_473b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_67f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_473b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_473b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_67f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_473b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_473b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_67f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_473b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_67f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_473b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_c010_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_0225_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_c010_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_0225_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_c010_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_0225_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1226_c3_402b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1221_l1234_l1230_l1226_DUPLICATE_6524_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_91f1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1221_l1234_l1230_l1226_DUPLICATE_6524_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1222_l1231_DUPLICATE_87ab_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1221_l1234_l1230_l1226_DUPLICATE_6524_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1229_l1225_l1220_l1217_l1212_DUPLICATE_6ec1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1229_l1225_l1220_l1217_l1212_DUPLICATE_6ec1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1229_l1225_l1220_l1217_l1212_DUPLICATE_6ec1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1229_l1225_l1220_l1217_l1212_DUPLICATE_6ec1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1229_l1225_l1220_l1217_l1212_DUPLICATE_6ec1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1229_l1225_l1220_l1217_l1212_DUPLICATE_6ec1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1233_l1229_l1225_l1220_l1217_DUPLICATE_c16c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1233_l1229_l1225_l1220_l1217_DUPLICATE_c16c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1233_l1229_l1225_l1220_l1217_DUPLICATE_c16c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1233_l1229_l1225_l1220_l1217_DUPLICATE_c16c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1233_l1229_l1225_l1220_l1217_DUPLICATE_c16c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_c010_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1233_l1229_l1225_l1220_l1217_DUPLICATE_c16c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1241_l1229_l1225_l1220_l1217_l1212_DUPLICATE_3b4f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1241_l1229_l1225_l1220_l1217_l1212_DUPLICATE_3b4f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1241_l1229_l1225_l1220_l1217_l1212_DUPLICATE_3b4f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1241_l1229_l1225_l1220_l1217_l1212_DUPLICATE_3b4f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1241_l1229_l1225_l1220_l1217_l1212_DUPLICATE_3b4f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_c010_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1241_l1229_l1225_l1220_l1217_l1212_DUPLICATE_3b4f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1241_l1229_l1225_l1220_l1217_l1212_DUPLICATE_138e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1241_l1229_l1225_l1220_l1217_l1212_DUPLICATE_138e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1241_l1229_l1225_l1220_l1217_l1212_DUPLICATE_138e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1241_l1229_l1225_l1220_l1217_l1212_DUPLICATE_138e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1241_l1229_l1225_l1220_l1217_l1212_DUPLICATE_138e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_c010_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1241_l1229_l1225_l1220_l1217_l1212_DUPLICATE_138e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1229_l1233_DUPLICATE_79d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1229_l1233_DUPLICATE_79d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1229_l1225_l1220_l1217_l1212_DUPLICATE_a5ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1229_l1225_l1220_l1217_l1212_DUPLICATE_a5ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1229_l1225_l1220_l1217_l1212_DUPLICATE_a5ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1229_l1225_l1220_l1217_l1212_DUPLICATE_a5ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1229_l1225_l1220_l1217_l1212_DUPLICATE_a5ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1229_l1225_l1220_l1217_l1212_DUPLICATE_a5ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1236_c30_5e40_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1233_c7_67f7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_67f7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_67f7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1241_c7_c010] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_c010_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_c010_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_c010_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_c010_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_c010_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_c010_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_c010_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_c010_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1233_c7_67f7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1234_c3_91f1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1234_c3_91f1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_91f1_left;
     BIN_OP_OR_uxn_opcodes_h_l1234_c3_91f1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_91f1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_91f1_return_output := BIN_OP_OR_uxn_opcodes_h_l1234_c3_91f1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1241_c7_c010] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_c010_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_c010_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_c010_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_c010_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_c010_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_c010_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_c010_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_c010_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1226_c3_402b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1226_c3_402b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1226_c3_402b_left;
     BIN_OP_OR_uxn_opcodes_h_l1226_c3_402b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1226_c3_402b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1226_c3_402b_return_output := BIN_OP_OR_uxn_opcodes_h_l1226_c3_402b_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1222_l1231_DUPLICATE_87ab LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1222_l1231_DUPLICATE_87ab_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1222_l1231_DUPLICATE_87ab_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1222_l1231_DUPLICATE_87ab_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1222_l1231_DUPLICATE_87ab_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1212_c1_f863] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1212_c1_f863_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1212_c1_f863_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1212_c1_f863_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1212_c1_f863_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1212_c1_f863_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1212_c1_f863_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1212_c1_f863_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1212_c1_f863_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1241_c7_c010] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_c010_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_c010_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_c010_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_c010_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_c010_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_c010_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_c010_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_c010_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1226_c3_402b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c21_518a_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_91f1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_91f1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1222_l1231_DUPLICATE_87ab_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1222_l1231_DUPLICATE_87ab_return_output;
     VAR_printf_uxn_opcodes_h_l1213_c3_ce39_uxn_opcodes_h_l1213_c3_ce39_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1212_c1_f863_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_c010_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_c010_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_c010_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1233_c7_67f7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1229_c7_bfaf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1229_c7_bfaf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output;

     -- printf_uxn_opcodes_h_l1213_c3_ce39[uxn_opcodes_h_l1213_c3_ce39] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1213_c3_ce39_uxn_opcodes_h_l1213_c3_ce39_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1213_c3_ce39_uxn_opcodes_h_l1213_c3_ce39_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1233_c7_67f7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_67f7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_67f7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1239_c21_518a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1239_c21_518a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c21_518a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1239_c21_518a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c21_518a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c21_518a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1239_c21_518a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1233_c7_67f7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1233_c7_67f7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1233_c7_67f7_cond;
     n16_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue;
     n16_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output := n16_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1233_c7_67f7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_67f7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_67f7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1225_c7_0e7e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond;
     t16_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue;
     t16_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output := t16_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1239_c21_4fa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c21_518a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output;
     -- MUX[uxn_opcodes_h_l1239_c21_4fa7] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1239_c21_4fa7_cond <= VAR_MUX_uxn_opcodes_h_l1239_c21_4fa7_cond;
     MUX_uxn_opcodes_h_l1239_c21_4fa7_iftrue <= VAR_MUX_uxn_opcodes_h_l1239_c21_4fa7_iftrue;
     MUX_uxn_opcodes_h_l1239_c21_4fa7_iffalse <= VAR_MUX_uxn_opcodes_h_l1239_c21_4fa7_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1239_c21_4fa7_return_output := MUX_uxn_opcodes_h_l1239_c21_4fa7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1220_c7_ccc2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond;
     t16_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue;
     t16_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output := t16_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1229_c7_bfaf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond <= VAR_n16_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond;
     n16_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue;
     n16_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output := n16_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1229_c7_bfaf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1229_c7_bfaf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1229_c7_bfaf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1225_c7_0e7e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1225_c7_0e7e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue := VAR_MUX_uxn_opcodes_h_l1239_c21_4fa7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1225_c7_0e7e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1233_c7_67f7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1233_c7_67f7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_67f7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_67f7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_67f7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1225_c7_0e7e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond;
     n16_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue;
     n16_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output := n16_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1217_c7_584d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1217_c7_584d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1217_c7_584d_cond;
     t16_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue;
     t16_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1217_c7_584d_return_output := t16_MUX_uxn_opcodes_h_l1217_c7_584d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1220_c7_ccc2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1225_c7_0e7e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1225_c7_0e7e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1220_c7_ccc2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_67f7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1217_c7_584d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1217_c7_584d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_584d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_584d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_584d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_584d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1220_c7_ccc2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1229_c7_bfaf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1229_c7_bfaf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1229_c7_bfaf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1229_c7_bfaf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output := result_u8_value_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1217_c7_584d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_584d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_584d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_584d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_584d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1220_c7_ccc2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1212_c2_f147] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1212_c2_f147_cond <= VAR_t16_MUX_uxn_opcodes_h_l1212_c2_f147_cond;
     t16_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue;
     t16_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1212_c2_f147_return_output := t16_MUX_uxn_opcodes_h_l1212_c2_f147_return_output;

     -- n16_MUX[uxn_opcodes_h_l1220_c7_ccc2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond;
     n16_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue;
     n16_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output := n16_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1220_c7_ccc2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_584d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_584d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1229_c7_bfaf_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1212_c2_f147_return_output;
     -- n16_MUX[uxn_opcodes_h_l1217_c7_584d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1217_c7_584d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1217_c7_584d_cond;
     n16_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue;
     n16_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1217_c7_584d_return_output := n16_MUX_uxn_opcodes_h_l1217_c7_584d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1212_c2_f147] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c2_f147_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c2_f147_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c2_f147_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c2_f147_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1225_c7_0e7e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_0e7e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_0e7e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_0e7e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1217_c7_584d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_584d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_584d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_584d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_584d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1212_c2_f147] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c2_f147_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c2_f147_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c2_f147_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c2_f147_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1217_c7_584d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_584d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_584d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_584d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_584d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1217_c7_584d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_584d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_584d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_584d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_584d_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1217_c7_584d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_584d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_584d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_584d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_0e7e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1220_c7_ccc2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c7_ccc2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c7_ccc2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c7_ccc2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1212_c2_f147] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1212_c2_f147_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c2_f147_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c2_f147_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1212_c2_f147_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1212_c2_f147] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c2_f147_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c2_f147_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c2_f147_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c2_f147_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1212_c2_f147] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1212_c2_f147_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c2_f147_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c2_f147_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1212_c2_f147_return_output;

     -- n16_MUX[uxn_opcodes_h_l1212_c2_f147] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1212_c2_f147_cond <= VAR_n16_MUX_uxn_opcodes_h_l1212_c2_f147_cond;
     n16_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue;
     n16_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1212_c2_f147_return_output := n16_MUX_uxn_opcodes_h_l1212_c2_f147_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1212_c2_f147_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c7_ccc2_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1217_c7_584d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1217_c7_584d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1217_c7_584d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1217_c7_584d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1217_c7_584d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1217_c7_584d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1217_c7_584d_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1217_c7_584d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1212_c2_f147] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1212_c2_f147_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1212_c2_f147_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1212_c2_f147_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1212_c2_f147_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1212_c2_f147_return_output := result_u8_value_MUX_uxn_opcodes_h_l1212_c2_f147_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1208_l1247_DUPLICATE_a78f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1208_l1247_DUPLICATE_a78f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c551(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c2_f147_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c2_f147_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c2_f147_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1212_c2_f147_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c2_f147_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c2_f147_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1208_l1247_DUPLICATE_a78f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1208_l1247_DUPLICATE_a78f_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
