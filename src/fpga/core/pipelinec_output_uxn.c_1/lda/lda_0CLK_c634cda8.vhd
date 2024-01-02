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
-- Submodules: 58
entity lda_0CLK_c634cda8 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda_0CLK_c634cda8;
architecture arch of lda_0CLK_c634cda8 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1394_c6_942a]
signal BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1394_c2_b884]
signal t16_MUX_uxn_opcodes_h_l1394_c2_b884_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1394_c2_b884_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1394_c2_b884]
signal tmp8_MUX_uxn_opcodes_h_l1394_c2_b884_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1394_c2_b884_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1394_c2_b884]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_b884_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_b884_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1394_c2_b884]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_b884_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_b884_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1394_c2_b884]
signal result_u16_value_MUX_uxn_opcodes_h_l1394_c2_b884_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1394_c2_b884_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1394_c2_b884]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_b884_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_b884_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1394_c2_b884]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_b884_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_b884_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1394_c2_b884]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_b884_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_b884_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1394_c2_b884]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_b884_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_b884_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1394_c2_b884]
signal result_u8_value_MUX_uxn_opcodes_h_l1394_c2_b884_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1394_c2_b884_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1394_c2_b884]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_b884_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_b884_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1394_c2_b884]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_b884_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_b884_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1407_c11_1638]
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1638_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1638_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1638_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1407_c7_9e42]
signal t16_MUX_uxn_opcodes_h_l1407_c7_9e42_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1407_c7_9e42]
signal tmp8_MUX_uxn_opcodes_h_l1407_c7_9e42_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1407_c7_9e42]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_9e42_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1407_c7_9e42]
signal result_u16_value_MUX_uxn_opcodes_h_l1407_c7_9e42_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1407_c7_9e42]
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_9e42_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1407_c7_9e42]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_9e42_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1407_c7_9e42]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_9e42_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1407_c7_9e42]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_9e42_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_2fa3]
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2fa3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2fa3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2fa3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1410_c7_bc05]
signal t16_MUX_uxn_opcodes_h_l1410_c7_bc05_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1410_c7_bc05]
signal tmp8_MUX_uxn_opcodes_h_l1410_c7_bc05_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_bc05]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_bc05_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1410_c7_bc05]
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_bc05_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1410_c7_bc05]
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_bc05_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_bc05]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_bc05_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_bc05]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_bc05_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_bc05]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_bc05_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output : unsigned(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1412_c3_d24b]
signal CONST_SL_8_uxn_opcodes_h_l1412_c3_d24b_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1412_c3_d24b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1414_c11_1435]
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1435_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1435_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1435_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1414_c7_e8e2]
signal t16_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1414_c7_e8e2]
signal tmp8_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1414_c7_e8e2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1414_c7_e8e2]
signal result_u16_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1414_c7_e8e2]
signal result_u8_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1414_c7_e8e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1414_c7_e8e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1414_c7_e8e2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1415_c3_75e6]
signal BIN_OP_OR_uxn_opcodes_h_l1415_c3_75e6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1415_c3_75e6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1415_c3_75e6_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1416_c30_78c4]
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_78c4_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_78c4_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_78c4_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_78c4_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1419_c11_8de6]
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8de6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8de6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8de6_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1419_c7_c8e9]
signal tmp8_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1419_c7_c8e9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1419_c7_c8e9]
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1419_c7_c8e9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1419_c7_c8e9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1419_c7_c8e9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1422_c11_8c2a]
signal BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8c2a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8c2a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8c2a_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1422_c7_9c3d]
signal tmp8_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1422_c7_9c3d]
signal result_u8_value_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1422_c7_9c3d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1422_c7_9c3d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1422_c7_9c3d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output : unsigned(3 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_c942( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_vram_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a
BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_left,
BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_right,
BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_return_output);

-- t16_MUX_uxn_opcodes_h_l1394_c2_b884
t16_MUX_uxn_opcodes_h_l1394_c2_b884 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1394_c2_b884_cond,
t16_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue,
t16_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse,
t16_MUX_uxn_opcodes_h_l1394_c2_b884_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1394_c2_b884
tmp8_MUX_uxn_opcodes_h_l1394_c2_b884 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1394_c2_b884_cond,
tmp8_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue,
tmp8_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse,
tmp8_MUX_uxn_opcodes_h_l1394_c2_b884_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_b884
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_b884 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_b884_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_b884_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_b884
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_b884 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_b884_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_b884_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1394_c2_b884
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_b884 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_b884_cond,
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_b884_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_b884
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_b884 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_b884_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_b884_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_b884
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_b884 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_b884_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_b884_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_b884
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_b884 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_b884_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_b884_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_b884
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_b884 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_b884_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_b884_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1394_c2_b884
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_b884 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_b884_cond,
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_b884_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_b884
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_b884 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_b884_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_b884_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_b884
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_b884 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_b884_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_b884_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1638
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1638 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1638_left,
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1638_right,
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1638_return_output);

-- t16_MUX_uxn_opcodes_h_l1407_c7_9e42
t16_MUX_uxn_opcodes_h_l1407_c7_9e42 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1407_c7_9e42_cond,
t16_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue,
t16_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse,
t16_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1407_c7_9e42
tmp8_MUX_uxn_opcodes_h_l1407_c7_9e42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1407_c7_9e42_cond,
tmp8_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue,
tmp8_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse,
tmp8_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_9e42
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_9e42 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_9e42_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1407_c7_9e42
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_9e42 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_9e42_cond,
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1407_c7_9e42
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_9e42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_9e42_cond,
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_9e42
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_9e42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_9e42_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_9e42
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_9e42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_9e42_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_9e42
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_9e42 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_9e42_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2fa3
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2fa3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2fa3_left,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2fa3_right,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2fa3_return_output);

-- t16_MUX_uxn_opcodes_h_l1410_c7_bc05
t16_MUX_uxn_opcodes_h_l1410_c7_bc05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1410_c7_bc05_cond,
t16_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue,
t16_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse,
t16_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1410_c7_bc05
tmp8_MUX_uxn_opcodes_h_l1410_c7_bc05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1410_c7_bc05_cond,
tmp8_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue,
tmp8_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse,
tmp8_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_bc05
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_bc05 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_bc05_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1410_c7_bc05
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_bc05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_bc05_cond,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1410_c7_bc05
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_bc05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_bc05_cond,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_bc05
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_bc05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_bc05_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_bc05
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_bc05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_bc05_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_bc05
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_bc05 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_bc05_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1412_c3_d24b
CONST_SL_8_uxn_opcodes_h_l1412_c3_d24b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1412_c3_d24b_x,
CONST_SL_8_uxn_opcodes_h_l1412_c3_d24b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1435
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1435 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1435_left,
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1435_right,
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1435_return_output);

-- t16_MUX_uxn_opcodes_h_l1414_c7_e8e2
t16_MUX_uxn_opcodes_h_l1414_c7_e8e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond,
t16_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue,
t16_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse,
t16_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1414_c7_e8e2
tmp8_MUX_uxn_opcodes_h_l1414_c7_e8e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond,
tmp8_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue,
tmp8_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse,
tmp8_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_e8e2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_e8e2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1414_c7_e8e2
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_e8e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond,
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1414_c7_e8e2
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_e8e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_e8e2
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_e8e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_e8e2
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_e8e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_e8e2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_e8e2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1415_c3_75e6
BIN_OP_OR_uxn_opcodes_h_l1415_c3_75e6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1415_c3_75e6_left,
BIN_OP_OR_uxn_opcodes_h_l1415_c3_75e6_right,
BIN_OP_OR_uxn_opcodes_h_l1415_c3_75e6_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1416_c30_78c4
sp_relative_shift_uxn_opcodes_h_l1416_c30_78c4 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1416_c30_78c4_ins,
sp_relative_shift_uxn_opcodes_h_l1416_c30_78c4_x,
sp_relative_shift_uxn_opcodes_h_l1416_c30_78c4_y,
sp_relative_shift_uxn_opcodes_h_l1416_c30_78c4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8de6
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8de6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8de6_left,
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8de6_right,
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8de6_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1419_c7_c8e9
tmp8_MUX_uxn_opcodes_h_l1419_c7_c8e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond,
tmp8_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue,
tmp8_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse,
tmp8_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c8e9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c8e9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c8e9
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c8e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c8e9
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c8e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c8e9
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c8e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c8e9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c8e9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8c2a
BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8c2a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8c2a_left,
BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8c2a_right,
BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8c2a_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1422_c7_9c3d
tmp8_MUX_uxn_opcodes_h_l1422_c7_9c3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond,
tmp8_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue,
tmp8_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse,
tmp8_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1422_c7_9c3d
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_9c3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_9c3d
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_9c3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_9c3d
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_9c3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_9c3d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_9c3d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_return_output,
 t16_MUX_uxn_opcodes_h_l1394_c2_b884_return_output,
 tmp8_MUX_uxn_opcodes_h_l1394_c2_b884_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_b884_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_b884_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1394_c2_b884_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_b884_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_b884_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_b884_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_b884_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1394_c2_b884_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_b884_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_b884_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1638_return_output,
 t16_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output,
 tmp8_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2fa3_return_output,
 t16_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output,
 tmp8_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output,
 CONST_SL_8_uxn_opcodes_h_l1412_c3_d24b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1435_return_output,
 t16_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output,
 tmp8_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1415_c3_75e6_return_output,
 sp_relative_shift_uxn_opcodes_h_l1416_c30_78c4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8de6_return_output,
 tmp8_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8c2a_return_output,
 tmp8_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1394_c2_b884_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1394_c2_b884_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_b884_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_b884_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1399_c3_e5ed : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_b884_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_b884_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1394_c2_b884_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_b884_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_b884_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_b884_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_b884_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_b884_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_b884_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_b884_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_b884_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_0422 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_b884_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_b884_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1394_c2_b884_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_b884_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_b884_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_b884_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_b884_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1394_c2_b884_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_b884_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_b884_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1394_c2_b884_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_b884_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_b884_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1638_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1638_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1638_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1407_c7_9e42_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_9e42_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_9e42_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_9e42_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_9e42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_9e42_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_9e42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_2acf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_9e42_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2fa3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2fa3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2fa3_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1410_c7_bc05_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_bc05_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_bc05_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_bc05_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_bc05_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_bc05_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_bc05_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_bc05_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_d24b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_d24b_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1435_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1435_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1435_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_75e6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_75e6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_75e6_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_78c4_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_78c4_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_78c4_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_78c4_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8de6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8de6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8de6_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1420_c3_a264 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8c2a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8c2a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8c2a_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1425_c3_3dbc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1407_l1410_l1394_l1414_DUPLICATE_f7fc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1394_l1422_l1419_l1414_l1410_DUPLICATE_ee32_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_7918_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_ea9f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_8dfe_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1411_l1415_DUPLICATE_c3bb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1410_l1422_l1414_DUPLICATE_35c4_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1389_l1430_DUPLICATE_0e07_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_78c4_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1399_c3_e5ed := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1399_c3_e5ed;
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_78c4_y := resize(to_signed(-1, 2), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1425_c3_3dbc := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1425_c3_3dbc;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1420_c3_a264 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1420_c3_a264;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1638_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1435_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8de6_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2fa3_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_2acf := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_2acf;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_0422 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_0422;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8c2a_right := to_unsigned(5, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_78c4_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1638_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2fa3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1435_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8de6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8c2a_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_75e6_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1419_c11_8de6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8de6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8de6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8de6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8de6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8de6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8de6_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1394_c2_b884] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1394_c2_b884_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_ea9f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_ea9f_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1394_c2_b884] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1394_c2_b884_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1407_l1410_l1394_l1414_DUPLICATE_f7fc LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1407_l1410_l1394_l1414_DUPLICATE_f7fc_return_output := result.u16_value;

     -- sp_relative_shift[uxn_opcodes_h_l1416_c30_78c4] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1416_c30_78c4_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_78c4_ins;
     sp_relative_shift_uxn_opcodes_h_l1416_c30_78c4_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_78c4_x;
     sp_relative_shift_uxn_opcodes_h_l1416_c30_78c4_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_78c4_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_78c4_return_output := sp_relative_shift_uxn_opcodes_h_l1416_c30_78c4_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1394_c2_b884] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1394_c2_b884_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1394_c6_942a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1422_c11_8c2a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8c2a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8c2a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8c2a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8c2a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8c2a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8c2a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1407_c11_1638] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1638_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1638_left;
     BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1638_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1638_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1638_return_output := BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1638_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_8dfe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_8dfe_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1394_l1422_l1419_l1414_l1410_DUPLICATE_ee32 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1394_l1422_l1419_l1414_l1410_DUPLICATE_ee32_return_output := result.u8_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1411_l1415_DUPLICATE_c3bb LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1411_l1415_DUPLICATE_c3bb_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_7918 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_7918_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1414_c11_1435] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1435_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1435_left;
     BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1435_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1435_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1435_return_output := BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1435_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1394_c2_b884] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1394_c2_b884_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_2fa3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2fa3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2fa3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2fa3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2fa3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2fa3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2fa3_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1410_l1422_l1414_DUPLICATE_35c4 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1410_l1422_l1414_DUPLICATE_35c4_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_b884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_b884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_b884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_b884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_b884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_b884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_b884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_b884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_b884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_b884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1394_c2_b884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_b884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_942a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_9e42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1638_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_9e42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1638_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_9e42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1638_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_9e42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1638_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_9e42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1638_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_9e42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1638_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1407_c7_9e42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1638_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_9e42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1638_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_bc05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2fa3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_bc05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2fa3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_bc05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2fa3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_bc05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2fa3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_bc05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2fa3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_bc05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2fa3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1410_c7_bc05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2fa3_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_bc05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_2fa3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1435_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1435_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1435_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1435_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1435_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1435_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1435_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1435_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8de6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8de6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8de6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8de6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8de6_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8de6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8c2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8c2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8c2a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8c2a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8c2a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_75e6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1411_l1415_DUPLICATE_c3bb_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_d24b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1411_l1415_DUPLICATE_c3bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_7918_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_7918_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_7918_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1407_l1410_l1394_l1414_DUPLICATE_f7fc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1407_l1410_l1394_l1414_DUPLICATE_f7fc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1407_l1410_l1394_l1414_DUPLICATE_f7fc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1407_l1410_l1394_l1414_DUPLICATE_f7fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_8dfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_8dfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_8dfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_8dfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_8dfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_ea9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_ea9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_ea9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_ea9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_ea9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1410_l1422_l1414_DUPLICATE_35c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1410_l1422_l1414_DUPLICATE_35c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1410_l1422_l1414_DUPLICATE_35c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1410_l1422_l1414_DUPLICATE_35c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1394_l1422_l1419_l1414_l1410_DUPLICATE_ee32_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1394_l1422_l1419_l1414_l1410_DUPLICATE_ee32_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1394_l1422_l1419_l1414_l1410_DUPLICATE_ee32_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1394_l1422_l1419_l1414_l1410_DUPLICATE_ee32_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1394_l1422_l1419_l1414_l1410_DUPLICATE_ee32_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1394_l1422_l1419_l1414_l1410_DUPLICATE_ee32_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1394_c2_b884_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1394_c2_b884_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1394_c2_b884_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1394_c2_b884_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_78c4_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1394_c2_b884] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_b884_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_b884_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_b884_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_b884_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1415_c3_75e6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1415_c3_75e6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_75e6_left;
     BIN_OP_OR_uxn_opcodes_h_l1415_c3_75e6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_75e6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_75e6_return_output := BIN_OP_OR_uxn_opcodes_h_l1415_c3_75e6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1394_c2_b884] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_b884_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_b884_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_b884_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_b884_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1422_c7_9c3d] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond;
     tmp8_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output := tmp8_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1422_c7_9c3d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1412_c3_d24b] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1412_c3_d24b_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_d24b_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_d24b_return_output := CONST_SL_8_uxn_opcodes_h_l1412_c3_d24b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1419_c7_c8e9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1422_c7_9c3d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1394_c2_b884] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_b884_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_b884_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_b884_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_b884_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1394_c2_b884] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_b884_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_b884_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_b884_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_b884_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1422_c7_9c3d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1422_c7_9c3d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_9c3d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_9c3d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_9c3d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_75e6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_75e6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_d24b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_9c3d_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1414_c7_e8e2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output := result_u16_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1419_c7_c8e9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1419_c7_c8e9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1419_c7_c8e9] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond;
     tmp8_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output := tmp8_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1414_c7_e8e2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1419_c7_c8e9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output;

     -- t16_MUX[uxn_opcodes_h_l1414_c7_e8e2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond;
     t16_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue;
     t16_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output := t16_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1419_c7_c8e9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c8e9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c8e9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c8e9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c8e9_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_bc05] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_bc05_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_bc05_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1414_c7_e8e2] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond;
     tmp8_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output := tmp8_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1414_c7_e8e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1414_c7_e8e2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1410_c7_bc05] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1410_c7_bc05_cond <= VAR_t16_MUX_uxn_opcodes_h_l1410_c7_bc05_cond;
     t16_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue;
     t16_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output := t16_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1410_c7_bc05] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_bc05_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_bc05_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output := result_u16_value_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1414_c7_e8e2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1414_c7_e8e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_e8e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_e8e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_e8e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_e8e2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1407_c7_9e42] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_9e42_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_9e42_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_bc05] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_bc05_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_bc05_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_bc05] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_bc05_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_bc05_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output;

     -- t16_MUX[uxn_opcodes_h_l1407_c7_9e42] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1407_c7_9e42_cond <= VAR_t16_MUX_uxn_opcodes_h_l1407_c7_9e42_cond;
     t16_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue;
     t16_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output := t16_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1407_c7_9e42] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1407_c7_9e42_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_9e42_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output := result_u16_value_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1410_c7_bc05] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_bc05_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_bc05_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output := result_u8_value_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1410_c7_bc05] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1410_c7_bc05_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_bc05_cond;
     tmp8_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output := tmp8_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_bc05] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_bc05_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_bc05_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_bc05_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_bc05_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_bc05_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1394_c2_b884] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_b884_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_b884_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_b884_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_b884_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1394_c2_b884] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1394_c2_b884_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_b884_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_b884_return_output := result_u16_value_MUX_uxn_opcodes_h_l1394_c2_b884_return_output;

     -- t16_MUX[uxn_opcodes_h_l1394_c2_b884] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1394_c2_b884_cond <= VAR_t16_MUX_uxn_opcodes_h_l1394_c2_b884_cond;
     t16_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue;
     t16_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1394_c2_b884_return_output := t16_MUX_uxn_opcodes_h_l1394_c2_b884_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1407_c7_9e42] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_9e42_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_9e42_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1407_c7_9e42] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1407_c7_9e42_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_9e42_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output := result_u8_value_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1407_c7_9e42] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_9e42_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_9e42_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1407_c7_9e42] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1407_c7_9e42_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_9e42_cond;
     tmp8_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output := tmp8_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1407_c7_9e42] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_9e42_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_9e42_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_9e42_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_9e42_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1394_c2_b884_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_9e42_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1394_c2_b884] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_b884_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_b884_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_b884_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_b884_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1394_c2_b884] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_b884_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_b884_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_b884_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_b884_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1394_c2_b884] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1394_c2_b884_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_b884_cond;
     tmp8_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_b884_return_output := tmp8_MUX_uxn_opcodes_h_l1394_c2_b884_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1394_c2_b884] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_b884_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_b884_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_b884_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_b884_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1394_c2_b884] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1394_c2_b884_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_b884_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_b884_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_b884_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_b884_return_output := result_u8_value_MUX_uxn_opcodes_h_l1394_c2_b884_return_output;

     -- Submodule level 7
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_b884_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1389_l1430_DUPLICATE_0e07 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1389_l1430_DUPLICATE_0e07_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c942(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_b884_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_b884_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_b884_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_b884_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_b884_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_b884_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_b884_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_b884_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_b884_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_b884_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1389_l1430_DUPLICATE_0e07_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1389_l1430_DUPLICATE_0e07_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
