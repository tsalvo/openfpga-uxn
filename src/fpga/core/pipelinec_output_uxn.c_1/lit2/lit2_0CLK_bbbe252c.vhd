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
-- Submodules: 85
entity lit2_0CLK_bbbe252c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lit2_0CLK_bbbe252c;
architecture arch of lit2_0CLK_bbbe252c is
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
-- BIN_OP_EQ[uxn_opcodes_h_l245_c6_62e1]
signal BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l245_c1_7b0b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_7b0b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_7b0b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_7b0b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_7b0b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l245_c2_a527]
signal tmp16_MUX_uxn_opcodes_h_l245_c2_a527_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l245_c2_a527_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l245_c2_a527_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l245_c2_a527_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l245_c2_a527]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_a527_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_a527_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_a527_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_a527_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l245_c2_a527]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_a527_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_a527_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_a527_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_a527_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l245_c2_a527]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_a527_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_a527_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_a527_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_a527_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l245_c2_a527]
signal result_pc_MUX_uxn_opcodes_h_l245_c2_a527_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l245_c2_a527_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l245_c2_a527_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l245_c2_a527_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l245_c2_a527]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_a527_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_a527_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_a527_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_a527_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l245_c2_a527]
signal result_stack_value_MUX_uxn_opcodes_h_l245_c2_a527_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l245_c2_a527_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l245_c2_a527_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l245_c2_a527_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l245_c2_a527]
signal result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_a527_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_a527_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_a527_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_a527_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l245_c2_a527]
signal result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_a527_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_a527_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_a527_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_a527_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l245_c2_a527]
signal result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_a527_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_a527_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_a527_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_a527_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l245_c2_a527]
signal result_ram_addr_MUX_uxn_opcodes_h_l245_c2_a527_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l245_c2_a527_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l245_c2_a527_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l245_c2_a527_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l246_c3_2a1d[uxn_opcodes_h_l246_c3_2a1d]
signal printf_uxn_opcodes_h_l246_c3_2a1d_uxn_opcodes_h_l246_c3_2a1d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l251_c11_267d]
signal BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l251_c7_1514]
signal tmp16_MUX_uxn_opcodes_h_l251_c7_1514_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l251_c7_1514_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l251_c7_1514_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l251_c7_1514_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l251_c7_1514]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_1514_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_1514_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_1514_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_1514_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l251_c7_1514]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_1514_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_1514_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_1514_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_1514_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l251_c7_1514]
signal result_pc_MUX_uxn_opcodes_h_l251_c7_1514_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l251_c7_1514_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l251_c7_1514_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l251_c7_1514_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l251_c7_1514]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_1514_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_1514_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_1514_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_1514_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l251_c7_1514]
signal result_stack_value_MUX_uxn_opcodes_h_l251_c7_1514_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l251_c7_1514_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l251_c7_1514_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l251_c7_1514_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l251_c7_1514]
signal result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_1514_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_1514_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_1514_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_1514_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l251_c7_1514]
signal result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_1514_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_1514_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_1514_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_1514_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l251_c7_1514]
signal result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_1514_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_1514_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_1514_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_1514_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l251_c7_1514]
signal result_ram_addr_MUX_uxn_opcodes_h_l251_c7_1514_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l251_c7_1514_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l251_c7_1514_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l251_c7_1514_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l256_c11_3d1c]
signal BIN_OP_EQ_uxn_opcodes_h_l256_c11_3d1c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l256_c11_3d1c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l256_c11_3d1c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l256_c7_202c]
signal tmp16_MUX_uxn_opcodes_h_l256_c7_202c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l256_c7_202c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l256_c7_202c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l256_c7_202c_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l256_c7_202c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_202c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_202c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_202c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_202c_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l256_c7_202c]
signal result_pc_MUX_uxn_opcodes_h_l256_c7_202c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l256_c7_202c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l256_c7_202c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l256_c7_202c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l256_c7_202c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_202c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_202c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_202c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_202c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l256_c7_202c]
signal result_stack_value_MUX_uxn_opcodes_h_l256_c7_202c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l256_c7_202c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l256_c7_202c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l256_c7_202c_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l256_c7_202c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_202c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_202c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_202c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_202c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l256_c7_202c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_202c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_202c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_202c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_202c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l256_c7_202c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_202c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_202c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_202c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_202c_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l256_c7_202c]
signal result_ram_addr_MUX_uxn_opcodes_h_l256_c7_202c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l256_c7_202c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l256_c7_202c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l256_c7_202c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l259_c11_7cf1]
signal BIN_OP_EQ_uxn_opcodes_h_l259_c11_7cf1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l259_c11_7cf1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l259_c11_7cf1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l259_c7_fc17]
signal tmp16_MUX_uxn_opcodes_h_l259_c7_fc17_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l259_c7_fc17_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l259_c7_fc17]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_fc17_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_fc17_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l259_c7_fc17]
signal result_pc_MUX_uxn_opcodes_h_l259_c7_fc17_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l259_c7_fc17_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l259_c7_fc17]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_fc17_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_fc17_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l259_c7_fc17]
signal result_stack_value_MUX_uxn_opcodes_h_l259_c7_fc17_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l259_c7_fc17_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l259_c7_fc17]
signal result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_fc17_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_fc17_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l259_c7_fc17]
signal result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_fc17_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_fc17_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l259_c7_fc17]
signal result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_fc17_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_fc17_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l259_c7_fc17]
signal result_ram_addr_MUX_uxn_opcodes_h_l259_c7_fc17_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l259_c7_fc17_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l261_c3_896b]
signal CONST_SL_8_uxn_opcodes_h_l261_c3_896b_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l261_c3_896b_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l262_c21_b14b]
signal BIN_OP_PLUS_uxn_opcodes_h_l262_c21_b14b_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l262_c21_b14b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l262_c21_b14b_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l264_c11_2824]
signal BIN_OP_EQ_uxn_opcodes_h_l264_c11_2824_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l264_c11_2824_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l264_c11_2824_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l264_c7_9ea8]
signal tmp16_MUX_uxn_opcodes_h_l264_c7_9ea8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l264_c7_9ea8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_9ea8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l264_c7_9ea8]
signal result_pc_MUX_uxn_opcodes_h_l264_c7_9ea8_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l264_c7_9ea8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_9ea8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l264_c7_9ea8]
signal result_stack_value_MUX_uxn_opcodes_h_l264_c7_9ea8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l264_c7_9ea8]
signal result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_9ea8_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l264_c7_9ea8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_9ea8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l264_c7_9ea8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_9ea8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l264_c7_9ea8]
signal result_ram_addr_MUX_uxn_opcodes_h_l264_c7_9ea8_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l265_c21_128c]
signal BIN_OP_PLUS_uxn_opcodes_h_l265_c21_128c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l265_c21_128c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l265_c21_128c_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l267_c11_96be]
signal BIN_OP_EQ_uxn_opcodes_h_l267_c11_96be_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l267_c11_96be_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l267_c11_96be_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l267_c7_9e6a]
signal tmp16_MUX_uxn_opcodes_h_l267_c7_9e6a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l267_c7_9e6a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_9e6a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l267_c7_9e6a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_9e6a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l267_c7_9e6a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_9e6a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l267_c7_9e6a]
signal result_pc_MUX_uxn_opcodes_h_l267_c7_9e6a_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l267_c7_9e6a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_9e6a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l267_c7_9e6a]
signal result_stack_value_MUX_uxn_opcodes_h_l267_c7_9e6a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l267_c7_9e6a]
signal result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_9e6a_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l268_c3_91c0]
signal BIN_OP_OR_uxn_opcodes_h_l268_c3_91c0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l268_c3_91c0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l268_c3_91c0_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l271_c15_7b7b]
signal BIN_OP_PLUS_uxn_opcodes_h_l271_c15_7b7b_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l271_c15_7b7b_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l271_c15_7b7b_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l273_c11_b299]
signal BIN_OP_EQ_uxn_opcodes_h_l273_c11_b299_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l273_c11_b299_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l273_c11_b299_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l273_c7_a0d8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_a0d8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l273_c7_a0d8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_a0d8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l273_c7_a0d8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_a0d8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l273_c7_a0d8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_a0d8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l273_c7_a0d8]
signal result_stack_value_MUX_uxn_opcodes_h_l273_c7_a0d8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l279_c11_e89a]
signal BIN_OP_EQ_uxn_opcodes_h_l279_c11_e89a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l279_c11_e89a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l279_c11_e89a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l279_c7_9325]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_9325_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_9325_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_9325_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_9325_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l279_c7_9325]
signal result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_9325_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_9325_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_9325_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_9325_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l279_c7_9325]
signal result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_9325_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_9325_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_9325_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_9325_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l279_c7_9325]
signal result_stack_value_MUX_uxn_opcodes_h_l279_c7_9325_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l279_c7_9325_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l279_c7_9325_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l279_c7_9325_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l281_c34_5550]
signal CONST_SR_8_uxn_opcodes_h_l281_c34_5550_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l281_c34_5550_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_170c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
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
      base.is_pc_updated := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.pc := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.stack_value := ref_toks_6;
      base.is_ram_read := ref_toks_7;
      base.is_stack_write := ref_toks_8;
      base.is_opc_done := ref_toks_9;
      base.ram_addr := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1
BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_left,
BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_right,
BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_7b0b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_7b0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_7b0b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_7b0b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_7b0b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_7b0b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l245_c2_a527
tmp16_MUX_uxn_opcodes_h_l245_c2_a527 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l245_c2_a527_cond,
tmp16_MUX_uxn_opcodes_h_l245_c2_a527_iftrue,
tmp16_MUX_uxn_opcodes_h_l245_c2_a527_iffalse,
tmp16_MUX_uxn_opcodes_h_l245_c2_a527_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_a527
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_a527 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_a527_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_a527_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_a527_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_a527_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_a527
result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_a527 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_a527_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_a527_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_a527_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_a527_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_a527
result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_a527 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_a527_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_a527_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_a527_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_a527_return_output);

-- result_pc_MUX_uxn_opcodes_h_l245_c2_a527
result_pc_MUX_uxn_opcodes_h_l245_c2_a527 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l245_c2_a527_cond,
result_pc_MUX_uxn_opcodes_h_l245_c2_a527_iftrue,
result_pc_MUX_uxn_opcodes_h_l245_c2_a527_iffalse,
result_pc_MUX_uxn_opcodes_h_l245_c2_a527_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_a527
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_a527 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_a527_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_a527_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_a527_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_a527_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l245_c2_a527
result_stack_value_MUX_uxn_opcodes_h_l245_c2_a527 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l245_c2_a527_cond,
result_stack_value_MUX_uxn_opcodes_h_l245_c2_a527_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l245_c2_a527_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l245_c2_a527_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_a527
result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_a527 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_a527_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_a527_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_a527_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_a527_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_a527
result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_a527 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_a527_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_a527_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_a527_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_a527_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_a527
result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_a527 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_a527_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_a527_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_a527_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_a527_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l245_c2_a527
result_ram_addr_MUX_uxn_opcodes_h_l245_c2_a527 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l245_c2_a527_cond,
result_ram_addr_MUX_uxn_opcodes_h_l245_c2_a527_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l245_c2_a527_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l245_c2_a527_return_output);

-- printf_uxn_opcodes_h_l246_c3_2a1d_uxn_opcodes_h_l246_c3_2a1d
printf_uxn_opcodes_h_l246_c3_2a1d_uxn_opcodes_h_l246_c3_2a1d : entity work.printf_uxn_opcodes_h_l246_c3_2a1d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l246_c3_2a1d_uxn_opcodes_h_l246_c3_2a1d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d
BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d_left,
BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d_right,
BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l251_c7_1514
tmp16_MUX_uxn_opcodes_h_l251_c7_1514 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l251_c7_1514_cond,
tmp16_MUX_uxn_opcodes_h_l251_c7_1514_iftrue,
tmp16_MUX_uxn_opcodes_h_l251_c7_1514_iffalse,
tmp16_MUX_uxn_opcodes_h_l251_c7_1514_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_1514
result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_1514 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_1514_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_1514_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_1514_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_1514_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_1514
result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_1514 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_1514_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_1514_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_1514_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_1514_return_output);

-- result_pc_MUX_uxn_opcodes_h_l251_c7_1514
result_pc_MUX_uxn_opcodes_h_l251_c7_1514 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l251_c7_1514_cond,
result_pc_MUX_uxn_opcodes_h_l251_c7_1514_iftrue,
result_pc_MUX_uxn_opcodes_h_l251_c7_1514_iffalse,
result_pc_MUX_uxn_opcodes_h_l251_c7_1514_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_1514
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_1514 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_1514_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_1514_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_1514_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_1514_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l251_c7_1514
result_stack_value_MUX_uxn_opcodes_h_l251_c7_1514 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l251_c7_1514_cond,
result_stack_value_MUX_uxn_opcodes_h_l251_c7_1514_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l251_c7_1514_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l251_c7_1514_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_1514
result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_1514 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_1514_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_1514_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_1514_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_1514_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_1514
result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_1514 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_1514_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_1514_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_1514_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_1514_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_1514
result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_1514 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_1514_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_1514_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_1514_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_1514_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l251_c7_1514
result_ram_addr_MUX_uxn_opcodes_h_l251_c7_1514 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l251_c7_1514_cond,
result_ram_addr_MUX_uxn_opcodes_h_l251_c7_1514_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l251_c7_1514_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l251_c7_1514_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l256_c11_3d1c
BIN_OP_EQ_uxn_opcodes_h_l256_c11_3d1c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l256_c11_3d1c_left,
BIN_OP_EQ_uxn_opcodes_h_l256_c11_3d1c_right,
BIN_OP_EQ_uxn_opcodes_h_l256_c11_3d1c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l256_c7_202c
tmp16_MUX_uxn_opcodes_h_l256_c7_202c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l256_c7_202c_cond,
tmp16_MUX_uxn_opcodes_h_l256_c7_202c_iftrue,
tmp16_MUX_uxn_opcodes_h_l256_c7_202c_iffalse,
tmp16_MUX_uxn_opcodes_h_l256_c7_202c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_202c
result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_202c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_202c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_202c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_202c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_202c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l256_c7_202c
result_pc_MUX_uxn_opcodes_h_l256_c7_202c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l256_c7_202c_cond,
result_pc_MUX_uxn_opcodes_h_l256_c7_202c_iftrue,
result_pc_MUX_uxn_opcodes_h_l256_c7_202c_iffalse,
result_pc_MUX_uxn_opcodes_h_l256_c7_202c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_202c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_202c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_202c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_202c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_202c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_202c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l256_c7_202c
result_stack_value_MUX_uxn_opcodes_h_l256_c7_202c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l256_c7_202c_cond,
result_stack_value_MUX_uxn_opcodes_h_l256_c7_202c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l256_c7_202c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l256_c7_202c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_202c
result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_202c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_202c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_202c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_202c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_202c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_202c
result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_202c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_202c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_202c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_202c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_202c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_202c
result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_202c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_202c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_202c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_202c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_202c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l256_c7_202c
result_ram_addr_MUX_uxn_opcodes_h_l256_c7_202c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l256_c7_202c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l256_c7_202c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l256_c7_202c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l256_c7_202c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l259_c11_7cf1
BIN_OP_EQ_uxn_opcodes_h_l259_c11_7cf1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l259_c11_7cf1_left,
BIN_OP_EQ_uxn_opcodes_h_l259_c11_7cf1_right,
BIN_OP_EQ_uxn_opcodes_h_l259_c11_7cf1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l259_c7_fc17
tmp16_MUX_uxn_opcodes_h_l259_c7_fc17 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l259_c7_fc17_cond,
tmp16_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue,
tmp16_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse,
tmp16_MUX_uxn_opcodes_h_l259_c7_fc17_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_fc17
result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_fc17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_fc17_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_fc17_return_output);

-- result_pc_MUX_uxn_opcodes_h_l259_c7_fc17
result_pc_MUX_uxn_opcodes_h_l259_c7_fc17 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l259_c7_fc17_cond,
result_pc_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue,
result_pc_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse,
result_pc_MUX_uxn_opcodes_h_l259_c7_fc17_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_fc17
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_fc17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_fc17_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_fc17_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l259_c7_fc17
result_stack_value_MUX_uxn_opcodes_h_l259_c7_fc17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l259_c7_fc17_cond,
result_stack_value_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l259_c7_fc17_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_fc17
result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_fc17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_fc17_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_fc17_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_fc17
result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_fc17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_fc17_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_fc17_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_fc17
result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_fc17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_fc17_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_fc17_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l259_c7_fc17
result_ram_addr_MUX_uxn_opcodes_h_l259_c7_fc17 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l259_c7_fc17_cond,
result_ram_addr_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l259_c7_fc17_return_output);

-- CONST_SL_8_uxn_opcodes_h_l261_c3_896b
CONST_SL_8_uxn_opcodes_h_l261_c3_896b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l261_c3_896b_x,
CONST_SL_8_uxn_opcodes_h_l261_c3_896b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l262_c21_b14b
BIN_OP_PLUS_uxn_opcodes_h_l262_c21_b14b : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l262_c21_b14b_left,
BIN_OP_PLUS_uxn_opcodes_h_l262_c21_b14b_right,
BIN_OP_PLUS_uxn_opcodes_h_l262_c21_b14b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l264_c11_2824
BIN_OP_EQ_uxn_opcodes_h_l264_c11_2824 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l264_c11_2824_left,
BIN_OP_EQ_uxn_opcodes_h_l264_c11_2824_right,
BIN_OP_EQ_uxn_opcodes_h_l264_c11_2824_return_output);

-- tmp16_MUX_uxn_opcodes_h_l264_c7_9ea8
tmp16_MUX_uxn_opcodes_h_l264_c7_9ea8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l264_c7_9ea8_cond,
tmp16_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue,
tmp16_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse,
tmp16_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_9ea8
result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_9ea8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_9ea8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output);

-- result_pc_MUX_uxn_opcodes_h_l264_c7_9ea8
result_pc_MUX_uxn_opcodes_h_l264_c7_9ea8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l264_c7_9ea8_cond,
result_pc_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue,
result_pc_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse,
result_pc_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_9ea8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_9ea8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_9ea8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l264_c7_9ea8
result_stack_value_MUX_uxn_opcodes_h_l264_c7_9ea8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l264_c7_9ea8_cond,
result_stack_value_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_9ea8
result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_9ea8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_9ea8_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_9ea8
result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_9ea8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_9ea8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_9ea8
result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_9ea8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_9ea8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l264_c7_9ea8
result_ram_addr_MUX_uxn_opcodes_h_l264_c7_9ea8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l264_c7_9ea8_cond,
result_ram_addr_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l265_c21_128c
BIN_OP_PLUS_uxn_opcodes_h_l265_c21_128c : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l265_c21_128c_left,
BIN_OP_PLUS_uxn_opcodes_h_l265_c21_128c_right,
BIN_OP_PLUS_uxn_opcodes_h_l265_c21_128c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l267_c11_96be
BIN_OP_EQ_uxn_opcodes_h_l267_c11_96be : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l267_c11_96be_left,
BIN_OP_EQ_uxn_opcodes_h_l267_c11_96be_right,
BIN_OP_EQ_uxn_opcodes_h_l267_c11_96be_return_output);

-- tmp16_MUX_uxn_opcodes_h_l267_c7_9e6a
tmp16_MUX_uxn_opcodes_h_l267_c7_9e6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l267_c7_9e6a_cond,
tmp16_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue,
tmp16_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse,
tmp16_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_9e6a
result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_9e6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_9e6a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_9e6a
result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_9e6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_9e6a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_9e6a
result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_9e6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_9e6a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output);

-- result_pc_MUX_uxn_opcodes_h_l267_c7_9e6a
result_pc_MUX_uxn_opcodes_h_l267_c7_9e6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l267_c7_9e6a_cond,
result_pc_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue,
result_pc_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse,
result_pc_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_9e6a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_9e6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_9e6a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l267_c7_9e6a
result_stack_value_MUX_uxn_opcodes_h_l267_c7_9e6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l267_c7_9e6a_cond,
result_stack_value_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_9e6a
result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_9e6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_9e6a_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l268_c3_91c0
BIN_OP_OR_uxn_opcodes_h_l268_c3_91c0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l268_c3_91c0_left,
BIN_OP_OR_uxn_opcodes_h_l268_c3_91c0_right,
BIN_OP_OR_uxn_opcodes_h_l268_c3_91c0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l271_c15_7b7b
BIN_OP_PLUS_uxn_opcodes_h_l271_c15_7b7b : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l271_c15_7b7b_left,
BIN_OP_PLUS_uxn_opcodes_h_l271_c15_7b7b_right,
BIN_OP_PLUS_uxn_opcodes_h_l271_c15_7b7b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l273_c11_b299
BIN_OP_EQ_uxn_opcodes_h_l273_c11_b299 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l273_c11_b299_left,
BIN_OP_EQ_uxn_opcodes_h_l273_c11_b299_right,
BIN_OP_EQ_uxn_opcodes_h_l273_c11_b299_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_a0d8
result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_a0d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_a0d8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_a0d8
result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_a0d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_a0d8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_a0d8
result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_a0d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_a0d8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_a0d8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_a0d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_a0d8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l273_c7_a0d8
result_stack_value_MUX_uxn_opcodes_h_l273_c7_a0d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l273_c7_a0d8_cond,
result_stack_value_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l279_c11_e89a
BIN_OP_EQ_uxn_opcodes_h_l279_c11_e89a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l279_c11_e89a_left,
BIN_OP_EQ_uxn_opcodes_h_l279_c11_e89a_right,
BIN_OP_EQ_uxn_opcodes_h_l279_c11_e89a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_9325
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_9325 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_9325_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_9325_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_9325_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_9325_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_9325
result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_9325 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_9325_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_9325_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_9325_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_9325_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_9325
result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_9325 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_9325_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_9325_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_9325_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_9325_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l279_c7_9325
result_stack_value_MUX_uxn_opcodes_h_l279_c7_9325 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l279_c7_9325_cond,
result_stack_value_MUX_uxn_opcodes_h_l279_c7_9325_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l279_c7_9325_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l279_c7_9325_return_output);

-- CONST_SR_8_uxn_opcodes_h_l281_c34_5550
CONST_SR_8_uxn_opcodes_h_l281_c34_5550 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l281_c34_5550_x,
CONST_SR_8_uxn_opcodes_h_l281_c34_5550_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_7b0b_return_output,
 tmp16_MUX_uxn_opcodes_h_l245_c2_a527_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_a527_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_a527_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_a527_return_output,
 result_pc_MUX_uxn_opcodes_h_l245_c2_a527_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_a527_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l245_c2_a527_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_a527_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_a527_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_a527_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l245_c2_a527_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d_return_output,
 tmp16_MUX_uxn_opcodes_h_l251_c7_1514_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_1514_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_1514_return_output,
 result_pc_MUX_uxn_opcodes_h_l251_c7_1514_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_1514_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l251_c7_1514_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_1514_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_1514_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_1514_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l251_c7_1514_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l256_c11_3d1c_return_output,
 tmp16_MUX_uxn_opcodes_h_l256_c7_202c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_202c_return_output,
 result_pc_MUX_uxn_opcodes_h_l256_c7_202c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_202c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l256_c7_202c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_202c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_202c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_202c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l256_c7_202c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l259_c11_7cf1_return_output,
 tmp16_MUX_uxn_opcodes_h_l259_c7_fc17_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_fc17_return_output,
 result_pc_MUX_uxn_opcodes_h_l259_c7_fc17_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_fc17_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l259_c7_fc17_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_fc17_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_fc17_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_fc17_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l259_c7_fc17_return_output,
 CONST_SL_8_uxn_opcodes_h_l261_c3_896b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l262_c21_b14b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l264_c11_2824_return_output,
 tmp16_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output,
 result_pc_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l265_c21_128c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l267_c11_96be_return_output,
 tmp16_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output,
 result_pc_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l268_c3_91c0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l271_c15_7b7b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l273_c11_b299_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l279_c11_e89a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_9325_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_9325_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_9325_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l279_c7_9325_return_output,
 CONST_SR_8_uxn_opcodes_h_l281_c34_5550_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_7b0b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_7b0b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_7b0b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_7b0b_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_a527_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_a527_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_1514_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_a527_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_a527_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_a527_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_a527_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_1514_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_a527_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_a527_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_a527_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l248_c3_9489 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_a527_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l245_c2_a527_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_a527_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_a527_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_a527_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_a527_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_1514_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_a527_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_a527_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_a527_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_a527_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_1514_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_a527_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_a527_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_a527_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_a527_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_1514_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_a527_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_a527_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_a527_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_a527_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_1514_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_a527_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_a527_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_a527_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_a527_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_1514_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_a527_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_a527_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_a527_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_a527_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_1514_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_a527_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_a527_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_a527_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_a527_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_1514_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_a527_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_a527_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_a527_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_a527_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_1514_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_a527_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_a527_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l246_c3_2a1d_uxn_opcodes_h_l246_c3_2a1d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_1514_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_1514_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_202c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_1514_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_1514_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_1514_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_202c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_1514_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_1514_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_1514_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l251_c7_1514_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_1514_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_1514_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_1514_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_202c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_1514_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_1514_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_1514_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_202c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_1514_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_1514_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_1514_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_202c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_1514_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_1514_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_1514_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_202c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_1514_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_1514_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_1514_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_202c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_1514_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_1514_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_1514_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_202c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_1514_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_1514_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_1514_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_202c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_1514_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_3d1c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_3d1c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_3d1c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_202c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_202c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_fc17_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_202c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_202c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_202c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_fc17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_202c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_202c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_202c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_fc17_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_202c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_202c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_202c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_fc17_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_202c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_202c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_202c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_fc17_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_202c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_202c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_202c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_fc17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_202c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_202c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_202c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_fc17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_202c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_202c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_202c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_fc17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_202c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_202c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_202c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_fc17_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_202c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_7cf1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_7cf1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_7cf1_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_fc17_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_fc17_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_fc17_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_fc17_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_fc17_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_fc17_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_fc17_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_fc17_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l262_c3_c2a0 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_fc17_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l261_c3_896b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l261_c3_896b_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_b14b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_b14b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_b14b_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2824_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2824_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2824_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_9ea8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_9ea8_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_9ea8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_9ea8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_9ea8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_9ea8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_9ea8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_9ea8_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l265_c3_331a : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_9ea8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_128c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_128c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_128c_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_96be_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_96be_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_96be_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_9e6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_9e6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_9e6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_9e6a_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l271_c3_ada0 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_9e6a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_9e6a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_9e6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_9e6a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_91c0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_91c0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_91c0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_7b7b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_7b7b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_7b7b_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_b299_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_b299_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_b299_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_a0d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_9325_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_a0d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_9325_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_a0d8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l276_c3_47ae : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_9325_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_a0d8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_9325_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_a0d8_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l277_c24_a3e2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_e89a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_e89a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_e89a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_9325_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l280_c3_4c8f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_9325_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_9325_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_9325_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_9325_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_9325_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_9325_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_9325_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_9325_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_9325_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_9325_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_9325_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l281_c34_5550_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l281_c34_5550_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l281_c24_3878_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l273_l264_l259_l256_l251_l245_DUPLICATE_759a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l245_DUPLICATE_1a56_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_07e5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_723b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l267_l264_l259_l256_l245_DUPLICATE_4ce1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_7dbd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l264_l245_DUPLICATE_8556_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l273_l267_l264_l259_l256_l251_l279_DUPLICATE_cda2_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l260_l268_DUPLICATE_7184_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_170c_uxn_opcodes_h_l288_l240_DUPLICATE_00b4_return_output : opcode_result_t;
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
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_1514_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_1514_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l280_c3_4c8f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_9325_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l280_c3_4c8f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_128c_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_7b0b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_b299_right := to_unsigned(6, 3);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_e89a_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_b14b_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_7cf1_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_9325_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_9325_iffalse := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l248_c3_9489 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_a527_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l248_c3_9489;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l276_c3_47ae := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l276_c3_47ae;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_a527_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_96be_right := to_unsigned(5, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_7b7b_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_3d1c_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_a527_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2824_right := to_unsigned(4, 3);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_7b0b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_b14b_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_128c_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_7b7b_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_1514_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_202c_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_3d1c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_7cf1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2824_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_96be_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_b299_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_e89a_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_91c0_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l281_c34_5550_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_a527_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_1514_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_202c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l267_l264_l259_l256_l245_DUPLICATE_4ce1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l267_l264_l259_l256_l245_DUPLICATE_4ce1_return_output := result.is_ram_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_723b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_723b_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l251_c11_267d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d_left;
     BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d_return_output := BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_7dbd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_7dbd_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l273_l267_l264_l259_l256_l251_l279_DUPLICATE_cda2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l273_l267_l264_l259_l256_l251_l279_DUPLICATE_cda2_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l245_DUPLICATE_1a56 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l245_DUPLICATE_1a56_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l279_c11_e89a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l279_c11_e89a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_e89a_left;
     BIN_OP_EQ_uxn_opcodes_h_l279_c11_e89a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_e89a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_e89a_return_output := BIN_OP_EQ_uxn_opcodes_h_l279_c11_e89a_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l271_c15_7b7b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l271_c15_7b7b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_7b7b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l271_c15_7b7b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_7b7b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_7b7b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l271_c15_7b7b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l256_c11_3d1c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l256_c11_3d1c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_3d1c_left;
     BIN_OP_EQ_uxn_opcodes_h_l256_c11_3d1c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_3d1c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_3d1c_return_output := BIN_OP_EQ_uxn_opcodes_h_l256_c11_3d1c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l259_c11_7cf1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l259_c11_7cf1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_7cf1_left;
     BIN_OP_EQ_uxn_opcodes_h_l259_c11_7cf1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_7cf1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_7cf1_return_output := BIN_OP_EQ_uxn_opcodes_h_l259_c11_7cf1_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l281_c34_5550] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l281_c34_5550_x <= VAR_CONST_SR_8_uxn_opcodes_h_l281_c34_5550_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l281_c34_5550_return_output := CONST_SR_8_uxn_opcodes_h_l281_c34_5550_return_output;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l251_c7_1514] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l251_c7_1514_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l245_c6_62e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l277_c24_a3e2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l277_c24_a3e2_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_07e5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_07e5_return_output := result.stack_address_sp_offset;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l245_c2_a527] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l245_c2_a527_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l273_c11_b299] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l273_c11_b299_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_b299_left;
     BIN_OP_EQ_uxn_opcodes_h_l273_c11_b299_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_b299_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_b299_return_output := BIN_OP_EQ_uxn_opcodes_h_l273_c11_b299_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l264_l245_DUPLICATE_8556 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l264_l245_DUPLICATE_8556_return_output := result.ram_addr;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l260_l268_DUPLICATE_7184 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l260_l268_DUPLICATE_7184_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_PLUS[uxn_opcodes_h_l262_c21_b14b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l262_c21_b14b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_b14b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l262_c21_b14b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_b14b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_b14b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l262_c21_b14b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l267_c11_96be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l267_c11_96be_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_96be_left;
     BIN_OP_EQ_uxn_opcodes_h_l267_c11_96be_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_96be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_96be_return_output := BIN_OP_EQ_uxn_opcodes_h_l267_c11_96be_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l265_c21_128c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l265_c21_128c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_128c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l265_c21_128c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_128c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_128c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l265_c21_128c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l264_c11_2824] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l264_c11_2824_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2824_left;
     BIN_OP_EQ_uxn_opcodes_h_l264_c11_2824_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2824_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2824_return_output := BIN_OP_EQ_uxn_opcodes_h_l264_c11_2824_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l273_l264_l259_l256_l251_l245_DUPLICATE_759a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l273_l264_l259_l256_l251_l245_DUPLICATE_759a_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_7b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_a527_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_a527_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_a527_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_a527_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_a527_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_a527_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_a527_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_a527_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_a527_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_a527_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_a527_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_62e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_1514_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_1514_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_1514_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_1514_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_1514_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_1514_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_1514_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_1514_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_1514_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_1514_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_267d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_202c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_3d1c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_202c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_3d1c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_202c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_3d1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_202c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_3d1c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_202c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_3d1c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_202c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_3d1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_202c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_3d1c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_202c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_3d1c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_202c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_3d1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_fc17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_7cf1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_fc17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_7cf1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_fc17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_7cf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_fc17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_7cf1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_fc17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_7cf1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_fc17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_7cf1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_fc17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_7cf1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_fc17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_7cf1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_fc17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_7cf1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_9ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2824_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_9ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2824_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_9ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2824_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_9ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2824_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_9ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2824_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_9ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2824_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_9ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2824_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_9ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2824_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_9ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2824_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_9e6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_96be_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_9e6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_96be_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_9e6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_96be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_9e6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_96be_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_9e6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_96be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_9e6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_96be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_9e6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_96be_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_9e6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_96be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_a0d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_b299_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_a0d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_b299_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_a0d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_b299_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_a0d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_b299_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_a0d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_b299_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_9325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_e89a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_9325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_e89a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_9325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_e89a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_9325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_e89a_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l262_c3_c2a0 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_b14b_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l265_c3_331a := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_128c_return_output, 16);
     VAR_result_pc_uxn_opcodes_h_l271_c3_ada0 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_7b7b_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_91c0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l260_l268_DUPLICATE_7184_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l261_c3_896b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l260_l268_DUPLICATE_7184_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l277_c24_a3e2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_a527_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l245_DUPLICATE_1a56_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_1514_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l245_DUPLICATE_1a56_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_202c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l245_DUPLICATE_1a56_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l245_DUPLICATE_1a56_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l245_DUPLICATE_1a56_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l245_DUPLICATE_1a56_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_a527_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l264_l245_DUPLICATE_8556_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l264_l245_DUPLICATE_8556_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_1514_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l273_l267_l264_l259_l256_l251_l279_DUPLICATE_cda2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_202c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l273_l267_l264_l259_l256_l251_l279_DUPLICATE_cda2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l273_l267_l264_l259_l256_l251_l279_DUPLICATE_cda2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l273_l267_l264_l259_l256_l251_l279_DUPLICATE_cda2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l273_l267_l264_l259_l256_l251_l279_DUPLICATE_cda2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l273_l267_l264_l259_l256_l251_l279_DUPLICATE_cda2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_9325_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l273_l267_l264_l259_l256_l251_l279_DUPLICATE_cda2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_a527_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l273_l264_l259_l256_l251_l245_DUPLICATE_759a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_1514_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l273_l264_l259_l256_l251_l245_DUPLICATE_759a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_202c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l273_l264_l259_l256_l251_l245_DUPLICATE_759a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l273_l264_l259_l256_l251_l245_DUPLICATE_759a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l273_l264_l259_l256_l251_l245_DUPLICATE_759a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l273_l264_l259_l256_l251_l245_DUPLICATE_759a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_a527_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l267_l264_l259_l256_l245_DUPLICATE_4ce1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_202c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l267_l264_l259_l256_l245_DUPLICATE_4ce1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l267_l264_l259_l256_l245_DUPLICATE_4ce1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l267_l264_l259_l256_l245_DUPLICATE_4ce1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l267_l264_l259_l256_l245_DUPLICATE_4ce1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_a527_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_7dbd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_1514_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_7dbd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_202c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_7dbd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_7dbd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_7dbd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_7dbd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_9325_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_7dbd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_a527_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_07e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_1514_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_07e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_202c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_07e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_07e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_07e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_07e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_9325_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_07e5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_a527_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_723b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_1514_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_723b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_202c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_723b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_723b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_723b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_723b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_9325_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_723b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_1514_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l251_c7_1514_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_a527_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l245_c2_a527_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue := VAR_result_pc_uxn_opcodes_h_l271_c3_ada0;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l262_c3_c2a0;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l265_c3_331a;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l251_c7_1514] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_1514_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_1514_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_1514_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_1514_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_1514_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_1514_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_1514_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_1514_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l264_c7_9ea8] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l264_c7_9ea8_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_9ea8_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output := result_ram_addr_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l279_c7_9325] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_9325_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_9325_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_9325_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_9325_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_9325_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_9325_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_9325_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_9325_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l273_c7_a0d8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_a0d8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_a0d8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l279_c7_9325] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_9325_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_9325_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_9325_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_9325_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_9325_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_9325_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_9325_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_9325_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l281_c24_3878] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l281_c24_3878_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l281_c34_5550_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l268_c3_91c0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l268_c3_91c0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_91c0_left;
     BIN_OP_OR_uxn_opcodes_h_l268_c3_91c0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_91c0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_91c0_return_output := BIN_OP_OR_uxn_opcodes_h_l268_c3_91c0_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l261_c3_896b] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l261_c3_896b_x <= VAR_CONST_SL_8_uxn_opcodes_h_l261_c3_896b_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l261_c3_896b_return_output := CONST_SL_8_uxn_opcodes_h_l261_c3_896b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l279_c7_9325] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_9325_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_9325_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_9325_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_9325_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_9325_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_9325_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_9325_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_9325_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l245_c2_a527] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_a527_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_a527_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_a527_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_a527_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_a527_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_a527_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_a527_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_a527_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l267_c7_9e6a] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_9e6a_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_9e6a_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l267_c7_9e6a] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l267_c7_9e6a_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_9e6a_cond;
     result_pc_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue;
     result_pc_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output := result_pc_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l245_c1_7b0b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_7b0b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_7b0b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_7b0b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_7b0b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_7b0b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_7b0b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_7b0b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_7b0b_return_output;

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_91c0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_9325_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l281_c24_3878_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l261_c3_896b_return_output;
     VAR_printf_uxn_opcodes_h_l246_c3_2a1d_uxn_opcodes_h_l246_c3_2a1d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_7b0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_9325_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_a527_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_1514_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_9325_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_9325_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l279_c7_9325] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l279_c7_9325_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_9325_cond;
     result_stack_value_MUX_uxn_opcodes_h_l279_c7_9325_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_9325_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l279_c7_9325_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_9325_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_9325_return_output := result_stack_value_MUX_uxn_opcodes_h_l279_c7_9325_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l245_c2_a527] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_a527_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_a527_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_a527_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_a527_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_a527_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_a527_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_a527_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_a527_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l267_c7_9e6a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l267_c7_9e6a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_9e6a_cond;
     tmp16_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output := tmp16_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l273_c7_a0d8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_a0d8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_a0d8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l264_c7_9ea8] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_9ea8_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_9ea8_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output;

     -- printf_uxn_opcodes_h_l246_c3_2a1d[uxn_opcodes_h_l246_c3_2a1d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l246_c3_2a1d_uxn_opcodes_h_l246_c3_2a1d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l246_c3_2a1d_uxn_opcodes_h_l246_c3_2a1d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_pc_MUX[uxn_opcodes_h_l264_c7_9ea8] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l264_c7_9ea8_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_9ea8_cond;
     result_pc_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue;
     result_pc_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output := result_pc_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l273_c7_a0d8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_a0d8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_a0d8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l259_c7_fc17] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l259_c7_fc17_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_fc17_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_fc17_return_output := result_ram_addr_MUX_uxn_opcodes_h_l259_c7_fc17_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l267_c7_9e6a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_9e6a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_9e6a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l273_c7_a0d8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_a0d8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_a0d8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_202c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_fc17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_9325_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l256_c7_202c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l256_c7_202c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_202c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l256_c7_202c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_202c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l256_c7_202c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_202c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_202c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l256_c7_202c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l259_c7_fc17] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l259_c7_fc17_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_fc17_cond;
     result_pc_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue;
     result_pc_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_fc17_return_output := result_pc_MUX_uxn_opcodes_h_l259_c7_fc17_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l273_c7_a0d8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l273_c7_a0d8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_a0d8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_a0d8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_a0d8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output := result_stack_value_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l267_c7_9e6a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_9e6a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_9e6a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l267_c7_9e6a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_9e6a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_9e6a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l264_c7_9ea8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l264_c7_9ea8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_9ea8_cond;
     tmp16_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output := tmp16_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l264_c7_9ea8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_9ea8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_9ea8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l267_c7_9e6a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_9e6a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_9e6a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l259_c7_fc17] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_fc17_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_fc17_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_fc17_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_fc17_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_202c_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_fc17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_202c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_fc17_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_1514_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_202c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_a0d8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l267_c7_9e6a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l267_c7_9e6a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_9e6a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_9e6a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_9e6a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output := result_stack_value_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l259_c7_fc17] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_fc17_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_fc17_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_fc17_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_fc17_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l264_c7_9ea8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_9ea8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_9ea8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l256_c7_202c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l256_c7_202c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_202c_cond;
     result_pc_MUX_uxn_opcodes_h_l256_c7_202c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_202c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l256_c7_202c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_202c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_202c_return_output := result_pc_MUX_uxn_opcodes_h_l256_c7_202c_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l256_c7_202c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_202c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_202c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_202c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_202c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_202c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_202c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_202c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_202c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l259_c7_fc17] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l259_c7_fc17_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_fc17_cond;
     tmp16_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue;
     tmp16_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_fc17_return_output := tmp16_MUX_uxn_opcodes_h_l259_c7_fc17_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l251_c7_1514] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l251_c7_1514_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_1514_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l251_c7_1514_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_1514_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l251_c7_1514_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_1514_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_1514_return_output := result_ram_addr_MUX_uxn_opcodes_h_l251_c7_1514_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l264_c7_9ea8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_9ea8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_9ea8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l264_c7_9ea8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_9ea8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_9ea8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_202c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_fc17_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_1514_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_202c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_1514_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_202c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_a527_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_1514_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_9e6a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_202c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_fc17_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l251_c7_1514] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l251_c7_1514_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_1514_cond;
     result_pc_MUX_uxn_opcodes_h_l251_c7_1514_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_1514_iftrue;
     result_pc_MUX_uxn_opcodes_h_l251_c7_1514_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_1514_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_1514_return_output := result_pc_MUX_uxn_opcodes_h_l251_c7_1514_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l256_c7_202c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l256_c7_202c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_202c_cond;
     tmp16_MUX_uxn_opcodes_h_l256_c7_202c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_202c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l256_c7_202c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_202c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_202c_return_output := tmp16_MUX_uxn_opcodes_h_l256_c7_202c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l264_c7_9ea8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l264_c7_9ea8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_9ea8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_9ea8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_9ea8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output := result_stack_value_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l245_c2_a527] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l245_c2_a527_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_a527_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l245_c2_a527_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_a527_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l245_c2_a527_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_a527_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_a527_return_output := result_ram_addr_MUX_uxn_opcodes_h_l245_c2_a527_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l256_c7_202c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_202c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_202c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_202c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_202c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_202c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_202c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_202c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_202c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l259_c7_fc17] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_fc17_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_fc17_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_fc17_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_fc17_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l259_c7_fc17] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_fc17_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_fc17_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_fc17_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_fc17_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l259_c7_fc17] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_fc17_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_fc17_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_fc17_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_fc17_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l251_c7_1514] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_1514_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_1514_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_1514_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_1514_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_1514_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_1514_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_1514_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_1514_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_202c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_fc17_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_1514_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_202c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_a527_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_1514_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_202c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_fc17_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_a527_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_1514_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_202c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_fc17_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_9ea8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_1514_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_202c_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l259_c7_fc17] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l259_c7_fc17_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_fc17_cond;
     result_stack_value_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_fc17_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_fc17_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_fc17_return_output := result_stack_value_MUX_uxn_opcodes_h_l259_c7_fc17_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l245_c2_a527] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_a527_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_a527_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_a527_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_a527_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_a527_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_a527_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_a527_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_a527_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l256_c7_202c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_202c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_202c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_202c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_202c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_202c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_202c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_202c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_202c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l251_c7_1514] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_1514_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_1514_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_1514_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_1514_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_1514_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_1514_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_1514_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_1514_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l256_c7_202c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_202c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_202c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_202c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_202c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_202c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_202c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_202c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_202c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l251_c7_1514] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l251_c7_1514_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_1514_cond;
     tmp16_MUX_uxn_opcodes_h_l251_c7_1514_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_1514_iftrue;
     tmp16_MUX_uxn_opcodes_h_l251_c7_1514_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_1514_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_1514_return_output := tmp16_MUX_uxn_opcodes_h_l251_c7_1514_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l256_c7_202c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_202c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_202c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_202c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_202c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_202c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_202c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_202c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_202c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l245_c2_a527] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l245_c2_a527_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_a527_cond;
     result_pc_MUX_uxn_opcodes_h_l245_c2_a527_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_a527_iftrue;
     result_pc_MUX_uxn_opcodes_h_l245_c2_a527_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_a527_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_a527_return_output := result_pc_MUX_uxn_opcodes_h_l245_c2_a527_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_1514_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_202c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_a527_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_1514_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_1514_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_202c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_1514_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_202c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_202c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_fc17_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_a527_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_1514_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l251_c7_1514] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_1514_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_1514_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_1514_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_1514_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_1514_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_1514_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_1514_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_1514_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l251_c7_1514] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_1514_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_1514_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_1514_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_1514_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_1514_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_1514_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_1514_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_1514_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l245_c2_a527] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_a527_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_a527_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_a527_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_a527_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_a527_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_a527_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_a527_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_a527_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l251_c7_1514] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_1514_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_1514_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_1514_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_1514_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_1514_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_1514_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_1514_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_1514_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l256_c7_202c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l256_c7_202c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_202c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l256_c7_202c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_202c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l256_c7_202c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_202c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_202c_return_output := result_stack_value_MUX_uxn_opcodes_h_l256_c7_202c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l245_c2_a527] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l245_c2_a527_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_a527_cond;
     tmp16_MUX_uxn_opcodes_h_l245_c2_a527_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_a527_iftrue;
     tmp16_MUX_uxn_opcodes_h_l245_c2_a527_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_a527_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_a527_return_output := tmp16_MUX_uxn_opcodes_h_l245_c2_a527_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_a527_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_1514_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_a527_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_1514_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_a527_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_1514_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_1514_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_202c_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_a527_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l251_c7_1514] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l251_c7_1514_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_1514_cond;
     result_stack_value_MUX_uxn_opcodes_h_l251_c7_1514_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_1514_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l251_c7_1514_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_1514_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_1514_return_output := result_stack_value_MUX_uxn_opcodes_h_l251_c7_1514_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l245_c2_a527] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_a527_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_a527_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_a527_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_a527_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_a527_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_a527_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_a527_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_a527_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l245_c2_a527] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_a527_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_a527_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_a527_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_a527_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_a527_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_a527_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_a527_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_a527_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l245_c2_a527] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_a527_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_a527_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_a527_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_a527_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_a527_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_a527_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_a527_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_a527_return_output;

     -- Submodule level 9
     VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_a527_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_1514_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l245_c2_a527] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l245_c2_a527_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_a527_cond;
     result_stack_value_MUX_uxn_opcodes_h_l245_c2_a527_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_a527_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l245_c2_a527_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_a527_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_a527_return_output := result_stack_value_MUX_uxn_opcodes_h_l245_c2_a527_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_170c_uxn_opcodes_h_l288_l240_DUPLICATE_00b4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_170c_uxn_opcodes_h_l288_l240_DUPLICATE_00b4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_170c(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_a527_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_a527_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_a527_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_a527_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_a527_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_a527_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_a527_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_a527_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_a527_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_a527_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_170c_uxn_opcodes_h_l288_l240_DUPLICATE_00b4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_170c_uxn_opcodes_h_l288_l240_DUPLICATE_00b4_return_output;
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
