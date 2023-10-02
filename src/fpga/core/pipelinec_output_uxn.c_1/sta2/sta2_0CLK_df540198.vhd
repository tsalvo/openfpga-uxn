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
-- BIN_OP_EQ[uxn_opcodes_h_l1485_c6_6d92]
signal BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1485_c1_13ce]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_13ce_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_13ce_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_13ce_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_13ce_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1485_c2_2f2f]
signal t16_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1485_c2_2f2f]
signal n16_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1485_c2_2f2f]
signal result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1485_c2_2f2f]
signal result_ram_value_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1485_c2_2f2f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1485_c2_2f2f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1485_c2_2f2f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1485_c2_2f2f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1485_c2_2f2f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1485_c2_2f2f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1485_c2_2f2f]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1485_c2_2f2f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1485_c2_2f2f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1486_c3_68c9[uxn_opcodes_h_l1486_c3_68c9]
signal printf_uxn_opcodes_h_l1486_c3_68c9_uxn_opcodes_h_l1486_c3_68c9_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1493_c11_a3a2]
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1493_c7_f8c1]
signal t16_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1493_c7_f8c1]
signal n16_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1493_c7_f8c1]
signal result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1493_c7_f8c1]
signal result_ram_value_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1493_c7_f8c1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1493_c7_f8c1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1493_c7_f8c1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1493_c7_f8c1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1493_c7_f8c1]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1493_c7_f8c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1493_c7_f8c1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1497_c11_39a7]
signal BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1497_c7_c7c1]
signal t16_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1497_c7_c7c1]
signal n16_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1497_c7_c7c1]
signal result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1497_c7_c7c1]
signal result_ram_value_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1497_c7_c7c1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1497_c7_c7c1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1497_c7_c7c1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1497_c7_c7c1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1497_c7_c7c1]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1497_c7_c7c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1497_c7_c7c1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1503_c11_637f]
signal BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1503_c7_869d]
signal t16_MUX_uxn_opcodes_h_l1503_c7_869d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1503_c7_869d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1503_c7_869d]
signal n16_MUX_uxn_opcodes_h_l1503_c7_869d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1503_c7_869d_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1503_c7_869d]
signal result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_869d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_869d_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1503_c7_869d]
signal result_ram_value_MUX_uxn_opcodes_h_l1503_c7_869d_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1503_c7_869d_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1503_c7_869d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_869d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_869d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1503_c7_869d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_869d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_869d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1503_c7_869d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_869d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_869d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1503_c7_869d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_869d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_869d_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1503_c7_869d]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_869d_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_869d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1503_c7_869d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_869d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_869d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1503_c7_869d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_869d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_869d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1507_c11_6997]
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1507_c7_1728]
signal t16_MUX_uxn_opcodes_h_l1507_c7_1728_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1507_c7_1728_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1507_c7_1728]
signal n16_MUX_uxn_opcodes_h_l1507_c7_1728_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1507_c7_1728_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1507_c7_1728]
signal result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_1728_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_1728_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1507_c7_1728]
signal result_ram_value_MUX_uxn_opcodes_h_l1507_c7_1728_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1507_c7_1728_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1507_c7_1728]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_1728_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_1728_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1507_c7_1728]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_1728_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_1728_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1507_c7_1728]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_1728_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_1728_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1507_c7_1728]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_1728_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_1728_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1507_c7_1728]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_1728_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_1728_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1507_c7_1728]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_1728_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_1728_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1507_c7_1728]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_1728_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_1728_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1508_c3_088d]
signal BIN_OP_OR_uxn_opcodes_h_l1508_c3_088d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1508_c3_088d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1508_c3_088d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1512_c11_0547]
signal BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1512_c7_c1f5]
signal n16_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1512_c7_c1f5]
signal result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1512_c7_c1f5]
signal result_ram_value_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1512_c7_c1f5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1512_c7_c1f5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1512_c7_c1f5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1512_c7_c1f5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1512_c7_c1f5]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1512_c7_c1f5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1512_c7_c1f5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1516_c11_ce48]
signal BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1516_c7_e8c9]
signal n16_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1516_c7_e8c9]
signal result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1516_c7_e8c9]
signal result_ram_value_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1516_c7_e8c9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1516_c7_e8c9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1516_c7_e8c9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1516_c7_e8c9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1516_c7_e8c9]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1516_c7_e8c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1516_c7_e8c9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1522_c11_c12f]
signal BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1522_c7_89ed]
signal n16_MUX_uxn_opcodes_h_l1522_c7_89ed_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1522_c7_89ed]
signal result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_89ed_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1522_c7_89ed]
signal result_ram_value_MUX_uxn_opcodes_h_l1522_c7_89ed_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1522_c7_89ed]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_89ed_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1522_c7_89ed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1522_c7_89ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_89ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1522_c7_89ed]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1522_c7_89ed]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_89ed_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1522_c7_89ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_89ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1522_c7_89ed]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_89ed_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1526_c11_7049]
signal BIN_OP_EQ_uxn_opcodes_h_l1526_c11_7049_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1526_c11_7049_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1526_c11_7049_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1526_c7_f134]
signal n16_MUX_uxn_opcodes_h_l1526_c7_f134_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1526_c7_f134_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1526_c7_f134]
signal result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_f134_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_f134_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1526_c7_f134]
signal result_ram_value_MUX_uxn_opcodes_h_l1526_c7_f134_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1526_c7_f134_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1526_c7_f134]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_f134_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_f134_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1526_c7_f134]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_f134_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_f134_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1526_c7_f134]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_f134_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_f134_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1526_c7_f134]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_f134_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_f134_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1526_c7_f134]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_f134_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_f134_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1526_c7_f134]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_f134_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_f134_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1527_c3_380e]
signal BIN_OP_OR_uxn_opcodes_h_l1527_c3_380e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1527_c3_380e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1527_c3_380e_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1530_c32_cc92]
signal BIN_OP_AND_uxn_opcodes_h_l1530_c32_cc92_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1530_c32_cc92_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1530_c32_cc92_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1530_c32_6ccd]
signal BIN_OP_GT_uxn_opcodes_h_l1530_c32_6ccd_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1530_c32_6ccd_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1530_c32_6ccd_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1530_c32_652e]
signal MUX_uxn_opcodes_h_l1530_c32_652e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1530_c32_652e_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1530_c32_652e_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1530_c32_652e_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1532_c11_03c1]
signal BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03c1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03c1_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1532_c7_b99c]
signal result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_b99c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1532_c7_b99c]
signal result_ram_value_MUX_uxn_opcodes_h_l1532_c7_b99c_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1532_c7_b99c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_b99c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1532_c7_b99c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_b99c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1532_c7_b99c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_b99c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1532_c7_b99c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_b99c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1537_c32_83b9]
signal CONST_SR_8_uxn_opcodes_h_l1537_c32_83b9_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1537_c32_83b9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1539_c11_e023]
signal BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e023_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e023_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e023_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1539_c7_f0c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_f0c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_f0c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_f0c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_f0c0_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1539_c7_f0c0]
signal result_ram_value_MUX_uxn_opcodes_h_l1539_c7_f0c0_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1539_c7_f0c0_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1539_c7_f0c0_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1539_c7_f0c0_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1539_c7_f0c0]
signal result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_f0c0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_f0c0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_f0c0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_f0c0_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1539_c7_f0c0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_f0c0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_f0c0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_f0c0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_f0c0_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1541_c21_95b0]
signal BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_95b0_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_95b0_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_95b0_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1544_c11_1bd8]
signal BIN_OP_EQ_uxn_opcodes_h_l1544_c11_1bd8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1544_c11_1bd8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1544_c11_1bd8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1544_c7_3d09]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_3d09_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_3d09_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_3d09_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_3d09_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1544_c7_3d09]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_3d09_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_3d09_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_3d09_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_3d09_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_ca7b
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_ca7b_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_ca7b_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_ffdf( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.ram_addr := ref_toks_1;
      base.ram_value := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.is_sp_shift := ref_toks_8;
      base.is_ram_read := ref_toks_9;
      base.is_opc_done := ref_toks_10;
      base.is_stack_read := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92
BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_left,
BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_right,
BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_13ce
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_13ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_13ce_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_13ce_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_13ce_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_13ce_return_output);

-- t16_MUX_uxn_opcodes_h_l1485_c2_2f2f
t16_MUX_uxn_opcodes_h_l1485_c2_2f2f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond,
t16_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue,
t16_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse,
t16_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output);

-- n16_MUX_uxn_opcodes_h_l1485_c2_2f2f
n16_MUX_uxn_opcodes_h_l1485_c2_2f2f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond,
n16_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue,
n16_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse,
n16_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_2f2f
result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_2f2f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1485_c2_2f2f
result_ram_value_MUX_uxn_opcodes_h_l1485_c2_2f2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond,
result_ram_value_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_2f2f
result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_2f2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_2f2f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_2f2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_2f2f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_2f2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_2f2f
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_2f2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_2f2f
result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_2f2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_2f2f
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_2f2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_2f2f
result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_2f2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output);

-- printf_uxn_opcodes_h_l1486_c3_68c9_uxn_opcodes_h_l1486_c3_68c9
printf_uxn_opcodes_h_l1486_c3_68c9_uxn_opcodes_h_l1486_c3_68c9 : entity work.printf_uxn_opcodes_h_l1486_c3_68c9_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1486_c3_68c9_uxn_opcodes_h_l1486_c3_68c9_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2_left,
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2_right,
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2_return_output);

-- t16_MUX_uxn_opcodes_h_l1493_c7_f8c1
t16_MUX_uxn_opcodes_h_l1493_c7_f8c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond,
t16_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue,
t16_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse,
t16_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output);

-- n16_MUX_uxn_opcodes_h_l1493_c7_f8c1
n16_MUX_uxn_opcodes_h_l1493_c7_f8c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond,
n16_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue,
n16_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse,
n16_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_f8c1
result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_f8c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1493_c7_f8c1
result_ram_value_MUX_uxn_opcodes_h_l1493_c7_f8c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond,
result_ram_value_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_f8c1
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_f8c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_f8c1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_f8c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1
result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_f8c1
result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_f8c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_f8c1
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_f8c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_f8c1
result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_f8c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7_left,
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7_right,
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7_return_output);

-- t16_MUX_uxn_opcodes_h_l1497_c7_c7c1
t16_MUX_uxn_opcodes_h_l1497_c7_c7c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond,
t16_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue,
t16_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse,
t16_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output);

-- n16_MUX_uxn_opcodes_h_l1497_c7_c7c1
n16_MUX_uxn_opcodes_h_l1497_c7_c7c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond,
n16_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue,
n16_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse,
n16_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_c7c1
result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_c7c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1497_c7_c7c1
result_ram_value_MUX_uxn_opcodes_h_l1497_c7_c7c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond,
result_ram_value_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_c7c1
result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_c7c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_c7c1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_c7c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1
result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_c7c1
result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_c7c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_c7c1
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_c7c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_c7c1
result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_c7c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f
BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f_left,
BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f_right,
BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f_return_output);

-- t16_MUX_uxn_opcodes_h_l1503_c7_869d
t16_MUX_uxn_opcodes_h_l1503_c7_869d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1503_c7_869d_cond,
t16_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue,
t16_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse,
t16_MUX_uxn_opcodes_h_l1503_c7_869d_return_output);

-- n16_MUX_uxn_opcodes_h_l1503_c7_869d
n16_MUX_uxn_opcodes_h_l1503_c7_869d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1503_c7_869d_cond,
n16_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue,
n16_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse,
n16_MUX_uxn_opcodes_h_l1503_c7_869d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_869d
result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_869d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_869d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_869d_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1503_c7_869d
result_ram_value_MUX_uxn_opcodes_h_l1503_c7_869d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1503_c7_869d_cond,
result_ram_value_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1503_c7_869d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_869d
result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_869d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_869d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_869d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_869d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_869d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_869d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_869d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_869d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_869d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_869d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_869d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_869d
result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_869d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_869d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_869d_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_869d
result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_869d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_869d_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_869d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_869d
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_869d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_869d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_869d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_869d
result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_869d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_869d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_869d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997_left,
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997_right,
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997_return_output);

-- t16_MUX_uxn_opcodes_h_l1507_c7_1728
t16_MUX_uxn_opcodes_h_l1507_c7_1728 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1507_c7_1728_cond,
t16_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue,
t16_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse,
t16_MUX_uxn_opcodes_h_l1507_c7_1728_return_output);

-- n16_MUX_uxn_opcodes_h_l1507_c7_1728
n16_MUX_uxn_opcodes_h_l1507_c7_1728 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1507_c7_1728_cond,
n16_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue,
n16_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse,
n16_MUX_uxn_opcodes_h_l1507_c7_1728_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_1728
result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_1728 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_1728_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_1728_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1507_c7_1728
result_ram_value_MUX_uxn_opcodes_h_l1507_c7_1728 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1507_c7_1728_cond,
result_ram_value_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1507_c7_1728_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_1728
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_1728 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_1728_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_1728_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_1728
result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_1728 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_1728_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_1728_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_1728
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_1728 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_1728_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_1728_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_1728
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_1728 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_1728_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_1728_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_1728
result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_1728 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_1728_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_1728_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_1728
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_1728 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_1728_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_1728_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_1728
result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_1728 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_1728_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_1728_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1508_c3_088d
BIN_OP_OR_uxn_opcodes_h_l1508_c3_088d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1508_c3_088d_left,
BIN_OP_OR_uxn_opcodes_h_l1508_c3_088d_right,
BIN_OP_OR_uxn_opcodes_h_l1508_c3_088d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547_left,
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547_right,
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547_return_output);

-- n16_MUX_uxn_opcodes_h_l1512_c7_c1f5
n16_MUX_uxn_opcodes_h_l1512_c7_c1f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond,
n16_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue,
n16_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse,
n16_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_c1f5
result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_c1f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1512_c7_c1f5
result_ram_value_MUX_uxn_opcodes_h_l1512_c7_c1f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond,
result_ram_value_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_c1f5
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_c1f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_c1f5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_c1f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5
result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_c1f5
result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_c1f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_c1f5
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_c1f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_c1f5
result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_c1f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48
BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48_left,
BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48_right,
BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48_return_output);

-- n16_MUX_uxn_opcodes_h_l1516_c7_e8c9
n16_MUX_uxn_opcodes_h_l1516_c7_e8c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond,
n16_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue,
n16_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse,
n16_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_e8c9
result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_e8c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1516_c7_e8c9
result_ram_value_MUX_uxn_opcodes_h_l1516_c7_e8c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond,
result_ram_value_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_e8c9
result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_e8c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_e8c9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_e8c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9
result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_e8c9
result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_e8c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_e8c9
result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_e8c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_e8c9
result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_e8c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f
BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f_left,
BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f_right,
BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f_return_output);

-- n16_MUX_uxn_opcodes_h_l1522_c7_89ed
n16_MUX_uxn_opcodes_h_l1522_c7_89ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1522_c7_89ed_cond,
n16_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue,
n16_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse,
n16_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_89ed
result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_89ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_89ed_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1522_c7_89ed
result_ram_value_MUX_uxn_opcodes_h_l1522_c7_89ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1522_c7_89ed_cond,
result_ram_value_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_89ed
result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_89ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_89ed_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_89ed
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_89ed : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_89ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_89ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_89ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_89ed
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_89ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_89ed
result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_89ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_89ed_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_89ed
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_89ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_89ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_89ed
result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_89ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_89ed_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1526_c11_7049
BIN_OP_EQ_uxn_opcodes_h_l1526_c11_7049 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1526_c11_7049_left,
BIN_OP_EQ_uxn_opcodes_h_l1526_c11_7049_right,
BIN_OP_EQ_uxn_opcodes_h_l1526_c11_7049_return_output);

-- n16_MUX_uxn_opcodes_h_l1526_c7_f134
n16_MUX_uxn_opcodes_h_l1526_c7_f134 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1526_c7_f134_cond,
n16_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue,
n16_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse,
n16_MUX_uxn_opcodes_h_l1526_c7_f134_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_f134
result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_f134 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_f134_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_f134_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1526_c7_f134
result_ram_value_MUX_uxn_opcodes_h_l1526_c7_f134 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1526_c7_f134_cond,
result_ram_value_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1526_c7_f134_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_f134
result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_f134 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_f134_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_f134_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_f134
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_f134 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_f134_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_f134_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_f134
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_f134 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_f134_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_f134_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_f134
result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_f134 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_f134_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_f134_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_f134
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_f134 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_f134_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_f134_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_f134
result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_f134 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_f134_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_f134_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1527_c3_380e
BIN_OP_OR_uxn_opcodes_h_l1527_c3_380e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1527_c3_380e_left,
BIN_OP_OR_uxn_opcodes_h_l1527_c3_380e_right,
BIN_OP_OR_uxn_opcodes_h_l1527_c3_380e_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1530_c32_cc92
BIN_OP_AND_uxn_opcodes_h_l1530_c32_cc92 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1530_c32_cc92_left,
BIN_OP_AND_uxn_opcodes_h_l1530_c32_cc92_right,
BIN_OP_AND_uxn_opcodes_h_l1530_c32_cc92_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1530_c32_6ccd
BIN_OP_GT_uxn_opcodes_h_l1530_c32_6ccd : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1530_c32_6ccd_left,
BIN_OP_GT_uxn_opcodes_h_l1530_c32_6ccd_right,
BIN_OP_GT_uxn_opcodes_h_l1530_c32_6ccd_return_output);

-- MUX_uxn_opcodes_h_l1530_c32_652e
MUX_uxn_opcodes_h_l1530_c32_652e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1530_c32_652e_cond,
MUX_uxn_opcodes_h_l1530_c32_652e_iftrue,
MUX_uxn_opcodes_h_l1530_c32_652e_iffalse,
MUX_uxn_opcodes_h_l1530_c32_652e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03c1
BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03c1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03c1_left,
BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03c1_right,
BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03c1_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_b99c
result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_b99c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_b99c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1532_c7_b99c
result_ram_value_MUX_uxn_opcodes_h_l1532_c7_b99c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1532_c7_b99c_cond,
result_ram_value_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_b99c
result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_b99c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_b99c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_b99c
result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_b99c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_b99c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_b99c
result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_b99c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_b99c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_b99c
result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_b99c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_b99c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1537_c32_83b9
CONST_SR_8_uxn_opcodes_h_l1537_c32_83b9 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1537_c32_83b9_x,
CONST_SR_8_uxn_opcodes_h_l1537_c32_83b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e023
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e023 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e023_left,
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e023_right,
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e023_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_f0c0
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_f0c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_f0c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_f0c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_f0c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_f0c0_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1539_c7_f0c0
result_ram_value_MUX_uxn_opcodes_h_l1539_c7_f0c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1539_c7_f0c0_cond,
result_ram_value_MUX_uxn_opcodes_h_l1539_c7_f0c0_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1539_c7_f0c0_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1539_c7_f0c0_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_f0c0
result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_f0c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_f0c0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_f0c0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_f0c0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_f0c0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_f0c0
result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_f0c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_f0c0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_f0c0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_f0c0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_f0c0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_95b0
BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_95b0 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_95b0_left,
BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_95b0_right,
BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_95b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1544_c11_1bd8
BIN_OP_EQ_uxn_opcodes_h_l1544_c11_1bd8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1544_c11_1bd8_left,
BIN_OP_EQ_uxn_opcodes_h_l1544_c11_1bd8_right,
BIN_OP_EQ_uxn_opcodes_h_l1544_c11_1bd8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_3d09
result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_3d09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_3d09_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_3d09_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_3d09_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_3d09_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_3d09
result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_3d09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_3d09_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_3d09_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_3d09_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_3d09_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_ca7b
CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_ca7b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_ca7b_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_ca7b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_13ce_return_output,
 t16_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output,
 n16_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2_return_output,
 t16_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output,
 n16_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7_return_output,
 t16_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output,
 n16_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f_return_output,
 t16_MUX_uxn_opcodes_h_l1503_c7_869d_return_output,
 n16_MUX_uxn_opcodes_h_l1503_c7_869d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_869d_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1503_c7_869d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_869d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_869d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_869d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_869d_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_869d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_869d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_869d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997_return_output,
 t16_MUX_uxn_opcodes_h_l1507_c7_1728_return_output,
 n16_MUX_uxn_opcodes_h_l1507_c7_1728_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_1728_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1507_c7_1728_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_1728_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_1728_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_1728_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_1728_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_1728_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_1728_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_1728_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1508_c3_088d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547_return_output,
 n16_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48_return_output,
 n16_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f_return_output,
 n16_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1526_c11_7049_return_output,
 n16_MUX_uxn_opcodes_h_l1526_c7_f134_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_f134_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1526_c7_f134_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_f134_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_f134_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_f134_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_f134_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_f134_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_f134_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1527_c3_380e_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1530_c32_cc92_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1530_c32_6ccd_return_output,
 MUX_uxn_opcodes_h_l1530_c32_652e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03c1_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output,
 CONST_SR_8_uxn_opcodes_h_l1537_c32_83b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e023_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_f0c0_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1539_c7_f0c0_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_f0c0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_f0c0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_95b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1544_c11_1bd8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_3d09_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_3d09_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_ca7b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_13ce_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_13ce_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_13ce_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_13ce_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1489_c3_d62d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1485_c2_2f2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1485_c2_2f2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1486_c3_68c9_uxn_opcodes_h_l1486_c3_68c9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1495_c3_b552 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1503_c7_869d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1503_c7_869d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_869d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_869d_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_869d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_869d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1501_c3_902a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_869d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_869d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_869d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_869d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_869d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1507_c7_1728_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1503_c7_869d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1507_c7_1728_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1503_c7_869d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_1728_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_869d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_1728_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_869d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_1728_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_869d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_1728_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_869d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1505_c3_fc82 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_1728_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_869d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_1728_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_869d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_1728_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_869d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_1728_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_869d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_1728_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_869d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1507_c7_1728_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1507_c7_1728_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_1728_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_1728_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_1728_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_1728_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1510_c3_7a8d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_1728_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_1728_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_1728_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_1728_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_1728_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1508_c3_088d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1508_c3_088d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1508_c3_088d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1514_c3_4b25 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1520_c3_c966 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1526_c7_f134_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1522_c7_89ed_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_f134_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_89ed_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_f134_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_89ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_f134_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_89ed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_f134_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1524_c3_af3e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1522_c7_89ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_89ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_f134_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_f134_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_89ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_f134_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_89ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_f134_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_89ed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_7049_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_7049_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_7049_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1526_c7_f134_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_f134_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_f134_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_f134_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_f134_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_f134_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_f134_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_f134_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1526_c7_f134_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_f134_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1527_c3_380e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1527_c3_380e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1527_c3_380e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1530_c32_652e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1530_c32_652e_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1530_c32_652e_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1530_c32_cc92_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1530_c32_cc92_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1530_c32_cc92_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1530_c32_6ccd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1530_c32_6ccd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1530_c32_6ccd_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1530_c32_652e_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03c1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03c1_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_f0c0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_b99c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_f0c0_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_b99c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_b99c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_b99c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_f0c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_b99c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_f0c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_b99c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1537_c32_83b9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1537_c32_83b9_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1537_c22_e1e4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e023_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e023_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e023_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_f0c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_f0c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_3d09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_f0c0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_f0c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_f0c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_f0c0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_f0c0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1541_c3_2d97 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_f0c0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_f0c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_f0c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_f0c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_3d09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_f0c0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_95b0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_95b0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_95b0_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1542_c22_ea84_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_1bd8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_1bd8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_1bd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_3d09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_3d09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_3d09_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_3d09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_3d09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_3d09_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_330f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_7d49_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_21a5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_107b_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1516_l1503_l1507_DUPLICATE_c730_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_3335_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1532_l1512_l1522_l1539_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_5566_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1508_l1498_l1517_l1527_DUPLICATE_5208_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_ca7b_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_ca7b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ffdf_uxn_opcodes_h_l1549_l1481_DUPLICATE_1b60_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_3d09_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1495_c3_b552 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1495_c3_b552;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1501_c3_902a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1501_c3_902a;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1514_c3_4b25 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1514_c3_4b25;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_13ce_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_1bd8_right := to_unsigned(11, 4);
     VAR_MUX_uxn_opcodes_h_l1530_c32_652e_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e023_right := to_unsigned(10, 4);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_f0c0_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03c1_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1524_c3_af3e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1524_c3_af3e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1520_c3_c966 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1520_c3_c966;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1510_c3_7a8d := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1510_c3_7a8d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1505_c3_fc82 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1505_c3_fc82;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_3d09_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1530_c32_6ccd_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_7049_right := to_unsigned(8, 4);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_95b0_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l1530_c32_652e_iffalse := resize(to_signed(-4, 4), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1489_c3_d62d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1489_c3_d62d;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1530_c32_cc92_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7_right := to_unsigned(2, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_13ce_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1530_c32_cc92_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1527_c3_380e_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1537_c32_83b9_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_7049_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03c1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e023_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_1bd8_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1508_c3_088d_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_95b0_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1522_c11_c12f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1541_c21_95b0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_95b0_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_95b0_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_95b0_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_95b0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_95b0_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_95b0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1507_c11_6997] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997_left;
     BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997_return_output := BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1503_c11_637f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1485_c2_2f2f] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1485_c2_2f2f_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1532_c11_03c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03c1_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_330f LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_330f_return_output := result.ram_addr;

     -- CONST_SR_8[uxn_opcodes_h_l1537_c32_83b9] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1537_c32_83b9_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1537_c32_83b9_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1537_c32_83b9_return_output := CONST_SR_8_uxn_opcodes_h_l1537_c32_83b9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1485_c6_6d92] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_left;
     BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_return_output := BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1485_c2_2f2f] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1485_c2_2f2f_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1539_c11_e023] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e023_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e023_left;
     BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e023_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e023_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e023_return_output := BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e023_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1516_c11_ce48] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48_left;
     BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48_return_output := BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1493_c11_a3a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1497_c11_39a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_7d49 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_7d49_return_output := result.ram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1516_l1503_l1507_DUPLICATE_c730 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1516_l1503_l1507_DUPLICATE_c730_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1512_c11_0547] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547_left;
     BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547_return_output := BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1532_l1512_l1522_l1539_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_5566 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1532_l1512_l1522_l1539_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_5566_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_107b LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_107b_return_output := result.sp_relative_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1542_c22_ea84] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1542_c22_ea84_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_AND[uxn_opcodes_h_l1530_c32_cc92] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1530_c32_cc92_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1530_c32_cc92_left;
     BIN_OP_AND_uxn_opcodes_h_l1530_c32_cc92_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1530_c32_cc92_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1530_c32_cc92_return_output := BIN_OP_AND_uxn_opcodes_h_l1530_c32_cc92_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_21a5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_21a5_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_3335 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_3335_return_output := result.is_ram_read;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1526_c7_f134] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1526_c7_f134_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1526_c11_7049] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1526_c11_7049_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_7049_left;
     BIN_OP_EQ_uxn_opcodes_h_l1526_c11_7049_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_7049_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_7049_return_output := BIN_OP_EQ_uxn_opcodes_h_l1526_c11_7049_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1544_c11_1bd8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1544_c11_1bd8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_1bd8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1544_c11_1bd8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_1bd8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_1bd8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1544_c11_1bd8_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1508_l1498_l1517_l1527_DUPLICATE_5208 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1508_l1498_l1517_l1527_DUPLICATE_5208_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1522_c7_89ed] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1522_c7_89ed_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1530_c32_6ccd_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1530_c32_cc92_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_13ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_6d92_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_a3a2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_39a7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1503_c7_869d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_869d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_869d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_869d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_869d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_869d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_869d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_869d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_869d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_869d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1503_c7_869d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_637f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1507_c7_1728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_1728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_1728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_1728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_1728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_1728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_1728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_1728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_1728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_1728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1507_c7_1728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_6997_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0547_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_ce48_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1522_c7_89ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_89ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_89ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_89ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_89ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_89ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_89ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_89ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_c12f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1526_c7_f134_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_7049_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_f134_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_7049_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_f134_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_7049_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_f134_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_7049_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_f134_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_7049_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_f134_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_7049_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_f134_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_7049_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_f134_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_7049_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_f134_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_7049_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_b99c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03c1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_b99c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03c1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_b99c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_b99c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03c1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_b99c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03c1_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_b99c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_f0c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e023_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_f0c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e023_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_f0c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e023_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_f0c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e023_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_3d09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_1bd8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_3d09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_1bd8_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1541_c3_2d97 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_95b0_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1508_c3_088d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1508_l1498_l1517_l1527_DUPLICATE_5208_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1527_c3_380e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1508_l1498_l1517_l1527_DUPLICATE_5208_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_ca7b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1508_l1498_l1517_l1527_DUPLICATE_5208_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_f0c0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1542_c22_ea84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_107b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_107b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_107b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_107b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_107b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_107b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_107b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_107b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_107b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_330f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_330f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_330f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_330f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_330f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_330f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_330f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_330f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_330f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_f0c0_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_330f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1532_l1512_l1522_l1539_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_5566_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1532_l1512_l1522_l1539_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_5566_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1532_l1512_l1522_l1539_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_5566_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1532_l1512_l1522_l1539_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_5566_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1532_l1512_l1522_l1539_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_5566_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1532_l1512_l1522_l1539_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_5566_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1532_l1512_l1522_l1539_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_5566_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1532_l1512_l1522_l1539_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_5566_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1532_l1512_l1522_l1539_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_5566_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_f0c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1532_l1512_l1522_l1539_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_5566_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_3d09_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1532_l1512_l1522_l1539_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_5566_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_3335_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_3335_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_3335_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_3335_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_3335_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_3335_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_3335_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_3335_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_3335_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_3335_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_21a5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_21a5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_21a5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_21a5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_21a5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_21a5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_21a5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_21a5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_21a5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_3d09_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_21a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1516_l1503_l1507_DUPLICATE_c730_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1516_l1503_l1507_DUPLICATE_c730_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1516_l1503_l1507_DUPLICATE_c730_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1516_l1503_l1507_DUPLICATE_c730_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1516_l1503_l1507_DUPLICATE_c730_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1516_l1503_l1507_DUPLICATE_c730_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1516_l1503_l1507_DUPLICATE_c730_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1516_l1503_l1507_DUPLICATE_c730_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1516_l1503_l1507_DUPLICATE_c730_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_7d49_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_7d49_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_7d49_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_7d49_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_7d49_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_7d49_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_7d49_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_7d49_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_7d49_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_f0c0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_7d49_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1485_c2_2f2f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1526_c7_f134_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1485_c2_2f2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1522_c7_89ed_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_f0c0_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1541_c3_2d97;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1532_c7_b99c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_b99c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_b99c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1522_c7_89ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_89ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_89ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_ca7b LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_ca7b_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_ca7b_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_ca7b_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_ca7b_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1539_c7_f0c0] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1539_c7_f0c0_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_f0c0_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1539_c7_f0c0_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_f0c0_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1539_c7_f0c0_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_f0c0_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_f0c0_return_output := result_ram_value_MUX_uxn_opcodes_h_l1539_c7_f0c0_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1539_c7_f0c0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_f0c0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_f0c0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_f0c0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_f0c0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_f0c0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_f0c0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_f0c0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_f0c0_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1530_c32_6ccd] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1530_c32_6ccd_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1530_c32_6ccd_left;
     BIN_OP_GT_uxn_opcodes_h_l1530_c32_6ccd_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1530_c32_6ccd_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1530_c32_6ccd_return_output := BIN_OP_GT_uxn_opcodes_h_l1530_c32_6ccd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1485_c1_13ce] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_13ce_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_13ce_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_13ce_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_13ce_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_13ce_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_13ce_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_13ce_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_13ce_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1544_c7_3d09] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_3d09_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_3d09_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_3d09_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_3d09_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_3d09_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_3d09_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_3d09_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_3d09_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1544_c7_3d09] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_3d09_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_3d09_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_3d09_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_3d09_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_3d09_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_3d09_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_3d09_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_3d09_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1532_c7_b99c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_b99c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_b99c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1537_c22_e1e4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1537_c22_e1e4_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1537_c32_83b9_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1527_c3_380e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1527_c3_380e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1527_c3_380e_left;
     BIN_OP_OR_uxn_opcodes_h_l1527_c3_380e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1527_c3_380e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1527_c3_380e_return_output := BIN_OP_OR_uxn_opcodes_h_l1527_c3_380e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1485_c2_2f2f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1485_c2_2f2f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1526_c7_f134] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_f134_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_f134_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_f134_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_f134_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1508_c3_088d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1508_c3_088d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1508_c3_088d_left;
     BIN_OP_OR_uxn_opcodes_h_l1508_c3_088d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1508_c3_088d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1508_c3_088d_return_output := BIN_OP_OR_uxn_opcodes_h_l1508_c3_088d_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1530_c32_652e_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1530_c32_6ccd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1508_c3_088d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1527_c3_380e_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1537_c22_e1e4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_ca7b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_ca7b_return_output;
     VAR_printf_uxn_opcodes_h_l1486_c3_68c9_uxn_opcodes_h_l1486_c3_68c9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_13ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_f0c0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_3d09_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_f0c0_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_3d09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_f134_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_f0c0_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_f0c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output;
     -- printf_uxn_opcodes_h_l1486_c3_68c9[uxn_opcodes_h_l1486_c3_68c9] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1486_c3_68c9_uxn_opcodes_h_l1486_c3_68c9_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1486_c3_68c9_uxn_opcodes_h_l1486_c3_68c9_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1539_c7_f0c0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_f0c0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_f0c0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_f0c0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_f0c0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_f0c0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_f0c0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_f0c0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_f0c0_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1526_c7_f134] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_f134_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_f134_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_f134_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_f134_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1526_c7_f134] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_f134_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_f134_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_f134_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_f134_return_output;

     -- MUX[uxn_opcodes_h_l1530_c32_652e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1530_c32_652e_cond <= VAR_MUX_uxn_opcodes_h_l1530_c32_652e_cond;
     MUX_uxn_opcodes_h_l1530_c32_652e_iftrue <= VAR_MUX_uxn_opcodes_h_l1530_c32_652e_iftrue;
     MUX_uxn_opcodes_h_l1530_c32_652e_iffalse <= VAR_MUX_uxn_opcodes_h_l1530_c32_652e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1530_c32_652e_return_output := MUX_uxn_opcodes_h_l1530_c32_652e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1526_c7_f134] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1526_c7_f134_cond <= VAR_n16_MUX_uxn_opcodes_h_l1526_c7_f134_cond;
     n16_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue;
     n16_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1526_c7_f134_return_output := n16_MUX_uxn_opcodes_h_l1526_c7_f134_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1532_c7_b99c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_b99c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_b99c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1516_c7_e8c9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1539_c7_f0c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_f0c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_f0c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_f0c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_f0c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_f0c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_f0c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_f0c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_f0c0_return_output;

     -- t16_MUX[uxn_opcodes_h_l1507_c7_1728] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1507_c7_1728_cond <= VAR_t16_MUX_uxn_opcodes_h_l1507_c7_1728_cond;
     t16_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue;
     t16_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1507_c7_1728_return_output := t16_MUX_uxn_opcodes_h_l1507_c7_1728_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1532_c7_b99c] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1532_c7_b99c_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_b99c_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output := result_ram_value_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1522_c7_89ed] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_89ed_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_89ed_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue := VAR_MUX_uxn_opcodes_h_l1530_c32_652e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1526_c7_f134_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_f0c0_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_f134_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_f0c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_f134_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1507_c7_1728_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1532_c7_b99c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_b99c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_b99c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1522_c7_89ed] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_89ed_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_89ed_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1526_c7_f134] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_f134_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_f134_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_f134_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_f134_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1526_c7_f134] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_f134_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_f134_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_f134_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_f134_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1512_c7_c1f5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1522_c7_89ed] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1516_c7_e8c9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1526_c7_f134] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1526_c7_f134_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_f134_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_f134_return_output := result_ram_value_MUX_uxn_opcodes_h_l1526_c7_f134_return_output;

     -- t16_MUX[uxn_opcodes_h_l1503_c7_869d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1503_c7_869d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1503_c7_869d_cond;
     t16_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue;
     t16_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1503_c7_869d_return_output := t16_MUX_uxn_opcodes_h_l1503_c7_869d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1522_c7_89ed] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1522_c7_89ed_cond <= VAR_n16_MUX_uxn_opcodes_h_l1522_c7_89ed_cond;
     n16_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue;
     n16_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output := n16_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1532_c7_b99c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_b99c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_b99c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_b99c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_b99c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_b99c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_f134_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_f134_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_f134_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1503_c7_869d_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1522_c7_89ed] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1522_c7_89ed_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_89ed_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output := result_ram_value_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1507_c7_1728] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_1728_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_1728_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_1728_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_1728_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1526_c7_f134] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_f134_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_f134_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_f134_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_f134_return_output;

     -- n16_MUX[uxn_opcodes_h_l1516_c7_e8c9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond;
     n16_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue;
     n16_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output := n16_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1522_c7_89ed] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_89ed_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_89ed_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output;

     -- t16_MUX[uxn_opcodes_h_l1497_c7_c7c1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond;
     t16_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue;
     t16_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output := t16_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1516_c7_e8c9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1516_c7_e8c9] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1512_c7_c1f5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1526_c7_f134] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_f134_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_f134_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_f134_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_f134_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_f134_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_f134_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1522_c7_89ed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_f134_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_f134_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_1728_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1522_c7_89ed] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_89ed_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_89ed_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1507_c7_1728] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_1728_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_1728_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_1728_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_1728_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1516_c7_e8c9] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1516_c7_e8c9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1522_c7_89ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_89ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_89ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_89ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_89ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1516_c7_e8c9] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output := result_ram_value_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1512_c7_c1f5] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1503_c7_869d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_869d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_869d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_869d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_869d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1493_c7_f8c1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond;
     t16_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue;
     t16_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output := t16_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1512_c7_c1f5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1512_c7_c1f5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond;
     n16_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue;
     n16_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output := n16_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_89ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_1728_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_869d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1497_c7_c7c1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1485_c2_2f2f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond;
     t16_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue;
     t16_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output := t16_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1507_c7_1728] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_1728_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_1728_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_1728_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_1728_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1512_c7_c1f5] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output := result_ram_value_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1512_c7_c1f5] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1516_c7_e8c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output;

     -- n16_MUX[uxn_opcodes_h_l1507_c7_1728] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1507_c7_1728_cond <= VAR_n16_MUX_uxn_opcodes_h_l1507_c7_1728_cond;
     n16_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue;
     n16_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1507_c7_1728_return_output := n16_MUX_uxn_opcodes_h_l1507_c7_1728_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1516_c7_e8c9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_e8c9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_e8c9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_e8c9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1503_c7_869d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_869d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_869d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_869d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_869d_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1507_c7_1728] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_1728_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_1728_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_1728_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_1728_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1512_c7_c1f5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1507_c7_1728_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_1728_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_e8c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_1728_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_869d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1507_c7_1728] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1507_c7_1728_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_1728_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_1728_return_output := result_ram_value_MUX_uxn_opcodes_h_l1507_c7_1728_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1507_c7_1728] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_1728_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_1728_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_1728_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_1728_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1503_c7_869d] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_869d_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_869d_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_869d_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_869d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1497_c7_c7c1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1493_c7_f8c1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1512_c7_c1f5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1512_c7_c1f5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_c1f5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_c1f5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_c1f5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1507_c7_1728] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_1728_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_1728_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_1728_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_1728_return_output;

     -- n16_MUX[uxn_opcodes_h_l1503_c7_869d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1503_c7_869d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1503_c7_869d_cond;
     n16_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue;
     n16_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1503_c7_869d_return_output := n16_MUX_uxn_opcodes_h_l1503_c7_869d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1503_c7_869d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_869d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_869d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_869d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_869d_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1503_c7_869d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_869d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_c1f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_869d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_1728_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_1728_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_1728_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output;
     -- n16_MUX[uxn_opcodes_h_l1497_c7_c7c1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond;
     n16_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue;
     n16_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output := n16_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1497_c7_c7c1] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1485_c2_2f2f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1503_c7_869d] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1503_c7_869d_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_869d_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_869d_return_output := result_ram_value_MUX_uxn_opcodes_h_l1503_c7_869d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1497_c7_c7c1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1503_c7_869d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_869d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_869d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_869d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_869d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1507_c7_1728] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_1728_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_1728_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_1728_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_1728_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1493_c7_f8c1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1507_c7_1728] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_1728_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_1728_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_1728_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_1728_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_1728_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_1728_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1503_c7_869d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_869d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_869d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_869d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_869d_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_1728_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_1728_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_869d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_869d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_869d_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1497_c7_c7c1] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output := result_ram_value_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1493_c7_f8c1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1503_c7_869d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_869d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_869d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_869d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_869d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1503_c7_869d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_869d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_869d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_869d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_869d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_869d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_869d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1497_c7_c7c1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1493_c7_f8c1] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1485_c2_2f2f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1497_c7_c7c1] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1493_c7_f8c1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond;
     n16_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue;
     n16_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output := n16_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_869d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_869d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1493_c7_f8c1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1497_c7_c7c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1485_c2_2f2f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1497_c7_c7c1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_c7c1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_c7c1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_c7c1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1485_c2_2f2f] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1493_c7_f8c1] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output := result_ram_value_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1485_c2_2f2f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond;
     n16_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue;
     n16_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output := n16_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1493_c7_f8c1] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_c7c1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1493_c7_f8c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1485_c2_2f2f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1493_c7_f8c1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_f8c1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_f8c1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_f8c1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1485_c2_2f2f] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output := result_ram_value_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1485_c2_2f2f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_f8c1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1485_c2_2f2f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1485_c2_2f2f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ffdf_uxn_opcodes_h_l1549_l1481_DUPLICATE_1b60 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ffdf_uxn_opcodes_h_l1549_l1481_DUPLICATE_1b60_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ffdf(
     result,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_2f2f_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ffdf_uxn_opcodes_h_l1549_l1481_DUPLICATE_1b60_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ffdf_uxn_opcodes_h_l1549_l1481_DUPLICATE_1b60_return_output;
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
