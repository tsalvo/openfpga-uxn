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
-- Submodules: 80
entity ldz2_0CLK_188cbc69 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldz2_0CLK_188cbc69;
architecture arch of ldz2_0CLK_188cbc69 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1558_c6_97bb]
signal BIN_OP_EQ_uxn_opcodes_h_l1558_c6_97bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1558_c6_97bb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1558_c6_97bb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1558_c2_f2cc]
signal tmp16_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1558_c2_f2cc]
signal t8_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1558_c2_f2cc]
signal result_u16_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1558_c2_f2cc]
signal result_u8_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1558_c2_f2cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1558_c2_f2cc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1558_c2_f2cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1558_c2_f2cc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1558_c2_f2cc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1563_c11_67b7]
signal BIN_OP_EQ_uxn_opcodes_h_l1563_c11_67b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1563_c11_67b7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1563_c11_67b7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1563_c7_d60e]
signal tmp16_MUX_uxn_opcodes_h_l1563_c7_d60e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1563_c7_d60e]
signal t8_MUX_uxn_opcodes_h_l1563_c7_d60e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1563_c7_d60e]
signal result_u16_value_MUX_uxn_opcodes_h_l1563_c7_d60e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1563_c7_d60e]
signal result_u8_value_MUX_uxn_opcodes_h_l1563_c7_d60e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1563_c7_d60e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_d60e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1563_c7_d60e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_d60e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1563_c7_d60e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_d60e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1563_c7_d60e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1563_c7_d60e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1566_c11_f70c]
signal BIN_OP_EQ_uxn_opcodes_h_l1566_c11_f70c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1566_c11_f70c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1566_c11_f70c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1566_c7_71fc]
signal tmp16_MUX_uxn_opcodes_h_l1566_c7_71fc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1566_c7_71fc]
signal t8_MUX_uxn_opcodes_h_l1566_c7_71fc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1566_c7_71fc]
signal result_u16_value_MUX_uxn_opcodes_h_l1566_c7_71fc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1566_c7_71fc]
signal result_u8_value_MUX_uxn_opcodes_h_l1566_c7_71fc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1566_c7_71fc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_71fc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1566_c7_71fc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_71fc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1566_c7_71fc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_71fc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1566_c7_71fc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1566_c7_71fc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1569_c30_5050]
signal sp_relative_shift_uxn_opcodes_h_l1569_c30_5050_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1569_c30_5050_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1569_c30_5050_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1569_c30_5050_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1572_c11_ce72]
signal BIN_OP_EQ_uxn_opcodes_h_l1572_c11_ce72_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1572_c11_ce72_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1572_c11_ce72_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1572_c7_9819]
signal tmp16_MUX_uxn_opcodes_h_l1572_c7_9819_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1572_c7_9819_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1572_c7_9819]
signal result_u16_value_MUX_uxn_opcodes_h_l1572_c7_9819_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1572_c7_9819_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1572_c7_9819]
signal result_u8_value_MUX_uxn_opcodes_h_l1572_c7_9819_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1572_c7_9819_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1572_c7_9819]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c7_9819_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c7_9819_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1572_c7_9819]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1572_c7_9819_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1572_c7_9819_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1572_c7_9819]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1572_c7_9819_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1572_c7_9819_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1572_c7_9819]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c7_9819_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c7_9819_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1576_c11_d4a1]
signal BIN_OP_EQ_uxn_opcodes_h_l1576_c11_d4a1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1576_c11_d4a1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1576_c11_d4a1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1576_c7_2779]
signal tmp16_MUX_uxn_opcodes_h_l1576_c7_2779_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1576_c7_2779_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1576_c7_2779]
signal result_u16_value_MUX_uxn_opcodes_h_l1576_c7_2779_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1576_c7_2779_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1576_c7_2779]
signal result_u8_value_MUX_uxn_opcodes_h_l1576_c7_2779_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1576_c7_2779_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1576_c7_2779]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_2779_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_2779_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1576_c7_2779]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_2779_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_2779_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1576_c7_2779]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_2779_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_2779_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1578_c3_b626]
signal CONST_SL_8_uxn_opcodes_h_l1578_c3_b626_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1578_c3_b626_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1579_c33_d8e3]
signal BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_d8e3_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_d8e3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_d8e3_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1581_c11_0198]
signal BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0198_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0198_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0198_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1581_c7_e7a9]
signal tmp16_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1581_c7_e7a9]
signal result_u16_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1581_c7_e7a9]
signal result_u8_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1581_c7_e7a9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1581_c7_e7a9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1581_c7_e7a9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1582_c33_7b59]
signal BIN_OP_PLUS_uxn_opcodes_h_l1582_c33_7b59_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1582_c33_7b59_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1582_c33_7b59_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1584_c11_a59a]
signal BIN_OP_EQ_uxn_opcodes_h_l1584_c11_a59a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1584_c11_a59a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1584_c11_a59a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1584_c7_b536]
signal tmp16_MUX_uxn_opcodes_h_l1584_c7_b536_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1584_c7_b536_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1584_c7_b536]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_b536_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_b536_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1584_c7_b536]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_b536_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_b536_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1584_c7_b536]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_b536_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_b536_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1584_c7_b536]
signal result_u8_value_MUX_uxn_opcodes_h_l1584_c7_b536_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1584_c7_b536_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1585_c3_c7d3]
signal BIN_OP_OR_uxn_opcodes_h_l1585_c3_c7d3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1585_c3_c7d3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1585_c3_c7d3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1590_c11_a752]
signal BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a752_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a752_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a752_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1590_c7_8001]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_8001_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_8001_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_8001_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_8001_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1590_c7_8001]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_8001_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_8001_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_8001_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_8001_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1590_c7_8001]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_8001_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_8001_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_8001_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_8001_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1590_c7_8001]
signal result_u8_value_MUX_uxn_opcodes_h_l1590_c7_8001_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1590_c7_8001_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1590_c7_8001_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1590_c7_8001_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1592_c31_fde4]
signal CONST_SR_8_uxn_opcodes_h_l1592_c31_fde4_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1592_c31_fde4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1594_c11_df01]
signal BIN_OP_EQ_uxn_opcodes_h_l1594_c11_df01_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1594_c11_df01_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1594_c11_df01_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1594_c7_72b9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_72b9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_72b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_72b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_72b9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1594_c7_72b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_72b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_72b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_72b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_72b9_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint9_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(8 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_9dc9( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_sp_shift := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1558_c6_97bb
BIN_OP_EQ_uxn_opcodes_h_l1558_c6_97bb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1558_c6_97bb_left,
BIN_OP_EQ_uxn_opcodes_h_l1558_c6_97bb_right,
BIN_OP_EQ_uxn_opcodes_h_l1558_c6_97bb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1558_c2_f2cc
tmp16_MUX_uxn_opcodes_h_l1558_c2_f2cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond,
tmp16_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue,
tmp16_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse,
tmp16_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output);

-- t8_MUX_uxn_opcodes_h_l1558_c2_f2cc
t8_MUX_uxn_opcodes_h_l1558_c2_f2cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond,
t8_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue,
t8_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse,
t8_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1558_c2_f2cc
result_u16_value_MUX_uxn_opcodes_h_l1558_c2_f2cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond,
result_u16_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1558_c2_f2cc
result_u8_value_MUX_uxn_opcodes_h_l1558_c2_f2cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_f2cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_f2cc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_f2cc
result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_f2cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_f2cc
result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_f2cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc
result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1563_c11_67b7
BIN_OP_EQ_uxn_opcodes_h_l1563_c11_67b7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1563_c11_67b7_left,
BIN_OP_EQ_uxn_opcodes_h_l1563_c11_67b7_right,
BIN_OP_EQ_uxn_opcodes_h_l1563_c11_67b7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1563_c7_d60e
tmp16_MUX_uxn_opcodes_h_l1563_c7_d60e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1563_c7_d60e_cond,
tmp16_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output);

-- t8_MUX_uxn_opcodes_h_l1563_c7_d60e
t8_MUX_uxn_opcodes_h_l1563_c7_d60e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1563_c7_d60e_cond,
t8_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue,
t8_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse,
t8_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1563_c7_d60e
result_u16_value_MUX_uxn_opcodes_h_l1563_c7_d60e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1563_c7_d60e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1563_c7_d60e
result_u8_value_MUX_uxn_opcodes_h_l1563_c7_d60e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1563_c7_d60e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_d60e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_d60e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_d60e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_d60e
result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_d60e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_d60e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_d60e
result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_d60e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_d60e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_d60e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_d60e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_d60e
result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_d60e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1566_c11_f70c
BIN_OP_EQ_uxn_opcodes_h_l1566_c11_f70c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1566_c11_f70c_left,
BIN_OP_EQ_uxn_opcodes_h_l1566_c11_f70c_right,
BIN_OP_EQ_uxn_opcodes_h_l1566_c11_f70c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1566_c7_71fc
tmp16_MUX_uxn_opcodes_h_l1566_c7_71fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1566_c7_71fc_cond,
tmp16_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue,
tmp16_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse,
tmp16_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output);

-- t8_MUX_uxn_opcodes_h_l1566_c7_71fc
t8_MUX_uxn_opcodes_h_l1566_c7_71fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1566_c7_71fc_cond,
t8_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue,
t8_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse,
t8_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1566_c7_71fc
result_u16_value_MUX_uxn_opcodes_h_l1566_c7_71fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1566_c7_71fc_cond,
result_u16_value_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1566_c7_71fc
result_u8_value_MUX_uxn_opcodes_h_l1566_c7_71fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1566_c7_71fc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_71fc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_71fc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_71fc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_71fc
result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_71fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_71fc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_71fc
result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_71fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_71fc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_71fc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_71fc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_71fc
result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_71fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1569_c30_5050
sp_relative_shift_uxn_opcodes_h_l1569_c30_5050 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1569_c30_5050_ins,
sp_relative_shift_uxn_opcodes_h_l1569_c30_5050_x,
sp_relative_shift_uxn_opcodes_h_l1569_c30_5050_y,
sp_relative_shift_uxn_opcodes_h_l1569_c30_5050_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1572_c11_ce72
BIN_OP_EQ_uxn_opcodes_h_l1572_c11_ce72 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1572_c11_ce72_left,
BIN_OP_EQ_uxn_opcodes_h_l1572_c11_ce72_right,
BIN_OP_EQ_uxn_opcodes_h_l1572_c11_ce72_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1572_c7_9819
tmp16_MUX_uxn_opcodes_h_l1572_c7_9819 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1572_c7_9819_cond,
tmp16_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue,
tmp16_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse,
tmp16_MUX_uxn_opcodes_h_l1572_c7_9819_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1572_c7_9819
result_u16_value_MUX_uxn_opcodes_h_l1572_c7_9819 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1572_c7_9819_cond,
result_u16_value_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1572_c7_9819_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1572_c7_9819
result_u8_value_MUX_uxn_opcodes_h_l1572_c7_9819 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1572_c7_9819_cond,
result_u8_value_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1572_c7_9819_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c7_9819
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c7_9819 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c7_9819_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c7_9819_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1572_c7_9819
result_is_stack_write_MUX_uxn_opcodes_h_l1572_c7_9819 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1572_c7_9819_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1572_c7_9819_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1572_c7_9819
result_is_opc_done_MUX_uxn_opcodes_h_l1572_c7_9819 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1572_c7_9819_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1572_c7_9819_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c7_9819
result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c7_9819 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c7_9819_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c7_9819_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1576_c11_d4a1
BIN_OP_EQ_uxn_opcodes_h_l1576_c11_d4a1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1576_c11_d4a1_left,
BIN_OP_EQ_uxn_opcodes_h_l1576_c11_d4a1_right,
BIN_OP_EQ_uxn_opcodes_h_l1576_c11_d4a1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1576_c7_2779
tmp16_MUX_uxn_opcodes_h_l1576_c7_2779 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1576_c7_2779_cond,
tmp16_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue,
tmp16_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse,
tmp16_MUX_uxn_opcodes_h_l1576_c7_2779_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1576_c7_2779
result_u16_value_MUX_uxn_opcodes_h_l1576_c7_2779 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1576_c7_2779_cond,
result_u16_value_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1576_c7_2779_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1576_c7_2779
result_u8_value_MUX_uxn_opcodes_h_l1576_c7_2779 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1576_c7_2779_cond,
result_u8_value_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1576_c7_2779_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_2779
result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_2779 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_2779_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_2779_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_2779
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_2779 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_2779_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_2779_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_2779
result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_2779 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_2779_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_2779_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1578_c3_b626
CONST_SL_8_uxn_opcodes_h_l1578_c3_b626 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1578_c3_b626_x,
CONST_SL_8_uxn_opcodes_h_l1578_c3_b626_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_d8e3
BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_d8e3 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_d8e3_left,
BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_d8e3_right,
BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_d8e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0198
BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0198 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0198_left,
BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0198_right,
BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0198_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1581_c7_e7a9
tmp16_MUX_uxn_opcodes_h_l1581_c7_e7a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond,
tmp16_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue,
tmp16_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse,
tmp16_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1581_c7_e7a9
result_u16_value_MUX_uxn_opcodes_h_l1581_c7_e7a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond,
result_u16_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1581_c7_e7a9
result_u8_value_MUX_uxn_opcodes_h_l1581_c7_e7a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_e7a9
result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_e7a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_e7a9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_e7a9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_e7a9
result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_e7a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1582_c33_7b59
BIN_OP_PLUS_uxn_opcodes_h_l1582_c33_7b59 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1582_c33_7b59_left,
BIN_OP_PLUS_uxn_opcodes_h_l1582_c33_7b59_right,
BIN_OP_PLUS_uxn_opcodes_h_l1582_c33_7b59_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1584_c11_a59a
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_a59a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_a59a_left,
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_a59a_right,
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_a59a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1584_c7_b536
tmp16_MUX_uxn_opcodes_h_l1584_c7_b536 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1584_c7_b536_cond,
tmp16_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue,
tmp16_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse,
tmp16_MUX_uxn_opcodes_h_l1584_c7_b536_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_b536
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_b536 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_b536_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_b536_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_b536
result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_b536 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_b536_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_b536_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_b536
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_b536 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_b536_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_b536_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1584_c7_b536
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_b536 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_b536_cond,
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_b536_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1585_c3_c7d3
BIN_OP_OR_uxn_opcodes_h_l1585_c3_c7d3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1585_c3_c7d3_left,
BIN_OP_OR_uxn_opcodes_h_l1585_c3_c7d3_right,
BIN_OP_OR_uxn_opcodes_h_l1585_c3_c7d3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a752
BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a752 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a752_left,
BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a752_right,
BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a752_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_8001
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_8001 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_8001_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_8001_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_8001_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_8001_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_8001
result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_8001 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_8001_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_8001_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_8001_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_8001_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_8001
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_8001 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_8001_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_8001_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_8001_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_8001_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1590_c7_8001
result_u8_value_MUX_uxn_opcodes_h_l1590_c7_8001 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1590_c7_8001_cond,
result_u8_value_MUX_uxn_opcodes_h_l1590_c7_8001_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1590_c7_8001_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1590_c7_8001_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1592_c31_fde4
CONST_SR_8_uxn_opcodes_h_l1592_c31_fde4 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1592_c31_fde4_x,
CONST_SR_8_uxn_opcodes_h_l1592_c31_fde4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1594_c11_df01
BIN_OP_EQ_uxn_opcodes_h_l1594_c11_df01 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1594_c11_df01_left,
BIN_OP_EQ_uxn_opcodes_h_l1594_c11_df01_right,
BIN_OP_EQ_uxn_opcodes_h_l1594_c11_df01_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_72b9
result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_72b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_72b9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_72b9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_72b9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_72b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_72b9
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_72b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_72b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_72b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_72b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_72b9_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1558_c6_97bb_return_output,
 tmp16_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output,
 t8_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1563_c11_67b7_return_output,
 tmp16_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output,
 t8_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1566_c11_f70c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output,
 t8_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output,
 sp_relative_shift_uxn_opcodes_h_l1569_c30_5050_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1572_c11_ce72_return_output,
 tmp16_MUX_uxn_opcodes_h_l1572_c7_9819_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1572_c7_9819_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1572_c7_9819_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c7_9819_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1572_c7_9819_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1572_c7_9819_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c7_9819_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1576_c11_d4a1_return_output,
 tmp16_MUX_uxn_opcodes_h_l1576_c7_2779_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1576_c7_2779_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1576_c7_2779_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_2779_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_2779_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_2779_return_output,
 CONST_SL_8_uxn_opcodes_h_l1578_c3_b626_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_d8e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0198_return_output,
 tmp16_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1582_c33_7b59_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1584_c11_a59a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1584_c7_b536_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_b536_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_b536_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_b536_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1584_c7_b536_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1585_c3_c7d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a752_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_8001_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_8001_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_8001_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1590_c7_8001_return_output,
 CONST_SR_8_uxn_opcodes_h_l1592_c31_fde4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1594_c11_df01_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_72b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_72b9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_97bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_97bb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_97bb_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1560_c3_9176 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_67b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_67b7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_67b7_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_d60e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1563_c7_d60e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_d60e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_d60e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1564_c3_657b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_d60e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_d60e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_d60e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_f70c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_f70c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_f70c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1572_c7_9819_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_71fc_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1566_c7_71fc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1572_c7_9819_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1566_c7_71fc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1572_c7_9819_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1566_c7_71fc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c7_9819_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_71fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1572_c7_9819_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_71fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1572_c7_9819_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_71fc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c7_9819_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1569_c30_5050_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1569_c30_5050_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1569_c30_5050_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1569_c30_5050_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1570_c22_20f0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c11_ce72_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c11_ce72_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c11_ce72_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1576_c7_2779_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1572_c7_9819_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1576_c7_2779_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1572_c7_9819_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1576_c7_2779_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1572_c7_9819_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_2779_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c7_9819_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_2779_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1572_c7_9819_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_2779_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1572_c7_9819_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c7_9819_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1574_c22_1c3d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_d4a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_d4a1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_d4a1_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1576_c7_2779_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1576_c7_2779_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1576_c7_2779_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_2779_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_2779_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_2779_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1578_c3_b626_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1578_c3_b626_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_d8e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_d8e3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_d8e3_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1579_c22_0651_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0198_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0198_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0198_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1584_c7_b536_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_b536_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_b536_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_b536_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_b536_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1582_c33_7b59_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1582_c33_7b59_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1582_c33_7b59_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1582_c22_6e60_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_a59a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_a59a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_a59a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1584_c7_b536_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1587_c3_a7da : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_8001_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_b536_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_8001_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_b536_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_8001_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_b536_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1590_c7_8001_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_b536_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1585_c3_c7d3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1585_c3_c7d3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1585_c3_c7d3_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1588_c21_f32a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a752_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a752_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a752_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_8001_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1591_c3_0ef2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_8001_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_8001_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_8001_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_8001_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_72b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_8001_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_8001_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_8001_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_72b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_8001_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1590_c7_8001_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1590_c7_8001_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1590_c7_8001_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1592_c31_fde4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1592_c31_fde4_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1592_c21_bb69_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_df01_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_df01_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_df01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_72b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_72b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_72b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_72b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_72b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_72b9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1563_l1581_l1558_DUPLICATE_3b8a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1566_l1563_l1590_l1558_l1581_l1576_l1572_DUPLICATE_9ee0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1566_l1594_l1563_l1590_l1558_l1581_l1576_l1572_DUPLICATE_5bfd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1563_l1566_l1558_DUPLICATE_f2cc_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1563_l1558_l1572_DUPLICATE_c9c6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1566_l1594_l1563_l1590_l1584_l1581_l1576_l1572_DUPLICATE_082c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1566_l1590_l1581_l1576_l1572_DUPLICATE_32a7_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1585_l1577_DUPLICATE_89ad_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9dc9_uxn_opcodes_h_l1599_l1553_DUPLICATE_4e7d_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_72b9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_a59a_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_df01_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c11_ce72_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1560_c3_9176 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1560_c3_9176;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_d8e3_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1564_c3_657b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1564_c3_657b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_d4a1_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_97bb_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1582_c33_7b59_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_67b7_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1569_c30_5050_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1587_c3_a7da := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1587_c3_a7da;
     VAR_sp_relative_shift_uxn_opcodes_h_l1569_c30_5050_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_72b9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_f70c_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1591_c3_0ef2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_8001_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1591_c3_0ef2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a752_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0198_right := to_unsigned(5, 3);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1569_c30_5050_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_97bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_67b7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_f70c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c11_ce72_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_d4a1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0198_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_a59a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a752_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_df01_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_d8e3_left := t8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1582_c33_7b59_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1585_c3_c7d3_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1592_c31_fde4_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse := tmp16;
     -- CAST_TO_uint16_t[uxn_opcodes_h_l1574_c22_1c3d] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1574_c22_1c3d_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1576_c11_d4a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1576_c11_d4a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_d4a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1576_c11_d4a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_d4a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_d4a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1576_c11_d4a1_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1592_c31_fde4] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1592_c31_fde4_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1592_c31_fde4_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1592_c31_fde4_return_output := CONST_SR_8_uxn_opcodes_h_l1592_c31_fde4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1590_c11_a752] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a752_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a752_left;
     BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a752_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a752_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a752_return_output := BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a752_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1572_c11_ce72] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1572_c11_ce72_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c11_ce72_left;
     BIN_OP_EQ_uxn_opcodes_h_l1572_c11_ce72_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c11_ce72_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c11_ce72_return_output := BIN_OP_EQ_uxn_opcodes_h_l1572_c11_ce72_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1566_l1594_l1563_l1590_l1584_l1581_l1576_l1572_DUPLICATE_082c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1566_l1594_l1563_l1590_l1584_l1581_l1576_l1572_DUPLICATE_082c_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1582_c33_7b59] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1582_c33_7b59_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1582_c33_7b59_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1582_c33_7b59_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1582_c33_7b59_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1582_c33_7b59_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1582_c33_7b59_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1585_l1577_DUPLICATE_89ad LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1585_l1577_DUPLICATE_89ad_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1563_l1566_l1558_DUPLICATE_f2cc LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1563_l1566_l1558_DUPLICATE_f2cc_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1594_c11_df01] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1594_c11_df01_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_df01_left;
     BIN_OP_EQ_uxn_opcodes_h_l1594_c11_df01_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_df01_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_df01_return_output := BIN_OP_EQ_uxn_opcodes_h_l1594_c11_df01_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1563_l1558_l1572_DUPLICATE_c9c6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1563_l1558_l1572_DUPLICATE_c9c6_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1584_c11_a59a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1584_c11_a59a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_a59a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1584_c11_a59a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_a59a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_a59a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1584_c11_a59a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1566_l1563_l1590_l1558_l1581_l1576_l1572_DUPLICATE_9ee0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1566_l1563_l1590_l1558_l1581_l1576_l1572_DUPLICATE_9ee0_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1558_c6_97bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1558_c6_97bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_97bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1558_c6_97bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_97bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_97bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1558_c6_97bb_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1569_c30_5050] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1569_c30_5050_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1569_c30_5050_ins;
     sp_relative_shift_uxn_opcodes_h_l1569_c30_5050_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1569_c30_5050_x;
     sp_relative_shift_uxn_opcodes_h_l1569_c30_5050_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1569_c30_5050_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1569_c30_5050_return_output := sp_relative_shift_uxn_opcodes_h_l1569_c30_5050_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1566_l1590_l1581_l1576_l1572_DUPLICATE_32a7 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1566_l1590_l1581_l1576_l1572_DUPLICATE_32a7_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1566_l1594_l1563_l1590_l1558_l1581_l1576_l1572_DUPLICATE_5bfd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1566_l1594_l1563_l1590_l1558_l1581_l1576_l1572_DUPLICATE_5bfd_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1563_c11_67b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1563_c11_67b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_67b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1563_c11_67b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_67b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_67b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1563_c11_67b7_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1570_c22_20f0] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1570_c22_20f0_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1563_l1581_l1558_DUPLICATE_3b8a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1563_l1581_l1558_DUPLICATE_3b8a_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1581_c11_0198] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0198_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0198_left;
     BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0198_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0198_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0198_return_output := BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0198_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1566_c11_f70c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1566_c11_f70c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_f70c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1566_c11_f70c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_f70c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_f70c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1566_c11_f70c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1579_c33_d8e3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_d8e3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_d8e3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_d8e3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_d8e3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_d8e3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_d8e3_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_97bb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_97bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_97bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_97bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_97bb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_97bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_97bb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_97bb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_97bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_d60e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_67b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_67b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_d60e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_67b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_67b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_d60e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_67b7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_d60e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_67b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_d60e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_67b7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1563_c7_d60e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_67b7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_d60e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_67b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_71fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_f70c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_f70c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_71fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_f70c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_f70c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_71fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_f70c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1566_c7_71fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_f70c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1566_c7_71fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_f70c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1566_c7_71fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_f70c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_71fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_f70c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1572_c7_9819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c11_ce72_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c7_9819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c11_ce72_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1572_c7_9819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c11_ce72_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c7_9819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c11_ce72_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1572_c7_9819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c11_ce72_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1572_c7_9819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c11_ce72_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1572_c7_9819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1572_c11_ce72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_2779_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_d4a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_2779_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_d4a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_2779_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_d4a1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1576_c7_2779_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_d4a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1576_c7_2779_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_d4a1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1576_c7_2779_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_d4a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0198_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0198_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0198_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0198_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0198_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c11_0198_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_b536_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_a59a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_b536_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_a59a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_b536_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_a59a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_b536_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_a59a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1584_c7_b536_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_a59a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_8001_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a752_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_8001_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a752_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_8001_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a752_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1590_c7_8001_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a752_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_72b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_df01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_72b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_df01_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1570_c22_20f0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1574_c22_1c3d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1585_c3_c7d3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1585_l1577_DUPLICATE_89ad_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1578_c3_b626_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1585_l1577_DUPLICATE_89ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1563_l1566_l1558_DUPLICATE_f2cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1563_l1566_l1558_DUPLICATE_f2cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1563_l1566_l1558_DUPLICATE_f2cc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1563_l1581_l1558_DUPLICATE_3b8a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1563_l1581_l1558_DUPLICATE_3b8a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1563_l1581_l1558_DUPLICATE_3b8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1566_l1594_l1563_l1590_l1584_l1581_l1576_l1572_DUPLICATE_082c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1566_l1594_l1563_l1590_l1584_l1581_l1576_l1572_DUPLICATE_082c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1566_l1594_l1563_l1590_l1584_l1581_l1576_l1572_DUPLICATE_082c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1566_l1594_l1563_l1590_l1584_l1581_l1576_l1572_DUPLICATE_082c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1566_l1594_l1563_l1590_l1584_l1581_l1576_l1572_DUPLICATE_082c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1566_l1594_l1563_l1590_l1584_l1581_l1576_l1572_DUPLICATE_082c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_8001_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1566_l1594_l1563_l1590_l1584_l1581_l1576_l1572_DUPLICATE_082c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_72b9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1566_l1594_l1563_l1590_l1584_l1581_l1576_l1572_DUPLICATE_082c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1563_l1558_l1572_DUPLICATE_c9c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1563_l1558_l1572_DUPLICATE_c9c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1563_l1558_l1572_DUPLICATE_c9c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1566_l1594_l1563_l1590_l1558_l1581_l1576_l1572_DUPLICATE_5bfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1566_l1594_l1563_l1590_l1558_l1581_l1576_l1572_DUPLICATE_5bfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1566_l1594_l1563_l1590_l1558_l1581_l1576_l1572_DUPLICATE_5bfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1566_l1594_l1563_l1590_l1558_l1581_l1576_l1572_DUPLICATE_5bfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1566_l1594_l1563_l1590_l1558_l1581_l1576_l1572_DUPLICATE_5bfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1566_l1594_l1563_l1590_l1558_l1581_l1576_l1572_DUPLICATE_5bfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_8001_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1566_l1594_l1563_l1590_l1558_l1581_l1576_l1572_DUPLICATE_5bfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_72b9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1566_l1594_l1563_l1590_l1558_l1581_l1576_l1572_DUPLICATE_5bfd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1566_l1590_l1581_l1576_l1572_DUPLICATE_32a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1566_l1590_l1581_l1576_l1572_DUPLICATE_32a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1566_l1590_l1581_l1576_l1572_DUPLICATE_32a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1566_l1590_l1581_l1576_l1572_DUPLICATE_32a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_8001_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1566_l1590_l1581_l1576_l1572_DUPLICATE_32a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1566_l1563_l1590_l1558_l1581_l1576_l1572_DUPLICATE_9ee0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1566_l1563_l1590_l1558_l1581_l1576_l1572_DUPLICATE_9ee0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1566_l1563_l1590_l1558_l1581_l1576_l1572_DUPLICATE_9ee0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1566_l1563_l1590_l1558_l1581_l1576_l1572_DUPLICATE_9ee0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1566_l1563_l1590_l1558_l1581_l1576_l1572_DUPLICATE_9ee0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1566_l1563_l1590_l1558_l1581_l1576_l1572_DUPLICATE_9ee0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1590_c7_8001_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1566_l1563_l1590_l1558_l1581_l1576_l1572_DUPLICATE_9ee0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1569_c30_5050_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1592_c21_bb69] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1592_c21_bb69_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1592_c31_fde4_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1594_c7_72b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_72b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_72b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_72b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_72b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_72b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_72b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_72b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_72b9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1566_c7_71fc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1578_c3_b626] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1578_c3_b626_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1578_c3_b626_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1578_c3_b626_return_output := CONST_SL_8_uxn_opcodes_h_l1578_c3_b626_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1594_c7_72b9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_72b9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_72b9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_72b9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_72b9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_72b9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_72b9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_72b9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_72b9_return_output;

     -- t8_MUX[uxn_opcodes_h_l1566_c7_71fc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1566_c7_71fc_cond <= VAR_t8_MUX_uxn_opcodes_h_l1566_c7_71fc_cond;
     t8_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue;
     t8_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output := t8_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1585_c3_c7d3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1585_c3_c7d3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1585_c3_c7d3_left;
     BIN_OP_OR_uxn_opcodes_h_l1585_c3_c7d3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1585_c3_c7d3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1585_c3_c7d3_return_output := BIN_OP_OR_uxn_opcodes_h_l1585_c3_c7d3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1572_c7_9819] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c7_9819_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c7_9819_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c7_9819_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c7_9819_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1582_c22_6e60] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1582_c22_6e60_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1582_c33_7b59_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1590_c7_8001] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_8001_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_8001_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_8001_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_8001_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_8001_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_8001_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_8001_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_8001_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1579_c22_0651] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1579_c22_0651_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c33_d8e3_return_output);

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1585_c3_c7d3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1579_c22_0651_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1582_c22_6e60_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1590_c7_8001_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1592_c21_bb69_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1578_c3_b626_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_8001_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_72b9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1572_c7_9819_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_8001_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_72b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_8001_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1566_c7_71fc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1584_c7_b536] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_b536_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_b536_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_b536_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_b536_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1590_c7_8001] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_8001_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_8001_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_8001_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_8001_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_8001_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_8001_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_8001_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_8001_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1584_c7_b536] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1584_c7_b536_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1584_c7_b536_cond;
     tmp16_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1584_c7_b536_return_output := tmp16_MUX_uxn_opcodes_h_l1584_c7_b536_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1563_c7_d60e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output;

     -- t8_MUX[uxn_opcodes_h_l1563_c7_d60e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1563_c7_d60e_cond <= VAR_t8_MUX_uxn_opcodes_h_l1563_c7_d60e_cond;
     t8_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue;
     t8_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output := t8_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1581_c7_e7a9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output := result_u16_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1590_c7_8001] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1590_c7_8001_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1590_c7_8001_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1590_c7_8001_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1590_c7_8001_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1590_c7_8001_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1590_c7_8001_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1590_c7_8001_return_output := result_u8_value_MUX_uxn_opcodes_h_l1590_c7_8001_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1588_c21_f32a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1588_c21_f32a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1585_c3_c7d3_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1590_c7_8001] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_8001_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_8001_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_8001_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_8001_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_8001_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_8001_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_8001_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_8001_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1588_c21_f32a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_8001_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_8001_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_b536_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1590_c7_8001_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1584_c7_b536_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1584_c7_b536] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_b536_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_b536_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_b536_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_b536_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1576_c7_2779] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1576_c7_2779_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1576_c7_2779_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1576_c7_2779_return_output := result_u16_value_MUX_uxn_opcodes_h_l1576_c7_2779_return_output;

     -- t8_MUX[uxn_opcodes_h_l1558_c2_f2cc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond <= VAR_t8_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond;
     t8_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue;
     t8_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output := t8_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1581_c7_e7a9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond;
     tmp16_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output := tmp16_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1563_c7_d60e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1558_c2_f2cc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1584_c7_b536] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1584_c7_b536_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_b536_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_b536_return_output := result_u8_value_MUX_uxn_opcodes_h_l1584_c7_b536_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1584_c7_b536] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_b536_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_b536_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_b536_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_b536_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_b536_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_b536_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1581_c7_e7a9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_b536_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_b536_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1576_c7_2779_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_b536_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1576_c7_2779] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1576_c7_2779_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1576_c7_2779_cond;
     tmp16_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1576_c7_2779_return_output := tmp16_MUX_uxn_opcodes_h_l1576_c7_2779_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1572_c7_9819] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1572_c7_9819_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1572_c7_9819_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1572_c7_9819_return_output := result_u16_value_MUX_uxn_opcodes_h_l1572_c7_9819_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1576_c7_2779] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_2779_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_2779_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_2779_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_2779_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1581_c7_e7a9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1558_c2_f2cc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1581_c7_e7a9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1581_c7_e7a9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_2779_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1572_c7_9819_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1581_c7_e7a9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1576_c7_2779_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1572_c7_9819] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c7_9819_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c7_9819_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c7_9819_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c7_9819_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1576_c7_2779] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_2779_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_2779_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_2779_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_2779_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1576_c7_2779] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1576_c7_2779_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1576_c7_2779_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1576_c7_2779_return_output := result_u8_value_MUX_uxn_opcodes_h_l1576_c7_2779_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1576_c7_2779] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_2779_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_2779_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_2779_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_2779_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_2779_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_2779_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1572_c7_9819] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1572_c7_9819_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1572_c7_9819_cond;
     tmp16_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1572_c7_9819_return_output := tmp16_MUX_uxn_opcodes_h_l1572_c7_9819_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1566_c7_71fc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1566_c7_71fc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1566_c7_71fc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output := result_u16_value_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_2779_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_2779_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1572_c7_9819_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1576_c7_2779_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1572_c7_9819_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1563_c7_d60e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1563_c7_d60e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_d60e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1572_c7_9819] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1572_c7_9819_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1572_c7_9819_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1572_c7_9819_return_output := result_u8_value_MUX_uxn_opcodes_h_l1572_c7_9819_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1572_c7_9819] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1572_c7_9819_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1572_c7_9819_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1572_c7_9819_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1572_c7_9819_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1572_c7_9819] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1572_c7_9819_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1572_c7_9819_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1572_c7_9819_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1572_c7_9819_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1572_c7_9819_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1572_c7_9819_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1566_c7_71fc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1566_c7_71fc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_71fc_cond;
     tmp16_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output := tmp16_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1566_c7_71fc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_71fc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_71fc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1572_c7_9819_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1572_c7_9819_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1572_c7_9819_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1563_c7_d60e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1563_c7_d60e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_d60e_cond;
     tmp16_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output := tmp16_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1566_c7_71fc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_71fc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_71fc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1566_c7_71fc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1566_c7_71fc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1566_c7_71fc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1566_c7_71fc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_71fc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_71fc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_71fc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_71fc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1563_c7_d60e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_d60e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_d60e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1558_c2_f2cc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output := result_u16_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1566_c7_71fc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1563_c7_d60e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_d60e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_d60e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1563_c7_d60e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1563_c7_d60e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_d60e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1558_c2_f2cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1563_c7_d60e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_d60e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_d60e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_d60e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_d60e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1558_c2_f2cc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond;
     tmp16_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output := tmp16_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1563_c7_d60e_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1558_c2_f2cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1558_c2_f2cc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1558_c2_f2cc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_f2cc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_f2cc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_f2cc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9dc9_uxn_opcodes_h_l1599_l1553_DUPLICATE_4e7d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9dc9_uxn_opcodes_h_l1599_l1553_DUPLICATE_4e7d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9dc9(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c2_f2cc_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9dc9_uxn_opcodes_h_l1599_l1553_DUPLICATE_4e7d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9dc9_uxn_opcodes_h_l1599_l1553_DUPLICATE_4e7d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
