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
-- Submodules: 82
entity rot_0CLK_97b3b4bb is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot_0CLK_97b3b4bb;
architecture arch of rot_0CLK_97b3b4bb is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2815_c6_8faf]
signal BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2815_c1_0401]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_0401_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_0401_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_0401_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_0401_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2815_c2_c78d]
signal n8_MUX_uxn_opcodes_h_l2815_c2_c78d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2815_c2_c78d]
signal l8_MUX_uxn_opcodes_h_l2815_c2_c78d_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2815_c2_c78d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2815_c2_c78d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_c78d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2815_c2_c78d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2815_c2_c78d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_c78d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2815_c2_c78d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_c78d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2815_c2_c78d]
signal result_u8_value_MUX_uxn_opcodes_h_l2815_c2_c78d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2815_c2_c78d]
signal t8_MUX_uxn_opcodes_h_l2815_c2_c78d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2816_c3_317d[uxn_opcodes_h_l2816_c3_317d]
signal printf_uxn_opcodes_h_l2816_c3_317d_uxn_opcodes_h_l2816_c3_317d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2820_c11_1638]
signal BIN_OP_EQ_uxn_opcodes_h_l2820_c11_1638_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2820_c11_1638_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2820_c11_1638_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2820_c7_034a]
signal n8_MUX_uxn_opcodes_h_l2820_c7_034a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2820_c7_034a_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2820_c7_034a]
signal l8_MUX_uxn_opcodes_h_l2820_c7_034a_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2820_c7_034a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2820_c7_034a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_034a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_034a_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2820_c7_034a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_034a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_034a_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2820_c7_034a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_034a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_034a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2820_c7_034a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_034a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_034a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2820_c7_034a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_034a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_034a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2820_c7_034a]
signal result_u8_value_MUX_uxn_opcodes_h_l2820_c7_034a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2820_c7_034a_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2820_c7_034a]
signal t8_MUX_uxn_opcodes_h_l2820_c7_034a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2820_c7_034a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2823_c11_aba1]
signal BIN_OP_EQ_uxn_opcodes_h_l2823_c11_aba1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2823_c11_aba1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2823_c11_aba1_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2823_c7_864d]
signal n8_MUX_uxn_opcodes_h_l2823_c7_864d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2823_c7_864d_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2823_c7_864d]
signal l8_MUX_uxn_opcodes_h_l2823_c7_864d_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2823_c7_864d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2823_c7_864d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_864d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_864d_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2823_c7_864d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_864d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_864d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2823_c7_864d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_864d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_864d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2823_c7_864d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_864d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_864d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2823_c7_864d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_864d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_864d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2823_c7_864d]
signal result_u8_value_MUX_uxn_opcodes_h_l2823_c7_864d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2823_c7_864d_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2823_c7_864d]
signal t8_MUX_uxn_opcodes_h_l2823_c7_864d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2823_c7_864d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2827_c11_5042]
signal BIN_OP_EQ_uxn_opcodes_h_l2827_c11_5042_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2827_c11_5042_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2827_c11_5042_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2827_c7_406f]
signal n8_MUX_uxn_opcodes_h_l2827_c7_406f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2827_c7_406f_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2827_c7_406f]
signal l8_MUX_uxn_opcodes_h_l2827_c7_406f_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2827_c7_406f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2827_c7_406f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_406f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_406f_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2827_c7_406f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_406f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_406f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2827_c7_406f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_406f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_406f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2827_c7_406f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_406f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_406f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2827_c7_406f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_406f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_406f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2827_c7_406f]
signal result_u8_value_MUX_uxn_opcodes_h_l2827_c7_406f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2827_c7_406f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2830_c11_db48]
signal BIN_OP_EQ_uxn_opcodes_h_l2830_c11_db48_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2830_c11_db48_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2830_c11_db48_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2830_c7_9853]
signal n8_MUX_uxn_opcodes_h_l2830_c7_9853_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2830_c7_9853_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2830_c7_9853]
signal l8_MUX_uxn_opcodes_h_l2830_c7_9853_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2830_c7_9853_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2830_c7_9853]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_9853_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_9853_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2830_c7_9853]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_9853_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_9853_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2830_c7_9853]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_9853_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_9853_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2830_c7_9853]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_9853_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_9853_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2830_c7_9853]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_9853_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_9853_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2830_c7_9853]
signal result_u8_value_MUX_uxn_opcodes_h_l2830_c7_9853_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2830_c7_9853_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2834_c11_c005]
signal BIN_OP_EQ_uxn_opcodes_h_l2834_c11_c005_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2834_c11_c005_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2834_c11_c005_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2834_c7_8095]
signal l8_MUX_uxn_opcodes_h_l2834_c7_8095_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2834_c7_8095_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2834_c7_8095]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_8095_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_8095_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2834_c7_8095]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_8095_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_8095_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2834_c7_8095]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_8095_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_8095_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2834_c7_8095]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_8095_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_8095_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2834_c7_8095]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_8095_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_8095_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2834_c7_8095]
signal result_u8_value_MUX_uxn_opcodes_h_l2834_c7_8095_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2834_c7_8095_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2837_c11_6221]
signal BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6221_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6221_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6221_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2837_c7_fa7d]
signal l8_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2837_c7_fa7d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2837_c7_fa7d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2837_c7_fa7d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2837_c7_fa7d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2837_c7_fa7d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2837_c7_fa7d]
signal result_u8_value_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2840_c30_214d]
signal sp_relative_shift_uxn_opcodes_h_l2840_c30_214d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2840_c30_214d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2840_c30_214d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2840_c30_214d_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2845_c11_052f]
signal BIN_OP_EQ_uxn_opcodes_h_l2845_c11_052f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2845_c11_052f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2845_c11_052f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2845_c7_1e7c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2845_c7_1e7c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2845_c7_1e7c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2845_c7_1e7c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2845_c7_1e7c]
signal result_u8_value_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2850_c11_4ed7]
signal BIN_OP_EQ_uxn_opcodes_h_l2850_c11_4ed7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2850_c11_4ed7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2850_c11_4ed7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2850_c7_0061]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_0061_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_0061_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_0061_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_0061_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2850_c7_0061]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_0061_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_0061_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_0061_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_0061_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2850_c7_0061]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_0061_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_0061_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_0061_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_0061_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2850_c7_0061]
signal result_u8_value_MUX_uxn_opcodes_h_l2850_c7_0061_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2850_c7_0061_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2850_c7_0061_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2850_c7_0061_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2854_c11_3cfc]
signal BIN_OP_EQ_uxn_opcodes_h_l2854_c11_3cfc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2854_c11_3cfc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2854_c11_3cfc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2854_c7_a64f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_a64f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_a64f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_a64f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_a64f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2854_c7_a64f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_a64f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_a64f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_a64f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_a64f_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_8cda( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf
BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf_left,
BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf_right,
BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_0401
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_0401 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_0401_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_0401_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_0401_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_0401_return_output);

-- n8_MUX_uxn_opcodes_h_l2815_c2_c78d
n8_MUX_uxn_opcodes_h_l2815_c2_c78d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2815_c2_c78d_cond,
n8_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue,
n8_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse,
n8_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output);

-- l8_MUX_uxn_opcodes_h_l2815_c2_c78d
l8_MUX_uxn_opcodes_h_l2815_c2_c78d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2815_c2_c78d_cond,
l8_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue,
l8_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse,
l8_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_c78d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_c78d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_c78d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_c78d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_c78d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_c78d
result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_c78d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_c78d
result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_c78d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_c78d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_c78d
result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_c78d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_c78d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2815_c2_c78d
result_u8_value_MUX_uxn_opcodes_h_l2815_c2_c78d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2815_c2_c78d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output);

-- t8_MUX_uxn_opcodes_h_l2815_c2_c78d
t8_MUX_uxn_opcodes_h_l2815_c2_c78d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2815_c2_c78d_cond,
t8_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue,
t8_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse,
t8_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output);

-- printf_uxn_opcodes_h_l2816_c3_317d_uxn_opcodes_h_l2816_c3_317d
printf_uxn_opcodes_h_l2816_c3_317d_uxn_opcodes_h_l2816_c3_317d : entity work.printf_uxn_opcodes_h_l2816_c3_317d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2816_c3_317d_uxn_opcodes_h_l2816_c3_317d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2820_c11_1638
BIN_OP_EQ_uxn_opcodes_h_l2820_c11_1638 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2820_c11_1638_left,
BIN_OP_EQ_uxn_opcodes_h_l2820_c11_1638_right,
BIN_OP_EQ_uxn_opcodes_h_l2820_c11_1638_return_output);

-- n8_MUX_uxn_opcodes_h_l2820_c7_034a
n8_MUX_uxn_opcodes_h_l2820_c7_034a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2820_c7_034a_cond,
n8_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue,
n8_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse,
n8_MUX_uxn_opcodes_h_l2820_c7_034a_return_output);

-- l8_MUX_uxn_opcodes_h_l2820_c7_034a
l8_MUX_uxn_opcodes_h_l2820_c7_034a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2820_c7_034a_cond,
l8_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue,
l8_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse,
l8_MUX_uxn_opcodes_h_l2820_c7_034a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_034a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_034a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_034a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_034a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_034a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_034a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_034a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_034a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_034a
result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_034a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_034a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_034a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_034a
result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_034a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_034a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_034a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_034a
result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_034a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_034a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_034a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2820_c7_034a
result_u8_value_MUX_uxn_opcodes_h_l2820_c7_034a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2820_c7_034a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2820_c7_034a_return_output);

-- t8_MUX_uxn_opcodes_h_l2820_c7_034a
t8_MUX_uxn_opcodes_h_l2820_c7_034a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2820_c7_034a_cond,
t8_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue,
t8_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse,
t8_MUX_uxn_opcodes_h_l2820_c7_034a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2823_c11_aba1
BIN_OP_EQ_uxn_opcodes_h_l2823_c11_aba1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2823_c11_aba1_left,
BIN_OP_EQ_uxn_opcodes_h_l2823_c11_aba1_right,
BIN_OP_EQ_uxn_opcodes_h_l2823_c11_aba1_return_output);

-- n8_MUX_uxn_opcodes_h_l2823_c7_864d
n8_MUX_uxn_opcodes_h_l2823_c7_864d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2823_c7_864d_cond,
n8_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue,
n8_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse,
n8_MUX_uxn_opcodes_h_l2823_c7_864d_return_output);

-- l8_MUX_uxn_opcodes_h_l2823_c7_864d
l8_MUX_uxn_opcodes_h_l2823_c7_864d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2823_c7_864d_cond,
l8_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue,
l8_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse,
l8_MUX_uxn_opcodes_h_l2823_c7_864d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_864d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_864d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_864d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_864d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_864d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_864d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_864d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_864d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_864d
result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_864d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_864d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_864d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_864d
result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_864d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_864d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_864d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_864d
result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_864d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_864d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_864d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2823_c7_864d
result_u8_value_MUX_uxn_opcodes_h_l2823_c7_864d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2823_c7_864d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2823_c7_864d_return_output);

-- t8_MUX_uxn_opcodes_h_l2823_c7_864d
t8_MUX_uxn_opcodes_h_l2823_c7_864d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2823_c7_864d_cond,
t8_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue,
t8_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse,
t8_MUX_uxn_opcodes_h_l2823_c7_864d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2827_c11_5042
BIN_OP_EQ_uxn_opcodes_h_l2827_c11_5042 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2827_c11_5042_left,
BIN_OP_EQ_uxn_opcodes_h_l2827_c11_5042_right,
BIN_OP_EQ_uxn_opcodes_h_l2827_c11_5042_return_output);

-- n8_MUX_uxn_opcodes_h_l2827_c7_406f
n8_MUX_uxn_opcodes_h_l2827_c7_406f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2827_c7_406f_cond,
n8_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue,
n8_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse,
n8_MUX_uxn_opcodes_h_l2827_c7_406f_return_output);

-- l8_MUX_uxn_opcodes_h_l2827_c7_406f
l8_MUX_uxn_opcodes_h_l2827_c7_406f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2827_c7_406f_cond,
l8_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue,
l8_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse,
l8_MUX_uxn_opcodes_h_l2827_c7_406f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_406f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_406f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_406f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_406f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_406f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_406f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_406f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_406f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_406f
result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_406f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_406f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_406f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_406f
result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_406f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_406f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_406f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_406f
result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_406f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_406f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_406f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2827_c7_406f
result_u8_value_MUX_uxn_opcodes_h_l2827_c7_406f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2827_c7_406f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2827_c7_406f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2830_c11_db48
BIN_OP_EQ_uxn_opcodes_h_l2830_c11_db48 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2830_c11_db48_left,
BIN_OP_EQ_uxn_opcodes_h_l2830_c11_db48_right,
BIN_OP_EQ_uxn_opcodes_h_l2830_c11_db48_return_output);

-- n8_MUX_uxn_opcodes_h_l2830_c7_9853
n8_MUX_uxn_opcodes_h_l2830_c7_9853 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2830_c7_9853_cond,
n8_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue,
n8_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse,
n8_MUX_uxn_opcodes_h_l2830_c7_9853_return_output);

-- l8_MUX_uxn_opcodes_h_l2830_c7_9853
l8_MUX_uxn_opcodes_h_l2830_c7_9853 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2830_c7_9853_cond,
l8_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue,
l8_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse,
l8_MUX_uxn_opcodes_h_l2830_c7_9853_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_9853
result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_9853 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_9853_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_9853_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_9853
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_9853 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_9853_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_9853_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_9853
result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_9853 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_9853_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_9853_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_9853
result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_9853 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_9853_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_9853_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_9853
result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_9853 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_9853_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_9853_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2830_c7_9853
result_u8_value_MUX_uxn_opcodes_h_l2830_c7_9853 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2830_c7_9853_cond,
result_u8_value_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2830_c7_9853_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2834_c11_c005
BIN_OP_EQ_uxn_opcodes_h_l2834_c11_c005 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2834_c11_c005_left,
BIN_OP_EQ_uxn_opcodes_h_l2834_c11_c005_right,
BIN_OP_EQ_uxn_opcodes_h_l2834_c11_c005_return_output);

-- l8_MUX_uxn_opcodes_h_l2834_c7_8095
l8_MUX_uxn_opcodes_h_l2834_c7_8095 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2834_c7_8095_cond,
l8_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue,
l8_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse,
l8_MUX_uxn_opcodes_h_l2834_c7_8095_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_8095
result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_8095 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_8095_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_8095_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_8095
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_8095 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_8095_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_8095_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_8095
result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_8095 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_8095_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_8095_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_8095
result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_8095 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_8095_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_8095_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_8095
result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_8095 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_8095_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_8095_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2834_c7_8095
result_u8_value_MUX_uxn_opcodes_h_l2834_c7_8095 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2834_c7_8095_cond,
result_u8_value_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2834_c7_8095_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6221
BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6221 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6221_left,
BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6221_right,
BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6221_return_output);

-- l8_MUX_uxn_opcodes_h_l2837_c7_fa7d
l8_MUX_uxn_opcodes_h_l2837_c7_fa7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond,
l8_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue,
l8_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse,
l8_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_fa7d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_fa7d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d
result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_fa7d
result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_fa7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_fa7d
result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_fa7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2837_c7_fa7d
result_u8_value_MUX_uxn_opcodes_h_l2837_c7_fa7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2840_c30_214d
sp_relative_shift_uxn_opcodes_h_l2840_c30_214d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2840_c30_214d_ins,
sp_relative_shift_uxn_opcodes_h_l2840_c30_214d_x,
sp_relative_shift_uxn_opcodes_h_l2840_c30_214d_y,
sp_relative_shift_uxn_opcodes_h_l2840_c30_214d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2845_c11_052f
BIN_OP_EQ_uxn_opcodes_h_l2845_c11_052f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2845_c11_052f_left,
BIN_OP_EQ_uxn_opcodes_h_l2845_c11_052f_right,
BIN_OP_EQ_uxn_opcodes_h_l2845_c11_052f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_1e7c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_1e7c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_1e7c
result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_1e7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_1e7c
result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_1e7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_1e7c
result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_1e7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2845_c7_1e7c
result_u8_value_MUX_uxn_opcodes_h_l2845_c7_1e7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2850_c11_4ed7
BIN_OP_EQ_uxn_opcodes_h_l2850_c11_4ed7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2850_c11_4ed7_left,
BIN_OP_EQ_uxn_opcodes_h_l2850_c11_4ed7_right,
BIN_OP_EQ_uxn_opcodes_h_l2850_c11_4ed7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_0061
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_0061 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_0061_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_0061_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_0061_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_0061_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_0061
result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_0061 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_0061_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_0061_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_0061_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_0061_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_0061
result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_0061 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_0061_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_0061_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_0061_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_0061_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2850_c7_0061
result_u8_value_MUX_uxn_opcodes_h_l2850_c7_0061 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2850_c7_0061_cond,
result_u8_value_MUX_uxn_opcodes_h_l2850_c7_0061_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2850_c7_0061_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2850_c7_0061_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2854_c11_3cfc
BIN_OP_EQ_uxn_opcodes_h_l2854_c11_3cfc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2854_c11_3cfc_left,
BIN_OP_EQ_uxn_opcodes_h_l2854_c11_3cfc_right,
BIN_OP_EQ_uxn_opcodes_h_l2854_c11_3cfc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_a64f
result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_a64f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_a64f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_a64f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_a64f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_a64f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_a64f
result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_a64f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_a64f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_a64f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_a64f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_a64f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_0401_return_output,
 n8_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output,
 l8_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output,
 t8_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2820_c11_1638_return_output,
 n8_MUX_uxn_opcodes_h_l2820_c7_034a_return_output,
 l8_MUX_uxn_opcodes_h_l2820_c7_034a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_034a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_034a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_034a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_034a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_034a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2820_c7_034a_return_output,
 t8_MUX_uxn_opcodes_h_l2820_c7_034a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2823_c11_aba1_return_output,
 n8_MUX_uxn_opcodes_h_l2823_c7_864d_return_output,
 l8_MUX_uxn_opcodes_h_l2823_c7_864d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_864d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_864d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_864d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_864d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_864d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2823_c7_864d_return_output,
 t8_MUX_uxn_opcodes_h_l2823_c7_864d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2827_c11_5042_return_output,
 n8_MUX_uxn_opcodes_h_l2827_c7_406f_return_output,
 l8_MUX_uxn_opcodes_h_l2827_c7_406f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_406f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_406f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_406f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_406f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_406f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2827_c7_406f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2830_c11_db48_return_output,
 n8_MUX_uxn_opcodes_h_l2830_c7_9853_return_output,
 l8_MUX_uxn_opcodes_h_l2830_c7_9853_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_9853_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_9853_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_9853_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_9853_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_9853_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2830_c7_9853_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2834_c11_c005_return_output,
 l8_MUX_uxn_opcodes_h_l2834_c7_8095_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_8095_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_8095_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_8095_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_8095_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_8095_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2834_c7_8095_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6221_return_output,
 l8_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output,
 sp_relative_shift_uxn_opcodes_h_l2840_c30_214d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2845_c11_052f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2850_c11_4ed7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_0061_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_0061_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_0061_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2850_c7_0061_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2854_c11_3cfc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_a64f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_a64f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_0401_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_0401_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_0401_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_0401_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2820_c7_034a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2815_c2_c78d_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2820_c7_034a_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2815_c2_c78d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_034a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2817_c3_3e1d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_034a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_c78d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_034a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_034a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_c78d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_034a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_c78d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c7_034a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2815_c2_c78d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2820_c7_034a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2815_c2_c78d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2816_c3_317d_uxn_opcodes_h_l2816_c3_317d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_1638_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_1638_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_1638_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2823_c7_864d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2820_c7_034a_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2823_c7_864d_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2820_c7_034a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_864d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_034a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2821_c3_3b6e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_864d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_034a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_864d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_034a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_864d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_034a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_864d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_034a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_864d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c7_034a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2823_c7_864d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2820_c7_034a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_aba1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_aba1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_aba1_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2827_c7_406f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2823_c7_864d_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2827_c7_406f_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2823_c7_864d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_406f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_864d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2825_c3_e31b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_406f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_864d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_406f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_864d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_406f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_864d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_406f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_864d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2827_c7_406f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_864d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2823_c7_864d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_5042_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_5042_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_5042_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2830_c7_9853_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2827_c7_406f_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2830_c7_9853_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2827_c7_406f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_9853_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_406f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2828_c3_55da : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_9853_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_406f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_9853_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_406f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_9853_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_406f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_9853_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_406f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_9853_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2827_c7_406f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_db48_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_db48_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_db48_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2830_c7_9853_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2834_c7_8095_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2830_c7_9853_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_8095_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_9853_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2832_c3_7b96 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_8095_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_9853_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_8095_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_9853_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_8095_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_9853_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_8095_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_9853_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2834_c7_8095_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_9853_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_c005_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_c005_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_c005_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2834_c7_8095_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_8095_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2835_c3_a9da : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_8095_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_8095_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_8095_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_8095_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2834_c7_8095_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6221_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6221_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6221_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2842_c3_c764 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2840_c30_214d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2840_c30_214d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2840_c30_214d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2840_c30_214d_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_052f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_052f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_052f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2847_c3_67aa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_0061_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_0061_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_0061_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_0061_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_4ed7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_4ed7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_4ed7_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_0061_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2851_c3_60a4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_0061_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2850_c7_0061_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_0061_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_0061_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_0061_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_a64f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_0061_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_0061_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_0061_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_a64f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_0061_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_0061_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_0061_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_0061_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_3cfc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_3cfc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_3cfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_a64f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_a64f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_a64f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_a64f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_a64f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_a64f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2820_l2815_l2837_l2834_l2830_l2827_l2823_DUPLICATE_ba54_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2820_l2845_l2815_l2834_l2830_l2827_l2823_DUPLICATE_11b1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2820_l2845_l2815_l2834_l2830_l2827_l2854_l2823_l2850_DUPLICATE_9328_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2820_l2815_l2834_l2830_l2827_l2823_l2850_DUPLICATE_95d8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2820_l2845_l2837_l2834_l2830_l2827_l2854_l2823_l2850_DUPLICATE_9df8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2859_l2811_DUPLICATE_8be3_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6221_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_a64f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_aba1_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_db48_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_5042_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_4ed7_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2842_c3_c764 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2842_c3_c764;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_c005_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2840_c30_214d_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2835_c3_a9da := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2835_c3_a9da;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_1638_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_3cfc_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2851_c3_60a4 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_0061_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2851_c3_60a4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2817_c3_3e1d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2817_c3_3e1d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2821_c3_3b6e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2821_c3_3b6e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_052f_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2832_c3_7b96 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2832_c3_7b96;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_0401_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2847_c3_67aa := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2847_c3_67aa;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2825_c3_e31b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2825_c3_e31b;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2840_c30_214d_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_a64f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2828_c3_55da := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2828_c3_55da;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_0401_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2840_c30_214d_ins := VAR_ins;
     VAR_l8_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse := l8;
     VAR_n8_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse := n8;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_0061_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_1638_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_aba1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_5042_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_db48_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_c005_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6221_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_052f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_4ed7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_3cfc_left := VAR_phase;
     VAR_l8_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2823_c11_aba1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2823_c11_aba1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_aba1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2823_c11_aba1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_aba1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_aba1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2823_c11_aba1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2827_c11_5042] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2827_c11_5042_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_5042_left;
     BIN_OP_EQ_uxn_opcodes_h_l2827_c11_5042_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_5042_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_5042_return_output := BIN_OP_EQ_uxn_opcodes_h_l2827_c11_5042_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2820_l2845_l2815_l2834_l2830_l2827_l2854_l2823_l2850_DUPLICATE_9328 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2820_l2845_l2815_l2834_l2830_l2827_l2854_l2823_l2850_DUPLICATE_9328_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l2840_c30_214d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2840_c30_214d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2840_c30_214d_ins;
     sp_relative_shift_uxn_opcodes_h_l2840_c30_214d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2840_c30_214d_x;
     sp_relative_shift_uxn_opcodes_h_l2840_c30_214d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2840_c30_214d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2840_c30_214d_return_output := sp_relative_shift_uxn_opcodes_h_l2840_c30_214d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2830_c11_db48] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2830_c11_db48_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_db48_left;
     BIN_OP_EQ_uxn_opcodes_h_l2830_c11_db48_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_db48_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_db48_return_output := BIN_OP_EQ_uxn_opcodes_h_l2830_c11_db48_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2820_l2845_l2815_l2834_l2830_l2827_l2823_DUPLICATE_11b1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2820_l2845_l2815_l2834_l2830_l2827_l2823_DUPLICATE_11b1_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2845_c11_052f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2845_c11_052f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_052f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2845_c11_052f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_052f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_052f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2845_c11_052f_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2820_l2815_l2837_l2834_l2830_l2827_l2823_DUPLICATE_ba54 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2820_l2815_l2837_l2834_l2830_l2827_l2823_DUPLICATE_ba54_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2820_l2845_l2837_l2834_l2830_l2827_l2854_l2823_l2850_DUPLICATE_9df8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2820_l2845_l2837_l2834_l2830_l2827_l2854_l2823_l2850_DUPLICATE_9df8_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2850_c7_0061] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2850_c7_0061_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2815_c6_8faf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2850_c11_4ed7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2850_c11_4ed7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_4ed7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2850_c11_4ed7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_4ed7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_4ed7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2850_c11_4ed7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2820_l2815_l2834_l2830_l2827_l2823_l2850_DUPLICATE_95d8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2820_l2815_l2834_l2830_l2827_l2823_l2850_DUPLICATE_95d8_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2854_c11_3cfc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2854_c11_3cfc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_3cfc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2854_c11_3cfc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_3cfc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_3cfc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2854_c11_3cfc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2837_c11_6221] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6221_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6221_left;
     BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6221_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6221_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6221_return_output := BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6221_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2834_c11_c005] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2834_c11_c005_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_c005_left;
     BIN_OP_EQ_uxn_opcodes_h_l2834_c11_c005_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_c005_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_c005_return_output := BIN_OP_EQ_uxn_opcodes_h_l2834_c11_c005_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2820_c11_1638] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2820_c11_1638_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_1638_left;
     BIN_OP_EQ_uxn_opcodes_h_l2820_c11_1638_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_1638_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_1638_return_output := BIN_OP_EQ_uxn_opcodes_h_l2820_c11_1638_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_0401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2815_c2_c78d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2815_c2_c78d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_c78d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_c78d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_c78d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2815_c2_c78d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2815_c2_c78d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_8faf_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2820_c7_034a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_1638_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2820_c7_034a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_1638_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_034a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_1638_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_034a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_1638_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_034a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_1638_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_034a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_1638_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_034a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_1638_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c7_034a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_1638_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2820_c7_034a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_1638_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2823_c7_864d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_aba1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2823_c7_864d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_aba1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_864d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_aba1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_864d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_aba1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_864d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_aba1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_864d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_aba1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_864d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_aba1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_864d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_aba1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2823_c7_864d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_aba1_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2827_c7_406f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_5042_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2827_c7_406f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_5042_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_406f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_5042_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_406f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_5042_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_406f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_5042_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_406f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_5042_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_406f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_5042_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2827_c7_406f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_5042_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2830_c7_9853_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_db48_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2830_c7_9853_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_db48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_9853_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_db48_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_9853_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_db48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_9853_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_db48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_9853_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_db48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_9853_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_db48_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_9853_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_db48_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2834_c7_8095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_c005_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_8095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_c005_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_8095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_c005_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_8095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_c005_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_8095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_c005_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_8095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_c005_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2834_c7_8095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_c005_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6221_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6221_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6221_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6221_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6221_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6221_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6221_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_052f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_052f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_052f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_052f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_052f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_0061_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_4ed7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_0061_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_4ed7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_0061_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_4ed7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_0061_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_4ed7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_a64f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_3cfc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_a64f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_3cfc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2820_l2815_l2837_l2834_l2830_l2827_l2823_DUPLICATE_ba54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2820_l2815_l2837_l2834_l2830_l2827_l2823_DUPLICATE_ba54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2820_l2815_l2837_l2834_l2830_l2827_l2823_DUPLICATE_ba54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2820_l2815_l2837_l2834_l2830_l2827_l2823_DUPLICATE_ba54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2820_l2815_l2837_l2834_l2830_l2827_l2823_DUPLICATE_ba54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2820_l2815_l2837_l2834_l2830_l2827_l2823_DUPLICATE_ba54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2820_l2815_l2837_l2834_l2830_l2827_l2823_DUPLICATE_ba54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2820_l2845_l2837_l2834_l2830_l2827_l2854_l2823_l2850_DUPLICATE_9df8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2820_l2845_l2837_l2834_l2830_l2827_l2854_l2823_l2850_DUPLICATE_9df8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2820_l2845_l2837_l2834_l2830_l2827_l2854_l2823_l2850_DUPLICATE_9df8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2820_l2845_l2837_l2834_l2830_l2827_l2854_l2823_l2850_DUPLICATE_9df8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2820_l2845_l2837_l2834_l2830_l2827_l2854_l2823_l2850_DUPLICATE_9df8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2820_l2845_l2837_l2834_l2830_l2827_l2854_l2823_l2850_DUPLICATE_9df8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2820_l2845_l2837_l2834_l2830_l2827_l2854_l2823_l2850_DUPLICATE_9df8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_0061_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2820_l2845_l2837_l2834_l2830_l2827_l2854_l2823_l2850_DUPLICATE_9df8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_a64f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2820_l2845_l2837_l2834_l2830_l2827_l2854_l2823_l2850_DUPLICATE_9df8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2820_l2845_l2815_l2834_l2830_l2827_l2823_DUPLICATE_11b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2820_l2845_l2815_l2834_l2830_l2827_l2823_DUPLICATE_11b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2820_l2845_l2815_l2834_l2830_l2827_l2823_DUPLICATE_11b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2820_l2845_l2815_l2834_l2830_l2827_l2823_DUPLICATE_11b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2820_l2845_l2815_l2834_l2830_l2827_l2823_DUPLICATE_11b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2820_l2845_l2815_l2834_l2830_l2827_l2823_DUPLICATE_11b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2820_l2845_l2815_l2834_l2830_l2827_l2823_DUPLICATE_11b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2820_l2845_l2815_l2834_l2830_l2827_l2854_l2823_l2850_DUPLICATE_9328_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2820_l2845_l2815_l2834_l2830_l2827_l2854_l2823_l2850_DUPLICATE_9328_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2820_l2845_l2815_l2834_l2830_l2827_l2854_l2823_l2850_DUPLICATE_9328_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2820_l2845_l2815_l2834_l2830_l2827_l2854_l2823_l2850_DUPLICATE_9328_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2820_l2845_l2815_l2834_l2830_l2827_l2854_l2823_l2850_DUPLICATE_9328_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2820_l2845_l2815_l2834_l2830_l2827_l2854_l2823_l2850_DUPLICATE_9328_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2820_l2845_l2815_l2834_l2830_l2827_l2854_l2823_l2850_DUPLICATE_9328_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_0061_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2820_l2845_l2815_l2834_l2830_l2827_l2854_l2823_l2850_DUPLICATE_9328_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_a64f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2820_l2845_l2815_l2834_l2830_l2827_l2854_l2823_l2850_DUPLICATE_9328_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2820_l2815_l2834_l2830_l2827_l2823_l2850_DUPLICATE_95d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2820_l2815_l2834_l2830_l2827_l2823_l2850_DUPLICATE_95d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2820_l2815_l2834_l2830_l2827_l2823_l2850_DUPLICATE_95d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2820_l2815_l2834_l2830_l2827_l2823_l2850_DUPLICATE_95d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2820_l2815_l2834_l2830_l2827_l2823_l2850_DUPLICATE_95d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2820_l2815_l2834_l2830_l2827_l2823_l2850_DUPLICATE_95d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_0061_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2820_l2815_l2834_l2830_l2827_l2823_l2850_DUPLICATE_95d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_0061_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2850_c7_0061_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2840_c30_214d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2850_c7_0061] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2850_c7_0061_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_0061_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2850_c7_0061_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_0061_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2850_c7_0061_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_0061_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_0061_return_output := result_u8_value_MUX_uxn_opcodes_h_l2850_c7_0061_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2845_c7_1e7c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2850_c7_0061] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_0061_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_0061_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_0061_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_0061_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_0061_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_0061_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_0061_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_0061_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2815_c1_0401] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_0401_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_0401_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_0401_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_0401_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_0401_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_0401_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_0401_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_0401_return_output;

     -- n8_MUX[uxn_opcodes_h_l2830_c7_9853] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2830_c7_9853_cond <= VAR_n8_MUX_uxn_opcodes_h_l2830_c7_9853_cond;
     n8_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue;
     n8_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2830_c7_9853_return_output := n8_MUX_uxn_opcodes_h_l2830_c7_9853_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2837_c7_fa7d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output;

     -- l8_MUX[uxn_opcodes_h_l2837_c7_fa7d] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond <= VAR_l8_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond;
     l8_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue;
     l8_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output := l8_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output;

     -- t8_MUX[uxn_opcodes_h_l2823_c7_864d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2823_c7_864d_cond <= VAR_t8_MUX_uxn_opcodes_h_l2823_c7_864d_cond;
     t8_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue;
     t8_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2823_c7_864d_return_output := t8_MUX_uxn_opcodes_h_l2823_c7_864d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2854_c7_a64f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_a64f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_a64f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_a64f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_a64f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_a64f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_a64f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_a64f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_a64f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2854_c7_a64f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_a64f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_a64f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_a64f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_a64f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_a64f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_a64f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_a64f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_a64f_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l2816_c3_317d_uxn_opcodes_h_l2816_c3_317d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_0401_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2830_c7_9853_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_0061_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_a64f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_0061_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_a64f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_0061_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_0061_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2823_c7_864d_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2837_c7_fa7d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output;

     -- n8_MUX[uxn_opcodes_h_l2827_c7_406f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2827_c7_406f_cond <= VAR_n8_MUX_uxn_opcodes_h_l2827_c7_406f_cond;
     n8_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue;
     n8_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2827_c7_406f_return_output := n8_MUX_uxn_opcodes_h_l2827_c7_406f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2850_c7_0061] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_0061_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_0061_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_0061_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_0061_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_0061_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_0061_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_0061_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_0061_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2845_c7_1e7c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output;

     -- t8_MUX[uxn_opcodes_h_l2820_c7_034a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2820_c7_034a_cond <= VAR_t8_MUX_uxn_opcodes_h_l2820_c7_034a_cond;
     t8_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue;
     t8_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2820_c7_034a_return_output := t8_MUX_uxn_opcodes_h_l2820_c7_034a_return_output;

     -- l8_MUX[uxn_opcodes_h_l2834_c7_8095] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2834_c7_8095_cond <= VAR_l8_MUX_uxn_opcodes_h_l2834_c7_8095_cond;
     l8_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue;
     l8_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2834_c7_8095_return_output := l8_MUX_uxn_opcodes_h_l2834_c7_8095_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2845_c7_1e7c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2850_c7_0061] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_0061_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_0061_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_0061_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_0061_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_0061_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_0061_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_0061_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_0061_return_output;

     -- printf_uxn_opcodes_h_l2816_c3_317d[uxn_opcodes_h_l2816_c3_317d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2816_c3_317d_uxn_opcodes_h_l2816_c3_317d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2816_c3_317d_uxn_opcodes_h_l2816_c3_317d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2834_c7_8095] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_8095_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_8095_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_8095_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_8095_return_output;

     -- Submodule level 3
     VAR_l8_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2834_c7_8095_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2827_c7_406f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_0061_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_0061_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_8095_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2820_c7_034a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2837_c7_fa7d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output;

     -- n8_MUX[uxn_opcodes_h_l2823_c7_864d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2823_c7_864d_cond <= VAR_n8_MUX_uxn_opcodes_h_l2823_c7_864d_cond;
     n8_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue;
     n8_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2823_c7_864d_return_output := n8_MUX_uxn_opcodes_h_l2823_c7_864d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2834_c7_8095] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_8095_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_8095_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_8095_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_8095_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2830_c7_9853] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_9853_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_9853_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_9853_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_9853_return_output;

     -- t8_MUX[uxn_opcodes_h_l2815_c2_c78d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2815_c2_c78d_cond <= VAR_t8_MUX_uxn_opcodes_h_l2815_c2_c78d_cond;
     t8_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue;
     t8_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output := t8_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2845_c7_1e7c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output;

     -- l8_MUX[uxn_opcodes_h_l2830_c7_9853] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2830_c7_9853_cond <= VAR_l8_MUX_uxn_opcodes_h_l2830_c7_9853_cond;
     l8_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue;
     l8_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2830_c7_9853_return_output := l8_MUX_uxn_opcodes_h_l2830_c7_9853_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2837_c7_fa7d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2845_c7_1e7c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_1e7c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_1e7c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_1e7c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output;

     -- Submodule level 4
     VAR_l8_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2830_c7_9853_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2823_c7_864d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_8095_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_1e7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_9853_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2837_c7_fa7d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output;

     -- n8_MUX[uxn_opcodes_h_l2820_c7_034a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2820_c7_034a_cond <= VAR_n8_MUX_uxn_opcodes_h_l2820_c7_034a_cond;
     n8_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue;
     n8_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2820_c7_034a_return_output := n8_MUX_uxn_opcodes_h_l2820_c7_034a_return_output;

     -- l8_MUX[uxn_opcodes_h_l2827_c7_406f] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2827_c7_406f_cond <= VAR_l8_MUX_uxn_opcodes_h_l2827_c7_406f_cond;
     l8_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue;
     l8_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2827_c7_406f_return_output := l8_MUX_uxn_opcodes_h_l2827_c7_406f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2827_c7_406f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_406f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_406f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_406f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_406f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2837_c7_fa7d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_fa7d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_fa7d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_fa7d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2834_c7_8095] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2834_c7_8095_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2834_c7_8095_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2834_c7_8095_return_output := result_u8_value_MUX_uxn_opcodes_h_l2834_c7_8095_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2834_c7_8095] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_8095_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_8095_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_8095_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_8095_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2830_c7_9853] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_9853_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_9853_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_9853_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_9853_return_output;

     -- Submodule level 5
     VAR_l8_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2827_c7_406f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2820_c7_034a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_9853_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_fa7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_406f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_8095_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2834_c7_8095_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2830_c7_9853] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2830_c7_9853_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_9853_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_9853_return_output := result_u8_value_MUX_uxn_opcodes_h_l2830_c7_9853_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2827_c7_406f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_406f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_406f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_406f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_406f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2834_c7_8095] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_8095_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_8095_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_8095_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_8095_return_output;

     -- n8_MUX[uxn_opcodes_h_l2815_c2_c78d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2815_c2_c78d_cond <= VAR_n8_MUX_uxn_opcodes_h_l2815_c2_c78d_cond;
     n8_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue;
     n8_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output := n8_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2830_c7_9853] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_9853_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_9853_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_9853_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_9853_return_output;

     -- l8_MUX[uxn_opcodes_h_l2823_c7_864d] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2823_c7_864d_cond <= VAR_l8_MUX_uxn_opcodes_h_l2823_c7_864d_cond;
     l8_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue;
     l8_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2823_c7_864d_return_output := l8_MUX_uxn_opcodes_h_l2823_c7_864d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2834_c7_8095] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_8095_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_8095_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_8095_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_8095_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_8095_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_8095_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2823_c7_864d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_864d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_864d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_864d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_864d_return_output;

     -- Submodule level 6
     VAR_l8_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2823_c7_864d_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_8095_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_406f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_8095_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_864d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_9853_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_9853_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2823_c7_864d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_864d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_864d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_864d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_864d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2827_c7_406f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2827_c7_406f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2827_c7_406f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2827_c7_406f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2827_c7_406f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2830_c7_9853] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_9853_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_9853_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_9853_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_9853_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2830_c7_9853] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_9853_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_9853_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_9853_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_9853_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_9853_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_9853_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2820_c7_034a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_034a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_034a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_034a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_034a_return_output;

     -- l8_MUX[uxn_opcodes_h_l2820_c7_034a] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2820_c7_034a_cond <= VAR_l8_MUX_uxn_opcodes_h_l2820_c7_034a_cond;
     l8_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue;
     l8_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2820_c7_034a_return_output := l8_MUX_uxn_opcodes_h_l2820_c7_034a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2827_c7_406f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_406f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_406f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_406f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_406f_return_output;

     -- Submodule level 7
     VAR_l8_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2820_c7_034a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_9853_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_864d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_9853_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_034a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_406f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2827_c7_406f_return_output;
     -- l8_MUX[uxn_opcodes_h_l2815_c2_c78d] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2815_c2_c78d_cond <= VAR_l8_MUX_uxn_opcodes_h_l2815_c2_c78d_cond;
     l8_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue;
     l8_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output := l8_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2823_c7_864d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2823_c7_864d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_864d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_864d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2823_c7_864d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2827_c7_406f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_406f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_406f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_406f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_406f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2827_c7_406f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_406f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_406f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_406f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_406f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_406f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_406f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2823_c7_864d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_864d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_864d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_864d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_864d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2820_c7_034a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_034a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_034a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_034a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_034a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2815_c2_c78d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output;

     -- Submodule level 8
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_406f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_034a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_406f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_864d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_864d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2823_c7_864d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_864d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_864d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_864d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_864d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2815_c2_c78d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2823_c7_864d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_864d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_864d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_864d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_864d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_864d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_864d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2820_c7_034a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_034a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_034a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_034a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_034a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2820_c7_034a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2820_c7_034a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c7_034a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c7_034a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2820_c7_034a_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_864d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_864d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_034a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c7_034a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2820_c7_034a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_034a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_034a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_034a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_034a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2815_c2_c78d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2815_c2_c78d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2815_c2_c78d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2815_c2_c78d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_c78d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_c78d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2820_c7_034a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_034a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_034a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_034a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_034a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_034a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_034a_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_034a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_034a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2815_c2_c78d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_c78d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_c78d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2815_c2_c78d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_c78d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_c78d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_c78d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_c78d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2859_l2811_DUPLICATE_8be3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2859_l2811_DUPLICATE_8be3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8cda(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2815_c2_c78d_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2859_l2811_DUPLICATE_8be3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2859_l2811_DUPLICATE_8be3_return_output;
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
