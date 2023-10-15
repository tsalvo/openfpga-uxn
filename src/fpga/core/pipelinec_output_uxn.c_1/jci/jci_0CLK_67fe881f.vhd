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
-- Submodules: 67
entity jci_0CLK_67fe881f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jci_0CLK_67fe881f;
architecture arch of jci_0CLK_67fe881f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l68_c6_1e2c]
signal BIN_OP_EQ_uxn_opcodes_h_l68_c6_1e2c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l68_c6_1e2c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l68_c6_1e2c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l68_c2_7a20]
signal t8_MUX_uxn_opcodes_h_l68_c2_7a20_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l68_c2_7a20_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l68_c2_7a20]
signal tmp16_MUX_uxn_opcodes_h_l68_c2_7a20_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l68_c2_7a20_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l68_c2_7a20]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_7a20_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_7a20_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l68_c2_7a20]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_7a20_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_7a20_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l68_c2_7a20]
signal result_pc_MUX_uxn_opcodes_h_l68_c2_7a20_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l68_c2_7a20_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l68_c2_7a20]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_7a20_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_7a20_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l68_c2_7a20]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_7a20_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_7a20_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l68_c2_7a20]
signal result_ram_addr_MUX_uxn_opcodes_h_l68_c2_7a20_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l68_c2_7a20_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l68_c2_7a20]
signal result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_7a20_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_7a20_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l73_c11_d3a6]
signal BIN_OP_EQ_uxn_opcodes_h_l73_c11_d3a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l73_c11_d3a6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l73_c11_d3a6_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l73_c7_cb0c]
signal t8_MUX_uxn_opcodes_h_l73_c7_cb0c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l73_c7_cb0c]
signal tmp16_MUX_uxn_opcodes_h_l73_c7_cb0c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l73_c7_cb0c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l73_c7_cb0c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_cb0c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l73_c7_cb0c]
signal result_pc_MUX_uxn_opcodes_h_l73_c7_cb0c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l73_c7_cb0c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_cb0c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l73_c7_cb0c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l73_c7_cb0c]
signal result_ram_addr_MUX_uxn_opcodes_h_l73_c7_cb0c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l73_c7_cb0c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_cb0c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l76_c11_2a39]
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_2a39_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_2a39_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_2a39_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l76_c7_f15b]
signal t8_MUX_uxn_opcodes_h_l76_c7_f15b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_f15b_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l76_c7_f15b]
signal tmp16_MUX_uxn_opcodes_h_l76_c7_f15b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_f15b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l76_c7_f15b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f15b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f15b_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l76_c7_f15b]
signal result_pc_MUX_uxn_opcodes_h_l76_c7_f15b_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l76_c7_f15b_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l76_c7_f15b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f15b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f15b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l76_c7_f15b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f15b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f15b_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l76_c7_f15b]
signal result_ram_addr_MUX_uxn_opcodes_h_l76_c7_f15b_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l76_c7_f15b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l76_c7_f15b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f15b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f15b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l82_c11_4243]
signal BIN_OP_EQ_uxn_opcodes_h_l82_c11_4243_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l82_c11_4243_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l82_c11_4243_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l82_c7_bbe6]
signal tmp16_MUX_uxn_opcodes_h_l82_c7_bbe6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l82_c7_bbe6]
signal result_pc_MUX_uxn_opcodes_h_l82_c7_bbe6_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l82_c7_bbe6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_bbe6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l82_c7_bbe6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_bbe6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l82_c7_bbe6]
signal result_ram_addr_MUX_uxn_opcodes_h_l82_c7_bbe6_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l82_c7_bbe6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_bbe6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l86_c11_3cd5]
signal BIN_OP_EQ_uxn_opcodes_h_l86_c11_3cd5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l86_c11_3cd5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l86_c11_3cd5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l86_c7_32a3]
signal tmp16_MUX_uxn_opcodes_h_l86_c7_32a3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l86_c7_32a3_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l86_c7_32a3]
signal result_ram_addr_MUX_uxn_opcodes_h_l86_c7_32a3_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l86_c7_32a3_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l86_c7_32a3]
signal result_pc_MUX_uxn_opcodes_h_l86_c7_32a3_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l86_c7_32a3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l86_c7_32a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_32a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_32a3_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l86_c7_32a3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_32a3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_32a3_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l88_c3_03e2]
signal CONST_SL_8_uxn_opcodes_h_l88_c3_03e2_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l88_c3_03e2_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l89_c21_0593]
signal BIN_OP_PLUS_uxn_opcodes_h_l89_c21_0593_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l89_c21_0593_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l89_c21_0593_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l91_c11_d98d]
signal BIN_OP_EQ_uxn_opcodes_h_l91_c11_d98d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l91_c11_d98d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l91_c11_d98d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l91_c7_19dc]
signal tmp16_MUX_uxn_opcodes_h_l91_c7_19dc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l91_c7_19dc_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l91_c7_19dc]
signal result_ram_addr_MUX_uxn_opcodes_h_l91_c7_19dc_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l91_c7_19dc_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l91_c7_19dc]
signal result_pc_MUX_uxn_opcodes_h_l91_c7_19dc_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l91_c7_19dc_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l91_c7_19dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_19dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_19dc_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l91_c7_19dc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_19dc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_19dc_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l92_c21_6164]
signal BIN_OP_PLUS_uxn_opcodes_h_l92_c21_6164_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l92_c21_6164_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l92_c21_6164_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l94_c11_cf55]
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_cf55_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_cf55_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_cf55_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l94_c7_06d9]
signal tmp16_MUX_uxn_opcodes_h_l94_c7_06d9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_06d9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_06d9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_06d9_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l94_c7_06d9]
signal result_pc_MUX_uxn_opcodes_h_l94_c7_06d9_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l94_c7_06d9_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l94_c7_06d9_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l94_c7_06d9_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l94_c7_06d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_06d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_06d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_06d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_06d9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l94_c7_06d9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_06d9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_06d9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_06d9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_06d9_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l95_c3_0cfa]
signal BIN_OP_OR_uxn_opcodes_h_l95_c3_0cfa_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l95_c3_0cfa_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l95_c3_0cfa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l97_c15_de80]
signal BIN_OP_EQ_uxn_opcodes_h_l97_c15_de80_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l97_c15_de80_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l97_c15_de80_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l97_c25_9e8e]
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c25_9e8e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c25_9e8e_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c25_9e8e_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l97_c35_6258]
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c35_6258_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c35_6258_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c35_6258_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l97_c35_b56a]
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c35_b56a_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c35_b56a_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c35_b56a_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l97_c15_ddff]
signal MUX_uxn_opcodes_h_l97_c15_ddff_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l97_c15_ddff_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l97_c15_ddff_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l97_c15_ddff_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l99_c11_bedd]
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_bedd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_bedd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_bedd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l99_c7_c68a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_c68a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_c68a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_c68a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_c68a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l99_c7_c68a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_c68a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_c68a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_c68a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_c68a_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_564f( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.pc := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.ram_addr := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l68_c6_1e2c
BIN_OP_EQ_uxn_opcodes_h_l68_c6_1e2c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l68_c6_1e2c_left,
BIN_OP_EQ_uxn_opcodes_h_l68_c6_1e2c_right,
BIN_OP_EQ_uxn_opcodes_h_l68_c6_1e2c_return_output);

-- t8_MUX_uxn_opcodes_h_l68_c2_7a20
t8_MUX_uxn_opcodes_h_l68_c2_7a20 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l68_c2_7a20_cond,
t8_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue,
t8_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse,
t8_MUX_uxn_opcodes_h_l68_c2_7a20_return_output);

-- tmp16_MUX_uxn_opcodes_h_l68_c2_7a20
tmp16_MUX_uxn_opcodes_h_l68_c2_7a20 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l68_c2_7a20_cond,
tmp16_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue,
tmp16_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse,
tmp16_MUX_uxn_opcodes_h_l68_c2_7a20_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_7a20
result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_7a20 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_7a20_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_7a20_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_7a20
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_7a20 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_7a20_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_7a20_return_output);

-- result_pc_MUX_uxn_opcodes_h_l68_c2_7a20
result_pc_MUX_uxn_opcodes_h_l68_c2_7a20 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l68_c2_7a20_cond,
result_pc_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue,
result_pc_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse,
result_pc_MUX_uxn_opcodes_h_l68_c2_7a20_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_7a20
result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_7a20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_7a20_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_7a20_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_7a20
result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_7a20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_7a20_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_7a20_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l68_c2_7a20
result_ram_addr_MUX_uxn_opcodes_h_l68_c2_7a20 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l68_c2_7a20_cond,
result_ram_addr_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l68_c2_7a20_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_7a20
result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_7a20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_7a20_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_7a20_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l73_c11_d3a6
BIN_OP_EQ_uxn_opcodes_h_l73_c11_d3a6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l73_c11_d3a6_left,
BIN_OP_EQ_uxn_opcodes_h_l73_c11_d3a6_right,
BIN_OP_EQ_uxn_opcodes_h_l73_c11_d3a6_return_output);

-- t8_MUX_uxn_opcodes_h_l73_c7_cb0c
t8_MUX_uxn_opcodes_h_l73_c7_cb0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l73_c7_cb0c_cond,
t8_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue,
t8_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse,
t8_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l73_c7_cb0c
tmp16_MUX_uxn_opcodes_h_l73_c7_cb0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l73_c7_cb0c_cond,
tmp16_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue,
tmp16_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse,
tmp16_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_cb0c
result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_cb0c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_cb0c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_cb0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_cb0c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l73_c7_cb0c
result_pc_MUX_uxn_opcodes_h_l73_c7_cb0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l73_c7_cb0c_cond,
result_pc_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue,
result_pc_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse,
result_pc_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_cb0c
result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_cb0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_cb0c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_cb0c
result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_cb0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l73_c7_cb0c
result_ram_addr_MUX_uxn_opcodes_h_l73_c7_cb0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l73_c7_cb0c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_cb0c
result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_cb0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_cb0c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l76_c11_2a39
BIN_OP_EQ_uxn_opcodes_h_l76_c11_2a39 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l76_c11_2a39_left,
BIN_OP_EQ_uxn_opcodes_h_l76_c11_2a39_right,
BIN_OP_EQ_uxn_opcodes_h_l76_c11_2a39_return_output);

-- t8_MUX_uxn_opcodes_h_l76_c7_f15b
t8_MUX_uxn_opcodes_h_l76_c7_f15b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l76_c7_f15b_cond,
t8_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue,
t8_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse,
t8_MUX_uxn_opcodes_h_l76_c7_f15b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l76_c7_f15b
tmp16_MUX_uxn_opcodes_h_l76_c7_f15b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l76_c7_f15b_cond,
tmp16_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue,
tmp16_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse,
tmp16_MUX_uxn_opcodes_h_l76_c7_f15b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f15b
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f15b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f15b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f15b_return_output);

-- result_pc_MUX_uxn_opcodes_h_l76_c7_f15b
result_pc_MUX_uxn_opcodes_h_l76_c7_f15b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l76_c7_f15b_cond,
result_pc_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue,
result_pc_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse,
result_pc_MUX_uxn_opcodes_h_l76_c7_f15b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f15b
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f15b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f15b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f15b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f15b
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f15b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f15b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f15b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l76_c7_f15b
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_f15b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_f15b_cond,
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_f15b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f15b
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f15b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f15b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f15b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l82_c11_4243
BIN_OP_EQ_uxn_opcodes_h_l82_c11_4243 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l82_c11_4243_left,
BIN_OP_EQ_uxn_opcodes_h_l82_c11_4243_right,
BIN_OP_EQ_uxn_opcodes_h_l82_c11_4243_return_output);

-- tmp16_MUX_uxn_opcodes_h_l82_c7_bbe6
tmp16_MUX_uxn_opcodes_h_l82_c7_bbe6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l82_c7_bbe6_cond,
tmp16_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue,
tmp16_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse,
tmp16_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output);

-- result_pc_MUX_uxn_opcodes_h_l82_c7_bbe6
result_pc_MUX_uxn_opcodes_h_l82_c7_bbe6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l82_c7_bbe6_cond,
result_pc_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue,
result_pc_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse,
result_pc_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_bbe6
result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_bbe6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_bbe6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_bbe6
result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_bbe6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_bbe6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l82_c7_bbe6
result_ram_addr_MUX_uxn_opcodes_h_l82_c7_bbe6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l82_c7_bbe6_cond,
result_ram_addr_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_bbe6
result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_bbe6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_bbe6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l86_c11_3cd5
BIN_OP_EQ_uxn_opcodes_h_l86_c11_3cd5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l86_c11_3cd5_left,
BIN_OP_EQ_uxn_opcodes_h_l86_c11_3cd5_right,
BIN_OP_EQ_uxn_opcodes_h_l86_c11_3cd5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l86_c7_32a3
tmp16_MUX_uxn_opcodes_h_l86_c7_32a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l86_c7_32a3_cond,
tmp16_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue,
tmp16_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse,
tmp16_MUX_uxn_opcodes_h_l86_c7_32a3_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l86_c7_32a3
result_ram_addr_MUX_uxn_opcodes_h_l86_c7_32a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l86_c7_32a3_cond,
result_ram_addr_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l86_c7_32a3_return_output);

-- result_pc_MUX_uxn_opcodes_h_l86_c7_32a3
result_pc_MUX_uxn_opcodes_h_l86_c7_32a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l86_c7_32a3_cond,
result_pc_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue,
result_pc_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse,
result_pc_MUX_uxn_opcodes_h_l86_c7_32a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_32a3
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_32a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_32a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_32a3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_32a3
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_32a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_32a3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_32a3_return_output);

-- CONST_SL_8_uxn_opcodes_h_l88_c3_03e2
CONST_SL_8_uxn_opcodes_h_l88_c3_03e2 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l88_c3_03e2_x,
CONST_SL_8_uxn_opcodes_h_l88_c3_03e2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l89_c21_0593
BIN_OP_PLUS_uxn_opcodes_h_l89_c21_0593 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l89_c21_0593_left,
BIN_OP_PLUS_uxn_opcodes_h_l89_c21_0593_right,
BIN_OP_PLUS_uxn_opcodes_h_l89_c21_0593_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l91_c11_d98d
BIN_OP_EQ_uxn_opcodes_h_l91_c11_d98d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l91_c11_d98d_left,
BIN_OP_EQ_uxn_opcodes_h_l91_c11_d98d_right,
BIN_OP_EQ_uxn_opcodes_h_l91_c11_d98d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l91_c7_19dc
tmp16_MUX_uxn_opcodes_h_l91_c7_19dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l91_c7_19dc_cond,
tmp16_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue,
tmp16_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse,
tmp16_MUX_uxn_opcodes_h_l91_c7_19dc_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l91_c7_19dc
result_ram_addr_MUX_uxn_opcodes_h_l91_c7_19dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l91_c7_19dc_cond,
result_ram_addr_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l91_c7_19dc_return_output);

-- result_pc_MUX_uxn_opcodes_h_l91_c7_19dc
result_pc_MUX_uxn_opcodes_h_l91_c7_19dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l91_c7_19dc_cond,
result_pc_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue,
result_pc_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse,
result_pc_MUX_uxn_opcodes_h_l91_c7_19dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_19dc
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_19dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_19dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_19dc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_19dc
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_19dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_19dc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_19dc_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l92_c21_6164
BIN_OP_PLUS_uxn_opcodes_h_l92_c21_6164 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l92_c21_6164_left,
BIN_OP_PLUS_uxn_opcodes_h_l92_c21_6164_right,
BIN_OP_PLUS_uxn_opcodes_h_l92_c21_6164_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l94_c11_cf55
BIN_OP_EQ_uxn_opcodes_h_l94_c11_cf55 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l94_c11_cf55_left,
BIN_OP_EQ_uxn_opcodes_h_l94_c11_cf55_right,
BIN_OP_EQ_uxn_opcodes_h_l94_c11_cf55_return_output);

-- tmp16_MUX_uxn_opcodes_h_l94_c7_06d9
tmp16_MUX_uxn_opcodes_h_l94_c7_06d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l94_c7_06d9_cond,
tmp16_MUX_uxn_opcodes_h_l94_c7_06d9_iftrue,
tmp16_MUX_uxn_opcodes_h_l94_c7_06d9_iffalse,
tmp16_MUX_uxn_opcodes_h_l94_c7_06d9_return_output);

-- result_pc_MUX_uxn_opcodes_h_l94_c7_06d9
result_pc_MUX_uxn_opcodes_h_l94_c7_06d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l94_c7_06d9_cond,
result_pc_MUX_uxn_opcodes_h_l94_c7_06d9_iftrue,
result_pc_MUX_uxn_opcodes_h_l94_c7_06d9_iffalse,
result_pc_MUX_uxn_opcodes_h_l94_c7_06d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_06d9
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_06d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_06d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_06d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_06d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_06d9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_06d9
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_06d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_06d9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_06d9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_06d9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_06d9_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l95_c3_0cfa
BIN_OP_OR_uxn_opcodes_h_l95_c3_0cfa : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l95_c3_0cfa_left,
BIN_OP_OR_uxn_opcodes_h_l95_c3_0cfa_right,
BIN_OP_OR_uxn_opcodes_h_l95_c3_0cfa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l97_c15_de80
BIN_OP_EQ_uxn_opcodes_h_l97_c15_de80 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l97_c15_de80_left,
BIN_OP_EQ_uxn_opcodes_h_l97_c15_de80_right,
BIN_OP_EQ_uxn_opcodes_h_l97_c15_de80_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l97_c25_9e8e
BIN_OP_PLUS_uxn_opcodes_h_l97_c25_9e8e : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l97_c25_9e8e_left,
BIN_OP_PLUS_uxn_opcodes_h_l97_c25_9e8e_right,
BIN_OP_PLUS_uxn_opcodes_h_l97_c25_9e8e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l97_c35_6258
BIN_OP_PLUS_uxn_opcodes_h_l97_c35_6258 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l97_c35_6258_left,
BIN_OP_PLUS_uxn_opcodes_h_l97_c35_6258_right,
BIN_OP_PLUS_uxn_opcodes_h_l97_c35_6258_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l97_c35_b56a
BIN_OP_PLUS_uxn_opcodes_h_l97_c35_b56a : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l97_c35_b56a_left,
BIN_OP_PLUS_uxn_opcodes_h_l97_c35_b56a_right,
BIN_OP_PLUS_uxn_opcodes_h_l97_c35_b56a_return_output);

-- MUX_uxn_opcodes_h_l97_c15_ddff
MUX_uxn_opcodes_h_l97_c15_ddff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l97_c15_ddff_cond,
MUX_uxn_opcodes_h_l97_c15_ddff_iftrue,
MUX_uxn_opcodes_h_l97_c15_ddff_iffalse,
MUX_uxn_opcodes_h_l97_c15_ddff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l99_c11_bedd
BIN_OP_EQ_uxn_opcodes_h_l99_c11_bedd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l99_c11_bedd_left,
BIN_OP_EQ_uxn_opcodes_h_l99_c11_bedd_right,
BIN_OP_EQ_uxn_opcodes_h_l99_c11_bedd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_c68a
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_c68a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_c68a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_c68a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_c68a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_c68a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_c68a
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_c68a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_c68a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_c68a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_c68a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_c68a_return_output);



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
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l68_c6_1e2c_return_output,
 t8_MUX_uxn_opcodes_h_l68_c2_7a20_return_output,
 tmp16_MUX_uxn_opcodes_h_l68_c2_7a20_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_7a20_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_7a20_return_output,
 result_pc_MUX_uxn_opcodes_h_l68_c2_7a20_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_7a20_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_7a20_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l68_c2_7a20_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_7a20_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l73_c11_d3a6_return_output,
 t8_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output,
 tmp16_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output,
 result_pc_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l76_c11_2a39_return_output,
 t8_MUX_uxn_opcodes_h_l76_c7_f15b_return_output,
 tmp16_MUX_uxn_opcodes_h_l76_c7_f15b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f15b_return_output,
 result_pc_MUX_uxn_opcodes_h_l76_c7_f15b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f15b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f15b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l76_c7_f15b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f15b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l82_c11_4243_return_output,
 tmp16_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output,
 result_pc_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l86_c11_3cd5_return_output,
 tmp16_MUX_uxn_opcodes_h_l86_c7_32a3_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l86_c7_32a3_return_output,
 result_pc_MUX_uxn_opcodes_h_l86_c7_32a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_32a3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_32a3_return_output,
 CONST_SL_8_uxn_opcodes_h_l88_c3_03e2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l89_c21_0593_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l91_c11_d98d_return_output,
 tmp16_MUX_uxn_opcodes_h_l91_c7_19dc_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l91_c7_19dc_return_output,
 result_pc_MUX_uxn_opcodes_h_l91_c7_19dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_19dc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_19dc_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l92_c21_6164_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l94_c11_cf55_return_output,
 tmp16_MUX_uxn_opcodes_h_l94_c7_06d9_return_output,
 result_pc_MUX_uxn_opcodes_h_l94_c7_06d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_06d9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_06d9_return_output,
 BIN_OP_OR_uxn_opcodes_h_l95_c3_0cfa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l97_c15_de80_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l97_c25_9e8e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l97_c35_6258_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l97_c35_b56a_return_output,
 MUX_uxn_opcodes_h_l97_c15_ddff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l99_c11_bedd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_c68a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_c68a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_1e2c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_1e2c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_1e2c_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l68_c2_7a20_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l68_c2_7a20_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_7a20_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_7a20_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_7a20_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_7a20_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l70_c3_8445 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_7a20_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_7a20_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_7a20_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_7a20_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_7a20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_7a20_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_7a20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_7a20_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_7a20_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_7a20_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_7a20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_7a20_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d3a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d3a6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d3a6_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_f15b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l73_c7_cb0c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_f15b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_cb0c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f15b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_07ea : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l73_c7_cb0c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_cb0c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_f15b_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_cb0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f15b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_cb0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f15b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_f15b_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l73_c7_cb0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f15b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_cb0c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_2a39_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_2a39_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_2a39_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_f15b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_f15b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l79_c3_1bf4 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f15b_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_f15b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f15b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f15b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_f15b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f15b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_4243_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_4243_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_4243_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_32a3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_bbe6_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l86_c7_32a3_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l82_c7_bbe6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_32a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_bbe6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_bbe6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l86_c7_32a3_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l82_c7_bbe6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_32a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_bbe6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_3cd5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_3cd5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_3cd5_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_19dc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_32a3_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l89_c3_44e0 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_19dc_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l86_c7_32a3_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_19dc_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l86_c7_32a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_19dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_32a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_19dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_32a3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_03e2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_03e2_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c21_0593_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c21_0593_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c21_0593_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_d98d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_d98d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_d98d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_06d9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_19dc_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l92_c3_52bf : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_19dc_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l94_c7_06d9_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_19dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_06d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_19dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_06d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_19dc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c21_6164_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c21_6164_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c21_6164_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_cf55_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_cf55_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_cf55_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_06d9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_06d9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_06d9_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l94_c7_06d9_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l94_c7_06d9_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l94_c7_06d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_06d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_06d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_c68a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_06d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_06d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_06d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_c68a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_06d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_0cfa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_0cfa_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_0cfa_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c15_ddff_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c15_ddff_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c15_ddff_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c15_de80_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c15_de80_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c15_de80_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c25_9e8e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c25_9e8e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c25_9e8e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_6258_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_6258_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_6258_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_b56a_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_b56a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_b56a_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c15_ddff_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_bedd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_bedd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_bedd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_c68a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_c68a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_c68a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_c68a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_c68a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_c68a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l68_l73_l76_DUPLICATE_2c51_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l73_l68_l94_l91_l86_l82_l76_DUPLICATE_4ff8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l73_l99_l68_l91_l86_l82_l76_DUPLICATE_a68f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l68_l82_l73_DUPLICATE_a388_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l68_l73_l91_DUPLICATE_c76d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l73_l99_l94_l91_l86_l82_l76_DUPLICATE_2d2b_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l95_l87_DUPLICATE_b863_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_564f_uxn_opcodes_h_l104_l63_DUPLICATE_c5d0_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c15_de80_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_07ea := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_07ea;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l70_c3_8445 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l70_c3_8445;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_d98d_right := to_unsigned(5, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_b56a_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_bedd_right := to_unsigned(7, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c21_0593_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l79_c3_1bf4 := resize(to_signed(-1, 2), 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l79_c3_1bf4;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_c68a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_2a39_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_1e2c_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_06d9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c21_6164_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_c68a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_4243_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_cf55_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d3a6_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_3cd5_right := to_unsigned(4, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c25_9e8e_right := to_unsigned(2, 2);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c21_0593_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c21_6164_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c25_9e8e_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_6258_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_1e2c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d3a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_2a39_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_4243_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_3cd5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_d98d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_cf55_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_bedd_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c15_de80_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_0cfa_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_06d9_iffalse := tmp16;
     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l68_l73_l76_DUPLICATE_2c51 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l68_l73_l76_DUPLICATE_2c51_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l73_l68_l94_l91_l86_l82_l76_DUPLICATE_4ff8 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l73_l68_l94_l91_l86_l82_l76_DUPLICATE_4ff8_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l86_c11_3cd5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l86_c11_3cd5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_3cd5_left;
     BIN_OP_EQ_uxn_opcodes_h_l86_c11_3cd5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_3cd5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_3cd5_return_output := BIN_OP_EQ_uxn_opcodes_h_l86_c11_3cd5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l68_c6_1e2c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l68_c6_1e2c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_1e2c_left;
     BIN_OP_EQ_uxn_opcodes_h_l68_c6_1e2c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_1e2c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_1e2c_return_output := BIN_OP_EQ_uxn_opcodes_h_l68_c6_1e2c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l97_c15_de80] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l97_c15_de80_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c15_de80_left;
     BIN_OP_EQ_uxn_opcodes_h_l97_c15_de80_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c15_de80_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c15_de80_return_output := BIN_OP_EQ_uxn_opcodes_h_l97_c15_de80_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l95_l87_DUPLICATE_b863 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l95_l87_DUPLICATE_b863_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l99_c11_bedd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l99_c11_bedd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_bedd_left;
     BIN_OP_EQ_uxn_opcodes_h_l99_c11_bedd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_bedd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_bedd_return_output := BIN_OP_EQ_uxn_opcodes_h_l99_c11_bedd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l82_c11_4243] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l82_c11_4243_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_4243_left;
     BIN_OP_EQ_uxn_opcodes_h_l82_c11_4243_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_4243_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_4243_return_output := BIN_OP_EQ_uxn_opcodes_h_l82_c11_4243_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l76_c11_2a39] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l76_c11_2a39_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_2a39_left;
     BIN_OP_EQ_uxn_opcodes_h_l76_c11_2a39_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_2a39_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_2a39_return_output := BIN_OP_EQ_uxn_opcodes_h_l76_c11_2a39_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l73_c7_cb0c] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l73_c7_cb0c_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l73_l99_l68_l91_l86_l82_l76_DUPLICATE_a68f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l73_l99_l68_l91_l86_l82_l76_DUPLICATE_a68f_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l68_l82_l73_DUPLICATE_a388 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l68_l82_l73_DUPLICATE_a388_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l73_l99_l94_l91_l86_l82_l76_DUPLICATE_2d2b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l73_l99_l94_l91_l86_l82_l76_DUPLICATE_2d2b_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l68_l73_l91_DUPLICATE_c76d LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l68_l73_l91_DUPLICATE_c76d_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l73_c11_d3a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l73_c11_d3a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d3a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l73_c11_d3a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d3a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d3a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l73_c11_d3a6_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l89_c21_0593] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l89_c21_0593_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c21_0593_left;
     BIN_OP_PLUS_uxn_opcodes_h_l89_c21_0593_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c21_0593_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c21_0593_return_output := BIN_OP_PLUS_uxn_opcodes_h_l89_c21_0593_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l92_c21_6164] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l92_c21_6164_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c21_6164_left;
     BIN_OP_PLUS_uxn_opcodes_h_l92_c21_6164_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c21_6164_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c21_6164_return_output := BIN_OP_PLUS_uxn_opcodes_h_l92_c21_6164_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l97_c25_9e8e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l97_c25_9e8e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c25_9e8e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l97_c25_9e8e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c25_9e8e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c25_9e8e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l97_c25_9e8e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l91_c11_d98d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l91_c11_d98d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_d98d_left;
     BIN_OP_EQ_uxn_opcodes_h_l91_c11_d98d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_d98d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_d98d_return_output := BIN_OP_EQ_uxn_opcodes_h_l91_c11_d98d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l94_c11_cf55] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l94_c11_cf55_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_cf55_left;
     BIN_OP_EQ_uxn_opcodes_h_l94_c11_cf55_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_cf55_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_cf55_return_output := BIN_OP_EQ_uxn_opcodes_h_l94_c11_cf55_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_7a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_1e2c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_7a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_1e2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_7a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_1e2c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_7a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_1e2c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_7a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_1e2c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_7a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_1e2c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_7a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_1e2c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l68_c2_7a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_1e2c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_7a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_1e2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_cb0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d3a6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_cb0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d3a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d3a6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_cb0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d3a6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l73_c7_cb0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d3a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d3a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_cb0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d3a6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l73_c7_cb0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d3a6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_cb0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d3a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f15b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_2a39_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f15b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_2a39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f15b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_2a39_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_f15b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_2a39_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_f15b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_2a39_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f15b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_2a39_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_f15b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_2a39_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_f15b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_2a39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_bbe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_4243_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_bbe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_4243_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_bbe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_4243_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l82_c7_bbe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_4243_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l82_c7_bbe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_4243_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_bbe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_4243_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_32a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_3cd5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_32a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_3cd5_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l86_c7_32a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_3cd5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l86_c7_32a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_3cd5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_32a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_3cd5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_19dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_d98d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_19dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_d98d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_19dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_d98d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_19dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_d98d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_19dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_d98d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_06d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_cf55_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_06d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_cf55_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l94_c7_06d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_cf55_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_06d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_cf55_return_output;
     VAR_MUX_uxn_opcodes_h_l97_c15_ddff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c15_de80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_c68a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_bedd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_c68a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_bedd_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l89_c3_44e0 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c21_0593_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l92_c3_52bf := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c21_6164_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l97_c15_ddff_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c25_9e8e_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_0cfa_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l95_l87_DUPLICATE_b863_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_03e2_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l95_l87_DUPLICATE_b863_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l68_l73_l76_DUPLICATE_2c51_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l68_l73_l76_DUPLICATE_2c51_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l68_l73_l76_DUPLICATE_2c51_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l73_l68_l94_l91_l86_l82_l76_DUPLICATE_4ff8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l73_l68_l94_l91_l86_l82_l76_DUPLICATE_4ff8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l73_l68_l94_l91_l86_l82_l76_DUPLICATE_4ff8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l73_l68_l94_l91_l86_l82_l76_DUPLICATE_4ff8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l73_l68_l94_l91_l86_l82_l76_DUPLICATE_4ff8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l73_l68_l94_l91_l86_l82_l76_DUPLICATE_4ff8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l94_c7_06d9_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l73_l68_l94_l91_l86_l82_l76_DUPLICATE_4ff8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l68_l73_l91_DUPLICATE_c76d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l68_l73_l91_DUPLICATE_c76d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l68_l73_l91_DUPLICATE_c76d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l73_l99_l94_l91_l86_l82_l76_DUPLICATE_2d2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l73_l99_l94_l91_l86_l82_l76_DUPLICATE_2d2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l73_l99_l94_l91_l86_l82_l76_DUPLICATE_2d2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l73_l99_l94_l91_l86_l82_l76_DUPLICATE_2d2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l73_l99_l94_l91_l86_l82_l76_DUPLICATE_2d2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_06d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l73_l99_l94_l91_l86_l82_l76_DUPLICATE_2d2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_c68a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l73_l99_l94_l91_l86_l82_l76_DUPLICATE_2d2b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l73_l99_l68_l91_l86_l82_l76_DUPLICATE_a68f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l73_l99_l68_l91_l86_l82_l76_DUPLICATE_a68f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l73_l99_l68_l91_l86_l82_l76_DUPLICATE_a68f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l73_l99_l68_l91_l86_l82_l76_DUPLICATE_a68f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l73_l99_l68_l91_l86_l82_l76_DUPLICATE_a68f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l73_l99_l68_l91_l86_l82_l76_DUPLICATE_a68f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_c68a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l73_l99_l68_l91_l86_l82_l76_DUPLICATE_a68f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l68_l82_l73_DUPLICATE_a388_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l68_l82_l73_DUPLICATE_a388_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l68_l82_l73_DUPLICATE_a388_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l73_c7_cb0c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l89_c3_44e0;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l92_c3_52bf;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l73_c7_cb0c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_cb0c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_cb0c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output;

     -- t8_MUX[uxn_opcodes_h_l76_c7_f15b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l76_c7_f15b_cond <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_f15b_cond;
     t8_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue;
     t8_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_f15b_return_output := t8_MUX_uxn_opcodes_h_l76_c7_f15b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l95_c3_0cfa] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l95_c3_0cfa_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_0cfa_left;
     BIN_OP_OR_uxn_opcodes_h_l95_c3_0cfa_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_0cfa_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_0cfa_return_output := BIN_OP_OR_uxn_opcodes_h_l95_c3_0cfa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l76_c7_f15b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f15b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f15b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f15b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f15b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l99_c7_c68a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_c68a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_c68a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_c68a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_c68a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_c68a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_c68a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_c68a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_c68a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l82_c7_bbe6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_bbe6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_bbe6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l99_c7_c68a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_c68a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_c68a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_c68a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_c68a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_c68a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_c68a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_c68a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_c68a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l91_c7_19dc] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l91_c7_19dc_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_19dc_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_19dc_return_output := result_ram_addr_MUX_uxn_opcodes_h_l91_c7_19dc_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l88_c3_03e2] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l88_c3_03e2_x <= VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_03e2_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_03e2_return_output := CONST_SL_8_uxn_opcodes_h_l88_c3_03e2_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_6258_right := VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_0cfa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_06d9_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_0cfa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_03e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_06d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_c68a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_06d9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_c68a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_19dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f15b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l76_c7_f15b_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l94_c7_06d9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l94_c7_06d9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_06d9_cond;
     tmp16_MUX_uxn_opcodes_h_l94_c7_06d9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_06d9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l94_c7_06d9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_06d9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_06d9_return_output := tmp16_MUX_uxn_opcodes_h_l94_c7_06d9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l94_c7_06d9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_06d9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_06d9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_06d9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_06d9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_06d9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_06d9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_06d9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_06d9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l73_c7_cb0c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output;

     -- t8_MUX[uxn_opcodes_h_l73_c7_cb0c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l73_c7_cb0c_cond <= VAR_t8_MUX_uxn_opcodes_h_l73_c7_cb0c_cond;
     t8_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue;
     t8_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output := t8_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l94_c7_06d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_06d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_06d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_06d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_06d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_06d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_06d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_06d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_06d9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l68_c2_7a20] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_7a20_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_7a20_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_7a20_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_7a20_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l86_c7_32a3] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l86_c7_32a3_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l86_c7_32a3_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l86_c7_32a3_return_output := result_ram_addr_MUX_uxn_opcodes_h_l86_c7_32a3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l76_c7_f15b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f15b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f15b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f15b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f15b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l97_c35_6258] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l97_c35_6258_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_6258_left;
     BIN_OP_PLUS_uxn_opcodes_h_l97_c35_6258_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_6258_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_6258_return_output := BIN_OP_PLUS_uxn_opcodes_h_l97_c35_6258_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_b56a_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_6258_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_06d9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_06d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f15b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l86_c7_32a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse := VAR_t8_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_06d9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l91_c7_19dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_19dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_19dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_19dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_19dc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l73_c7_cb0c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l97_c35_b56a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l97_c35_b56a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_b56a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l97_c35_b56a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_b56a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_b56a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l97_c35_b56a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l68_c2_7a20] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_7a20_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_7a20_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_7a20_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_7a20_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l91_c7_19dc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l91_c7_19dc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_19dc_cond;
     tmp16_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_19dc_return_output := tmp16_MUX_uxn_opcodes_h_l91_c7_19dc_return_output;

     -- t8_MUX[uxn_opcodes_h_l68_c2_7a20] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l68_c2_7a20_cond <= VAR_t8_MUX_uxn_opcodes_h_l68_c2_7a20_cond;
     t8_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue;
     t8_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l68_c2_7a20_return_output := t8_MUX_uxn_opcodes_h_l68_c2_7a20_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l82_c7_bbe6] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l82_c7_bbe6_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l82_c7_bbe6_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output := result_ram_addr_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l91_c7_19dc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_19dc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_19dc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_19dc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_19dc_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l97_c15_ddff_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_b56a_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_19dc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_19dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l68_c2_7a20_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_19dc_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l76_c7_f15b] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l76_c7_f15b_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_f15b_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_f15b_return_output := result_ram_addr_MUX_uxn_opcodes_h_l76_c7_f15b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l86_c7_32a3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_32a3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_32a3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_32a3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_32a3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l86_c7_32a3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l86_c7_32a3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_32a3_cond;
     tmp16_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_32a3_return_output := tmp16_MUX_uxn_opcodes_h_l86_c7_32a3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l68_c2_7a20] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_7a20_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_7a20_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_7a20_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_7a20_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l86_c7_32a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_32a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_32a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_32a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_32a3_return_output;

     -- MUX[uxn_opcodes_h_l97_c15_ddff] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l97_c15_ddff_cond <= VAR_MUX_uxn_opcodes_h_l97_c15_ddff_cond;
     MUX_uxn_opcodes_h_l97_c15_ddff_iftrue <= VAR_MUX_uxn_opcodes_h_l97_c15_ddff_iftrue;
     MUX_uxn_opcodes_h_l97_c15_ddff_iffalse <= VAR_MUX_uxn_opcodes_h_l97_c15_ddff_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l97_c15_ddff_return_output := MUX_uxn_opcodes_h_l97_c15_ddff_return_output;

     -- Submodule level 5
     VAR_result_pc_MUX_uxn_opcodes_h_l94_c7_06d9_iftrue := VAR_MUX_uxn_opcodes_h_l97_c15_ddff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_32a3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_32a3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_f15b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_32a3_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l73_c7_cb0c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l73_c7_cb0c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l73_c7_cb0c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l94_c7_06d9] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l94_c7_06d9_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l94_c7_06d9_cond;
     result_pc_MUX_uxn_opcodes_h_l94_c7_06d9_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l94_c7_06d9_iftrue;
     result_pc_MUX_uxn_opcodes_h_l94_c7_06d9_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l94_c7_06d9_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l94_c7_06d9_return_output := result_pc_MUX_uxn_opcodes_h_l94_c7_06d9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l82_c7_bbe6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_bbe6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_bbe6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l82_c7_bbe6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_bbe6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_bbe6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l82_c7_bbe6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l82_c7_bbe6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_bbe6_cond;
     tmp16_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output := tmp16_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l94_c7_06d9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l76_c7_f15b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f15b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f15b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f15b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f15b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l76_c7_f15b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l76_c7_f15b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_f15b_cond;
     tmp16_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_f15b_return_output := tmp16_MUX_uxn_opcodes_h_l76_c7_f15b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l76_c7_f15b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f15b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f15b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f15b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f15b_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l91_c7_19dc] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l91_c7_19dc_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_19dc_cond;
     result_pc_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_19dc_iftrue;
     result_pc_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_19dc_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_19dc_return_output := result_pc_MUX_uxn_opcodes_h_l91_c7_19dc_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l68_c2_7a20] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l68_c2_7a20_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_7a20_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_7a20_return_output := result_ram_addr_MUX_uxn_opcodes_h_l68_c2_7a20_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f15b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f15b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_19dc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_f15b_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l73_c7_cb0c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_cb0c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_cb0c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l73_c7_cb0c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_cb0c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_cb0c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l73_c7_cb0c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l73_c7_cb0c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_cb0c_cond;
     tmp16_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output := tmp16_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l86_c7_32a3] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l86_c7_32a3_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l86_c7_32a3_cond;
     result_pc_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l86_c7_32a3_iftrue;
     result_pc_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l86_c7_32a3_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l86_c7_32a3_return_output := result_pc_MUX_uxn_opcodes_h_l86_c7_32a3_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l86_c7_32a3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l68_c2_7a20] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l68_c2_7a20_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_7a20_cond;
     tmp16_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue;
     tmp16_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_7a20_return_output := tmp16_MUX_uxn_opcodes_h_l68_c2_7a20_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l68_c2_7a20] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_7a20_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_7a20_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_7a20_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_7a20_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l68_c2_7a20] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_7a20_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_7a20_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_7a20_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_7a20_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l82_c7_bbe6] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l82_c7_bbe6_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l82_c7_bbe6_cond;
     result_pc_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l82_c7_bbe6_iftrue;
     result_pc_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l82_c7_bbe6_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output := result_pc_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output;

     -- Submodule level 9
     VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l82_c7_bbe6_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_7a20_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l76_c7_f15b] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l76_c7_f15b_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_f15b_cond;
     result_pc_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_f15b_iftrue;
     result_pc_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_f15b_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_f15b_return_output := result_pc_MUX_uxn_opcodes_h_l76_c7_f15b_return_output;

     -- Submodule level 10
     VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_f15b_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l73_c7_cb0c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l73_c7_cb0c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_cb0c_cond;
     result_pc_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_cb0c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_cb0c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output := result_pc_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output;

     -- Submodule level 11
     VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_cb0c_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l68_c2_7a20] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l68_c2_7a20_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_7a20_cond;
     result_pc_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_7a20_iftrue;
     result_pc_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_7a20_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_7a20_return_output := result_pc_MUX_uxn_opcodes_h_l68_c2_7a20_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_564f_uxn_opcodes_h_l104_l63_DUPLICATE_c5d0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_564f_uxn_opcodes_h_l104_l63_DUPLICATE_c5d0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_564f(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_7a20_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_7a20_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_7a20_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_7a20_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_7a20_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_7a20_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_7a20_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_564f_uxn_opcodes_h_l104_l63_DUPLICATE_c5d0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_564f_uxn_opcodes_h_l104_l63_DUPLICATE_c5d0_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
