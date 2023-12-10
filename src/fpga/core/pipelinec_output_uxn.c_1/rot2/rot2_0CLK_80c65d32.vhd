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
-- Submodules: 105
entity rot2_0CLK_80c65d32 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot2_0CLK_80c65d32;
architecture arch of rot2_0CLK_80c65d32 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal l16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_l16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2646_c6_bdab]
signal BIN_OP_EQ_uxn_opcodes_h_l2646_c6_bdab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2646_c6_bdab_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2646_c6_bdab_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2646_c2_cf29]
signal l16_MUX_uxn_opcodes_h_l2646_c2_cf29_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2646_c2_cf29]
signal n16_MUX_uxn_opcodes_h_l2646_c2_cf29_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2646_c2_cf29]
signal t16_MUX_uxn_opcodes_h_l2646_c2_cf29_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2646_c2_cf29]
signal result_u8_value_MUX_uxn_opcodes_h_l2646_c2_cf29_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2646_c2_cf29]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2646_c2_cf29_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2646_c2_cf29]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2646_c2_cf29_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2646_c2_cf29]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c2_cf29_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2646_c2_cf29]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c2_cf29_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2653_c11_303d]
signal BIN_OP_EQ_uxn_opcodes_h_l2653_c11_303d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2653_c11_303d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2653_c11_303d_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2653_c7_a6f8]
signal l16_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2653_c7_a6f8]
signal n16_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2653_c7_a6f8]
signal t16_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2653_c7_a6f8]
signal result_u8_value_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2653_c7_a6f8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2653_c7_a6f8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2653_c7_a6f8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2653_c7_a6f8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2656_c11_140f]
signal BIN_OP_EQ_uxn_opcodes_h_l2656_c11_140f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2656_c11_140f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2656_c11_140f_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2656_c7_51fc]
signal l16_MUX_uxn_opcodes_h_l2656_c7_51fc_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2656_c7_51fc]
signal n16_MUX_uxn_opcodes_h_l2656_c7_51fc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2656_c7_51fc]
signal t16_MUX_uxn_opcodes_h_l2656_c7_51fc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2656_c7_51fc]
signal result_u8_value_MUX_uxn_opcodes_h_l2656_c7_51fc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2656_c7_51fc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_51fc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2656_c7_51fc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_51fc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2656_c7_51fc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_51fc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2656_c7_51fc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_51fc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2661_c11_9a53]
signal BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9a53_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9a53_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9a53_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2661_c7_e3f6]
signal l16_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2661_c7_e3f6]
signal n16_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2661_c7_e3f6]
signal t16_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2661_c7_e3f6]
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2661_c7_e3f6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2661_c7_e3f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2661_c7_e3f6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2661_c7_e3f6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2662_c3_146f]
signal BIN_OP_OR_uxn_opcodes_h_l2662_c3_146f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2662_c3_146f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2662_c3_146f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2665_c11_8fe6]
signal BIN_OP_EQ_uxn_opcodes_h_l2665_c11_8fe6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2665_c11_8fe6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2665_c11_8fe6_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2665_c7_d4aa]
signal l16_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2665_c7_d4aa]
signal n16_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2665_c7_d4aa]
signal result_u8_value_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2665_c7_d4aa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2665_c7_d4aa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2665_c7_d4aa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2665_c7_d4aa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2670_c11_f1ab]
signal BIN_OP_EQ_uxn_opcodes_h_l2670_c11_f1ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2670_c11_f1ab_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2670_c11_f1ab_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2670_c7_a0e4]
signal l16_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2670_c7_a0e4]
signal n16_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2670_c7_a0e4]
signal result_u8_value_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2670_c7_a0e4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2670_c7_a0e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2670_c7_a0e4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2670_c7_a0e4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2671_c3_273a]
signal BIN_OP_OR_uxn_opcodes_h_l2671_c3_273a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2671_c3_273a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2671_c3_273a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2674_c11_0a50]
signal BIN_OP_EQ_uxn_opcodes_h_l2674_c11_0a50_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2674_c11_0a50_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2674_c11_0a50_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2674_c7_1de1]
signal l16_MUX_uxn_opcodes_h_l2674_c7_1de1_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2674_c7_1de1]
signal result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1de1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2674_c7_1de1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1de1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2674_c7_1de1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1de1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2674_c7_1de1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1de1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2674_c7_1de1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1de1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2678_c30_a74f]
signal sp_relative_shift_uxn_opcodes_h_l2678_c30_a74f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2678_c30_a74f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2678_c30_a74f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2678_c30_a74f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2683_c11_b6d7]
signal BIN_OP_EQ_uxn_opcodes_h_l2683_c11_b6d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2683_c11_b6d7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2683_c11_b6d7_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2683_c7_0774]
signal l16_MUX_uxn_opcodes_h_l2683_c7_0774_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2683_c7_0774_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2683_c7_0774]
signal result_u8_value_MUX_uxn_opcodes_h_l2683_c7_0774_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2683_c7_0774_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2683_c7_0774]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_0774_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_0774_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2683_c7_0774]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_0774_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_0774_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2683_c7_0774]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_0774_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_0774_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2683_c7_0774]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_0774_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_0774_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2684_c3_6b09]
signal BIN_OP_OR_uxn_opcodes_h_l2684_c3_6b09_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2684_c3_6b09_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2684_c3_6b09_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2687_c31_e495]
signal CONST_SR_8_uxn_opcodes_h_l2687_c31_e495_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2687_c31_e495_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2689_c11_5f38]
signal BIN_OP_EQ_uxn_opcodes_h_l2689_c11_5f38_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2689_c11_5f38_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2689_c11_5f38_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2689_c7_4d5c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_4d5c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_4d5c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_4d5c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_4d5c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2689_c7_4d5c]
signal result_u8_value_MUX_uxn_opcodes_h_l2689_c7_4d5c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2689_c7_4d5c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2689_c7_4d5c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2689_c7_4d5c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2689_c7_4d5c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_4d5c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_4d5c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_4d5c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_4d5c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2689_c7_4d5c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_4d5c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_4d5c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_4d5c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_4d5c_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2693_c11_e08b]
signal BIN_OP_EQ_uxn_opcodes_h_l2693_c11_e08b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2693_c11_e08b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2693_c11_e08b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2693_c7_f746]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_f746_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_f746_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_f746_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_f746_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2693_c7_f746]
signal result_u8_value_MUX_uxn_opcodes_h_l2693_c7_f746_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2693_c7_f746_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2693_c7_f746_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2693_c7_f746_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2693_c7_f746]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_f746_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_f746_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_f746_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_f746_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2693_c7_f746]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_f746_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_f746_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_f746_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_f746_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2695_c31_3562]
signal CONST_SR_8_uxn_opcodes_h_l2695_c31_3562_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2695_c31_3562_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2697_c11_f240]
signal BIN_OP_EQ_uxn_opcodes_h_l2697_c11_f240_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2697_c11_f240_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2697_c11_f240_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2697_c7_ba21]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_ba21_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_ba21_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_ba21_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_ba21_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2697_c7_ba21]
signal result_u8_value_MUX_uxn_opcodes_h_l2697_c7_ba21_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2697_c7_ba21_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2697_c7_ba21_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2697_c7_ba21_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2697_c7_ba21]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_ba21_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_ba21_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_ba21_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_ba21_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2697_c7_ba21]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_ba21_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_ba21_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_ba21_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_ba21_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2701_c11_e2a3]
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_e2a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_e2a3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_e2a3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2701_c7_55b6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_55b6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_55b6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_55b6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_55b6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2701_c7_55b6]
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_55b6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_55b6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_55b6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_55b6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2701_c7_55b6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_55b6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_55b6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_55b6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_55b6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2701_c7_55b6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_55b6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_55b6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_55b6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_55b6_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2703_c31_229d]
signal CONST_SR_8_uxn_opcodes_h_l2703_c31_229d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2703_c31_229d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2705_c11_6e43]
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_6e43_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_6e43_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_6e43_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2705_c7_a2d2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_a2d2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_a2d2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_a2d2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_a2d2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2705_c7_a2d2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_a2d2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_a2d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_a2d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_a2d2_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2667_l2676_l2658_DUPLICATE_f1b1
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2667_l2676_l2658_DUPLICATE_f1b1_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2667_l2676_l2658_DUPLICATE_f1b1_return_output : unsigned(15 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_eae7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2646_c6_bdab
BIN_OP_EQ_uxn_opcodes_h_l2646_c6_bdab : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2646_c6_bdab_left,
BIN_OP_EQ_uxn_opcodes_h_l2646_c6_bdab_right,
BIN_OP_EQ_uxn_opcodes_h_l2646_c6_bdab_return_output);

-- l16_MUX_uxn_opcodes_h_l2646_c2_cf29
l16_MUX_uxn_opcodes_h_l2646_c2_cf29 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2646_c2_cf29_cond,
l16_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue,
l16_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse,
l16_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output);

-- n16_MUX_uxn_opcodes_h_l2646_c2_cf29
n16_MUX_uxn_opcodes_h_l2646_c2_cf29 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2646_c2_cf29_cond,
n16_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue,
n16_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse,
n16_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output);

-- t16_MUX_uxn_opcodes_h_l2646_c2_cf29
t16_MUX_uxn_opcodes_h_l2646_c2_cf29 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2646_c2_cf29_cond,
t16_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue,
t16_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse,
t16_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2646_c2_cf29
result_u8_value_MUX_uxn_opcodes_h_l2646_c2_cf29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2646_c2_cf29_cond,
result_u8_value_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2646_c2_cf29
result_is_stack_write_MUX_uxn_opcodes_h_l2646_c2_cf29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2646_c2_cf29_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2646_c2_cf29
result_is_opc_done_MUX_uxn_opcodes_h_l2646_c2_cf29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2646_c2_cf29_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c2_cf29
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c2_cf29 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c2_cf29_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c2_cf29
result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c2_cf29 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c2_cf29_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2653_c11_303d
BIN_OP_EQ_uxn_opcodes_h_l2653_c11_303d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2653_c11_303d_left,
BIN_OP_EQ_uxn_opcodes_h_l2653_c11_303d_right,
BIN_OP_EQ_uxn_opcodes_h_l2653_c11_303d_return_output);

-- l16_MUX_uxn_opcodes_h_l2653_c7_a6f8
l16_MUX_uxn_opcodes_h_l2653_c7_a6f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond,
l16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue,
l16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse,
l16_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output);

-- n16_MUX_uxn_opcodes_h_l2653_c7_a6f8
n16_MUX_uxn_opcodes_h_l2653_c7_a6f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond,
n16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue,
n16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse,
n16_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output);

-- t16_MUX_uxn_opcodes_h_l2653_c7_a6f8
t16_MUX_uxn_opcodes_h_l2653_c7_a6f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond,
t16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue,
t16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse,
t16_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2653_c7_a6f8
result_u8_value_MUX_uxn_opcodes_h_l2653_c7_a6f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_a6f8
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_a6f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_a6f8
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_a6f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_a6f8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_a6f8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_a6f8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_a6f8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2656_c11_140f
BIN_OP_EQ_uxn_opcodes_h_l2656_c11_140f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2656_c11_140f_left,
BIN_OP_EQ_uxn_opcodes_h_l2656_c11_140f_right,
BIN_OP_EQ_uxn_opcodes_h_l2656_c11_140f_return_output);

-- l16_MUX_uxn_opcodes_h_l2656_c7_51fc
l16_MUX_uxn_opcodes_h_l2656_c7_51fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2656_c7_51fc_cond,
l16_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue,
l16_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse,
l16_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output);

-- n16_MUX_uxn_opcodes_h_l2656_c7_51fc
n16_MUX_uxn_opcodes_h_l2656_c7_51fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2656_c7_51fc_cond,
n16_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue,
n16_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse,
n16_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output);

-- t16_MUX_uxn_opcodes_h_l2656_c7_51fc
t16_MUX_uxn_opcodes_h_l2656_c7_51fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2656_c7_51fc_cond,
t16_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue,
t16_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse,
t16_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2656_c7_51fc
result_u8_value_MUX_uxn_opcodes_h_l2656_c7_51fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2656_c7_51fc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_51fc
result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_51fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_51fc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_51fc
result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_51fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_51fc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_51fc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_51fc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_51fc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_51fc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_51fc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_51fc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9a53
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9a53 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9a53_left,
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9a53_right,
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9a53_return_output);

-- l16_MUX_uxn_opcodes_h_l2661_c7_e3f6
l16_MUX_uxn_opcodes_h_l2661_c7_e3f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond,
l16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue,
l16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse,
l16_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output);

-- n16_MUX_uxn_opcodes_h_l2661_c7_e3f6
n16_MUX_uxn_opcodes_h_l2661_c7_e3f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond,
n16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue,
n16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse,
n16_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output);

-- t16_MUX_uxn_opcodes_h_l2661_c7_e3f6
t16_MUX_uxn_opcodes_h_l2661_c7_e3f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond,
t16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue,
t16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse,
t16_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2661_c7_e3f6
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_e3f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_e3f6
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_e3f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_e3f6
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_e3f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_e3f6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_e3f6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_e3f6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_e3f6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2662_c3_146f
BIN_OP_OR_uxn_opcodes_h_l2662_c3_146f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2662_c3_146f_left,
BIN_OP_OR_uxn_opcodes_h_l2662_c3_146f_right,
BIN_OP_OR_uxn_opcodes_h_l2662_c3_146f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2665_c11_8fe6
BIN_OP_EQ_uxn_opcodes_h_l2665_c11_8fe6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2665_c11_8fe6_left,
BIN_OP_EQ_uxn_opcodes_h_l2665_c11_8fe6_right,
BIN_OP_EQ_uxn_opcodes_h_l2665_c11_8fe6_return_output);

-- l16_MUX_uxn_opcodes_h_l2665_c7_d4aa
l16_MUX_uxn_opcodes_h_l2665_c7_d4aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond,
l16_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue,
l16_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse,
l16_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output);

-- n16_MUX_uxn_opcodes_h_l2665_c7_d4aa
n16_MUX_uxn_opcodes_h_l2665_c7_d4aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond,
n16_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue,
n16_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse,
n16_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2665_c7_d4aa
result_u8_value_MUX_uxn_opcodes_h_l2665_c7_d4aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond,
result_u8_value_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_d4aa
result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_d4aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_d4aa
result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_d4aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_d4aa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_d4aa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_d4aa
result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_d4aa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2670_c11_f1ab
BIN_OP_EQ_uxn_opcodes_h_l2670_c11_f1ab : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2670_c11_f1ab_left,
BIN_OP_EQ_uxn_opcodes_h_l2670_c11_f1ab_right,
BIN_OP_EQ_uxn_opcodes_h_l2670_c11_f1ab_return_output);

-- l16_MUX_uxn_opcodes_h_l2670_c7_a0e4
l16_MUX_uxn_opcodes_h_l2670_c7_a0e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond,
l16_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue,
l16_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse,
l16_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output);

-- n16_MUX_uxn_opcodes_h_l2670_c7_a0e4
n16_MUX_uxn_opcodes_h_l2670_c7_a0e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond,
n16_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue,
n16_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse,
n16_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2670_c7_a0e4
result_u8_value_MUX_uxn_opcodes_h_l2670_c7_a0e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_a0e4
result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_a0e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_a0e4
result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_a0e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_a0e4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_a0e4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2670_c7_a0e4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2670_c7_a0e4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2671_c3_273a
BIN_OP_OR_uxn_opcodes_h_l2671_c3_273a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2671_c3_273a_left,
BIN_OP_OR_uxn_opcodes_h_l2671_c3_273a_right,
BIN_OP_OR_uxn_opcodes_h_l2671_c3_273a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2674_c11_0a50
BIN_OP_EQ_uxn_opcodes_h_l2674_c11_0a50 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2674_c11_0a50_left,
BIN_OP_EQ_uxn_opcodes_h_l2674_c11_0a50_right,
BIN_OP_EQ_uxn_opcodes_h_l2674_c11_0a50_return_output);

-- l16_MUX_uxn_opcodes_h_l2674_c7_1de1
l16_MUX_uxn_opcodes_h_l2674_c7_1de1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2674_c7_1de1_cond,
l16_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue,
l16_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse,
l16_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1de1
result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1de1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1de1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1de1
result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1de1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1de1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1de1
result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1de1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1de1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1de1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1de1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1de1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1de1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1de1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1de1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2678_c30_a74f
sp_relative_shift_uxn_opcodes_h_l2678_c30_a74f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2678_c30_a74f_ins,
sp_relative_shift_uxn_opcodes_h_l2678_c30_a74f_x,
sp_relative_shift_uxn_opcodes_h_l2678_c30_a74f_y,
sp_relative_shift_uxn_opcodes_h_l2678_c30_a74f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2683_c11_b6d7
BIN_OP_EQ_uxn_opcodes_h_l2683_c11_b6d7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2683_c11_b6d7_left,
BIN_OP_EQ_uxn_opcodes_h_l2683_c11_b6d7_right,
BIN_OP_EQ_uxn_opcodes_h_l2683_c11_b6d7_return_output);

-- l16_MUX_uxn_opcodes_h_l2683_c7_0774
l16_MUX_uxn_opcodes_h_l2683_c7_0774 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2683_c7_0774_cond,
l16_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue,
l16_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse,
l16_MUX_uxn_opcodes_h_l2683_c7_0774_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2683_c7_0774
result_u8_value_MUX_uxn_opcodes_h_l2683_c7_0774 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2683_c7_0774_cond,
result_u8_value_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2683_c7_0774_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_0774
result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_0774 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_0774_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_0774_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_0774
result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_0774 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_0774_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_0774_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_0774
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_0774 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_0774_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_0774_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_0774
result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_0774 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_0774_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_0774_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2684_c3_6b09
BIN_OP_OR_uxn_opcodes_h_l2684_c3_6b09 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2684_c3_6b09_left,
BIN_OP_OR_uxn_opcodes_h_l2684_c3_6b09_right,
BIN_OP_OR_uxn_opcodes_h_l2684_c3_6b09_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2687_c31_e495
CONST_SR_8_uxn_opcodes_h_l2687_c31_e495 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2687_c31_e495_x,
CONST_SR_8_uxn_opcodes_h_l2687_c31_e495_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2689_c11_5f38
BIN_OP_EQ_uxn_opcodes_h_l2689_c11_5f38 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2689_c11_5f38_left,
BIN_OP_EQ_uxn_opcodes_h_l2689_c11_5f38_right,
BIN_OP_EQ_uxn_opcodes_h_l2689_c11_5f38_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_4d5c
result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_4d5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_4d5c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_4d5c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_4d5c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_4d5c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2689_c7_4d5c
result_u8_value_MUX_uxn_opcodes_h_l2689_c7_4d5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2689_c7_4d5c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2689_c7_4d5c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2689_c7_4d5c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2689_c7_4d5c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_4d5c
result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_4d5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_4d5c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_4d5c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_4d5c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_4d5c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_4d5c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_4d5c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_4d5c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_4d5c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_4d5c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_4d5c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2693_c11_e08b
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_e08b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_e08b_left,
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_e08b_right,
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_e08b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_f746
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_f746 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_f746_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_f746_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_f746_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_f746_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2693_c7_f746
result_u8_value_MUX_uxn_opcodes_h_l2693_c7_f746 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2693_c7_f746_cond,
result_u8_value_MUX_uxn_opcodes_h_l2693_c7_f746_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2693_c7_f746_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2693_c7_f746_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_f746
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_f746 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_f746_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_f746_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_f746_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_f746_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_f746
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_f746 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_f746_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_f746_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_f746_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_f746_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2695_c31_3562
CONST_SR_8_uxn_opcodes_h_l2695_c31_3562 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2695_c31_3562_x,
CONST_SR_8_uxn_opcodes_h_l2695_c31_3562_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2697_c11_f240
BIN_OP_EQ_uxn_opcodes_h_l2697_c11_f240 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2697_c11_f240_left,
BIN_OP_EQ_uxn_opcodes_h_l2697_c11_f240_right,
BIN_OP_EQ_uxn_opcodes_h_l2697_c11_f240_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_ba21
result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_ba21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_ba21_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_ba21_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_ba21_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_ba21_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2697_c7_ba21
result_u8_value_MUX_uxn_opcodes_h_l2697_c7_ba21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2697_c7_ba21_cond,
result_u8_value_MUX_uxn_opcodes_h_l2697_c7_ba21_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2697_c7_ba21_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2697_c7_ba21_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_ba21
result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_ba21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_ba21_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_ba21_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_ba21_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_ba21_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_ba21
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_ba21 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_ba21_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_ba21_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_ba21_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_ba21_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2701_c11_e2a3
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_e2a3 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_e2a3_left,
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_e2a3_right,
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_e2a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_55b6
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_55b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_55b6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_55b6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_55b6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_55b6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2701_c7_55b6
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_55b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_55b6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_55b6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_55b6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_55b6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_55b6
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_55b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_55b6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_55b6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_55b6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_55b6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_55b6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_55b6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_55b6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_55b6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_55b6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_55b6_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2703_c31_229d
CONST_SR_8_uxn_opcodes_h_l2703_c31_229d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2703_c31_229d_x,
CONST_SR_8_uxn_opcodes_h_l2703_c31_229d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2705_c11_6e43
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_6e43 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_6e43_left,
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_6e43_right,
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_6e43_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_a2d2
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_a2d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_a2d2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_a2d2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_a2d2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_a2d2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_a2d2
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_a2d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_a2d2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_a2d2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_a2d2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_a2d2_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2667_l2676_l2658_DUPLICATE_f1b1
CONST_SL_8_uint16_t_uxn_opcodes_h_l2667_l2676_l2658_DUPLICATE_f1b1 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2667_l2676_l2658_DUPLICATE_f1b1_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2667_l2676_l2658_DUPLICATE_f1b1_return_output);



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
 l16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2646_c6_bdab_return_output,
 l16_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output,
 n16_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output,
 t16_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2653_c11_303d_return_output,
 l16_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output,
 n16_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output,
 t16_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2656_c11_140f_return_output,
 l16_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output,
 n16_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output,
 t16_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9a53_return_output,
 l16_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output,
 n16_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output,
 t16_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2662_c3_146f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2665_c11_8fe6_return_output,
 l16_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output,
 n16_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2670_c11_f1ab_return_output,
 l16_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output,
 n16_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2671_c3_273a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2674_c11_0a50_return_output,
 l16_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output,
 sp_relative_shift_uxn_opcodes_h_l2678_c30_a74f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2683_c11_b6d7_return_output,
 l16_MUX_uxn_opcodes_h_l2683_c7_0774_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2683_c7_0774_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_0774_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_0774_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_0774_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_0774_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2684_c3_6b09_return_output,
 CONST_SR_8_uxn_opcodes_h_l2687_c31_e495_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2689_c11_5f38_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_4d5c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2689_c7_4d5c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_4d5c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_4d5c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2693_c11_e08b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_f746_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2693_c7_f746_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_f746_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_f746_return_output,
 CONST_SR_8_uxn_opcodes_h_l2695_c31_3562_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2697_c11_f240_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_ba21_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2697_c7_ba21_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_ba21_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_ba21_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2701_c11_e2a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_55b6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2701_c7_55b6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_55b6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_55b6_return_output,
 CONST_SR_8_uxn_opcodes_h_l2703_c31_229d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2705_c11_6e43_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_a2d2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_a2d2_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2667_l2676_l2658_DUPLICATE_f1b1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c6_bdab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c6_bdab_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c6_bdab_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2646_c2_cf29_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2646_c2_cf29_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2646_c2_cf29_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2646_c2_cf29_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c2_cf29_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c2_cf29_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2650_c3_f7aa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c2_cf29_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c2_cf29_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_303d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_303d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_303d_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2654_c3_c0ab : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_140f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_140f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_140f_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2656_c7_51fc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2656_c7_51fc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2656_c7_51fc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2656_c7_51fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_51fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_51fc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2659_c3_980b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_51fc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_51fc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9a53_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9a53_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9a53_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2663_c3_ebdf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2662_c3_146f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2662_c3_146f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2662_c3_146f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_8fe6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_8fe6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_8fe6_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2668_c3_c5f7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2670_c11_f1ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2670_c11_f1ab_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2670_c11_f1ab_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2672_c3_4f73 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2671_c3_273a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2671_c3_273a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2671_c3_273a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_0a50_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_0a50_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_0a50_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2683_c7_0774_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2674_c7_1de1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2683_c7_0774_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1de1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_0774_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1de1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_0774_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1de1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2680_c3_d330 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_0774_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1de1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_0774_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1de1_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2678_c30_a74f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2678_c30_a74f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2678_c30_a74f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2678_c30_a74f_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2681_c21_4d6d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_b6d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_b6d7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_b6d7_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2683_c7_0774_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_4d5c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2683_c7_0774_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_4d5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_0774_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_4d5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_0774_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2686_c3_f693 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_4d5c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_0774_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2685_c3_6d45 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_0774_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2684_c3_6b09_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2684_c3_6b09_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2684_c3_6b09_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2687_c31_e495_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2687_c31_e495_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2687_c21_2b80_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_5f38_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_5f38_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_5f38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_4d5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_4d5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_f746_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_4d5c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_4d5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_4d5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_f746_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_4d5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_4d5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_4d5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_f746_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_4d5c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_4d5c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2690_c3_ad19 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_4d5c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_f746_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_4d5c_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2691_c21_55aa_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_e08b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_e08b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_e08b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_f746_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_f746_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_ba21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_f746_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_f746_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_f746_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2697_c7_ba21_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_f746_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_f746_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_f746_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_ba21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_f746_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_f746_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2694_c3_467f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_f746_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_ba21_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_f746_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2695_c31_3562_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2695_c31_3562_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2695_c21_37ec_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_f240_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_f240_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_f240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_ba21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_ba21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_55b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_ba21_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2697_c7_ba21_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2697_c7_ba21_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_55b6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2697_c7_ba21_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_ba21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_ba21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_55b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_ba21_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_ba21_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2698_c3_000b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_ba21_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_55b6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_ba21_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2699_c21_6a21_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_e2a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_e2a3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_e2a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_55b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_55b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_a2d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_55b6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_55b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_55b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_55b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_55b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_55b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_a2d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_55b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_55b6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2702_c3_0836 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_55b6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2701_c7_55b6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_55b6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2703_c31_229d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2703_c31_229d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2703_c21_ee72_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_6e43_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_6e43_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_6e43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_a2d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_a2d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_a2d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_a2d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_a2d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_a2d2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2656_l2653_l2646_l2670_l2701_l2665_l2661_DUPLICATE_0f23_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2646_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_caf5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2656_l2653_l2683_l2646_l2670_l2665_l2661_DUPLICATE_febf_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2674_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_95cc_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2657_l2684_l2662_l2666_l2675_l2671_DUPLICATE_eaf3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2667_l2676_l2658_DUPLICATE_f1b1_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2667_l2676_l2658_DUPLICATE_f1b1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2710_l2642_DUPLICATE_1623_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_l16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_l16 := l16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_a2d2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2670_c11_f1ab_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_e2a3_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_303d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_b6d7_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2650_c3_f7aa := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2650_c3_f7aa;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2685_c3_6d45 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2685_c3_6d45;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c6_bdab_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_140f_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2698_c3_000b := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_ba21_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2698_c3_000b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2659_c3_980b := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2659_c3_980b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2654_c3_c0ab := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2654_c3_c0ab;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2680_c3_d330 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2680_c3_d330;
     VAR_sp_relative_shift_uxn_opcodes_h_l2678_c30_a74f_x := signed(std_logic_vector(resize(to_unsigned(6, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2702_c3_0836 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_55b6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2702_c3_0836;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_0a50_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2663_c3_ebdf := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2663_c3_ebdf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_f240_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_6e43_right := to_unsigned(12, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2694_c3_467f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_f746_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2694_c3_467f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2690_c3_ad19 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_4d5c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2690_c3_ad19;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2668_c3_c5f7 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2668_c3_c5f7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2672_c3_4f73 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2672_c3_4f73;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_a2d2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2686_c3_f693 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2686_c3_f693;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_8fe6_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_5f38_right := to_unsigned(8, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_e08b_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9a53_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2678_c30_a74f_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2678_c30_a74f_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2684_c3_6b09_left := l16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2695_c31_3562_x := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse := l16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2671_c3_273a_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2703_c31_229d_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c6_bdab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_303d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_140f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9a53_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_8fe6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2670_c11_f1ab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_0a50_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_b6d7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_5f38_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_e08b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_f240_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_e2a3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_6e43_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2662_c3_146f_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2687_c31_e495_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2656_c11_140f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2656_c11_140f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_140f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2656_c11_140f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_140f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_140f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2656_c11_140f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2656_l2653_l2646_l2670_l2701_l2665_l2661_DUPLICATE_0f23 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2656_l2653_l2646_l2670_l2701_l2665_l2661_DUPLICATE_0f23_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2697_c11_f240] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2697_c11_f240_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_f240_left;
     BIN_OP_EQ_uxn_opcodes_h_l2697_c11_f240_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_f240_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_f240_return_output := BIN_OP_EQ_uxn_opcodes_h_l2697_c11_f240_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2646_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_caf5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2646_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_caf5_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2670_c11_f1ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2670_c11_f1ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2670_c11_f1ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l2670_c11_f1ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2670_c11_f1ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2670_c11_f1ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l2670_c11_f1ab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2705_c11_6e43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2705_c11_6e43_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_6e43_left;
     BIN_OP_EQ_uxn_opcodes_h_l2705_c11_6e43_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_6e43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_6e43_return_output := BIN_OP_EQ_uxn_opcodes_h_l2705_c11_6e43_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2656_l2653_l2683_l2646_l2670_l2665_l2661_DUPLICATE_febf LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2656_l2653_l2683_l2646_l2670_l2665_l2661_DUPLICATE_febf_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2693_c11_e08b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2693_c11_e08b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_e08b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2693_c11_e08b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_e08b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_e08b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2693_c11_e08b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2653_c11_303d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2653_c11_303d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_303d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2653_c11_303d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_303d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_303d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2653_c11_303d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2674_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_95cc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2674_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_95cc_return_output := result.is_opc_done;

     -- CONST_SR_8[uxn_opcodes_h_l2695_c31_3562] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2695_c31_3562_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2695_c31_3562_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2695_c31_3562_return_output := CONST_SR_8_uxn_opcodes_h_l2695_c31_3562_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2661_c11_9a53] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9a53_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9a53_left;
     BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9a53_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9a53_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9a53_return_output := BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9a53_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2699_c21_6a21] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2699_c21_6a21_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2646_c6_bdab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2646_c6_bdab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c6_bdab_left;
     BIN_OP_EQ_uxn_opcodes_h_l2646_c6_bdab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c6_bdab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c6_bdab_return_output := BIN_OP_EQ_uxn_opcodes_h_l2646_c6_bdab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2683_c11_b6d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2683_c11_b6d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_b6d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2683_c11_b6d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_b6d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_b6d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2683_c11_b6d7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2665_c11_8fe6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2665_c11_8fe6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_8fe6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2665_c11_8fe6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_8fe6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_8fe6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2665_c11_8fe6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2681_c21_4d6d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2681_c21_4d6d_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2701_c7_55b6] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2701_c7_55b6_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2701_c11_e2a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2701_c11_e2a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_e2a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2701_c11_e2a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_e2a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_e2a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2701_c11_e2a3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2689_c11_5f38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2689_c11_5f38_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_5f38_left;
     BIN_OP_EQ_uxn_opcodes_h_l2689_c11_5f38_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_5f38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_5f38_return_output := BIN_OP_EQ_uxn_opcodes_h_l2689_c11_5f38_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2657_l2684_l2662_l2666_l2675_l2671_DUPLICATE_eaf3 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2657_l2684_l2662_l2666_l2675_l2671_DUPLICATE_eaf3_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2691_c21_55aa] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2691_c21_55aa_return_output := CAST_TO_uint8_t_uint16_t(
     l16);

     -- sp_relative_shift[uxn_opcodes_h_l2678_c30_a74f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2678_c30_a74f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2678_c30_a74f_ins;
     sp_relative_shift_uxn_opcodes_h_l2678_c30_a74f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2678_c30_a74f_x;
     sp_relative_shift_uxn_opcodes_h_l2678_c30_a74f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2678_c30_a74f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2678_c30_a74f_return_output := sp_relative_shift_uxn_opcodes_h_l2678_c30_a74f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2674_c11_0a50] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2674_c11_0a50_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_0a50_left;
     BIN_OP_EQ_uxn_opcodes_h_l2674_c11_0a50_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_0a50_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_0a50_return_output := BIN_OP_EQ_uxn_opcodes_h_l2674_c11_0a50_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2703_c31_229d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2703_c31_229d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2703_c31_229d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2703_c31_229d_return_output := CONST_SR_8_uxn_opcodes_h_l2703_c31_229d_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2687_c31_e495] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2687_c31_e495_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2687_c31_e495_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2687_c31_e495_return_output := CONST_SR_8_uxn_opcodes_h_l2687_c31_e495_return_output;

     -- Submodule level 1
     VAR_l16_MUX_uxn_opcodes_h_l2646_c2_cf29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c6_bdab_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2646_c2_cf29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c6_bdab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c2_cf29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c6_bdab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c2_cf29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c6_bdab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c2_cf29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c6_bdab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c2_cf29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c6_bdab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2646_c2_cf29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c6_bdab_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2646_c2_cf29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c6_bdab_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_303d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_303d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_303d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_303d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_303d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_303d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_303d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_303d_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2656_c7_51fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_140f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2656_c7_51fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_140f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_51fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_140f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_51fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_140f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_51fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_140f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_51fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_140f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2656_c7_51fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_140f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2656_c7_51fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_140f_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9a53_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9a53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9a53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9a53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9a53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9a53_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9a53_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9a53_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_8fe6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_8fe6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_8fe6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_8fe6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_8fe6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_8fe6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_8fe6_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2670_c11_f1ab_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2670_c11_f1ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2670_c11_f1ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2670_c11_f1ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2670_c11_f1ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2670_c11_f1ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2670_c11_f1ab_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2674_c7_1de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_0a50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_0a50_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_0a50_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_0a50_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_0a50_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_0a50_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2683_c7_0774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_b6d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_0774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_b6d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_0774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_b6d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_0774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_b6d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_0774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_b6d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2683_c7_0774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_b6d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_4d5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_5f38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_4d5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_5f38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_4d5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_5f38_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_4d5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_5f38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_f746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_e08b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_f746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_e08b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_f746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_e08b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_f746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_e08b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_ba21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_f240_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_ba21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_f240_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_ba21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_f240_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2697_c7_ba21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_f240_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_55b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_e2a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_55b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_e2a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_55b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_e2a3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_55b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_e2a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_a2d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_6e43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_a2d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_6e43_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2662_c3_146f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2657_l2684_l2662_l2666_l2675_l2671_DUPLICATE_eaf3_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2671_c3_273a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2657_l2684_l2662_l2666_l2675_l2671_DUPLICATE_eaf3_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2684_c3_6b09_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2657_l2684_l2662_l2666_l2675_l2671_DUPLICATE_eaf3_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2667_l2676_l2658_DUPLICATE_f1b1_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2657_l2684_l2662_l2666_l2675_l2671_DUPLICATE_eaf3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2681_c21_4d6d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_4d5c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2691_c21_55aa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2697_c7_ba21_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2699_c21_6a21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2656_l2653_l2683_l2646_l2670_l2665_l2661_DUPLICATE_febf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2656_l2653_l2683_l2646_l2670_l2665_l2661_DUPLICATE_febf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2656_l2653_l2683_l2646_l2670_l2665_l2661_DUPLICATE_febf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2656_l2653_l2683_l2646_l2670_l2665_l2661_DUPLICATE_febf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2656_l2653_l2683_l2646_l2670_l2665_l2661_DUPLICATE_febf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2656_l2653_l2683_l2646_l2670_l2665_l2661_DUPLICATE_febf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2656_l2653_l2683_l2646_l2670_l2665_l2661_DUPLICATE_febf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2674_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_95cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2674_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_95cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2674_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_95cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2674_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_95cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2674_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_95cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2674_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_95cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2674_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_95cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_4d5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2674_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_95cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_f746_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2674_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_95cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_ba21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2674_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_95cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_55b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2674_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_95cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_a2d2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2674_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_95cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2646_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_caf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2646_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_caf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2646_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_caf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2646_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_caf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2646_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_caf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2646_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_caf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2646_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_caf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_4d5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2646_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_caf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_f746_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2646_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_caf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_ba21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2646_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_caf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_55b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2646_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_caf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_a2d2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2656_l2689_l2653_l2683_l2646_l2705_l2670_l2701_l2665_l2697_l2661_l2693_DUPLICATE_caf5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2656_l2653_l2646_l2670_l2701_l2665_l2661_DUPLICATE_0f23_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2656_l2653_l2646_l2670_l2701_l2665_l2661_DUPLICATE_0f23_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2656_l2653_l2646_l2670_l2701_l2665_l2661_DUPLICATE_0f23_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2656_l2653_l2646_l2670_l2701_l2665_l2661_DUPLICATE_0f23_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2656_l2653_l2646_l2670_l2701_l2665_l2661_DUPLICATE_0f23_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2656_l2653_l2646_l2670_l2701_l2665_l2661_DUPLICATE_0f23_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_55b6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2656_l2653_l2646_l2670_l2701_l2665_l2661_DUPLICATE_0f23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_55b6_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2701_c7_55b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2678_c30_a74f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2701_c7_55b6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_55b6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_55b6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_55b6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_55b6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_55b6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_55b6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_55b6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_55b6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2684_c3_6b09] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2684_c3_6b09_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2684_c3_6b09_left;
     BIN_OP_OR_uxn_opcodes_h_l2684_c3_6b09_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2684_c3_6b09_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2684_c3_6b09_return_output := BIN_OP_OR_uxn_opcodes_h_l2684_c3_6b09_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2667_l2676_l2658_DUPLICATE_f1b1 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2667_l2676_l2658_DUPLICATE_f1b1_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2667_l2676_l2658_DUPLICATE_f1b1_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2667_l2676_l2658_DUPLICATE_f1b1_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2667_l2676_l2658_DUPLICATE_f1b1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2705_c7_a2d2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_a2d2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_a2d2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_a2d2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_a2d2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_a2d2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_a2d2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_a2d2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_a2d2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2683_c7_0774] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_0774_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_0774_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_0774_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_0774_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2695_c21_37ec] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2695_c21_37ec_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2695_c31_3562_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2705_c7_a2d2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_a2d2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_a2d2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_a2d2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_a2d2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_a2d2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_a2d2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_a2d2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_a2d2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2687_c21_2b80] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2687_c21_2b80_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2687_c31_e495_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2671_c3_273a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2671_c3_273a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2671_c3_273a_left;
     BIN_OP_OR_uxn_opcodes_h_l2671_c3_273a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2671_c3_273a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2671_c3_273a_return_output := BIN_OP_OR_uxn_opcodes_h_l2671_c3_273a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2662_c3_146f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2662_c3_146f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2662_c3_146f_left;
     BIN_OP_OR_uxn_opcodes_h_l2662_c3_146f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2662_c3_146f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2662_c3_146f_return_output := BIN_OP_OR_uxn_opcodes_h_l2662_c3_146f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2703_c21_ee72] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2703_c21_ee72_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2703_c31_229d_return_output);

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2662_c3_146f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2671_c3_273a_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2684_c3_6b09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2687_c21_2b80_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_f746_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2695_c21_37ec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_55b6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2703_c21_ee72_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2667_l2676_l2658_DUPLICATE_f1b1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2667_l2676_l2658_DUPLICATE_f1b1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2667_l2676_l2658_DUPLICATE_f1b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_55b6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_a2d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_55b6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_a2d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_0774_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_ba21_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_55b6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2701_c7_55b6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_55b6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_55b6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_55b6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_55b6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_55b6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_55b6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_55b6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_55b6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2701_c7_55b6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_55b6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_55b6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_55b6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_55b6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_55b6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_55b6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_55b6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_55b6_return_output;

     -- l16_MUX[uxn_opcodes_h_l2683_c7_0774] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2683_c7_0774_cond <= VAR_l16_MUX_uxn_opcodes_h_l2683_c7_0774_cond;
     l16_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue;
     l16_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2683_c7_0774_return_output := l16_MUX_uxn_opcodes_h_l2683_c7_0774_return_output;

     -- n16_MUX[uxn_opcodes_h_l2670_c7_a0e4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond;
     n16_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue;
     n16_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output := n16_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output;

     -- t16_MUX[uxn_opcodes_h_l2661_c7_e3f6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond;
     t16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue;
     t16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output := t16_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2674_c7_1de1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1de1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1de1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2701_c7_55b6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2701_c7_55b6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_55b6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2701_c7_55b6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_55b6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2701_c7_55b6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_55b6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_55b6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2701_c7_55b6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2697_c7_ba21] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_ba21_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_ba21_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_ba21_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_ba21_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_ba21_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_ba21_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_ba21_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_ba21_return_output;

     -- Submodule level 3
     VAR_l16_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2683_c7_0774_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_ba21_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_55b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_ba21_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_55b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_f746_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_ba21_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2697_c7_ba21_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_55b6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2670_c7_a0e4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output;

     -- l16_MUX[uxn_opcodes_h_l2674_c7_1de1] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2674_c7_1de1_cond <= VAR_l16_MUX_uxn_opcodes_h_l2674_c7_1de1_cond;
     l16_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue;
     l16_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output := l16_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2693_c7_f746] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_f746_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_f746_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_f746_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_f746_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_f746_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_f746_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_f746_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_f746_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2697_c7_ba21] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2697_c7_ba21_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2697_c7_ba21_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2697_c7_ba21_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2697_c7_ba21_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2697_c7_ba21_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2697_c7_ba21_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2697_c7_ba21_return_output := result_u8_value_MUX_uxn_opcodes_h_l2697_c7_ba21_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2697_c7_ba21] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_ba21_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_ba21_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_ba21_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_ba21_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_ba21_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_ba21_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_ba21_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_ba21_return_output;

     -- t16_MUX[uxn_opcodes_h_l2656_c7_51fc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2656_c7_51fc_cond <= VAR_t16_MUX_uxn_opcodes_h_l2656_c7_51fc_cond;
     t16_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue;
     t16_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output := t16_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output;

     -- n16_MUX[uxn_opcodes_h_l2665_c7_d4aa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond <= VAR_n16_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond;
     n16_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue;
     n16_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output := n16_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2697_c7_ba21] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_ba21_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_ba21_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_ba21_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_ba21_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_ba21_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_ba21_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_ba21_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_ba21_return_output;

     -- Submodule level 4
     VAR_l16_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_f746_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_ba21_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_f746_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_ba21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_4d5c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_f746_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_f746_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2697_c7_ba21_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2689_c7_4d5c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_4d5c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_4d5c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_4d5c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_4d5c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_4d5c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_4d5c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_4d5c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_4d5c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2653_c7_a6f8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond <= VAR_t16_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond;
     t16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue;
     t16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output := t16_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output;

     -- l16_MUX[uxn_opcodes_h_l2670_c7_a0e4] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond <= VAR_l16_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond;
     l16_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue;
     l16_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output := l16_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2693_c7_f746] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2693_c7_f746_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_f746_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2693_c7_f746_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_f746_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2693_c7_f746_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_f746_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_f746_return_output := result_u8_value_MUX_uxn_opcodes_h_l2693_c7_f746_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2693_c7_f746] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_f746_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_f746_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_f746_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_f746_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_f746_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_f746_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_f746_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_f746_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2665_c7_d4aa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2693_c7_f746] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_f746_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_f746_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_f746_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_f746_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_f746_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_f746_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_f746_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_f746_return_output;

     -- n16_MUX[uxn_opcodes_h_l2661_c7_e3f6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond;
     n16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue;
     n16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output := n16_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output;

     -- Submodule level 5
     VAR_l16_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_4d5c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_f746_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_4d5c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_f746_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_4d5c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_4d5c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_f746_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output;
     -- l16_MUX[uxn_opcodes_h_l2665_c7_d4aa] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond <= VAR_l16_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond;
     l16_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue;
     l16_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output := l16_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2689_c7_4d5c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_4d5c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_4d5c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_4d5c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_4d5c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_4d5c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_4d5c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_4d5c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_4d5c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2661_c7_e3f6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output;

     -- t16_MUX[uxn_opcodes_h_l2646_c2_cf29] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2646_c2_cf29_cond <= VAR_t16_MUX_uxn_opcodes_h_l2646_c2_cf29_cond;
     t16_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue;
     t16_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output := t16_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2683_c7_0774] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_0774_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_0774_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_0774_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_0774_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2689_c7_4d5c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_4d5c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_4d5c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_4d5c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_4d5c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_4d5c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_4d5c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_4d5c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_4d5c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2656_c7_51fc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2656_c7_51fc_cond <= VAR_n16_MUX_uxn_opcodes_h_l2656_c7_51fc_cond;
     n16_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue;
     n16_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output := n16_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2689_c7_4d5c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2689_c7_4d5c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_4d5c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2689_c7_4d5c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_4d5c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2689_c7_4d5c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_4d5c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_4d5c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2689_c7_4d5c_return_output;

     -- Submodule level 6
     VAR_l16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_4d5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_4d5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_0774_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_4d5c_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2683_c7_0774] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_0774_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_0774_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_0774_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_0774_return_output;

     -- l16_MUX[uxn_opcodes_h_l2661_c7_e3f6] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond <= VAR_l16_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond;
     l16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue;
     l16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output := l16_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2653_c7_a6f8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond;
     n16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue;
     n16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output := n16_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2683_c7_0774] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_0774_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_0774_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_0774_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_0774_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2683_c7_0774] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2683_c7_0774_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2683_c7_0774_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2683_c7_0774_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2683_c7_0774_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2683_c7_0774_return_output := result_u8_value_MUX_uxn_opcodes_h_l2683_c7_0774_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2656_c7_51fc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_51fc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_51fc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2674_c7_1de1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1de1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1de1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output;

     -- Submodule level 7
     VAR_l16_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_0774_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_0774_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2683_c7_0774_return_output;
     -- l16_MUX[uxn_opcodes_h_l2656_c7_51fc] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2656_c7_51fc_cond <= VAR_l16_MUX_uxn_opcodes_h_l2656_c7_51fc_cond;
     l16_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue;
     l16_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output := l16_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2674_c7_1de1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1de1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1de1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2674_c7_1de1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1de1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1de1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2653_c7_a6f8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2646_c2_cf29] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2646_c2_cf29_cond <= VAR_n16_MUX_uxn_opcodes_h_l2646_c2_cf29_cond;
     n16_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue;
     n16_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output := n16_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2670_c7_a0e4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2674_c7_1de1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1de1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1de1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1de1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1de1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output;

     -- Submodule level 8
     VAR_l16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output;
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1de1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2670_c7_a0e4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output;

     -- l16_MUX[uxn_opcodes_h_l2653_c7_a6f8] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond <= VAR_l16_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond;
     l16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue;
     l16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output := l16_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2646_c2_cf29] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c2_cf29_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c2_cf29_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2665_c7_d4aa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2670_c7_a0e4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2670_c7_a0e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_a0e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_a0e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_a0e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output;

     -- Submodule level 9
     VAR_l16_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2670_c7_a0e4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2665_c7_d4aa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2665_c7_d4aa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output := result_u8_value_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2665_c7_d4aa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_d4aa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_d4aa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_d4aa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2661_c7_e3f6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output;

     -- l16_MUX[uxn_opcodes_h_l2646_c2_cf29] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2646_c2_cf29_cond <= VAR_l16_MUX_uxn_opcodes_h_l2646_c2_cf29_cond;
     l16_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue;
     l16_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output := l16_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output;

     -- Submodule level 10
     REG_VAR_l16 := VAR_l16_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_d4aa_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2661_c7_e3f6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2656_c7_51fc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_51fc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_51fc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2661_c7_e3f6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2661_c7_e3f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_e3f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_e3f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_e3f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_e3f6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2656_c7_51fc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2656_c7_51fc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2656_c7_51fc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2653_c7_a6f8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2656_c7_51fc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_51fc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_51fc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2656_c7_51fc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_51fc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_51fc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_51fc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_51fc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2656_c7_51fc_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2646_c2_cf29] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c2_cf29_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c2_cf29_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2653_c7_a6f8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2653_c7_a6f8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2653_c7_a6f8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_a6f8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_a6f8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_a6f8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c7_a6f8_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2646_c2_cf29] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2646_c2_cf29_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2646_c2_cf29_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output := result_u8_value_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2646_c2_cf29] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2646_c2_cf29_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c2_cf29_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2646_c2_cf29] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2646_c2_cf29_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c2_cf29_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c2_cf29_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c2_cf29_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output;

     -- Submodule level 14
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2710_l2642_DUPLICATE_1623 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2710_l2642_DUPLICATE_1623_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_eae7(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c2_cf29_return_output);

     -- Submodule level 15
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2710_l2642_DUPLICATE_1623_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2710_l2642_DUPLICATE_1623_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_l16 <= REG_VAR_l16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     l16 <= REG_COMB_l16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
