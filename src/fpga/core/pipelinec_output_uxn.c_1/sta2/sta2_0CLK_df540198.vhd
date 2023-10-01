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
-- Submodules: 134
entity sta2_0CLK_df540198 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta2_0CLK_df540198;
architecture arch of sta2_0CLK_df540198 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1485_c6_664c]
signal BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1485_c1_6ae7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_6ae7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_6ae7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_6ae7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_6ae7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1485_c2_0ea6]
signal n16_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1485_c2_0ea6]
signal t16_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1485_c2_0ea6]
signal result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1485_c2_0ea6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1485_c2_0ea6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1485_c2_0ea6]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1485_c2_0ea6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1485_c2_0ea6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1485_c2_0ea6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output : signed(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1485_c2_0ea6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1485_c2_0ea6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1485_c2_0ea6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1485_c2_0ea6]
signal result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1486_c3_ffcb[uxn_opcodes_h_l1486_c3_ffcb]
signal printf_uxn_opcodes_h_l1486_c3_ffcb_uxn_opcodes_h_l1486_c3_ffcb_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1493_c11_5d7b]
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1493_c7_5fcc]
signal n16_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1493_c7_5fcc]
signal t16_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1493_c7_5fcc]
signal result_ram_value_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1493_c7_5fcc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1493_c7_5fcc]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1493_c7_5fcc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1493_c7_5fcc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1493_c7_5fcc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1493_c7_5fcc]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1493_c7_5fcc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1493_c7_5fcc]
signal result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1497_c11_c45f]
signal BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1497_c7_28eb]
signal n16_MUX_uxn_opcodes_h_l1497_c7_28eb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1497_c7_28eb]
signal t16_MUX_uxn_opcodes_h_l1497_c7_28eb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1497_c7_28eb]
signal result_ram_value_MUX_uxn_opcodes_h_l1497_c7_28eb_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1497_c7_28eb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_28eb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1497_c7_28eb]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_28eb_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1497_c7_28eb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1497_c7_28eb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_28eb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1497_c7_28eb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_28eb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1497_c7_28eb]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_28eb_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1497_c7_28eb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1497_c7_28eb]
signal result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_28eb_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1503_c11_12b4]
signal BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1503_c7_ded2]
signal n16_MUX_uxn_opcodes_h_l1503_c7_ded2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1503_c7_ded2]
signal t16_MUX_uxn_opcodes_h_l1503_c7_ded2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1503_c7_ded2]
signal result_ram_value_MUX_uxn_opcodes_h_l1503_c7_ded2_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1503_c7_ded2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_ded2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1503_c7_ded2]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_ded2_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1503_c7_ded2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1503_c7_ded2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_ded2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1503_c7_ded2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_ded2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1503_c7_ded2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_ded2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1503_c7_ded2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1503_c7_ded2]
signal result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_ded2_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1507_c11_b53d]
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1507_c7_9ecd]
signal n16_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1507_c7_9ecd]
signal t16_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1507_c7_9ecd]
signal result_ram_value_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1507_c7_9ecd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1507_c7_9ecd]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1507_c7_9ecd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1507_c7_9ecd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1507_c7_9ecd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1507_c7_9ecd]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1507_c7_9ecd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1507_c7_9ecd]
signal result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1508_c3_5f51]
signal BIN_OP_OR_uxn_opcodes_h_l1508_c3_5f51_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1508_c3_5f51_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1508_c3_5f51_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1512_c11_c00d]
signal BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1512_c7_13d5]
signal n16_MUX_uxn_opcodes_h_l1512_c7_13d5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1512_c7_13d5]
signal result_ram_value_MUX_uxn_opcodes_h_l1512_c7_13d5_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1512_c7_13d5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_13d5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1512_c7_13d5]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_13d5_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1512_c7_13d5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1512_c7_13d5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_13d5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1512_c7_13d5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_13d5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1512_c7_13d5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_13d5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1512_c7_13d5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1512_c7_13d5]
signal result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_13d5_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1516_c11_308a]
signal BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1516_c7_3147]
signal n16_MUX_uxn_opcodes_h_l1516_c7_3147_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1516_c7_3147_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1516_c7_3147]
signal result_ram_value_MUX_uxn_opcodes_h_l1516_c7_3147_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1516_c7_3147_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1516_c7_3147]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_3147_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_3147_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1516_c7_3147]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_3147_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_3147_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1516_c7_3147]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_3147_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_3147_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1516_c7_3147]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_3147_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_3147_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1516_c7_3147]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_3147_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_3147_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1516_c7_3147]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_3147_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_3147_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1516_c7_3147]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_3147_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_3147_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1516_c7_3147]
signal result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_3147_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_3147_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1522_c11_2ceb]
signal BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1522_c7_cadf]
signal n16_MUX_uxn_opcodes_h_l1522_c7_cadf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1522_c7_cadf]
signal result_ram_value_MUX_uxn_opcodes_h_l1522_c7_cadf_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1522_c7_cadf]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_cadf_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1522_c7_cadf]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_cadf_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1522_c7_cadf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1522_c7_cadf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_cadf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1522_c7_cadf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_cadf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1522_c7_cadf]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_cadf_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1522_c7_cadf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1522_c7_cadf]
signal result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_cadf_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1526_c11_eba2]
signal BIN_OP_EQ_uxn_opcodes_h_l1526_c11_eba2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1526_c11_eba2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1526_c11_eba2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1526_c7_4ff2]
signal n16_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1526_c7_4ff2]
signal result_ram_value_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1526_c7_4ff2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1526_c7_4ff2]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1526_c7_4ff2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1526_c7_4ff2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1526_c7_4ff2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output : signed(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1526_c7_4ff2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1526_c7_4ff2]
signal result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1527_c3_cc8d]
signal BIN_OP_OR_uxn_opcodes_h_l1527_c3_cc8d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1527_c3_cc8d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1527_c3_cc8d_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1530_c32_205f]
signal BIN_OP_AND_uxn_opcodes_h_l1530_c32_205f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1530_c32_205f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1530_c32_205f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1530_c32_5341]
signal BIN_OP_GT_uxn_opcodes_h_l1530_c32_5341_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1530_c32_5341_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1530_c32_5341_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1530_c32_62e8]
signal MUX_uxn_opcodes_h_l1530_c32_62e8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1530_c32_62e8_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1530_c32_62e8_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1530_c32_62e8_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1532_c11_6df0]
signal BIN_OP_EQ_uxn_opcodes_h_l1532_c11_6df0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1532_c11_6df0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1532_c11_6df0_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1532_c7_7597]
signal result_ram_value_MUX_uxn_opcodes_h_l1532_c7_7597_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1532_c7_7597_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1532_c7_7597]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_7597_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_7597_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1532_c7_7597]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_7597_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_7597_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1532_c7_7597]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_7597_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_7597_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1532_c7_7597]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_7597_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_7597_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1532_c7_7597]
signal result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_7597_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_7597_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1537_c32_0c6c]
signal CONST_SR_8_uxn_opcodes_h_l1537_c32_0c6c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1537_c32_0c6c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1539_c11_27cc]
signal BIN_OP_EQ_uxn_opcodes_h_l1539_c11_27cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1539_c11_27cc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1539_c11_27cc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1539_c7_300b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_300b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_300b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_300b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_300b_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1539_c7_300b]
signal result_ram_value_MUX_uxn_opcodes_h_l1539_c7_300b_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1539_c7_300b_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1539_c7_300b_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1539_c7_300b_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1539_c7_300b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_300b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_300b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_300b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_300b_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1539_c7_300b]
signal result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_300b_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_300b_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_300b_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_300b_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1541_c21_32f1]
signal BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_32f1_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_32f1_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_32f1_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1544_c11_d800]
signal BIN_OP_EQ_uxn_opcodes_h_l1544_c11_d800_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1544_c11_d800_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1544_c11_d800_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1544_c7_f472]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_f472_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_f472_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_f472_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_f472_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1544_c7_f472]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_f472_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_f472_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_f472_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_f472_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_d20e
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_d20e_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_d20e_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_751c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.ram_value := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_ram_read := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;
      base.is_stack_index_flipped := ref_toks_10;
      base.ram_addr := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c
BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_left,
BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_right,
BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_6ae7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_6ae7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_6ae7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_6ae7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_6ae7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_6ae7_return_output);

-- n16_MUX_uxn_opcodes_h_l1485_c2_0ea6
n16_MUX_uxn_opcodes_h_l1485_c2_0ea6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond,
n16_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue,
n16_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse,
n16_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output);

-- t16_MUX_uxn_opcodes_h_l1485_c2_0ea6
t16_MUX_uxn_opcodes_h_l1485_c2_0ea6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond,
t16_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue,
t16_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse,
t16_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0ea6
result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0ea6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond,
result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0ea6
result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0ea6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0ea6
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0ea6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0ea6
result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0ea6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0ea6
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0ea6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0ea6
result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0ea6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0ea6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0ea6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0ea6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0ea6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0ea6
result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0ea6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output);

-- printf_uxn_opcodes_h_l1486_c3_ffcb_uxn_opcodes_h_l1486_c3_ffcb
printf_uxn_opcodes_h_l1486_c3_ffcb_uxn_opcodes_h_l1486_c3_ffcb : entity work.printf_uxn_opcodes_h_l1486_c3_ffcb_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1486_c3_ffcb_uxn_opcodes_h_l1486_c3_ffcb_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b_left,
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b_right,
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b_return_output);

-- n16_MUX_uxn_opcodes_h_l1493_c7_5fcc
n16_MUX_uxn_opcodes_h_l1493_c7_5fcc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond,
n16_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue,
n16_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse,
n16_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output);

-- t16_MUX_uxn_opcodes_h_l1493_c7_5fcc
t16_MUX_uxn_opcodes_h_l1493_c7_5fcc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond,
t16_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue,
t16_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse,
t16_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1493_c7_5fcc
result_ram_value_MUX_uxn_opcodes_h_l1493_c7_5fcc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond,
result_ram_value_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_5fcc
result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_5fcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_5fcc
result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_5fcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc
result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_5fcc
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_5fcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_5fcc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_5fcc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_5fcc
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_5fcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_5fcc
result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_5fcc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f_left,
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f_right,
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f_return_output);

-- n16_MUX_uxn_opcodes_h_l1497_c7_28eb
n16_MUX_uxn_opcodes_h_l1497_c7_28eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1497_c7_28eb_cond,
n16_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue,
n16_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse,
n16_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output);

-- t16_MUX_uxn_opcodes_h_l1497_c7_28eb
t16_MUX_uxn_opcodes_h_l1497_c7_28eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1497_c7_28eb_cond,
t16_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue,
t16_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse,
t16_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1497_c7_28eb
result_ram_value_MUX_uxn_opcodes_h_l1497_c7_28eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1497_c7_28eb_cond,
result_ram_value_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_28eb
result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_28eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_28eb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_28eb
result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_28eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_28eb_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_28eb
result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_28eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_28eb
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_28eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_28eb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_28eb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_28eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_28eb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_28eb
result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_28eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_28eb_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_28eb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_28eb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_28eb
result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_28eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_28eb_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4
BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4_left,
BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4_right,
BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4_return_output);

-- n16_MUX_uxn_opcodes_h_l1503_c7_ded2
n16_MUX_uxn_opcodes_h_l1503_c7_ded2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1503_c7_ded2_cond,
n16_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue,
n16_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse,
n16_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output);

-- t16_MUX_uxn_opcodes_h_l1503_c7_ded2
t16_MUX_uxn_opcodes_h_l1503_c7_ded2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1503_c7_ded2_cond,
t16_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue,
t16_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse,
t16_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1503_c7_ded2
result_ram_value_MUX_uxn_opcodes_h_l1503_c7_ded2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1503_c7_ded2_cond,
result_ram_value_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_ded2
result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_ded2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_ded2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_ded2
result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_ded2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_ded2_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_ded2
result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_ded2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_ded2
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_ded2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_ded2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_ded2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_ded2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_ded2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_ded2
result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_ded2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_ded2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_ded2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_ded2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_ded2
result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_ded2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_ded2_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d_left,
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d_right,
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d_return_output);

-- n16_MUX_uxn_opcodes_h_l1507_c7_9ecd
n16_MUX_uxn_opcodes_h_l1507_c7_9ecd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond,
n16_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue,
n16_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse,
n16_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output);

-- t16_MUX_uxn_opcodes_h_l1507_c7_9ecd
t16_MUX_uxn_opcodes_h_l1507_c7_9ecd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond,
t16_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue,
t16_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse,
t16_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1507_c7_9ecd
result_ram_value_MUX_uxn_opcodes_h_l1507_c7_9ecd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond,
result_ram_value_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_9ecd
result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_9ecd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_9ecd
result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_9ecd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_9ecd
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_9ecd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_9ecd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_9ecd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_9ecd
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_9ecd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_9ecd
result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_9ecd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1508_c3_5f51
BIN_OP_OR_uxn_opcodes_h_l1508_c3_5f51 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1508_c3_5f51_left,
BIN_OP_OR_uxn_opcodes_h_l1508_c3_5f51_right,
BIN_OP_OR_uxn_opcodes_h_l1508_c3_5f51_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d_left,
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d_right,
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d_return_output);

-- n16_MUX_uxn_opcodes_h_l1512_c7_13d5
n16_MUX_uxn_opcodes_h_l1512_c7_13d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1512_c7_13d5_cond,
n16_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue,
n16_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse,
n16_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1512_c7_13d5
result_ram_value_MUX_uxn_opcodes_h_l1512_c7_13d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1512_c7_13d5_cond,
result_ram_value_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_13d5
result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_13d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_13d5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_13d5
result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_13d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_13d5_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_13d5
result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_13d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_13d5
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_13d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_13d5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_13d5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_13d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_13d5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_13d5
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_13d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_13d5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_13d5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_13d5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_13d5
result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_13d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_13d5_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a
BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a_left,
BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a_right,
BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a_return_output);

-- n16_MUX_uxn_opcodes_h_l1516_c7_3147
n16_MUX_uxn_opcodes_h_l1516_c7_3147 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1516_c7_3147_cond,
n16_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue,
n16_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse,
n16_MUX_uxn_opcodes_h_l1516_c7_3147_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1516_c7_3147
result_ram_value_MUX_uxn_opcodes_h_l1516_c7_3147 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1516_c7_3147_cond,
result_ram_value_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1516_c7_3147_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_3147
result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_3147 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_3147_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_3147_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_3147
result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_3147 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_3147_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_3147_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_3147
result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_3147 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_3147_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_3147_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_3147
result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_3147 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_3147_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_3147_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_3147
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_3147 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_3147_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_3147_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_3147
result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_3147 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_3147_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_3147_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_3147
result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_3147 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_3147_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_3147_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_3147
result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_3147 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_3147_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_3147_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb
BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb_left,
BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb_right,
BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb_return_output);

-- n16_MUX_uxn_opcodes_h_l1522_c7_cadf
n16_MUX_uxn_opcodes_h_l1522_c7_cadf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1522_c7_cadf_cond,
n16_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue,
n16_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse,
n16_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1522_c7_cadf
result_ram_value_MUX_uxn_opcodes_h_l1522_c7_cadf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1522_c7_cadf_cond,
result_ram_value_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_cadf
result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_cadf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_cadf_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_cadf
result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_cadf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_cadf_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_cadf
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_cadf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_cadf
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_cadf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_cadf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_cadf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_cadf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_cadf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_cadf
result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_cadf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_cadf_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_cadf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_cadf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_cadf
result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_cadf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_cadf_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1526_c11_eba2
BIN_OP_EQ_uxn_opcodes_h_l1526_c11_eba2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1526_c11_eba2_left,
BIN_OP_EQ_uxn_opcodes_h_l1526_c11_eba2_right,
BIN_OP_EQ_uxn_opcodes_h_l1526_c11_eba2_return_output);

-- n16_MUX_uxn_opcodes_h_l1526_c7_4ff2
n16_MUX_uxn_opcodes_h_l1526_c7_4ff2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond,
n16_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue,
n16_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse,
n16_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1526_c7_4ff2
result_ram_value_MUX_uxn_opcodes_h_l1526_c7_4ff2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond,
result_ram_value_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_4ff2
result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_4ff2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_4ff2
result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_4ff2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_4ff2
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_4ff2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_4ff2
result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_4ff2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_4ff2
result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_4ff2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1527_c3_cc8d
BIN_OP_OR_uxn_opcodes_h_l1527_c3_cc8d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1527_c3_cc8d_left,
BIN_OP_OR_uxn_opcodes_h_l1527_c3_cc8d_right,
BIN_OP_OR_uxn_opcodes_h_l1527_c3_cc8d_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1530_c32_205f
BIN_OP_AND_uxn_opcodes_h_l1530_c32_205f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1530_c32_205f_left,
BIN_OP_AND_uxn_opcodes_h_l1530_c32_205f_right,
BIN_OP_AND_uxn_opcodes_h_l1530_c32_205f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1530_c32_5341
BIN_OP_GT_uxn_opcodes_h_l1530_c32_5341 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1530_c32_5341_left,
BIN_OP_GT_uxn_opcodes_h_l1530_c32_5341_right,
BIN_OP_GT_uxn_opcodes_h_l1530_c32_5341_return_output);

-- MUX_uxn_opcodes_h_l1530_c32_62e8
MUX_uxn_opcodes_h_l1530_c32_62e8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1530_c32_62e8_cond,
MUX_uxn_opcodes_h_l1530_c32_62e8_iftrue,
MUX_uxn_opcodes_h_l1530_c32_62e8_iffalse,
MUX_uxn_opcodes_h_l1530_c32_62e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1532_c11_6df0
BIN_OP_EQ_uxn_opcodes_h_l1532_c11_6df0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1532_c11_6df0_left,
BIN_OP_EQ_uxn_opcodes_h_l1532_c11_6df0_right,
BIN_OP_EQ_uxn_opcodes_h_l1532_c11_6df0_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1532_c7_7597
result_ram_value_MUX_uxn_opcodes_h_l1532_c7_7597 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1532_c7_7597_cond,
result_ram_value_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1532_c7_7597_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_7597
result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_7597 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_7597_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_7597_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_7597
result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_7597 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_7597_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_7597_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_7597
result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_7597 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_7597_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_7597_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_7597
result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_7597 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_7597_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_7597_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_7597
result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_7597 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_7597_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_7597_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1537_c32_0c6c
CONST_SR_8_uxn_opcodes_h_l1537_c32_0c6c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1537_c32_0c6c_x,
CONST_SR_8_uxn_opcodes_h_l1537_c32_0c6c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1539_c11_27cc
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_27cc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_27cc_left,
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_27cc_right,
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_27cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_300b
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_300b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_300b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_300b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_300b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_300b_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1539_c7_300b
result_ram_value_MUX_uxn_opcodes_h_l1539_c7_300b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1539_c7_300b_cond,
result_ram_value_MUX_uxn_opcodes_h_l1539_c7_300b_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1539_c7_300b_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1539_c7_300b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_300b
result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_300b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_300b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_300b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_300b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_300b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_300b
result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_300b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_300b_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_300b_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_300b_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_300b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_32f1
BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_32f1 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_32f1_left,
BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_32f1_right,
BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_32f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1544_c11_d800
BIN_OP_EQ_uxn_opcodes_h_l1544_c11_d800 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1544_c11_d800_left,
BIN_OP_EQ_uxn_opcodes_h_l1544_c11_d800_right,
BIN_OP_EQ_uxn_opcodes_h_l1544_c11_d800_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_f472
result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_f472 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_f472_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_f472_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_f472_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_f472_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_f472
result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_f472 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_f472_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_f472_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_f472_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_f472_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_d20e
CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_d20e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_d20e_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_d20e_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_6ae7_return_output,
 n16_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output,
 t16_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b_return_output,
 n16_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output,
 t16_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f_return_output,
 n16_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output,
 t16_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4_return_output,
 n16_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output,
 t16_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d_return_output,
 n16_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output,
 t16_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1508_c3_5f51_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d_return_output,
 n16_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a_return_output,
 n16_MUX_uxn_opcodes_h_l1516_c7_3147_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1516_c7_3147_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_3147_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_3147_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_3147_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_3147_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_3147_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_3147_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_3147_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_3147_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb_return_output,
 n16_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1526_c11_eba2_return_output,
 n16_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1527_c3_cc8d_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1530_c32_205f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1530_c32_5341_return_output,
 MUX_uxn_opcodes_h_l1530_c32_62e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1532_c11_6df0_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1532_c7_7597_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_7597_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_7597_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_7597_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_7597_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_7597_return_output,
 CONST_SR_8_uxn_opcodes_h_l1537_c32_0c6c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1539_c11_27cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_300b_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1539_c7_300b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_300b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_300b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_32f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1544_c11_d800_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_f472_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_f472_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_d20e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_6ae7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_6ae7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_6ae7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_6ae7_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1485_c2_0ea6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1489_c3_041b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1485_c2_0ea6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1486_c3_ffcb_uxn_opcodes_h_l1486_c3_ffcb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1495_c3_9817 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1497_c7_28eb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1497_c7_28eb_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_28eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_28eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_28eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_28eb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1501_c3_bfea : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_28eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_28eb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_28eb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1503_c7_ded2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1503_c7_ded2_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_ded2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_ded2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_ded2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_ded2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1505_c3_ca34 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_ded2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_ded2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_ded2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1510_c3_b52f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1508_c3_5f51_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1508_c3_5f51_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1508_c3_5f51_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1516_c7_3147_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1512_c7_13d5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_3147_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_13d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_3147_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_13d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_3147_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_13d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_3147_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_3147_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_13d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1514_c3_1cf5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_3147_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_13d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_3147_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_13d5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_3147_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_3147_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_13d5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1516_c7_3147_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_3147_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_3147_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_3147_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_3147_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_3147_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1520_c3_c96f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_3147_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_3147_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_3147_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_3147_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1522_c7_cadf_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_cadf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_cadf_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_cadf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_cadf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1524_c3_28af : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1522_c7_cadf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_cadf_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_cadf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_cadf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_eba2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_eba2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_eba2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_7597_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1526_c7_4ff2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_7597_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_7597_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_7597_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_7597_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_7597_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1527_c3_cc8d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1527_c3_cc8d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1527_c3_cc8d_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1530_c32_62e8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1530_c32_62e8_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1530_c32_62e8_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1530_c32_205f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1530_c32_205f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1530_c32_205f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1530_c32_5341_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1530_c32_5341_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1530_c32_5341_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1530_c32_62e8_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_6df0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_6df0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_6df0_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_300b_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_7597_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_7597_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_300b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_7597_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_7597_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_300b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_7597_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_300b_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_7597_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1537_c32_0c6c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1537_c32_0c6c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1537_c22_994e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_27cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_27cc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_27cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_300b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_300b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_f472_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_300b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_300b_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_300b_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_300b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_300b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_300b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_f472_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_300b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_300b_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1541_c3_048b : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_300b_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_300b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_32f1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_32f1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_32f1_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1542_c22_a325_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_d800_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_d800_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_d800_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_f472_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_f472_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_f472_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_f472_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_f472_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_f472_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1507_l1539_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_e450_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1532_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_2495_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1532_l1497_l1493_l1522_l1485_l1516_DUPLICATE_bba8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_311f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1544_l1507_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_f466_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1507_l1539_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_9562_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1544_l1507_l1539_l1503_l1532_l1497_l1526_l1493_l1522_l1516_DUPLICATE_18a8_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1498_l1517_l1527_l1508_DUPLICATE_7fc1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_d20e_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_d20e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_751c_uxn_opcodes_h_l1549_l1481_DUPLICATE_a20f_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1489_c3_041b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1489_c3_041b;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_6ae7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_6df0_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1514_c3_1cf5 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1514_c3_1cf5;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_eba2_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1510_c3_b52f := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1510_c3_b52f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_27cc_right := to_unsigned(10, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1530_c32_205f_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1505_c3_ca34 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1505_c3_ca34;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_32f1_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1530_c32_62e8_iffalse := resize(to_signed(-4, 4), 8);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_f472_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_f472_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d_right := to_unsigned(5, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_300b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_d800_right := to_unsigned(11, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1530_c32_5341_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1524_c3_28af := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1524_c3_28af;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1501_c3_bfea := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1501_c3_bfea;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1520_c3_c96f := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1520_c3_c96f;
     VAR_MUX_uxn_opcodes_h_l1530_c32_62e8_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1495_c3_9817 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1495_c3_9817;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d_right := to_unsigned(4, 3);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_6ae7_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1530_c32_205f_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1527_c3_cc8d_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1537_c32_0c6c_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_eba2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_6df0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_27cc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_d800_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1508_c3_5f51_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_32f1_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse := t16;
     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_311f LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_311f_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1544_l1507_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_f466 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1544_l1507_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_f466_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1503_c11_12b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1526_c7_4ff2] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1526_c7_4ff2_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1507_c11_b53d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1544_c11_d800] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1544_c11_d800_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_d800_left;
     BIN_OP_EQ_uxn_opcodes_h_l1544_c11_d800_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_d800_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_d800_return_output := BIN_OP_EQ_uxn_opcodes_h_l1544_c11_d800_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1522_c11_2ceb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1522_c7_cadf] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1522_c7_cadf_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1497_c11_c45f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1542_c22_a325] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1542_c22_a325_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1498_l1517_l1527_l1508_DUPLICATE_7fc1 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1498_l1517_l1527_l1508_DUPLICATE_7fc1_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_PLUS[uxn_opcodes_h_l1541_c21_32f1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_32f1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_32f1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_32f1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_32f1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_32f1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_32f1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1539_c11_27cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1539_c11_27cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_27cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1539_c11_27cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_27cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_27cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1539_c11_27cc_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1537_c32_0c6c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1537_c32_0c6c_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1537_c32_0c6c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1537_c32_0c6c_return_output := CONST_SR_8_uxn_opcodes_h_l1537_c32_0c6c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1532_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_2495 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1532_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_2495_return_output := result.is_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1516_c11_308a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1507_l1539_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_e450 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1507_l1539_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_e450_return_output := result.ram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1512_c11_c00d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1493_c11_5d7b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1485_c2_0ea6] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1485_c2_0ea6_return_output := result.is_stack_index_flipped;

     -- BIN_OP_AND[uxn_opcodes_h_l1530_c32_205f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1530_c32_205f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1530_c32_205f_left;
     BIN_OP_AND_uxn_opcodes_h_l1530_c32_205f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1530_c32_205f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1530_c32_205f_return_output := BIN_OP_AND_uxn_opcodes_h_l1530_c32_205f_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1485_c2_0ea6] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1485_c2_0ea6_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1532_c11_6df0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1532_c11_6df0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_6df0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1532_c11_6df0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_6df0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_6df0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1532_c11_6df0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1526_c11_eba2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1526_c11_eba2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_eba2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1526_c11_eba2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_eba2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_eba2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1526_c11_eba2_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1507_l1539_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_9562 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1507_l1539_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_9562_return_output := result.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1544_l1507_l1539_l1503_l1532_l1497_l1526_l1493_l1522_l1516_DUPLICATE_18a8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1544_l1507_l1539_l1503_l1532_l1497_l1526_l1493_l1522_l1516_DUPLICATE_18a8_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1532_l1497_l1493_l1522_l1485_l1516_DUPLICATE_bba8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1532_l1497_l1493_l1522_l1485_l1516_DUPLICATE_bba8_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1485_c6_664c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1530_c32_5341_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1530_c32_205f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_6ae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_664c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_5d7b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1497_c7_28eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_28eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_28eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_28eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_28eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_28eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_28eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_28eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1497_c7_28eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_c45f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1503_c7_ded2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_ded2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_ded2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_ded2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_ded2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_ded2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_ded2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_ded2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1503_c7_ded2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_12b4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_b53d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1512_c7_13d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_13d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_13d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_13d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_13d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_13d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_13d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_13d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_c00d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1516_c7_3147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_3147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_3147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_3147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_3147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_3147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_3147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_3147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_3147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_3147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_308a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1522_c7_cadf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_cadf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_cadf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_cadf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_cadf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_cadf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_cadf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_cadf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_2ceb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_eba2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_eba2_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_eba2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_eba2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_eba2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_eba2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_eba2_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_eba2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_eba2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_7597_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_6df0_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_7597_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_6df0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_7597_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_6df0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_7597_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_6df0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_7597_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_6df0_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_7597_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_6df0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_300b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_27cc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_300b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_27cc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_300b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_27cc_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_300b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_27cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_f472_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_d800_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_f472_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_d800_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1541_c3_048b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_32f1_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1508_c3_5f51_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1498_l1517_l1527_l1508_DUPLICATE_7fc1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1527_c3_cc8d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1498_l1517_l1527_l1508_DUPLICATE_7fc1_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_d20e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1498_l1517_l1527_l1508_DUPLICATE_7fc1_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_300b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1542_c22_a325_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_311f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_311f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_311f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_311f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_311f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_311f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_311f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_311f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_311f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1507_l1539_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_9562_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1507_l1539_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_9562_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1507_l1539_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_9562_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1507_l1539_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_9562_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1507_l1539_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_9562_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1507_l1539_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_9562_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1507_l1539_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_9562_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1507_l1539_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_9562_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1507_l1539_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_9562_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_300b_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1507_l1539_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_9562_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1544_l1507_l1539_l1503_l1532_l1497_l1526_l1493_l1522_l1516_DUPLICATE_18a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1544_l1507_l1539_l1503_l1532_l1497_l1526_l1493_l1522_l1516_DUPLICATE_18a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1544_l1507_l1539_l1503_l1532_l1497_l1526_l1493_l1522_l1516_DUPLICATE_18a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1544_l1507_l1539_l1503_l1532_l1497_l1526_l1493_l1522_l1516_DUPLICATE_18a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1544_l1507_l1539_l1503_l1532_l1497_l1526_l1493_l1522_l1516_DUPLICATE_18a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1544_l1507_l1539_l1503_l1532_l1497_l1526_l1493_l1522_l1516_DUPLICATE_18a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1544_l1507_l1539_l1503_l1532_l1497_l1526_l1493_l1522_l1516_DUPLICATE_18a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1544_l1507_l1539_l1503_l1532_l1497_l1526_l1493_l1522_l1516_DUPLICATE_18a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1544_l1507_l1539_l1503_l1532_l1497_l1526_l1493_l1522_l1516_DUPLICATE_18a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_300b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1544_l1507_l1539_l1503_l1532_l1497_l1526_l1493_l1522_l1516_DUPLICATE_18a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_f472_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1544_l1507_l1539_l1503_l1532_l1497_l1526_l1493_l1522_l1516_DUPLICATE_18a8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1532_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_2495_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1532_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_2495_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1532_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_2495_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1532_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_2495_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1532_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_2495_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1532_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_2495_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1532_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_2495_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1532_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_2495_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1532_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_2495_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1532_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_2495_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1544_l1507_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_f466_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1544_l1507_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_f466_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1544_l1507_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_f466_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1544_l1507_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_f466_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1544_l1507_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_f466_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1544_l1507_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_f466_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1544_l1507_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_f466_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1544_l1507_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_f466_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1544_l1507_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_f466_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_f472_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1544_l1507_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_f466_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1532_l1497_l1493_l1522_l1485_l1516_DUPLICATE_bba8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1532_l1497_l1493_l1522_l1485_l1516_DUPLICATE_bba8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1532_l1497_l1493_l1522_l1485_l1516_DUPLICATE_bba8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1532_l1497_l1493_l1522_l1485_l1516_DUPLICATE_bba8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1532_l1497_l1493_l1522_l1485_l1516_DUPLICATE_bba8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1532_l1497_l1493_l1522_l1485_l1516_DUPLICATE_bba8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1532_l1497_l1493_l1522_l1485_l1516_DUPLICATE_bba8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1532_l1497_l1493_l1522_l1485_l1516_DUPLICATE_bba8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1512_l1507_l1503_l1532_l1497_l1493_l1522_l1485_l1516_DUPLICATE_bba8_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1507_l1539_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_e450_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1507_l1539_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_e450_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1507_l1539_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_e450_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1507_l1539_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_e450_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1507_l1539_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_e450_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1507_l1539_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_e450_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1507_l1539_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_e450_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1507_l1539_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_e450_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1507_l1539_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_e450_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_300b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1507_l1539_l1503_l1497_l1526_l1493_l1522_l1485_l1516_DUPLICATE_e450_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1485_c2_0ea6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1526_c7_4ff2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1485_c2_0ea6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1522_c7_cadf_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_300b_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1541_c3_048b;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1485_c2_0ea6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1508_c3_5f51] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1508_c3_5f51_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1508_c3_5f51_left;
     BIN_OP_OR_uxn_opcodes_h_l1508_c3_5f51_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1508_c3_5f51_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1508_c3_5f51_return_output := BIN_OP_OR_uxn_opcodes_h_l1508_c3_5f51_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1527_c3_cc8d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1527_c3_cc8d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1527_c3_cc8d_left;
     BIN_OP_OR_uxn_opcodes_h_l1527_c3_cc8d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1527_c3_cc8d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1527_c3_cc8d_return_output := BIN_OP_OR_uxn_opcodes_h_l1527_c3_cc8d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1526_c7_4ff2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1532_c7_7597] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_7597_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_7597_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_7597_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_7597_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1485_c2_0ea6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1544_c7_f472] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_f472_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_f472_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_f472_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_f472_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_f472_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_f472_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_f472_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_f472_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1532_c7_7597] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_7597_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_7597_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_7597_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_7597_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1537_c22_994e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1537_c22_994e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1537_c32_0c6c_return_output);

     -- result_ram_value_MUX[uxn_opcodes_h_l1539_c7_300b] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1539_c7_300b_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_300b_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1539_c7_300b_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_300b_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1539_c7_300b_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_300b_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_300b_return_output := result_ram_value_MUX_uxn_opcodes_h_l1539_c7_300b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1522_c7_cadf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_cadf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_cadf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1485_c1_6ae7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_6ae7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_6ae7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_6ae7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_6ae7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_6ae7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_6ae7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_6ae7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_6ae7_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1530_c32_5341] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1530_c32_5341_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1530_c32_5341_left;
     BIN_OP_GT_uxn_opcodes_h_l1530_c32_5341_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1530_c32_5341_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1530_c32_5341_return_output := BIN_OP_GT_uxn_opcodes_h_l1530_c32_5341_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1539_c7_300b] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_300b_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_300b_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_300b_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_300b_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_300b_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_300b_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_300b_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_300b_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_d20e LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_d20e_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_d20e_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_d20e_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_d20e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1544_c7_f472] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_f472_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_f472_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_f472_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_f472_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_f472_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_f472_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_f472_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_f472_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1530_c32_62e8_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1530_c32_5341_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1508_c3_5f51_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1527_c3_cc8d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1537_c22_994e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_d20e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_d20e_return_output;
     VAR_printf_uxn_opcodes_h_l1486_c3_ffcb_uxn_opcodes_h_l1486_c3_ffcb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_6ae7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_300b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_f472_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_7597_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_300b_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_f472_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_7597_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_300b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_300b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1516_c7_3147] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_3147_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_3147_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_3147_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_3147_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1526_c7_4ff2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1522_c7_cadf] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_cadf_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_cadf_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1532_c7_7597] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1532_c7_7597_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_7597_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_7597_return_output := result_ram_value_MUX_uxn_opcodes_h_l1532_c7_7597_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1539_c7_300b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_300b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_300b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_300b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_300b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_300b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_300b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_300b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_300b_return_output;

     -- printf_uxn_opcodes_h_l1486_c3_ffcb[uxn_opcodes_h_l1486_c3_ffcb] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1486_c3_ffcb_uxn_opcodes_h_l1486_c3_ffcb_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1486_c3_ffcb_uxn_opcodes_h_l1486_c3_ffcb_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l1526_c7_4ff2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond;
     n16_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue;
     n16_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output := n16_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output;

     -- MUX[uxn_opcodes_h_l1530_c32_62e8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1530_c32_62e8_cond <= VAR_MUX_uxn_opcodes_h_l1530_c32_62e8_cond;
     MUX_uxn_opcodes_h_l1530_c32_62e8_iftrue <= VAR_MUX_uxn_opcodes_h_l1530_c32_62e8_iftrue;
     MUX_uxn_opcodes_h_l1530_c32_62e8_iffalse <= VAR_MUX_uxn_opcodes_h_l1530_c32_62e8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1530_c32_62e8_return_output := MUX_uxn_opcodes_h_l1530_c32_62e8_return_output;

     -- t16_MUX[uxn_opcodes_h_l1507_c7_9ecd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond <= VAR_t16_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond;
     t16_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue;
     t16_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output := t16_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1539_c7_300b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_300b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_300b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_300b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_300b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_300b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_300b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_300b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_300b_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1526_c7_4ff2] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1532_c7_7597] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_7597_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_7597_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_7597_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_7597_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue := VAR_MUX_uxn_opcodes_h_l1530_c32_62e8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_300b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_300b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_7597_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_7597_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_3147_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1532_c7_7597] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_7597_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_7597_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_7597_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_7597_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1526_c7_4ff2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1522_c7_cadf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1522_c7_cadf_cond <= VAR_n16_MUX_uxn_opcodes_h_l1522_c7_cadf_cond;
     n16_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue;
     n16_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output := n16_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1516_c7_3147] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_3147_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_3147_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_3147_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_3147_return_output;

     -- t16_MUX[uxn_opcodes_h_l1503_c7_ded2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1503_c7_ded2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1503_c7_ded2_cond;
     t16_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue;
     t16_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output := t16_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1532_c7_7597] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_7597_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_7597_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_7597_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_7597_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_7597_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_7597_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1522_c7_cadf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1522_c7_cadf] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_cadf_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_cadf_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1526_c7_4ff2] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output := result_ram_value_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1512_c7_13d5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_13d5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_13d5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1526_c7_4ff2] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_7597_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_7597_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_3147_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output;
     -- t16_MUX[uxn_opcodes_h_l1497_c7_28eb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1497_c7_28eb_cond <= VAR_t16_MUX_uxn_opcodes_h_l1497_c7_28eb_cond;
     t16_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue;
     t16_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output := t16_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1522_c7_cadf] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1522_c7_cadf_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_cadf_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output := result_ram_value_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1526_c7_4ff2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1516_c7_3147] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1516_c7_3147_cond <= VAR_n16_MUX_uxn_opcodes_h_l1516_c7_3147_cond;
     n16_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue;
     n16_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1516_c7_3147_return_output := n16_MUX_uxn_opcodes_h_l1516_c7_3147_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1516_c7_3147] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_3147_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_3147_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_3147_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_3147_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1526_c7_4ff2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_4ff2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_4ff2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_4ff2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1522_c7_cadf] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_cadf_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_cadf_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1516_c7_3147] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_3147_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_3147_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_3147_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_3147_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1512_c7_13d5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_13d5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_13d5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1522_c7_cadf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1507_c7_9ecd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1516_c7_3147_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_3147_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_4ff2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_3147_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l1512_c7_13d5] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_13d5_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_13d5_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1516_c7_3147] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_3147_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_3147_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_3147_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_3147_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1516_c7_3147] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1516_c7_3147_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_3147_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_3147_return_output := result_ram_value_MUX_uxn_opcodes_h_l1516_c7_3147_return_output;

     -- t16_MUX[uxn_opcodes_h_l1493_c7_5fcc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond <= VAR_t16_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond;
     t16_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue;
     t16_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output := t16_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1512_c7_13d5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1503_c7_ded2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_ded2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_ded2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1507_c7_9ecd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1516_c7_3147] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_3147_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_3147_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_3147_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_3147_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1522_c7_cadf] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_cadf_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_cadf_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1522_c7_cadf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_cadf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_cadf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_cadf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_cadf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output;

     -- n16_MUX[uxn_opcodes_h_l1512_c7_13d5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1512_c7_13d5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1512_c7_13d5_cond;
     n16_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue;
     n16_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output := n16_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_cadf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_3147_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_3147_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_3147_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1512_c7_13d5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1507_c7_9ecd] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1503_c7_ded2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_ded2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_ded2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1512_c7_13d5] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_13d5_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_13d5_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1512_c7_13d5] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1512_c7_13d5_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_13d5_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output := result_ram_value_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1516_c7_3147] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_3147_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_3147_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_3147_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_3147_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1507_c7_9ecd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output;

     -- t16_MUX[uxn_opcodes_h_l1485_c2_0ea6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond;
     t16_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue;
     t16_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output := t16_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1507_c7_9ecd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond <= VAR_n16_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond;
     n16_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue;
     n16_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output := n16_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1497_c7_28eb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_28eb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_28eb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1516_c7_3147] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_3147_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_3147_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_3147_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_3147_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_3147_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_3147_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_3147_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_3147_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1512_c7_13d5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_13d5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_13d5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1503_c7_ded2] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_ded2_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_ded2_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1512_c7_13d5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_13d5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_13d5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_13d5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_13d5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1497_c7_28eb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_28eb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_28eb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1507_c7_9ecd] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1493_c7_5fcc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output;

     -- n16_MUX[uxn_opcodes_h_l1503_c7_ded2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1503_c7_ded2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1503_c7_ded2_cond;
     n16_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue;
     n16_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output := n16_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1503_c7_ded2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1507_c7_9ecd] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output := result_ram_value_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1507_c7_9ecd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_13d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1503_c7_ded2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1493_c7_5fcc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1485_c2_0ea6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1497_c7_28eb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1497_c7_28eb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1497_c7_28eb_cond;
     n16_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue;
     n16_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output := n16_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1503_c7_ded2] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_ded2_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_ded2_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1497_c7_28eb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1507_c7_9ecd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1507_c7_9ecd] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_9ecd_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_9ecd_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_9ecd_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1497_c7_28eb] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_28eb_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_28eb_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1503_c7_ded2] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1503_c7_ded2_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_ded2_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output := result_ram_value_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_9ecd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1503_c7_ded2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_ded2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_ded2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1493_c7_5fcc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1497_c7_28eb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1503_c7_ded2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_ded2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_ded2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_ded2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_ded2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1485_c2_0ea6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1493_c7_5fcc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond <= VAR_n16_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond;
     n16_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue;
     n16_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output := n16_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1497_c7_28eb] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1497_c7_28eb_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_28eb_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output := result_ram_value_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1497_c7_28eb] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_28eb_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_28eb_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1493_c7_5fcc] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_ded2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1493_c7_5fcc] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1497_c7_28eb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_28eb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_28eb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1497_c7_28eb] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_28eb_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_28eb_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_28eb_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_28eb_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1493_c7_5fcc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output;

     -- n16_MUX[uxn_opcodes_h_l1485_c2_0ea6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond;
     n16_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue;
     n16_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output := n16_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1493_c7_5fcc] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output := result_ram_value_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1485_c2_0ea6] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1485_c2_0ea6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_28eb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1493_c7_5fcc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1485_c2_0ea6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1485_c2_0ea6] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1485_c2_0ea6] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output := result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1493_c7_5fcc] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_5fcc_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_5fcc_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_5fcc_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_5fcc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1485_c2_0ea6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1485_c2_0ea6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_751c_uxn_opcodes_h_l1549_l1481_DUPLICATE_a20f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_751c_uxn_opcodes_h_l1549_l1481_DUPLICATE_a20f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_751c(
     result,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0ea6_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_751c_uxn_opcodes_h_l1549_l1481_DUPLICATE_a20f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_751c_uxn_opcodes_h_l1549_l1481_DUPLICATE_a20f_return_output;
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
