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
-- Submodules: 68
entity lit2_0CLK_a45e5d62 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lit2_0CLK_a45e5d62;
architecture arch of lit2_0CLK_a45e5d62 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l225_c6_d190]
signal BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l225_c1_3d1f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l225_c1_3d1f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l225_c1_3d1f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l225_c1_3d1f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l225_c1_3d1f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l225_c2_bb02]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l225_c2_bb02_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l225_c2_bb02_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l225_c2_bb02]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l225_c2_bb02_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l225_c2_bb02_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l225_c2_bb02]
signal result_stack_value_MUX_uxn_opcodes_h_l225_c2_bb02_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l225_c2_bb02_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l225_c2_bb02]
signal result_ram_addr_MUX_uxn_opcodes_h_l225_c2_bb02_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l225_c2_bb02_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l225_c2_bb02]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l225_c2_bb02_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l225_c2_bb02_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l225_c2_bb02]
signal result_pc_MUX_uxn_opcodes_h_l225_c2_bb02_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l225_c2_bb02_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l225_c2_bb02]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l225_c2_bb02_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l225_c2_bb02_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l225_c2_bb02]
signal result_is_stack_write_MUX_uxn_opcodes_h_l225_c2_bb02_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l225_c2_bb02_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l225_c2_bb02]
signal result_is_opc_done_MUX_uxn_opcodes_h_l225_c2_bb02_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l225_c2_bb02_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l225_c2_bb02]
signal tmp16_MUX_uxn_opcodes_h_l225_c2_bb02_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l225_c2_bb02_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l226_c3_df72[uxn_opcodes_h_l226_c3_df72]
signal printf_uxn_opcodes_h_l226_c3_df72_uxn_opcodes_h_l226_c3_df72_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l232_c11_9fea]
signal BIN_OP_EQ_uxn_opcodes_h_l232_c11_9fea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l232_c11_9fea_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l232_c11_9fea_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l232_c7_80e3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_80e3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_80e3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l232_c7_80e3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_80e3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_80e3_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l232_c7_80e3]
signal result_stack_value_MUX_uxn_opcodes_h_l232_c7_80e3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l232_c7_80e3_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l232_c7_80e3]
signal result_ram_addr_MUX_uxn_opcodes_h_l232_c7_80e3_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l232_c7_80e3_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l232_c7_80e3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l232_c7_80e3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l232_c7_80e3_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l232_c7_80e3]
signal result_pc_MUX_uxn_opcodes_h_l232_c7_80e3_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l232_c7_80e3_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l232_c7_80e3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_80e3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_80e3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l232_c7_80e3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_80e3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_80e3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l232_c7_80e3]
signal tmp16_MUX_uxn_opcodes_h_l232_c7_80e3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l232_c7_80e3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l236_c11_f0fc]
signal BIN_OP_EQ_uxn_opcodes_h_l236_c11_f0fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l236_c11_f0fc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l236_c11_f0fc_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l236_c7_f65b]
signal result_ram_addr_MUX_uxn_opcodes_h_l236_c7_f65b_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l236_c7_f65b_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l236_c7_f65b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l236_c7_f65b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l236_c7_f65b_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l236_c7_f65b]
signal result_pc_MUX_uxn_opcodes_h_l236_c7_f65b_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l236_c7_f65b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l236_c7_f65b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l236_c7_f65b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l236_c7_f65b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l236_c7_f65b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c7_f65b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c7_f65b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l236_c7_f65b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l236_c7_f65b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l236_c7_f65b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l236_c7_f65b]
signal result_stack_value_MUX_uxn_opcodes_h_l236_c7_f65b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l236_c7_f65b_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l236_c7_f65b]
signal tmp16_MUX_uxn_opcodes_h_l236_c7_f65b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l236_c7_f65b_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l238_c3_444e]
signal CONST_SL_8_uxn_opcodes_h_l238_c3_444e_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l238_c3_444e_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l239_c21_b3db]
signal BIN_OP_PLUS_uxn_opcodes_h_l239_c21_b3db_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l239_c21_b3db_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l239_c21_b3db_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l241_c11_b26f]
signal BIN_OP_EQ_uxn_opcodes_h_l241_c11_b26f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l241_c11_b26f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l241_c11_b26f_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l241_c7_3df7]
signal result_ram_addr_MUX_uxn_opcodes_h_l241_c7_3df7_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l241_c7_3df7_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l241_c7_3df7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l241_c7_3df7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l241_c7_3df7_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l241_c7_3df7]
signal result_pc_MUX_uxn_opcodes_h_l241_c7_3df7_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l241_c7_3df7_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l241_c7_3df7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l241_c7_3df7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l241_c7_3df7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l241_c7_3df7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l241_c7_3df7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l241_c7_3df7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l241_c7_3df7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l241_c7_3df7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l241_c7_3df7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l241_c7_3df7]
signal result_stack_value_MUX_uxn_opcodes_h_l241_c7_3df7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l241_c7_3df7_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l241_c7_3df7]
signal tmp16_MUX_uxn_opcodes_h_l241_c7_3df7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l241_c7_3df7_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l242_c21_b980]
signal BIN_OP_PLUS_uxn_opcodes_h_l242_c21_b980_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l242_c21_b980_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l242_c21_b980_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l244_c11_3df2]
signal BIN_OP_EQ_uxn_opcodes_h_l244_c11_3df2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l244_c11_3df2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l244_c11_3df2_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l244_c7_a800]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l244_c7_a800_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l244_c7_a800_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l244_c7_a800_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l244_c7_a800_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l244_c7_a800]
signal result_pc_MUX_uxn_opcodes_h_l244_c7_a800_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l244_c7_a800_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l244_c7_a800_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l244_c7_a800_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l244_c7_a800]
signal result_is_stack_write_MUX_uxn_opcodes_h_l244_c7_a800_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l244_c7_a800_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l244_c7_a800_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l244_c7_a800_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l244_c7_a800]
signal result_is_opc_done_MUX_uxn_opcodes_h_l244_c7_a800_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l244_c7_a800_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l244_c7_a800_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l244_c7_a800_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l244_c7_a800]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l244_c7_a800_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l244_c7_a800_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l244_c7_a800_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l244_c7_a800_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l244_c7_a800]
signal result_stack_value_MUX_uxn_opcodes_h_l244_c7_a800_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l244_c7_a800_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l244_c7_a800_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l244_c7_a800_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l244_c7_a800]
signal tmp16_MUX_uxn_opcodes_h_l244_c7_a800_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l244_c7_a800_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l244_c7_a800_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l244_c7_a800_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l245_c3_ee8c]
signal BIN_OP_OR_uxn_opcodes_h_l245_c3_ee8c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l245_c3_ee8c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l245_c3_ee8c_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l247_c15_e892]
signal BIN_OP_PLUS_uxn_opcodes_h_l247_c15_e892_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l247_c15_e892_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l247_c15_e892_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l252_c11_1205]
signal BIN_OP_EQ_uxn_opcodes_h_l252_c11_1205_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l252_c11_1205_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l252_c11_1205_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l252_c7_4d13]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_4d13_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_4d13_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l252_c7_4d13]
signal result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_4d13_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_4d13_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l252_c7_4d13]
signal result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_4d13_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_4d13_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l252_c7_4d13]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_4d13_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_4d13_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l252_c7_4d13]
signal result_stack_value_MUX_uxn_opcodes_h_l252_c7_4d13_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l252_c7_4d13_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l255_c34_7084]
signal CONST_SR_8_uxn_opcodes_h_l255_c34_7084_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l255_c34_7084_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l257_c11_f7d6]
signal BIN_OP_EQ_uxn_opcodes_h_l257_c11_f7d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l257_c11_f7d6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l257_c11_f7d6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l257_c7_3112]
signal result_is_stack_write_MUX_uxn_opcodes_h_l257_c7_3112_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l257_c7_3112_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l257_c7_3112_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l257_c7_3112_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l257_c7_3112]
signal result_is_opc_done_MUX_uxn_opcodes_h_l257_c7_3112_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l257_c7_3112_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l257_c7_3112_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l257_c7_3112_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_210b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.ram_addr := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.pc := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_stack_write := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190
BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190_left,
BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190_right,
BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l225_c1_3d1f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l225_c1_3d1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l225_c1_3d1f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l225_c1_3d1f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l225_c1_3d1f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l225_c1_3d1f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l225_c2_bb02
result_is_pc_updated_MUX_uxn_opcodes_h_l225_c2_bb02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l225_c2_bb02_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l225_c2_bb02_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l225_c2_bb02
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l225_c2_bb02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l225_c2_bb02_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l225_c2_bb02_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l225_c2_bb02
result_stack_value_MUX_uxn_opcodes_h_l225_c2_bb02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l225_c2_bb02_cond,
result_stack_value_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l225_c2_bb02_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l225_c2_bb02
result_ram_addr_MUX_uxn_opcodes_h_l225_c2_bb02 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l225_c2_bb02_cond,
result_ram_addr_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l225_c2_bb02_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l225_c2_bb02
result_is_sp_shift_MUX_uxn_opcodes_h_l225_c2_bb02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l225_c2_bb02_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l225_c2_bb02_return_output);

-- result_pc_MUX_uxn_opcodes_h_l225_c2_bb02
result_pc_MUX_uxn_opcodes_h_l225_c2_bb02 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l225_c2_bb02_cond,
result_pc_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue,
result_pc_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse,
result_pc_MUX_uxn_opcodes_h_l225_c2_bb02_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l225_c2_bb02
result_sp_relative_shift_MUX_uxn_opcodes_h_l225_c2_bb02 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l225_c2_bb02_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l225_c2_bb02_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l225_c2_bb02
result_is_stack_write_MUX_uxn_opcodes_h_l225_c2_bb02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l225_c2_bb02_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l225_c2_bb02_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l225_c2_bb02
result_is_opc_done_MUX_uxn_opcodes_h_l225_c2_bb02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l225_c2_bb02_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l225_c2_bb02_return_output);

-- tmp16_MUX_uxn_opcodes_h_l225_c2_bb02
tmp16_MUX_uxn_opcodes_h_l225_c2_bb02 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l225_c2_bb02_cond,
tmp16_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue,
tmp16_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse,
tmp16_MUX_uxn_opcodes_h_l225_c2_bb02_return_output);

-- printf_uxn_opcodes_h_l226_c3_df72_uxn_opcodes_h_l226_c3_df72
printf_uxn_opcodes_h_l226_c3_df72_uxn_opcodes_h_l226_c3_df72 : entity work.printf_uxn_opcodes_h_l226_c3_df72_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l226_c3_df72_uxn_opcodes_h_l226_c3_df72_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l232_c11_9fea
BIN_OP_EQ_uxn_opcodes_h_l232_c11_9fea : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l232_c11_9fea_left,
BIN_OP_EQ_uxn_opcodes_h_l232_c11_9fea_right,
BIN_OP_EQ_uxn_opcodes_h_l232_c11_9fea_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_80e3
result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_80e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_80e3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_80e3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_80e3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_80e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_80e3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_80e3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l232_c7_80e3
result_stack_value_MUX_uxn_opcodes_h_l232_c7_80e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l232_c7_80e3_cond,
result_stack_value_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l232_c7_80e3_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l232_c7_80e3
result_ram_addr_MUX_uxn_opcodes_h_l232_c7_80e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l232_c7_80e3_cond,
result_ram_addr_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l232_c7_80e3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l232_c7_80e3
result_is_sp_shift_MUX_uxn_opcodes_h_l232_c7_80e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l232_c7_80e3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l232_c7_80e3_return_output);

-- result_pc_MUX_uxn_opcodes_h_l232_c7_80e3
result_pc_MUX_uxn_opcodes_h_l232_c7_80e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l232_c7_80e3_cond,
result_pc_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue,
result_pc_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse,
result_pc_MUX_uxn_opcodes_h_l232_c7_80e3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_80e3
result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_80e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_80e3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_80e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_80e3
result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_80e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_80e3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_80e3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l232_c7_80e3
tmp16_MUX_uxn_opcodes_h_l232_c7_80e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l232_c7_80e3_cond,
tmp16_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue,
tmp16_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse,
tmp16_MUX_uxn_opcodes_h_l232_c7_80e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l236_c11_f0fc
BIN_OP_EQ_uxn_opcodes_h_l236_c11_f0fc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l236_c11_f0fc_left,
BIN_OP_EQ_uxn_opcodes_h_l236_c11_f0fc_right,
BIN_OP_EQ_uxn_opcodes_h_l236_c11_f0fc_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l236_c7_f65b
result_ram_addr_MUX_uxn_opcodes_h_l236_c7_f65b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l236_c7_f65b_cond,
result_ram_addr_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l236_c7_f65b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l236_c7_f65b
result_is_pc_updated_MUX_uxn_opcodes_h_l236_c7_f65b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l236_c7_f65b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l236_c7_f65b_return_output);

-- result_pc_MUX_uxn_opcodes_h_l236_c7_f65b
result_pc_MUX_uxn_opcodes_h_l236_c7_f65b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l236_c7_f65b_cond,
result_pc_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue,
result_pc_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse,
result_pc_MUX_uxn_opcodes_h_l236_c7_f65b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l236_c7_f65b
result_is_stack_write_MUX_uxn_opcodes_h_l236_c7_f65b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l236_c7_f65b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l236_c7_f65b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c7_f65b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c7_f65b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c7_f65b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c7_f65b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l236_c7_f65b
result_is_opc_done_MUX_uxn_opcodes_h_l236_c7_f65b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l236_c7_f65b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l236_c7_f65b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l236_c7_f65b
result_stack_value_MUX_uxn_opcodes_h_l236_c7_f65b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l236_c7_f65b_cond,
result_stack_value_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l236_c7_f65b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l236_c7_f65b
tmp16_MUX_uxn_opcodes_h_l236_c7_f65b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l236_c7_f65b_cond,
tmp16_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue,
tmp16_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse,
tmp16_MUX_uxn_opcodes_h_l236_c7_f65b_return_output);

-- CONST_SL_8_uxn_opcodes_h_l238_c3_444e
CONST_SL_8_uxn_opcodes_h_l238_c3_444e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l238_c3_444e_x,
CONST_SL_8_uxn_opcodes_h_l238_c3_444e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l239_c21_b3db
BIN_OP_PLUS_uxn_opcodes_h_l239_c21_b3db : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l239_c21_b3db_left,
BIN_OP_PLUS_uxn_opcodes_h_l239_c21_b3db_right,
BIN_OP_PLUS_uxn_opcodes_h_l239_c21_b3db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l241_c11_b26f
BIN_OP_EQ_uxn_opcodes_h_l241_c11_b26f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l241_c11_b26f_left,
BIN_OP_EQ_uxn_opcodes_h_l241_c11_b26f_right,
BIN_OP_EQ_uxn_opcodes_h_l241_c11_b26f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l241_c7_3df7
result_ram_addr_MUX_uxn_opcodes_h_l241_c7_3df7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l241_c7_3df7_cond,
result_ram_addr_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l241_c7_3df7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l241_c7_3df7
result_is_pc_updated_MUX_uxn_opcodes_h_l241_c7_3df7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l241_c7_3df7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l241_c7_3df7_return_output);

-- result_pc_MUX_uxn_opcodes_h_l241_c7_3df7
result_pc_MUX_uxn_opcodes_h_l241_c7_3df7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l241_c7_3df7_cond,
result_pc_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue,
result_pc_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse,
result_pc_MUX_uxn_opcodes_h_l241_c7_3df7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l241_c7_3df7
result_is_stack_write_MUX_uxn_opcodes_h_l241_c7_3df7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l241_c7_3df7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l241_c7_3df7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l241_c7_3df7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l241_c7_3df7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l241_c7_3df7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l241_c7_3df7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l241_c7_3df7
result_is_opc_done_MUX_uxn_opcodes_h_l241_c7_3df7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l241_c7_3df7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l241_c7_3df7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l241_c7_3df7
result_stack_value_MUX_uxn_opcodes_h_l241_c7_3df7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l241_c7_3df7_cond,
result_stack_value_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l241_c7_3df7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l241_c7_3df7
tmp16_MUX_uxn_opcodes_h_l241_c7_3df7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l241_c7_3df7_cond,
tmp16_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue,
tmp16_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse,
tmp16_MUX_uxn_opcodes_h_l241_c7_3df7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l242_c21_b980
BIN_OP_PLUS_uxn_opcodes_h_l242_c21_b980 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l242_c21_b980_left,
BIN_OP_PLUS_uxn_opcodes_h_l242_c21_b980_right,
BIN_OP_PLUS_uxn_opcodes_h_l242_c21_b980_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l244_c11_3df2
BIN_OP_EQ_uxn_opcodes_h_l244_c11_3df2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l244_c11_3df2_left,
BIN_OP_EQ_uxn_opcodes_h_l244_c11_3df2_right,
BIN_OP_EQ_uxn_opcodes_h_l244_c11_3df2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l244_c7_a800
result_is_pc_updated_MUX_uxn_opcodes_h_l244_c7_a800 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l244_c7_a800_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l244_c7_a800_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l244_c7_a800_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l244_c7_a800_return_output);

-- result_pc_MUX_uxn_opcodes_h_l244_c7_a800
result_pc_MUX_uxn_opcodes_h_l244_c7_a800 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l244_c7_a800_cond,
result_pc_MUX_uxn_opcodes_h_l244_c7_a800_iftrue,
result_pc_MUX_uxn_opcodes_h_l244_c7_a800_iffalse,
result_pc_MUX_uxn_opcodes_h_l244_c7_a800_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l244_c7_a800
result_is_stack_write_MUX_uxn_opcodes_h_l244_c7_a800 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l244_c7_a800_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l244_c7_a800_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l244_c7_a800_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l244_c7_a800_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l244_c7_a800
result_is_opc_done_MUX_uxn_opcodes_h_l244_c7_a800 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l244_c7_a800_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l244_c7_a800_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l244_c7_a800_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l244_c7_a800_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l244_c7_a800
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l244_c7_a800 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l244_c7_a800_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l244_c7_a800_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l244_c7_a800_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l244_c7_a800_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l244_c7_a800
result_stack_value_MUX_uxn_opcodes_h_l244_c7_a800 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l244_c7_a800_cond,
result_stack_value_MUX_uxn_opcodes_h_l244_c7_a800_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l244_c7_a800_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l244_c7_a800_return_output);

-- tmp16_MUX_uxn_opcodes_h_l244_c7_a800
tmp16_MUX_uxn_opcodes_h_l244_c7_a800 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l244_c7_a800_cond,
tmp16_MUX_uxn_opcodes_h_l244_c7_a800_iftrue,
tmp16_MUX_uxn_opcodes_h_l244_c7_a800_iffalse,
tmp16_MUX_uxn_opcodes_h_l244_c7_a800_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l245_c3_ee8c
BIN_OP_OR_uxn_opcodes_h_l245_c3_ee8c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l245_c3_ee8c_left,
BIN_OP_OR_uxn_opcodes_h_l245_c3_ee8c_right,
BIN_OP_OR_uxn_opcodes_h_l245_c3_ee8c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l247_c15_e892
BIN_OP_PLUS_uxn_opcodes_h_l247_c15_e892 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l247_c15_e892_left,
BIN_OP_PLUS_uxn_opcodes_h_l247_c15_e892_right,
BIN_OP_PLUS_uxn_opcodes_h_l247_c15_e892_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l252_c11_1205
BIN_OP_EQ_uxn_opcodes_h_l252_c11_1205 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l252_c11_1205_left,
BIN_OP_EQ_uxn_opcodes_h_l252_c11_1205_right,
BIN_OP_EQ_uxn_opcodes_h_l252_c11_1205_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_4d13
result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_4d13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_4d13_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_4d13_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_4d13
result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_4d13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_4d13_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_4d13_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_4d13
result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_4d13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_4d13_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_4d13_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_4d13
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_4d13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_4d13_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_4d13_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l252_c7_4d13
result_stack_value_MUX_uxn_opcodes_h_l252_c7_4d13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l252_c7_4d13_cond,
result_stack_value_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l252_c7_4d13_return_output);

-- CONST_SR_8_uxn_opcodes_h_l255_c34_7084
CONST_SR_8_uxn_opcodes_h_l255_c34_7084 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l255_c34_7084_x,
CONST_SR_8_uxn_opcodes_h_l255_c34_7084_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l257_c11_f7d6
BIN_OP_EQ_uxn_opcodes_h_l257_c11_f7d6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l257_c11_f7d6_left,
BIN_OP_EQ_uxn_opcodes_h_l257_c11_f7d6_right,
BIN_OP_EQ_uxn_opcodes_h_l257_c11_f7d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l257_c7_3112
result_is_stack_write_MUX_uxn_opcodes_h_l257_c7_3112 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l257_c7_3112_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l257_c7_3112_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l257_c7_3112_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l257_c7_3112_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l257_c7_3112
result_is_opc_done_MUX_uxn_opcodes_h_l257_c7_3112 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l257_c7_3112_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l257_c7_3112_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l257_c7_3112_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l257_c7_3112_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_ram_read,
 -- Registers
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l225_c1_3d1f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l225_c2_bb02_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l225_c2_bb02_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l225_c2_bb02_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l225_c2_bb02_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l225_c2_bb02_return_output,
 result_pc_MUX_uxn_opcodes_h_l225_c2_bb02_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l225_c2_bb02_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l225_c2_bb02_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l225_c2_bb02_return_output,
 tmp16_MUX_uxn_opcodes_h_l225_c2_bb02_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l232_c11_9fea_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_80e3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_80e3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l232_c7_80e3_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l232_c7_80e3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l232_c7_80e3_return_output,
 result_pc_MUX_uxn_opcodes_h_l232_c7_80e3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_80e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_80e3_return_output,
 tmp16_MUX_uxn_opcodes_h_l232_c7_80e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l236_c11_f0fc_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l236_c7_f65b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l236_c7_f65b_return_output,
 result_pc_MUX_uxn_opcodes_h_l236_c7_f65b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l236_c7_f65b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c7_f65b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l236_c7_f65b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l236_c7_f65b_return_output,
 tmp16_MUX_uxn_opcodes_h_l236_c7_f65b_return_output,
 CONST_SL_8_uxn_opcodes_h_l238_c3_444e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l239_c21_b3db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l241_c11_b26f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l241_c7_3df7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l241_c7_3df7_return_output,
 result_pc_MUX_uxn_opcodes_h_l241_c7_3df7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l241_c7_3df7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l241_c7_3df7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l241_c7_3df7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l241_c7_3df7_return_output,
 tmp16_MUX_uxn_opcodes_h_l241_c7_3df7_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l242_c21_b980_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l244_c11_3df2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l244_c7_a800_return_output,
 result_pc_MUX_uxn_opcodes_h_l244_c7_a800_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l244_c7_a800_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l244_c7_a800_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l244_c7_a800_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l244_c7_a800_return_output,
 tmp16_MUX_uxn_opcodes_h_l244_c7_a800_return_output,
 BIN_OP_OR_uxn_opcodes_h_l245_c3_ee8c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l247_c15_e892_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l252_c11_1205_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_4d13_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_4d13_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_4d13_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_4d13_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l252_c7_4d13_return_output,
 CONST_SR_8_uxn_opcodes_h_l255_c34_7084_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l257_c11_f7d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l257_c7_3112_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l257_c7_3112_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l225_c1_3d1f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l225_c1_3d1f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l225_c1_3d1f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l225_c1_3d1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_80e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l225_c2_bb02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l225_c2_bb02_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_80e3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l225_c2_bb02_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l225_c2_bb02_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l232_c7_80e3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l225_c2_bb02_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l225_c2_bb02_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l232_c7_80e3_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l225_c2_bb02_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l225_c2_bb02_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l232_c7_80e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l225_c2_bb02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l225_c2_bb02_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l232_c7_80e3_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l225_c2_bb02_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l225_c2_bb02_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l228_c3_0844 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l225_c2_bb02_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l225_c2_bb02_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l225_c2_bb02_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_80e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l225_c2_bb02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l225_c2_bb02_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_80e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l225_c2_bb02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l225_c2_bb02_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l232_c7_80e3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l225_c2_bb02_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l225_c2_bb02_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l226_c3_df72_uxn_opcodes_h_l226_c3_df72_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_9fea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_9fea_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_9fea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c7_f65b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_80e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c7_f65b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_80e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c7_f65b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l232_c7_80e3_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c7_f65b_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l232_c7_80e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l232_c7_80e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l232_c7_80e3_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l236_c7_f65b_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l232_c7_80e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c7_f65b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_80e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c7_f65b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_80e3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l236_c7_f65b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l232_c7_80e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c11_f0fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c11_f0fc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c11_f0fc_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l239_c3_f7a2 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l241_c7_3df7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c7_f65b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l241_c7_3df7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c7_f65b_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l241_c7_3df7_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l236_c7_f65b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l241_c7_3df7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c7_f65b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l241_c7_3df7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c7_f65b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l241_c7_3df7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c7_f65b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l241_c7_3df7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c7_f65b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l241_c7_3df7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l236_c7_f65b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l238_c3_444e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l238_c3_444e_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l239_c21_b3db_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l239_c21_b3db_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l239_c21_b3db_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l241_c11_b26f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l241_c11_b26f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l241_c11_b26f_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l242_c3_114d : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l241_c7_3df7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l241_c7_3df7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l244_c7_a800_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l241_c7_3df7_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l244_c7_a800_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l241_c7_3df7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l244_c7_a800_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l241_c7_3df7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l244_c7_a800_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l241_c7_3df7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l244_c7_a800_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l241_c7_3df7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l244_c7_a800_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l241_c7_3df7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l244_c7_a800_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l241_c7_3df7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l242_c21_b980_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l242_c21_b980_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l242_c21_b980_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l244_c11_3df2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l244_c11_3df2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l244_c11_3df2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l244_c7_a800_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l244_c7_a800_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_4d13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l244_c7_a800_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l244_c7_a800_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l247_c3_797b : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l244_c7_a800_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l244_c7_a800_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l244_c7_a800_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l244_c7_a800_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_4d13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l244_c7_a800_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l244_c7_a800_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l244_c7_a800_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_4d13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l244_c7_a800_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l244_c7_a800_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l249_c3_9f16 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l244_c7_a800_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_4d13_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l244_c7_a800_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l244_c7_a800_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l244_c7_a800_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l252_c7_4d13_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l244_c7_a800_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l244_c7_a800_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l244_c7_a800_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l244_c7_a800_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l245_c3_ee8c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l245_c3_ee8c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l245_c3_ee8c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l247_c15_e892_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l247_c15_e892_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l247_c15_e892_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l250_c24_eb42_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_1205_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_1205_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_1205_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_4d13_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l257_c7_3112_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_4d13_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l257_c7_3112_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_4d13_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l254_c3_2dd6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_4d13_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l252_c7_4d13_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l255_c34_7084_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l255_c34_7084_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l255_c24_73c5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l257_c11_f7d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l257_c11_f7d6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l257_c11_f7d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l257_c7_3112_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l257_c7_3112_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l257_c7_3112_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l257_c7_3112_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l257_c7_3112_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l257_c7_3112_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_DUPLICATE_97d2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_DUPLICATE_cc74_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_DUPLICATE_8f4a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l225_l244_l241_l236_l232_DUPLICATE_b235_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_l257_DUPLICATE_fd76_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l244_l241_l252_l236_l232_l257_DUPLICATE_cb30_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l237_l245_DUPLICATE_ae9e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_210b_uxn_opcodes_h_l262_l220_DUPLICATE_528d_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l247_c15_e892_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l239_c21_b3db_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_1205_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l244_c7_a800_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l257_c7_3112_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l242_c21_b980_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l257_c7_3112_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l225_c1_3d1f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l257_c11_f7d6_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l244_c11_3df2_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l241_c11_b26f_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l249_c3_9f16 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l244_c7_a800_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l249_c3_9f16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c11_f0fc_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l228_c3_0844 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l228_c3_0844;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l254_c3_2dd6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l254_c3_2dd6;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l244_c7_a800_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_9fea_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l225_c1_3d1f_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l239_c21_b3db_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l242_c21_b980_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l247_c15_e892_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_9fea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c11_f0fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l241_c11_b26f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l244_c11_3df2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_1205_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l257_c11_f7d6_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l245_c3_ee8c_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l255_c34_7084_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l244_c7_a800_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l252_c11_1205] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l252_c11_1205_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_1205_left;
     BIN_OP_EQ_uxn_opcodes_h_l252_c11_1205_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_1205_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_1205_return_output := BIN_OP_EQ_uxn_opcodes_h_l252_c11_1205_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l225_c6_d190] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190_left;
     BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190_return_output := BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l255_c34_7084] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l255_c34_7084_x <= VAR_CONST_SR_8_uxn_opcodes_h_l255_c34_7084_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l255_c34_7084_return_output := CONST_SR_8_uxn_opcodes_h_l255_c34_7084_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l225_c2_bb02] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l225_c2_bb02_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_DUPLICATE_cc74 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_DUPLICATE_cc74_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l237_l245_DUPLICATE_ae9e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l237_l245_DUPLICATE_ae9e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l225_l244_l241_l236_l232_DUPLICATE_b235 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l225_l244_l241_l236_l232_DUPLICATE_b235_return_output := result.pc;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_l257_DUPLICATE_fd76 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_l257_DUPLICATE_fd76_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_DUPLICATE_97d2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_DUPLICATE_97d2_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l232_c11_9fea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l232_c11_9fea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_9fea_left;
     BIN_OP_EQ_uxn_opcodes_h_l232_c11_9fea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_9fea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_9fea_return_output := BIN_OP_EQ_uxn_opcodes_h_l232_c11_9fea_return_output;

     -- result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l241_c7_3df7] LATENCY=0
     VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l241_c7_3df7_return_output := result.ram_addr;

     -- BIN_OP_PLUS[uxn_opcodes_h_l247_c15_e892] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l247_c15_e892_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l247_c15_e892_left;
     BIN_OP_PLUS_uxn_opcodes_h_l247_c15_e892_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l247_c15_e892_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l247_c15_e892_return_output := BIN_OP_PLUS_uxn_opcodes_h_l247_c15_e892_return_output;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l232_c7_80e3] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l232_c7_80e3_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l257_c11_f7d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l257_c11_f7d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l257_c11_f7d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l257_c11_f7d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l257_c11_f7d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l257_c11_f7d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l257_c11_f7d6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l241_c11_b26f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l241_c11_b26f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l241_c11_b26f_left;
     BIN_OP_EQ_uxn_opcodes_h_l241_c11_b26f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l241_c11_b26f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l241_c11_b26f_return_output := BIN_OP_EQ_uxn_opcodes_h_l241_c11_b26f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l236_c11_f0fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l236_c11_f0fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c11_f0fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l236_c11_f0fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c11_f0fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c11_f0fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l236_c11_f0fc_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_DUPLICATE_8f4a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_DUPLICATE_8f4a_return_output := result.stack_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l242_c21_b980] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l242_c21_b980_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l242_c21_b980_left;
     BIN_OP_PLUS_uxn_opcodes_h_l242_c21_b980_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l242_c21_b980_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l242_c21_b980_return_output := BIN_OP_PLUS_uxn_opcodes_h_l242_c21_b980_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l239_c21_b3db] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l239_c21_b3db_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l239_c21_b3db_left;
     BIN_OP_PLUS_uxn_opcodes_h_l239_c21_b3db_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l239_c21_b3db_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l239_c21_b3db_return_output := BIN_OP_PLUS_uxn_opcodes_h_l239_c21_b3db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l244_c11_3df2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l244_c11_3df2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l244_c11_3df2_left;
     BIN_OP_EQ_uxn_opcodes_h_l244_c11_3df2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l244_c11_3df2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l244_c11_3df2_return_output := BIN_OP_EQ_uxn_opcodes_h_l244_c11_3df2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l244_l241_l252_l236_l232_l257_DUPLICATE_cb30 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l244_l241_l252_l236_l232_l257_DUPLICATE_cb30_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l225_c1_3d1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l225_c2_bb02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l225_c2_bb02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l225_c2_bb02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l225_c2_bb02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l225_c2_bb02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l225_c2_bb02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l225_c2_bb02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l225_c2_bb02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l225_c2_bb02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l225_c2_bb02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l225_c6_d190_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_80e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_9fea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_80e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_9fea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l232_c7_80e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_9fea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_80e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_9fea_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l232_c7_80e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_9fea_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l232_c7_80e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_9fea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_80e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_9fea_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l232_c7_80e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_9fea_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l232_c7_80e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l232_c11_9fea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c7_f65b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c11_f0fc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c7_f65b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c11_f0fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c7_f65b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c11_f0fc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l236_c7_f65b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c11_f0fc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c7_f65b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c11_f0fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c7_f65b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c11_f0fc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c7_f65b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c11_f0fc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l236_c7_f65b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c11_f0fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l241_c7_3df7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l241_c11_b26f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l241_c7_3df7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l241_c11_b26f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l241_c7_3df7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l241_c11_b26f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l241_c7_3df7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l241_c11_b26f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l241_c7_3df7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l241_c11_b26f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l241_c7_3df7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l241_c11_b26f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l241_c7_3df7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l241_c11_b26f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l241_c7_3df7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l241_c11_b26f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l244_c7_a800_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l244_c11_3df2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l244_c7_a800_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l244_c11_3df2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l244_c7_a800_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l244_c11_3df2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l244_c7_a800_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l244_c11_3df2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l244_c7_a800_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l244_c11_3df2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l244_c7_a800_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l244_c11_3df2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l244_c7_a800_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l244_c11_3df2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_4d13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_1205_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_4d13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_1205_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_4d13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_1205_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_4d13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_1205_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l252_c7_4d13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_1205_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l257_c7_3112_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l257_c11_f7d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l257_c7_3112_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l257_c11_f7d6_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l239_c3_f7a2 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l239_c21_b3db_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l242_c3_114d := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l242_c21_b980_return_output, 16);
     VAR_result_pc_uxn_opcodes_h_l247_c3_797b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l247_c15_e892_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l245_c3_ee8c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l237_l245_DUPLICATE_ae9e_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l238_c3_444e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l237_l245_DUPLICATE_ae9e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l225_l244_l241_l236_l232_DUPLICATE_b235_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l225_l244_l241_l236_l232_DUPLICATE_b235_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l225_l244_l241_l236_l232_DUPLICATE_b235_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l225_l244_l241_l236_l232_DUPLICATE_b235_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l244_c7_a800_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l225_l244_l241_l236_l232_DUPLICATE_b235_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l244_l241_l252_l236_l232_l257_DUPLICATE_cb30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l244_l241_l252_l236_l232_l257_DUPLICATE_cb30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l244_l241_l252_l236_l232_l257_DUPLICATE_cb30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l244_c7_a800_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l244_l241_l252_l236_l232_l257_DUPLICATE_cb30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l244_l241_l252_l236_l232_l257_DUPLICATE_cb30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l257_c7_3112_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l244_l241_l252_l236_l232_l257_DUPLICATE_cb30_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_DUPLICATE_97d2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_DUPLICATE_97d2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_DUPLICATE_97d2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_DUPLICATE_97d2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_DUPLICATE_97d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_l257_DUPLICATE_fd76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_l257_DUPLICATE_fd76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_l257_DUPLICATE_fd76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_l257_DUPLICATE_fd76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_l257_DUPLICATE_fd76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l257_c7_3112_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_l257_DUPLICATE_fd76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_DUPLICATE_cc74_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_DUPLICATE_cc74_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_DUPLICATE_cc74_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_DUPLICATE_cc74_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_DUPLICATE_cc74_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_DUPLICATE_8f4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_DUPLICATE_8f4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_DUPLICATE_8f4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_DUPLICATE_8f4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l225_l241_l252_l236_l232_DUPLICATE_8f4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l232_c7_80e3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse := VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l241_c7_3df7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l225_c2_bb02_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l244_c7_a800_iftrue := VAR_result_pc_uxn_opcodes_h_l247_c3_797b;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l239_c3_f7a2;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l242_c3_114d;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l252_c7_4d13] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_4d13_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_4d13_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_4d13_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_4d13_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l225_c1_3d1f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l225_c1_3d1f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l225_c1_3d1f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l225_c1_3d1f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l225_c1_3d1f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l225_c1_3d1f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l225_c1_3d1f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l225_c1_3d1f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l225_c1_3d1f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l257_c7_3112] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l257_c7_3112_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l257_c7_3112_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l257_c7_3112_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l257_c7_3112_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l257_c7_3112_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l257_c7_3112_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l257_c7_3112_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l257_c7_3112_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l244_c7_a800] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l244_c7_a800_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l244_c7_a800_cond;
     result_pc_MUX_uxn_opcodes_h_l244_c7_a800_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l244_c7_a800_iftrue;
     result_pc_MUX_uxn_opcodes_h_l244_c7_a800_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l244_c7_a800_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l244_c7_a800_return_output := result_pc_MUX_uxn_opcodes_h_l244_c7_a800_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l255_c24_73c5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l255_c24_73c5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l255_c34_7084_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l257_c7_3112] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l257_c7_3112_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l257_c7_3112_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l257_c7_3112_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l257_c7_3112_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l257_c7_3112_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l257_c7_3112_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l257_c7_3112_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l257_c7_3112_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l238_c3_444e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l238_c3_444e_x <= VAR_CONST_SL_8_uxn_opcodes_h_l238_c3_444e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l238_c3_444e_return_output := CONST_SL_8_uxn_opcodes_h_l238_c3_444e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l225_c2_bb02] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l225_c2_bb02_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l225_c2_bb02_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l225_c2_bb02_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l225_c2_bb02_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l241_c7_3df7] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l241_c7_3df7_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l241_c7_3df7_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l241_c7_3df7_return_output := result_ram_addr_MUX_uxn_opcodes_h_l241_c7_3df7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l245_c3_ee8c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l245_c3_ee8c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l245_c3_ee8c_left;
     BIN_OP_OR_uxn_opcodes_h_l245_c3_ee8c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l245_c3_ee8c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l245_c3_ee8c_return_output := BIN_OP_OR_uxn_opcodes_h_l245_c3_ee8c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l232_c7_80e3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l232_c7_80e3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l232_c7_80e3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l232_c7_80e3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l232_c7_80e3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l252_c7_4d13] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_4d13_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_4d13_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_4d13_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_4d13_return_output;

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l244_c7_a800_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l245_c3_ee8c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l255_c24_73c5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l238_c3_444e_return_output;
     VAR_printf_uxn_opcodes_h_l226_c3_df72_uxn_opcodes_h_l226_c3_df72_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l225_c1_3d1f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l257_c7_3112_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l244_c7_a800_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_4d13_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l232_c7_80e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l257_c7_3112_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l244_c7_a800_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l241_c7_3df7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l244_c7_a800_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_4d13_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l252_c7_4d13] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l252_c7_4d13_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l252_c7_4d13_cond;
     result_stack_value_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l252_c7_4d13_return_output := result_stack_value_MUX_uxn_opcodes_h_l252_c7_4d13_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l236_c7_f65b] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l236_c7_f65b_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c7_f65b_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c7_f65b_return_output := result_ram_addr_MUX_uxn_opcodes_h_l236_c7_f65b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l244_c7_a800] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l244_c7_a800_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l244_c7_a800_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l244_c7_a800_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l244_c7_a800_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l244_c7_a800_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l244_c7_a800_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l244_c7_a800_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l244_c7_a800_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l252_c7_4d13] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_4d13_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_4d13_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_4d13_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_4d13_return_output;

     -- printf_uxn_opcodes_h_l226_c3_df72[uxn_opcodes_h_l226_c3_df72] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l226_c3_df72_uxn_opcodes_h_l226_c3_df72_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l226_c3_df72_uxn_opcodes_h_l226_c3_df72_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_pc_MUX[uxn_opcodes_h_l241_c7_3df7] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l241_c7_3df7_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l241_c7_3df7_cond;
     result_pc_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue;
     result_pc_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l241_c7_3df7_return_output := result_pc_MUX_uxn_opcodes_h_l241_c7_3df7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l252_c7_4d13] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_4d13_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_4d13_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_4d13_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_4d13_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_4d13_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_4d13_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l225_c2_bb02] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l225_c2_bb02_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l225_c2_bb02_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l225_c2_bb02_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l225_c2_bb02_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l244_c7_a800] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l244_c7_a800_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l244_c7_a800_cond;
     tmp16_MUX_uxn_opcodes_h_l244_c7_a800_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l244_c7_a800_iftrue;
     tmp16_MUX_uxn_opcodes_h_l244_c7_a800_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l244_c7_a800_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l244_c7_a800_return_output := tmp16_MUX_uxn_opcodes_h_l244_c7_a800_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l250_c24_eb42] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l250_c24_eb42_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l245_c3_ee8c_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l244_c7_a800] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l244_c7_a800_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l244_c7_a800_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l244_c7_a800_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l244_c7_a800_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l244_c7_a800_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l244_c7_a800_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l244_c7_a800_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l244_c7_a800_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l244_c7_a800_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l250_c24_eb42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l244_c7_a800_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_4d13_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l244_c7_a800_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l244_c7_a800_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_4d13_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l241_c7_3df7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c7_f65b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l244_c7_a800_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l244_c7_a800_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l252_c7_4d13_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l244_c7_a800_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l244_c7_a800] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l244_c7_a800_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l244_c7_a800_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l244_c7_a800_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l244_c7_a800_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l244_c7_a800_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l244_c7_a800_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l244_c7_a800_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l244_c7_a800_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l232_c7_80e3] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l232_c7_80e3_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l232_c7_80e3_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l232_c7_80e3_return_output := result_ram_addr_MUX_uxn_opcodes_h_l232_c7_80e3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l241_c7_3df7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l241_c7_3df7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l241_c7_3df7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l241_c7_3df7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l241_c7_3df7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l241_c7_3df7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l241_c7_3df7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l241_c7_3df7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l241_c7_3df7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l241_c7_3df7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l241_c7_3df7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l241_c7_3df7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l241_c7_3df7_cond;
     tmp16_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l241_c7_3df7_return_output := tmp16_MUX_uxn_opcodes_h_l241_c7_3df7_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l236_c7_f65b] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l236_c7_f65b_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l236_c7_f65b_cond;
     result_pc_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue;
     result_pc_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l236_c7_f65b_return_output := result_pc_MUX_uxn_opcodes_h_l236_c7_f65b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l244_c7_a800] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l244_c7_a800_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l244_c7_a800_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l244_c7_a800_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l244_c7_a800_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l244_c7_a800_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l244_c7_a800_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l244_c7_a800_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l244_c7_a800_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l244_c7_a800] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l244_c7_a800_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l244_c7_a800_cond;
     result_stack_value_MUX_uxn_opcodes_h_l244_c7_a800_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l244_c7_a800_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l244_c7_a800_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l244_c7_a800_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l244_c7_a800_return_output := result_stack_value_MUX_uxn_opcodes_h_l244_c7_a800_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l244_c7_a800_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l241_c7_3df7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l244_c7_a800_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l236_c7_f65b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l232_c7_80e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l241_c7_3df7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l244_c7_a800_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l241_c7_3df7_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l232_c7_80e3] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l232_c7_80e3_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l232_c7_80e3_cond;
     result_pc_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue;
     result_pc_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l232_c7_80e3_return_output := result_pc_MUX_uxn_opcodes_h_l232_c7_80e3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l241_c7_3df7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l241_c7_3df7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l241_c7_3df7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l241_c7_3df7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l241_c7_3df7_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l225_c2_bb02] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l225_c2_bb02_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l225_c2_bb02_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l225_c2_bb02_return_output := result_ram_addr_MUX_uxn_opcodes_h_l225_c2_bb02_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l236_c7_f65b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l236_c7_f65b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l236_c7_f65b_cond;
     tmp16_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l236_c7_f65b_return_output := tmp16_MUX_uxn_opcodes_h_l236_c7_f65b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l241_c7_3df7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l241_c7_3df7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l241_c7_3df7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l241_c7_3df7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l241_c7_3df7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l236_c7_f65b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l236_c7_f65b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c7_f65b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c7_f65b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l236_c7_f65b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l236_c7_f65b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c7_f65b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c7_f65b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c7_f65b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c7_f65b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l241_c7_3df7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l241_c7_3df7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l241_c7_3df7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l241_c7_3df7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l241_c7_3df7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l241_c7_3df7_return_output := result_stack_value_MUX_uxn_opcodes_h_l241_c7_3df7_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l241_c7_3df7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c7_f65b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l241_c7_3df7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l232_c7_80e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c7_f65b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l241_c7_3df7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l236_c7_f65b_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l225_c2_bb02] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l225_c2_bb02_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l225_c2_bb02_cond;
     result_pc_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue;
     result_pc_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l225_c2_bb02_return_output := result_pc_MUX_uxn_opcodes_h_l225_c2_bb02_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l232_c7_80e3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_80e3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_80e3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_80e3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_80e3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l232_c7_80e3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l232_c7_80e3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l232_c7_80e3_cond;
     tmp16_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l232_c7_80e3_return_output := tmp16_MUX_uxn_opcodes_h_l232_c7_80e3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l236_c7_f65b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l236_c7_f65b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c7_f65b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c7_f65b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l236_c7_f65b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l236_c7_f65b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l236_c7_f65b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c7_f65b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c7_f65b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l236_c7_f65b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l236_c7_f65b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l236_c7_f65b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c7_f65b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c7_f65b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c7_f65b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c7_f65b_return_output := result_stack_value_MUX_uxn_opcodes_h_l236_c7_f65b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l232_c7_80e3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_80e3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_80e3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_80e3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_80e3_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c7_f65b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l232_c7_80e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c7_f65b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l232_c7_80e3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c7_f65b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l232_c7_80e3_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l225_c2_bb02] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l225_c2_bb02_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l225_c2_bb02_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l225_c2_bb02_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l225_c2_bb02_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l225_c2_bb02] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l225_c2_bb02_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l225_c2_bb02_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l225_c2_bb02_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l225_c2_bb02_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l225_c2_bb02] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l225_c2_bb02_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l225_c2_bb02_cond;
     tmp16_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue;
     tmp16_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l225_c2_bb02_return_output := tmp16_MUX_uxn_opcodes_h_l225_c2_bb02_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l232_c7_80e3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l232_c7_80e3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l232_c7_80e3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l232_c7_80e3_return_output := result_stack_value_MUX_uxn_opcodes_h_l232_c7_80e3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l232_c7_80e3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_80e3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_80e3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_80e3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_80e3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l232_c7_80e3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_80e3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_80e3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_80e3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_80e3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_80e3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_80e3_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l232_c7_80e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l232_c7_80e3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l232_c7_80e3_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l225_c2_bb02_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l225_c2_bb02] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l225_c2_bb02_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l225_c2_bb02_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l225_c2_bb02_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l225_c2_bb02_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l225_c2_bb02] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l225_c2_bb02_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l225_c2_bb02_cond;
     result_stack_value_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l225_c2_bb02_return_output := result_stack_value_MUX_uxn_opcodes_h_l225_c2_bb02_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l225_c2_bb02] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l225_c2_bb02_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l225_c2_bb02_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l225_c2_bb02_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l225_c2_bb02_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l225_c2_bb02_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l225_c2_bb02_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_210b_uxn_opcodes_h_l262_l220_DUPLICATE_528d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_210b_uxn_opcodes_h_l262_l220_DUPLICATE_528d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_210b(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l225_c2_bb02_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l225_c2_bb02_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l225_c2_bb02_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l225_c2_bb02_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l225_c2_bb02_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l225_c2_bb02_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l225_c2_bb02_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l225_c2_bb02_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l225_c2_bb02_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_210b_uxn_opcodes_h_l262_l220_DUPLICATE_528d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_210b_uxn_opcodes_h_l262_l220_DUPLICATE_528d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
