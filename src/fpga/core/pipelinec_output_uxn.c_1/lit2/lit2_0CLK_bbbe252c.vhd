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
-- BIN_OP_EQ[uxn_opcodes_h_l245_c6_3a62]
signal BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l245_c1_f548]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_f548_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_f548_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_f548_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_f548_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l245_c2_6328]
signal tmp16_MUX_uxn_opcodes_h_l245_c2_6328_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l245_c2_6328_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l245_c2_6328_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l245_c2_6328_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l245_c2_6328]
signal result_stack_value_MUX_uxn_opcodes_h_l245_c2_6328_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l245_c2_6328_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l245_c2_6328_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l245_c2_6328_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l245_c2_6328]
signal result_ram_addr_MUX_uxn_opcodes_h_l245_c2_6328_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l245_c2_6328_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l245_c2_6328_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l245_c2_6328_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l245_c2_6328]
signal result_pc_MUX_uxn_opcodes_h_l245_c2_6328_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l245_c2_6328_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l245_c2_6328_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l245_c2_6328_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l245_c2_6328]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_6328_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_6328_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_6328_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_6328_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l245_c2_6328]
signal result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_6328_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_6328_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_6328_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_6328_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l245_c2_6328]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_6328_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_6328_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_6328_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_6328_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l245_c2_6328]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_6328_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_6328_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_6328_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_6328_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l245_c2_6328]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_6328_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_6328_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_6328_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_6328_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l245_c2_6328]
signal result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_6328_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_6328_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_6328_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_6328_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l245_c2_6328]
signal result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_6328_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_6328_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_6328_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_6328_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l246_c3_54f2[uxn_opcodes_h_l246_c3_54f2]
signal printf_uxn_opcodes_h_l246_c3_54f2_uxn_opcodes_h_l246_c3_54f2_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l251_c11_5304]
signal BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l251_c7_5495]
signal tmp16_MUX_uxn_opcodes_h_l251_c7_5495_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l251_c7_5495_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l251_c7_5495_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l251_c7_5495_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l251_c7_5495]
signal result_stack_value_MUX_uxn_opcodes_h_l251_c7_5495_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l251_c7_5495_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l251_c7_5495_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l251_c7_5495_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l251_c7_5495]
signal result_ram_addr_MUX_uxn_opcodes_h_l251_c7_5495_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l251_c7_5495_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l251_c7_5495_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l251_c7_5495_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l251_c7_5495]
signal result_pc_MUX_uxn_opcodes_h_l251_c7_5495_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l251_c7_5495_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l251_c7_5495_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l251_c7_5495_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l251_c7_5495]
signal result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_5495_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_5495_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_5495_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_5495_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l251_c7_5495]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_5495_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_5495_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_5495_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_5495_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l251_c7_5495]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_5495_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_5495_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_5495_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_5495_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l251_c7_5495]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_5495_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_5495_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_5495_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_5495_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l251_c7_5495]
signal result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_5495_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_5495_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_5495_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_5495_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l251_c7_5495]
signal result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_5495_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_5495_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_5495_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_5495_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l256_c11_07bb]
signal BIN_OP_EQ_uxn_opcodes_h_l256_c11_07bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l256_c11_07bb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l256_c11_07bb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l256_c7_0d8c]
signal tmp16_MUX_uxn_opcodes_h_l256_c7_0d8c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l256_c7_0d8c]
signal result_stack_value_MUX_uxn_opcodes_h_l256_c7_0d8c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l256_c7_0d8c]
signal result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0d8c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l256_c7_0d8c]
signal result_pc_MUX_uxn_opcodes_h_l256_c7_0d8c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l256_c7_0d8c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0d8c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l256_c7_0d8c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0d8c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l256_c7_0d8c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0d8c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l256_c7_0d8c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0d8c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l256_c7_0d8c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0d8c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l259_c11_798d]
signal BIN_OP_EQ_uxn_opcodes_h_l259_c11_798d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l259_c11_798d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l259_c11_798d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l259_c7_f73d]
signal tmp16_MUX_uxn_opcodes_h_l259_c7_f73d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l259_c7_f73d_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l259_c7_f73d]
signal result_stack_value_MUX_uxn_opcodes_h_l259_c7_f73d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l259_c7_f73d_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l259_c7_f73d]
signal result_ram_addr_MUX_uxn_opcodes_h_l259_c7_f73d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l259_c7_f73d_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l259_c7_f73d]
signal result_pc_MUX_uxn_opcodes_h_l259_c7_f73d_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l259_c7_f73d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l259_c7_f73d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_f73d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_f73d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l259_c7_f73d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_f73d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_f73d_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l259_c7_f73d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_f73d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_f73d_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l259_c7_f73d]
signal result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_f73d_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_f73d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l259_c7_f73d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_f73d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_f73d_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l261_c3_be62]
signal CONST_SL_8_uxn_opcodes_h_l261_c3_be62_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l261_c3_be62_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l262_c21_ccbd]
signal BIN_OP_PLUS_uxn_opcodes_h_l262_c21_ccbd_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l262_c21_ccbd_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l262_c21_ccbd_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l264_c11_8e3b]
signal BIN_OP_EQ_uxn_opcodes_h_l264_c11_8e3b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l264_c11_8e3b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l264_c11_8e3b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l264_c7_a97d]
signal tmp16_MUX_uxn_opcodes_h_l264_c7_a97d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l264_c7_a97d_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l264_c7_a97d]
signal result_stack_value_MUX_uxn_opcodes_h_l264_c7_a97d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l264_c7_a97d_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l264_c7_a97d]
signal result_ram_addr_MUX_uxn_opcodes_h_l264_c7_a97d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l264_c7_a97d_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l264_c7_a97d]
signal result_pc_MUX_uxn_opcodes_h_l264_c7_a97d_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l264_c7_a97d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l264_c7_a97d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_a97d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_a97d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l264_c7_a97d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_a97d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_a97d_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l264_c7_a97d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_a97d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_a97d_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l264_c7_a97d]
signal result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_a97d_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_a97d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l264_c7_a97d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_a97d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_a97d_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l265_c21_7a37]
signal BIN_OP_PLUS_uxn_opcodes_h_l265_c21_7a37_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l265_c21_7a37_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l265_c21_7a37_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l267_c11_f56b]
signal BIN_OP_EQ_uxn_opcodes_h_l267_c11_f56b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l267_c11_f56b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l267_c11_f56b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l267_c7_444c]
signal tmp16_MUX_uxn_opcodes_h_l267_c7_444c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l267_c7_444c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l267_c7_444c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l267_c7_444c_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l267_c7_444c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_444c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_444c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_444c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_444c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l267_c7_444c]
signal result_stack_value_MUX_uxn_opcodes_h_l267_c7_444c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l267_c7_444c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l267_c7_444c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l267_c7_444c_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l267_c7_444c]
signal result_pc_MUX_uxn_opcodes_h_l267_c7_444c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l267_c7_444c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l267_c7_444c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l267_c7_444c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l267_c7_444c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_444c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_444c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_444c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_444c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l267_c7_444c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_444c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_444c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_444c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_444c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l267_c7_444c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_444c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_444c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_444c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_444c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l267_c7_444c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_444c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_444c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_444c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_444c_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l268_c3_759d]
signal BIN_OP_OR_uxn_opcodes_h_l268_c3_759d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l268_c3_759d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l268_c3_759d_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l271_c15_385c]
signal BIN_OP_PLUS_uxn_opcodes_h_l271_c15_385c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l271_c15_385c_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l271_c15_385c_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l273_c11_18e2]
signal BIN_OP_EQ_uxn_opcodes_h_l273_c11_18e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l273_c11_18e2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l273_c11_18e2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l273_c7_e110]
signal result_stack_value_MUX_uxn_opcodes_h_l273_c7_e110_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l273_c7_e110_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l273_c7_e110_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l273_c7_e110_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l273_c7_e110]
signal result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_e110_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_e110_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_e110_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_e110_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l273_c7_e110]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_e110_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_e110_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_e110_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_e110_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l273_c7_e110]
signal result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_e110_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_e110_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_e110_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_e110_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l273_c7_e110]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_e110_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_e110_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_e110_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_e110_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l279_c11_ecdd]
signal BIN_OP_EQ_uxn_opcodes_h_l279_c11_ecdd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l279_c11_ecdd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l279_c11_ecdd_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l279_c7_710a]
signal result_stack_value_MUX_uxn_opcodes_h_l279_c7_710a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l279_c7_710a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l279_c7_710a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l279_c7_710a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l279_c7_710a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_710a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_710a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_710a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_710a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l279_c7_710a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_710a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_710a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_710a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_710a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l279_c7_710a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_710a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_710a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_710a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_710a_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l281_c34_3f81]
signal CONST_SR_8_uxn_opcodes_h_l281_c34_3f81_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l281_c34_3f81_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_2e50( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
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
      base.stack_value := ref_toks_1;
      base.ram_addr := ref_toks_2;
      base.pc := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_sp_shift := ref_toks_8;
      base.is_ram_read := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62
BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_left,
BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_right,
BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_f548
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_f548 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_f548_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_f548_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_f548_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_f548_return_output);

-- tmp16_MUX_uxn_opcodes_h_l245_c2_6328
tmp16_MUX_uxn_opcodes_h_l245_c2_6328 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l245_c2_6328_cond,
tmp16_MUX_uxn_opcodes_h_l245_c2_6328_iftrue,
tmp16_MUX_uxn_opcodes_h_l245_c2_6328_iffalse,
tmp16_MUX_uxn_opcodes_h_l245_c2_6328_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l245_c2_6328
result_stack_value_MUX_uxn_opcodes_h_l245_c2_6328 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l245_c2_6328_cond,
result_stack_value_MUX_uxn_opcodes_h_l245_c2_6328_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l245_c2_6328_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l245_c2_6328_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l245_c2_6328
result_ram_addr_MUX_uxn_opcodes_h_l245_c2_6328 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l245_c2_6328_cond,
result_ram_addr_MUX_uxn_opcodes_h_l245_c2_6328_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l245_c2_6328_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l245_c2_6328_return_output);

-- result_pc_MUX_uxn_opcodes_h_l245_c2_6328
result_pc_MUX_uxn_opcodes_h_l245_c2_6328 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l245_c2_6328_cond,
result_pc_MUX_uxn_opcodes_h_l245_c2_6328_iftrue,
result_pc_MUX_uxn_opcodes_h_l245_c2_6328_iffalse,
result_pc_MUX_uxn_opcodes_h_l245_c2_6328_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_6328
result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_6328 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_6328_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_6328_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_6328_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_6328_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_6328
result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_6328 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_6328_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_6328_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_6328_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_6328_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_6328
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_6328 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_6328_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_6328_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_6328_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_6328_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_6328
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_6328 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_6328_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_6328_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_6328_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_6328_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_6328
result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_6328 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_6328_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_6328_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_6328_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_6328_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_6328
result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_6328 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_6328_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_6328_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_6328_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_6328_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_6328
result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_6328 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_6328_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_6328_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_6328_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_6328_return_output);

-- printf_uxn_opcodes_h_l246_c3_54f2_uxn_opcodes_h_l246_c3_54f2
printf_uxn_opcodes_h_l246_c3_54f2_uxn_opcodes_h_l246_c3_54f2 : entity work.printf_uxn_opcodes_h_l246_c3_54f2_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l246_c3_54f2_uxn_opcodes_h_l246_c3_54f2_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304
BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304_left,
BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304_right,
BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304_return_output);

-- tmp16_MUX_uxn_opcodes_h_l251_c7_5495
tmp16_MUX_uxn_opcodes_h_l251_c7_5495 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l251_c7_5495_cond,
tmp16_MUX_uxn_opcodes_h_l251_c7_5495_iftrue,
tmp16_MUX_uxn_opcodes_h_l251_c7_5495_iffalse,
tmp16_MUX_uxn_opcodes_h_l251_c7_5495_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l251_c7_5495
result_stack_value_MUX_uxn_opcodes_h_l251_c7_5495 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l251_c7_5495_cond,
result_stack_value_MUX_uxn_opcodes_h_l251_c7_5495_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l251_c7_5495_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l251_c7_5495_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l251_c7_5495
result_ram_addr_MUX_uxn_opcodes_h_l251_c7_5495 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l251_c7_5495_cond,
result_ram_addr_MUX_uxn_opcodes_h_l251_c7_5495_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l251_c7_5495_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l251_c7_5495_return_output);

-- result_pc_MUX_uxn_opcodes_h_l251_c7_5495
result_pc_MUX_uxn_opcodes_h_l251_c7_5495 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l251_c7_5495_cond,
result_pc_MUX_uxn_opcodes_h_l251_c7_5495_iftrue,
result_pc_MUX_uxn_opcodes_h_l251_c7_5495_iffalse,
result_pc_MUX_uxn_opcodes_h_l251_c7_5495_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_5495
result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_5495 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_5495_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_5495_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_5495_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_5495_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_5495
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_5495 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_5495_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_5495_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_5495_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_5495_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_5495
result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_5495 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_5495_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_5495_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_5495_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_5495_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_5495
result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_5495 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_5495_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_5495_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_5495_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_5495_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_5495
result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_5495 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_5495_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_5495_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_5495_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_5495_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_5495
result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_5495 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_5495_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_5495_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_5495_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_5495_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l256_c11_07bb
BIN_OP_EQ_uxn_opcodes_h_l256_c11_07bb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l256_c11_07bb_left,
BIN_OP_EQ_uxn_opcodes_h_l256_c11_07bb_right,
BIN_OP_EQ_uxn_opcodes_h_l256_c11_07bb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l256_c7_0d8c
tmp16_MUX_uxn_opcodes_h_l256_c7_0d8c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l256_c7_0d8c_cond,
tmp16_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue,
tmp16_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse,
tmp16_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l256_c7_0d8c
result_stack_value_MUX_uxn_opcodes_h_l256_c7_0d8c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l256_c7_0d8c_cond,
result_stack_value_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0d8c
result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0d8c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0d8c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l256_c7_0d8c
result_pc_MUX_uxn_opcodes_h_l256_c7_0d8c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l256_c7_0d8c_cond,
result_pc_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue,
result_pc_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse,
result_pc_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0d8c
result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0d8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0d8c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0d8c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0d8c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0d8c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0d8c
result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0d8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0d8c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0d8c
result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0d8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0d8c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0d8c
result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0d8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0d8c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l259_c11_798d
BIN_OP_EQ_uxn_opcodes_h_l259_c11_798d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l259_c11_798d_left,
BIN_OP_EQ_uxn_opcodes_h_l259_c11_798d_right,
BIN_OP_EQ_uxn_opcodes_h_l259_c11_798d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l259_c7_f73d
tmp16_MUX_uxn_opcodes_h_l259_c7_f73d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l259_c7_f73d_cond,
tmp16_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue,
tmp16_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse,
tmp16_MUX_uxn_opcodes_h_l259_c7_f73d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l259_c7_f73d
result_stack_value_MUX_uxn_opcodes_h_l259_c7_f73d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l259_c7_f73d_cond,
result_stack_value_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l259_c7_f73d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l259_c7_f73d
result_ram_addr_MUX_uxn_opcodes_h_l259_c7_f73d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l259_c7_f73d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l259_c7_f73d_return_output);

-- result_pc_MUX_uxn_opcodes_h_l259_c7_f73d
result_pc_MUX_uxn_opcodes_h_l259_c7_f73d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l259_c7_f73d_cond,
result_pc_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue,
result_pc_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse,
result_pc_MUX_uxn_opcodes_h_l259_c7_f73d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_f73d
result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_f73d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_f73d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_f73d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_f73d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_f73d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_f73d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_f73d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_f73d
result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_f73d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_f73d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_f73d_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_f73d
result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_f73d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_f73d_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_f73d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_f73d
result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_f73d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_f73d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_f73d_return_output);

-- CONST_SL_8_uxn_opcodes_h_l261_c3_be62
CONST_SL_8_uxn_opcodes_h_l261_c3_be62 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l261_c3_be62_x,
CONST_SL_8_uxn_opcodes_h_l261_c3_be62_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l262_c21_ccbd
BIN_OP_PLUS_uxn_opcodes_h_l262_c21_ccbd : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l262_c21_ccbd_left,
BIN_OP_PLUS_uxn_opcodes_h_l262_c21_ccbd_right,
BIN_OP_PLUS_uxn_opcodes_h_l262_c21_ccbd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l264_c11_8e3b
BIN_OP_EQ_uxn_opcodes_h_l264_c11_8e3b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l264_c11_8e3b_left,
BIN_OP_EQ_uxn_opcodes_h_l264_c11_8e3b_right,
BIN_OP_EQ_uxn_opcodes_h_l264_c11_8e3b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l264_c7_a97d
tmp16_MUX_uxn_opcodes_h_l264_c7_a97d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l264_c7_a97d_cond,
tmp16_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue,
tmp16_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse,
tmp16_MUX_uxn_opcodes_h_l264_c7_a97d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l264_c7_a97d
result_stack_value_MUX_uxn_opcodes_h_l264_c7_a97d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l264_c7_a97d_cond,
result_stack_value_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l264_c7_a97d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l264_c7_a97d
result_ram_addr_MUX_uxn_opcodes_h_l264_c7_a97d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l264_c7_a97d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l264_c7_a97d_return_output);

-- result_pc_MUX_uxn_opcodes_h_l264_c7_a97d
result_pc_MUX_uxn_opcodes_h_l264_c7_a97d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l264_c7_a97d_cond,
result_pc_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue,
result_pc_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse,
result_pc_MUX_uxn_opcodes_h_l264_c7_a97d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_a97d
result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_a97d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_a97d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_a97d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_a97d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_a97d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_a97d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_a97d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_a97d
result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_a97d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_a97d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_a97d_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_a97d
result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_a97d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_a97d_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_a97d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_a97d
result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_a97d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_a97d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_a97d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l265_c21_7a37
BIN_OP_PLUS_uxn_opcodes_h_l265_c21_7a37 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l265_c21_7a37_left,
BIN_OP_PLUS_uxn_opcodes_h_l265_c21_7a37_right,
BIN_OP_PLUS_uxn_opcodes_h_l265_c21_7a37_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l267_c11_f56b
BIN_OP_EQ_uxn_opcodes_h_l267_c11_f56b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l267_c11_f56b_left,
BIN_OP_EQ_uxn_opcodes_h_l267_c11_f56b_right,
BIN_OP_EQ_uxn_opcodes_h_l267_c11_f56b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l267_c7_444c
tmp16_MUX_uxn_opcodes_h_l267_c7_444c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l267_c7_444c_cond,
tmp16_MUX_uxn_opcodes_h_l267_c7_444c_iftrue,
tmp16_MUX_uxn_opcodes_h_l267_c7_444c_iffalse,
tmp16_MUX_uxn_opcodes_h_l267_c7_444c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_444c
result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_444c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_444c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_444c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_444c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_444c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l267_c7_444c
result_stack_value_MUX_uxn_opcodes_h_l267_c7_444c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l267_c7_444c_cond,
result_stack_value_MUX_uxn_opcodes_h_l267_c7_444c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l267_c7_444c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l267_c7_444c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l267_c7_444c
result_pc_MUX_uxn_opcodes_h_l267_c7_444c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l267_c7_444c_cond,
result_pc_MUX_uxn_opcodes_h_l267_c7_444c_iftrue,
result_pc_MUX_uxn_opcodes_h_l267_c7_444c_iffalse,
result_pc_MUX_uxn_opcodes_h_l267_c7_444c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_444c
result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_444c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_444c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_444c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_444c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_444c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_444c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_444c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_444c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_444c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_444c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_444c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_444c
result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_444c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_444c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_444c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_444c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_444c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_444c
result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_444c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_444c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_444c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_444c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_444c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l268_c3_759d
BIN_OP_OR_uxn_opcodes_h_l268_c3_759d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l268_c3_759d_left,
BIN_OP_OR_uxn_opcodes_h_l268_c3_759d_right,
BIN_OP_OR_uxn_opcodes_h_l268_c3_759d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l271_c15_385c
BIN_OP_PLUS_uxn_opcodes_h_l271_c15_385c : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l271_c15_385c_left,
BIN_OP_PLUS_uxn_opcodes_h_l271_c15_385c_right,
BIN_OP_PLUS_uxn_opcodes_h_l271_c15_385c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l273_c11_18e2
BIN_OP_EQ_uxn_opcodes_h_l273_c11_18e2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l273_c11_18e2_left,
BIN_OP_EQ_uxn_opcodes_h_l273_c11_18e2_right,
BIN_OP_EQ_uxn_opcodes_h_l273_c11_18e2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l273_c7_e110
result_stack_value_MUX_uxn_opcodes_h_l273_c7_e110 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l273_c7_e110_cond,
result_stack_value_MUX_uxn_opcodes_h_l273_c7_e110_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l273_c7_e110_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l273_c7_e110_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_e110
result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_e110 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_e110_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_e110_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_e110_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_e110_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_e110
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_e110 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_e110_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_e110_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_e110_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_e110_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_e110
result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_e110 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_e110_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_e110_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_e110_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_e110_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_e110
result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_e110 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_e110_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_e110_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_e110_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_e110_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l279_c11_ecdd
BIN_OP_EQ_uxn_opcodes_h_l279_c11_ecdd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l279_c11_ecdd_left,
BIN_OP_EQ_uxn_opcodes_h_l279_c11_ecdd_right,
BIN_OP_EQ_uxn_opcodes_h_l279_c11_ecdd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l279_c7_710a
result_stack_value_MUX_uxn_opcodes_h_l279_c7_710a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l279_c7_710a_cond,
result_stack_value_MUX_uxn_opcodes_h_l279_c7_710a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l279_c7_710a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l279_c7_710a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_710a
result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_710a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_710a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_710a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_710a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_710a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_710a
result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_710a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_710a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_710a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_710a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_710a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_710a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_710a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_710a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_710a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_710a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_710a_return_output);

-- CONST_SR_8_uxn_opcodes_h_l281_c34_3f81
CONST_SR_8_uxn_opcodes_h_l281_c34_3f81 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l281_c34_3f81_x,
CONST_SR_8_uxn_opcodes_h_l281_c34_3f81_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_f548_return_output,
 tmp16_MUX_uxn_opcodes_h_l245_c2_6328_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l245_c2_6328_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l245_c2_6328_return_output,
 result_pc_MUX_uxn_opcodes_h_l245_c2_6328_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_6328_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_6328_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_6328_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_6328_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_6328_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_6328_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_6328_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304_return_output,
 tmp16_MUX_uxn_opcodes_h_l251_c7_5495_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l251_c7_5495_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l251_c7_5495_return_output,
 result_pc_MUX_uxn_opcodes_h_l251_c7_5495_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_5495_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_5495_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_5495_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_5495_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_5495_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_5495_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l256_c11_07bb_return_output,
 tmp16_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output,
 result_pc_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l259_c11_798d_return_output,
 tmp16_MUX_uxn_opcodes_h_l259_c7_f73d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l259_c7_f73d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l259_c7_f73d_return_output,
 result_pc_MUX_uxn_opcodes_h_l259_c7_f73d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_f73d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_f73d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_f73d_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_f73d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_f73d_return_output,
 CONST_SL_8_uxn_opcodes_h_l261_c3_be62_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l262_c21_ccbd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l264_c11_8e3b_return_output,
 tmp16_MUX_uxn_opcodes_h_l264_c7_a97d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l264_c7_a97d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l264_c7_a97d_return_output,
 result_pc_MUX_uxn_opcodes_h_l264_c7_a97d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_a97d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_a97d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_a97d_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_a97d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_a97d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l265_c21_7a37_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l267_c11_f56b_return_output,
 tmp16_MUX_uxn_opcodes_h_l267_c7_444c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_444c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l267_c7_444c_return_output,
 result_pc_MUX_uxn_opcodes_h_l267_c7_444c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_444c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_444c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_444c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_444c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l268_c3_759d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l271_c15_385c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l273_c11_18e2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l273_c7_e110_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_e110_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_e110_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_e110_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_e110_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l279_c11_ecdd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l279_c7_710a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_710a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_710a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_710a_return_output,
 CONST_SR_8_uxn_opcodes_h_l281_c34_3f81_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_f548_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_f548_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_f548_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_f548_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_6328_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_6328_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_5495_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_6328_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_6328_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_6328_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_6328_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_5495_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_6328_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_6328_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_6328_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_6328_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_5495_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_6328_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_6328_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_6328_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_6328_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_5495_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_6328_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_6328_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_6328_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l248_c3_9001 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_6328_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l245_c2_6328_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_6328_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_6328_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_6328_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_6328_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_5495_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_6328_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_6328_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_6328_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_6328_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_5495_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_6328_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_6328_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_6328_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_6328_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_5495_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_6328_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_6328_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_6328_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_6328_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_5495_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_6328_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_6328_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_6328_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_6328_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_5495_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_6328_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_6328_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_6328_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_6328_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_5495_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_6328_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_6328_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l246_c3_54f2_uxn_opcodes_h_l246_c3_54f2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_5495_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_5495_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_5495_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_5495_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_5495_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_5495_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_5495_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_5495_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_5495_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_5495_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_5495_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_5495_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_5495_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_5495_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_5495_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_5495_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_5495_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_5495_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_5495_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_5495_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_5495_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_5495_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_5495_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l251_c7_5495_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_5495_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_5495_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_5495_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_5495_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_5495_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_5495_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_5495_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_07bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_07bb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_07bb_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_f73d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_0d8c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_f73d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_0d8c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_f73d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0d8c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_f73d_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_0d8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_f73d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0d8c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_f73d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0d8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_f73d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0d8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_f73d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0d8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_f73d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0d8c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_798d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_798d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_798d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_a97d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_f73d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_a97d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_f73d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l262_c3_23c7 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_a97d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_f73d_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_a97d_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_f73d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_a97d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_f73d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_a97d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_f73d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_a97d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_f73d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_a97d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_f73d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_a97d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_f73d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l261_c3_be62_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l261_c3_be62_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_ccbd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_ccbd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_ccbd_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_8e3b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_8e3b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_8e3b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_444c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_a97d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_444c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_a97d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l265_c3_26ef : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_a97d_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_444c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_a97d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_444c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_a97d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_444c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_a97d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_444c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_a97d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_444c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_a97d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_444c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_a97d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_7a37_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_7a37_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_7a37_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_f56b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_f56b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_f56b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_444c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_444c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_444c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_444c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_444c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_444c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_444c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_444c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_e110_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_444c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_444c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l271_c3_4ecd : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_444c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_444c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_444c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_444c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_e110_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_444c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_444c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_444c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_e110_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_444c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_444c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_444c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_e110_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_444c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_444c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_444c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_e110_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_444c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_759d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_759d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_759d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_385c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_385c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_385c_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_18e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_18e2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_18e2_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_e110_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_e110_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_710a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_e110_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_e110_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_e110_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_710a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_e110_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_e110_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l276_c3_7991 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_e110_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_710a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_e110_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_e110_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_e110_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_710a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_e110_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_e110_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_e110_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_e110_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l277_c24_9fe2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_ecdd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_ecdd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_ecdd_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_710a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_710a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_710a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_710a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_710a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_710a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_710a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_710a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_710a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_710a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l280_c3_ea1e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_710a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_710a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l281_c34_3f81_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l281_c34_3f81_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l281_c24_f5f6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_bc57_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l264_l245_DUPLICATE_c5dc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l245_DUPLICATE_50b0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_2f0c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_8441_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l264_l251_l256_l273_l259_l245_DUPLICATE_8d01_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l264_l267_l256_l259_l245_DUPLICATE_f6de_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l264_l251_l267_l256_l273_l259_l279_DUPLICATE_ecec_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l260_l268_DUPLICATE_7a51_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2e50_uxn_opcodes_h_l288_l240_DUPLICATE_a735_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_710a_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_710a_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_ecdd_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_5495_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_f548_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_f56b_right := to_unsigned(5, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_e110_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_07bb_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_444c_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_6328_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l276_c3_7991 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_e110_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l276_c3_7991;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l280_c3_ea1e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_710a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l280_c3_ea1e;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_6328_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_18e2_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_798d_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_385c_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_8e3b_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_e110_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_444c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_ccbd_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_right := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_5495_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l248_c3_9001 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_6328_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l248_c3_9001;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_7a37_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_f548_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_ccbd_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_7a37_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_385c_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_5495_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_07bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_798d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_8e3b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_f56b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_18e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_ecdd_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_759d_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l281_c34_3f81_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_6328_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_5495_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_444c_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l264_c11_8e3b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l264_c11_8e3b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_8e3b_left;
     BIN_OP_EQ_uxn_opcodes_h_l264_c11_8e3b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_8e3b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_8e3b_return_output := BIN_OP_EQ_uxn_opcodes_h_l264_c11_8e3b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l264_l251_l267_l256_l273_l259_l279_DUPLICATE_ecec LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l264_l251_l267_l256_l273_l259_l279_DUPLICATE_ecec_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l264_l245_DUPLICATE_c5dc LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l264_l245_DUPLICATE_c5dc_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l279_c11_ecdd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l279_c11_ecdd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_ecdd_left;
     BIN_OP_EQ_uxn_opcodes_h_l279_c11_ecdd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_ecdd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_ecdd_return_output := BIN_OP_EQ_uxn_opcodes_h_l279_c11_ecdd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l273_c11_18e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l273_c11_18e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_18e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l273_c11_18e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_18e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_18e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l273_c11_18e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l256_c11_07bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l256_c11_07bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_07bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l256_c11_07bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_07bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_07bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l256_c11_07bb_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l260_l268_DUPLICATE_7a51 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l260_l268_DUPLICATE_7a51_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l245_c6_3a62] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_left;
     BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_return_output := BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_bc57 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_bc57_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l251_c11_5304] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304_left;
     BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304_return_output := BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l262_c21_ccbd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l262_c21_ccbd_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_ccbd_left;
     BIN_OP_PLUS_uxn_opcodes_h_l262_c21_ccbd_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_ccbd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_ccbd_return_output := BIN_OP_PLUS_uxn_opcodes_h_l262_c21_ccbd_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_8441 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_8441_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l259_c11_798d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l259_c11_798d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_798d_left;
     BIN_OP_EQ_uxn_opcodes_h_l259_c11_798d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_798d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_798d_return_output := BIN_OP_EQ_uxn_opcodes_h_l259_c11_798d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l264_l267_l256_l259_l245_DUPLICATE_f6de LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l264_l267_l256_l259_l245_DUPLICATE_f6de_return_output := result.is_ram_read;

     -- BIN_OP_PLUS[uxn_opcodes_h_l271_c15_385c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l271_c15_385c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_385c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l271_c15_385c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_385c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_385c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l271_c15_385c_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l245_c2_6328] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l245_c2_6328_return_output := result.sp_relative_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l277_c24_9fe2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l277_c24_9fe2_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_PLUS[uxn_opcodes_h_l265_c21_7a37] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l265_c21_7a37_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_7a37_left;
     BIN_OP_PLUS_uxn_opcodes_h_l265_c21_7a37_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_7a37_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_7a37_return_output := BIN_OP_PLUS_uxn_opcodes_h_l265_c21_7a37_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_2f0c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_2f0c_return_output := result.is_stack_write;

     -- CONST_SR_8[uxn_opcodes_h_l281_c34_3f81] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l281_c34_3f81_x <= VAR_CONST_SR_8_uxn_opcodes_h_l281_c34_3f81_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l281_c34_3f81_return_output := CONST_SR_8_uxn_opcodes_h_l281_c34_3f81_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l267_c11_f56b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l267_c11_f56b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_f56b_left;
     BIN_OP_EQ_uxn_opcodes_h_l267_c11_f56b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_f56b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_f56b_return_output := BIN_OP_EQ_uxn_opcodes_h_l267_c11_f56b_return_output;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l251_c7_5495] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l251_c7_5495_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l264_l251_l256_l273_l259_l245_DUPLICATE_8d01 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l264_l251_l256_l273_l259_l245_DUPLICATE_8d01_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l245_DUPLICATE_50b0 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l245_DUPLICATE_50b0_return_output := result.pc;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_f548_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_6328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_6328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_6328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_6328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_6328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_6328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_6328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_6328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_6328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_6328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_6328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_3a62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_5495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_5495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_5495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_5495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_5495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_5495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_5495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_5495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_5495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_5495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_5304_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0d8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_07bb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0d8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_07bb_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0d8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_07bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0d8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_07bb_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_0d8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_07bb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0d8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_07bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0d8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_07bb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_0d8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_07bb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_0d8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_07bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_f73d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_798d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_f73d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_798d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_f73d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_798d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_f73d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_798d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_f73d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_798d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_f73d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_798d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_f73d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_798d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_f73d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_798d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_f73d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_798d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_a97d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_8e3b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_a97d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_8e3b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_a97d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_8e3b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_a97d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_8e3b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_a97d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_8e3b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_a97d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_8e3b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_a97d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_8e3b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_a97d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_8e3b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_a97d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_8e3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_444c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_f56b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_444c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_f56b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_444c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_f56b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_444c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_f56b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_444c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_f56b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_444c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_f56b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_444c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_f56b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_444c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_f56b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_e110_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_18e2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_e110_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_18e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_e110_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_18e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_e110_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_18e2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_e110_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_18e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_710a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_ecdd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_710a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_ecdd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_710a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_ecdd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_710a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_ecdd_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l262_c3_23c7 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_ccbd_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l265_c3_26ef := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_7a37_return_output, 16);
     VAR_result_pc_uxn_opcodes_h_l271_c3_4ecd := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_385c_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_759d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l260_l268_DUPLICATE_7a51_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l261_c3_be62_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l260_l268_DUPLICATE_7a51_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_e110_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l277_c24_9fe2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_6328_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l245_DUPLICATE_50b0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_5495_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l245_DUPLICATE_50b0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l245_DUPLICATE_50b0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l245_DUPLICATE_50b0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l245_DUPLICATE_50b0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_444c_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l245_DUPLICATE_50b0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_6328_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l264_l245_DUPLICATE_c5dc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l264_l245_DUPLICATE_c5dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_5495_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l264_l251_l267_l256_l273_l259_l279_DUPLICATE_ecec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l264_l251_l267_l256_l273_l259_l279_DUPLICATE_ecec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l264_l251_l267_l256_l273_l259_l279_DUPLICATE_ecec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l264_l251_l267_l256_l273_l259_l279_DUPLICATE_ecec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_444c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l264_l251_l267_l256_l273_l259_l279_DUPLICATE_ecec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_e110_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l264_l251_l267_l256_l273_l259_l279_DUPLICATE_ecec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_710a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l264_l251_l267_l256_l273_l259_l279_DUPLICATE_ecec_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_6328_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l264_l251_l256_l273_l259_l245_DUPLICATE_8d01_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_5495_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l264_l251_l256_l273_l259_l245_DUPLICATE_8d01_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l264_l251_l256_l273_l259_l245_DUPLICATE_8d01_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l264_l251_l256_l273_l259_l245_DUPLICATE_8d01_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l264_l251_l256_l273_l259_l245_DUPLICATE_8d01_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_e110_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l264_l251_l256_l273_l259_l245_DUPLICATE_8d01_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_6328_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l264_l267_l256_l259_l245_DUPLICATE_f6de_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l264_l267_l256_l259_l245_DUPLICATE_f6de_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l264_l267_l256_l259_l245_DUPLICATE_f6de_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l264_l267_l256_l259_l245_DUPLICATE_f6de_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_444c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l264_l267_l256_l259_l245_DUPLICATE_f6de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_6328_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_2f0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_5495_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_2f0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_2f0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_2f0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_2f0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_444c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_2f0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_710a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_2f0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_6328_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_8441_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_5495_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_8441_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_8441_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_8441_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_8441_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_444c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_8441_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_710a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_8441_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_6328_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_bc57_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_5495_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_bc57_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_bc57_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_bc57_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_bc57_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_444c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_bc57_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_710a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l264_l251_l267_l256_l259_l279_l245_DUPLICATE_bc57_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_5495_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l251_c7_5495_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_6328_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l245_c2_6328_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_444c_iftrue := VAR_result_pc_uxn_opcodes_h_l271_c3_4ecd;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l262_c3_23c7;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l265_c3_26ef;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l273_c7_e110] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_e110_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_e110_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_e110_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_e110_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_e110_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_e110_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_e110_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_e110_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l251_c7_5495] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_5495_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_5495_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_5495_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_5495_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_5495_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_5495_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_5495_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_5495_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l268_c3_759d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l268_c3_759d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_759d_left;
     BIN_OP_OR_uxn_opcodes_h_l268_c3_759d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_759d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_759d_return_output := BIN_OP_OR_uxn_opcodes_h_l268_c3_759d_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l267_c7_444c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l267_c7_444c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_444c_cond;
     result_pc_MUX_uxn_opcodes_h_l267_c7_444c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_444c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l267_c7_444c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_444c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_444c_return_output := result_pc_MUX_uxn_opcodes_h_l267_c7_444c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l279_c7_710a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_710a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_710a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_710a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_710a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_710a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_710a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_710a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_710a_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l261_c3_be62] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l261_c3_be62_x <= VAR_CONST_SL_8_uxn_opcodes_h_l261_c3_be62_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l261_c3_be62_return_output := CONST_SL_8_uxn_opcodes_h_l261_c3_be62_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l264_c7_a97d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l264_c7_a97d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_a97d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_a97d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l264_c7_a97d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l279_c7_710a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_710a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_710a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_710a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_710a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_710a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_710a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_710a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_710a_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l267_c7_444c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_444c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_444c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_444c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_444c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_444c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_444c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_444c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_444c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l279_c7_710a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_710a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_710a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_710a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_710a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_710a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_710a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_710a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_710a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l245_c2_6328] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_6328_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_6328_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_6328_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_6328_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_6328_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_6328_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_6328_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_6328_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l245_c1_f548] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_f548_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_f548_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_f548_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_f548_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_f548_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_f548_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_f548_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_f548_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l281_c24_f5f6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l281_c24_f5f6_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l281_c34_3f81_return_output);

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_444c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_759d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_710a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l281_c24_f5f6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l261_c3_be62_return_output;
     VAR_printf_uxn_opcodes_h_l246_c3_54f2_uxn_opcodes_h_l246_c3_54f2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_f548_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_e110_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_710a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_444c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_e110_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_444c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_6328_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_5495_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_e110_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_710a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_444c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_a97d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_e110_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_710a_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l267_c7_444c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l267_c7_444c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_444c_cond;
     tmp16_MUX_uxn_opcodes_h_l267_c7_444c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_444c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l267_c7_444c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_444c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_444c_return_output := tmp16_MUX_uxn_opcodes_h_l267_c7_444c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l259_c7_f73d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l259_c7_f73d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_f73d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_f73d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l259_c7_f73d_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l264_c7_a97d] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l264_c7_a97d_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_a97d_cond;
     result_pc_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue;
     result_pc_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_a97d_return_output := result_pc_MUX_uxn_opcodes_h_l264_c7_a97d_return_output;

     -- printf_uxn_opcodes_h_l246_c3_54f2[uxn_opcodes_h_l246_c3_54f2] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l246_c3_54f2_uxn_opcodes_h_l246_c3_54f2_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l246_c3_54f2_uxn_opcodes_h_l246_c3_54f2_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l273_c7_e110] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_e110_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_e110_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_e110_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_e110_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_e110_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_e110_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_e110_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_e110_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l273_c7_e110] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_e110_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_e110_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_e110_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_e110_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_e110_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_e110_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_e110_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_e110_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l264_c7_a97d] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_a97d_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_a97d_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_a97d_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_a97d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l267_c7_444c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_444c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_444c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_444c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_444c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_444c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_444c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_444c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_444c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l245_c2_6328] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_6328_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_6328_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_6328_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_6328_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_6328_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_6328_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_6328_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_6328_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l273_c7_e110] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_e110_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_e110_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_e110_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_e110_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_e110_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_e110_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_e110_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_e110_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l279_c7_710a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l279_c7_710a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_710a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l279_c7_710a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_710a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l279_c7_710a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_710a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_710a_return_output := result_stack_value_MUX_uxn_opcodes_h_l279_c7_710a_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_444c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_e110_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_444c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_a97d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_444c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_e110_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_a97d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_f73d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_444c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_e110_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_e110_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_710a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_444c_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l264_c7_a97d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l264_c7_a97d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_a97d_cond;
     tmp16_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_a97d_return_output := tmp16_MUX_uxn_opcodes_h_l264_c7_a97d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l264_c7_a97d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_a97d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_a97d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_a97d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_a97d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l273_c7_e110] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l273_c7_e110_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_e110_cond;
     result_stack_value_MUX_uxn_opcodes_h_l273_c7_e110_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_e110_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l273_c7_e110_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_e110_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_e110_return_output := result_stack_value_MUX_uxn_opcodes_h_l273_c7_e110_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l256_c7_0d8c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0d8c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0d8c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l267_c7_444c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_444c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_444c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_444c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_444c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_444c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_444c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_444c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_444c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l267_c7_444c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_444c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_444c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_444c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_444c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_444c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_444c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_444c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_444c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l267_c7_444c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_444c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_444c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_444c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_444c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_444c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_444c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_444c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_444c_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l259_c7_f73d] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_f73d_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_f73d_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_f73d_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_f73d_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l259_c7_f73d] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l259_c7_f73d_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_f73d_cond;
     result_pc_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue;
     result_pc_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_f73d_return_output := result_pc_MUX_uxn_opcodes_h_l259_c7_f73d_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_444c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_a97d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_f73d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_444c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_f73d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_5495_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_444c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_444c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_e110_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_a97d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l264_c7_a97d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_a97d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_a97d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_a97d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_a97d_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l256_c7_0d8c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0d8c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0d8c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l256_c7_0d8c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l256_c7_0d8c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_0d8c_cond;
     result_pc_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output := result_pc_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l267_c7_444c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l267_c7_444c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_444c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l267_c7_444c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_444c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l267_c7_444c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_444c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_444c_return_output := result_stack_value_MUX_uxn_opcodes_h_l267_c7_444c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l264_c7_a97d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_a97d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_a97d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_a97d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_a97d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l264_c7_a97d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_a97d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_a97d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_a97d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_a97d_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l251_c7_5495] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l251_c7_5495_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_5495_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l251_c7_5495_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_5495_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l251_c7_5495_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_5495_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_5495_return_output := result_ram_addr_MUX_uxn_opcodes_h_l251_c7_5495_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l259_c7_f73d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_f73d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_f73d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_f73d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_f73d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l259_c7_f73d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l259_c7_f73d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_f73d_cond;
     tmp16_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_f73d_return_output := tmp16_MUX_uxn_opcodes_h_l259_c7_f73d_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_a97d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_f73d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_5495_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_a97d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_5495_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_6328_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_5495_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_a97d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_444c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_f73d_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l264_c7_a97d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l264_c7_a97d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_a97d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_a97d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_a97d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_a97d_return_output := result_stack_value_MUX_uxn_opcodes_h_l264_c7_a97d_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l245_c2_6328] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l245_c2_6328_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_6328_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l245_c2_6328_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_6328_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l245_c2_6328_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_6328_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_6328_return_output := result_ram_addr_MUX_uxn_opcodes_h_l245_c2_6328_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l251_c7_5495] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_5495_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_5495_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_5495_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_5495_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_5495_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_5495_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_5495_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_5495_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l256_c7_0d8c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l256_c7_0d8c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_0d8c_cond;
     tmp16_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output := tmp16_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l251_c7_5495] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l251_c7_5495_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_5495_cond;
     result_pc_MUX_uxn_opcodes_h_l251_c7_5495_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_5495_iftrue;
     result_pc_MUX_uxn_opcodes_h_l251_c7_5495_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_5495_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_5495_return_output := result_pc_MUX_uxn_opcodes_h_l251_c7_5495_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l256_c7_0d8c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0d8c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0d8c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l259_c7_f73d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_f73d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_f73d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_f73d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_f73d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l259_c7_f73d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_f73d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_f73d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_f73d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_f73d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l259_c7_f73d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_f73d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_f73d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_f73d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_f73d_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_f73d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_5495_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_6328_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_5495_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_f73d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_6328_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_5495_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_f73d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_a97d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_5495_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l251_c7_5495] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l251_c7_5495_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_5495_cond;
     tmp16_MUX_uxn_opcodes_h_l251_c7_5495_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_5495_iftrue;
     tmp16_MUX_uxn_opcodes_h_l251_c7_5495_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_5495_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_5495_return_output := tmp16_MUX_uxn_opcodes_h_l251_c7_5495_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l245_c2_6328] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l245_c2_6328_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_6328_cond;
     result_pc_MUX_uxn_opcodes_h_l245_c2_6328_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_6328_iftrue;
     result_pc_MUX_uxn_opcodes_h_l245_c2_6328_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_6328_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_6328_return_output := result_pc_MUX_uxn_opcodes_h_l245_c2_6328_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l259_c7_f73d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l259_c7_f73d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_f73d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_f73d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_f73d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_f73d_return_output := result_stack_value_MUX_uxn_opcodes_h_l259_c7_f73d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l256_c7_0d8c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0d8c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0d8c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l256_c7_0d8c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0d8c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0d8c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l251_c7_5495] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_5495_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_5495_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_5495_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_5495_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_5495_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_5495_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_5495_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_5495_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l245_c2_6328] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_6328_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_6328_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_6328_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_6328_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_6328_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_6328_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_6328_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_6328_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l256_c7_0d8c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0d8c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0d8c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_5495_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_6328_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_5495_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_5495_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_5495_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_f73d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_6328_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_5495_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l245_c2_6328] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_6328_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_6328_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_6328_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_6328_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_6328_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_6328_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_6328_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_6328_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l256_c7_0d8c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l256_c7_0d8c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_0d8c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_0d8c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_0d8c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output := result_stack_value_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l251_c7_5495] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_5495_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_5495_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_5495_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_5495_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_5495_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_5495_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_5495_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_5495_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l245_c2_6328] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l245_c2_6328_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_6328_cond;
     tmp16_MUX_uxn_opcodes_h_l245_c2_6328_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_6328_iftrue;
     tmp16_MUX_uxn_opcodes_h_l245_c2_6328_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_6328_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_6328_return_output := tmp16_MUX_uxn_opcodes_h_l245_c2_6328_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l251_c7_5495] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_5495_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_5495_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_5495_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_5495_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_5495_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_5495_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_5495_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_5495_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l251_c7_5495] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_5495_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_5495_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_5495_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_5495_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_5495_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_5495_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_5495_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_5495_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_6328_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_5495_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_6328_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_5495_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_6328_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_5495_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_5495_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_0d8c_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_6328_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l251_c7_5495] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l251_c7_5495_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_5495_cond;
     result_stack_value_MUX_uxn_opcodes_h_l251_c7_5495_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_5495_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l251_c7_5495_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_5495_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_5495_return_output := result_stack_value_MUX_uxn_opcodes_h_l251_c7_5495_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l245_c2_6328] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_6328_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_6328_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_6328_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_6328_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_6328_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_6328_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_6328_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_6328_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l245_c2_6328] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_6328_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_6328_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_6328_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_6328_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_6328_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_6328_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_6328_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_6328_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l245_c2_6328] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_6328_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_6328_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_6328_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_6328_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_6328_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_6328_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_6328_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_6328_return_output;

     -- Submodule level 9
     VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_6328_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_5495_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l245_c2_6328] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l245_c2_6328_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_6328_cond;
     result_stack_value_MUX_uxn_opcodes_h_l245_c2_6328_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_6328_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l245_c2_6328_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_6328_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_6328_return_output := result_stack_value_MUX_uxn_opcodes_h_l245_c2_6328_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_2e50_uxn_opcodes_h_l288_l240_DUPLICATE_a735 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2e50_uxn_opcodes_h_l288_l240_DUPLICATE_a735_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_2e50(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_6328_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_6328_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_6328_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_6328_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_6328_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_6328_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_6328_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_6328_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_6328_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_6328_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2e50_uxn_opcodes_h_l288_l240_DUPLICATE_a735_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2e50_uxn_opcodes_h_l288_l240_DUPLICATE_a735_return_output;
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
