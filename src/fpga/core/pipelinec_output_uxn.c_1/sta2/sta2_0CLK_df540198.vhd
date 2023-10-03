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
-- BIN_OP_EQ[uxn_opcodes_h_l1485_c6_4962]
signal BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1485_c1_a07b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_a07b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_a07b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_a07b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_a07b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1485_c2_0c19]
signal n16_MUX_uxn_opcodes_h_l1485_c2_0c19_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1485_c2_0c19]
signal t16_MUX_uxn_opcodes_h_l1485_c2_0c19_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1485_c2_0c19]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0c19_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1485_c2_0c19]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0c19_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1485_c2_0c19]
signal result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0c19_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1485_c2_0c19]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0c19_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1485_c2_0c19]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0c19_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1485_c2_0c19]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0c19_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1485_c2_0c19]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1485_c2_0c19]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0c19_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1485_c2_0c19]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0c19_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1485_c2_0c19]
signal result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0c19_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1485_c2_0c19]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1486_c3_c98a[uxn_opcodes_h_l1486_c3_c98a]
signal printf_uxn_opcodes_h_l1486_c3_c98a_uxn_opcodes_h_l1486_c3_c98a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1493_c11_685f]
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1493_c7_e356]
signal n16_MUX_uxn_opcodes_h_l1493_c7_e356_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1493_c7_e356_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1493_c7_e356]
signal t16_MUX_uxn_opcodes_h_l1493_c7_e356_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1493_c7_e356_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1493_c7_e356]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_e356_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_e356_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1493_c7_e356]
signal result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_e356_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_e356_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1493_c7_e356]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_e356_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_e356_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1493_c7_e356]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_e356_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_e356_return_output : signed(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1493_c7_e356]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_e356_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_e356_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1493_c7_e356]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_e356_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_e356_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1493_c7_e356]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_e356_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_e356_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1493_c7_e356]
signal result_ram_value_MUX_uxn_opcodes_h_l1493_c7_e356_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1493_c7_e356_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1493_c7_e356]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_e356_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_e356_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1497_c11_a9de]
signal BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1497_c7_4724]
signal n16_MUX_uxn_opcodes_h_l1497_c7_4724_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1497_c7_4724_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1497_c7_4724]
signal t16_MUX_uxn_opcodes_h_l1497_c7_4724_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1497_c7_4724_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1497_c7_4724]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_4724_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_4724_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1497_c7_4724]
signal result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_4724_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_4724_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1497_c7_4724]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_4724_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_4724_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1497_c7_4724]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_4724_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_4724_return_output : signed(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1497_c7_4724]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_4724_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_4724_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1497_c7_4724]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_4724_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_4724_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1497_c7_4724]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_4724_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_4724_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1497_c7_4724]
signal result_ram_value_MUX_uxn_opcodes_h_l1497_c7_4724_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1497_c7_4724_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1497_c7_4724]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_4724_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_4724_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1503_c11_3867]
signal BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1503_c7_62c0]
signal n16_MUX_uxn_opcodes_h_l1503_c7_62c0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1503_c7_62c0]
signal t16_MUX_uxn_opcodes_h_l1503_c7_62c0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1503_c7_62c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_62c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1503_c7_62c0]
signal result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_62c0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1503_c7_62c0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_62c0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1503_c7_62c0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output : signed(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1503_c7_62c0]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_62c0_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1503_c7_62c0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_62c0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1503_c7_62c0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_62c0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1503_c7_62c0]
signal result_ram_value_MUX_uxn_opcodes_h_l1503_c7_62c0_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1503_c7_62c0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1507_c11_a4ff]
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1507_c7_0038]
signal n16_MUX_uxn_opcodes_h_l1507_c7_0038_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1507_c7_0038_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1507_c7_0038]
signal t16_MUX_uxn_opcodes_h_l1507_c7_0038_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1507_c7_0038_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1507_c7_0038]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0038_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0038_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1507_c7_0038]
signal result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_0038_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_0038_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1507_c7_0038]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_0038_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_0038_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1507_c7_0038]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_0038_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_0038_return_output : signed(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1507_c7_0038]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_0038_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_0038_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1507_c7_0038]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_0038_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_0038_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1507_c7_0038]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0038_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0038_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1507_c7_0038]
signal result_ram_value_MUX_uxn_opcodes_h_l1507_c7_0038_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1507_c7_0038_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1507_c7_0038]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0038_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0038_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1508_c3_4618]
signal BIN_OP_OR_uxn_opcodes_h_l1508_c3_4618_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1508_c3_4618_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1508_c3_4618_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1512_c11_0ffc]
signal BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1512_c7_a211]
signal n16_MUX_uxn_opcodes_h_l1512_c7_a211_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1512_c7_a211_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1512_c7_a211]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_a211_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_a211_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1512_c7_a211]
signal result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_a211_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_a211_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1512_c7_a211]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_a211_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_a211_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1512_c7_a211]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_a211_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_a211_return_output : signed(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1512_c7_a211]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_a211_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_a211_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1512_c7_a211]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_a211_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_a211_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1512_c7_a211]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_a211_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_a211_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1512_c7_a211]
signal result_ram_value_MUX_uxn_opcodes_h_l1512_c7_a211_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1512_c7_a211_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1512_c7_a211]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_a211_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_a211_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1516_c11_7012]
signal BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1516_c7_610a]
signal n16_MUX_uxn_opcodes_h_l1516_c7_610a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1516_c7_610a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1516_c7_610a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_610a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_610a_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1516_c7_610a]
signal result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_610a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_610a_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1516_c7_610a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_610a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_610a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1516_c7_610a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_610a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_610a_return_output : signed(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1516_c7_610a]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_610a_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_610a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1516_c7_610a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_610a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_610a_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1516_c7_610a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_610a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_610a_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1516_c7_610a]
signal result_ram_value_MUX_uxn_opcodes_h_l1516_c7_610a_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1516_c7_610a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1516_c7_610a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_610a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_610a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1522_c11_d983]
signal BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1522_c7_e405]
signal n16_MUX_uxn_opcodes_h_l1522_c7_e405_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1522_c7_e405_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1522_c7_e405]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_e405_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_e405_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1522_c7_e405]
signal result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_e405_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_e405_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1522_c7_e405]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_e405_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_e405_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1522_c7_e405]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_e405_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_e405_return_output : signed(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1522_c7_e405]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_e405_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_e405_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1522_c7_e405]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_e405_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_e405_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1522_c7_e405]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_e405_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_e405_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1522_c7_e405]
signal result_ram_value_MUX_uxn_opcodes_h_l1522_c7_e405_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1522_c7_e405_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1522_c7_e405]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_e405_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_e405_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1526_c11_3626]
signal BIN_OP_EQ_uxn_opcodes_h_l1526_c11_3626_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1526_c11_3626_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1526_c11_3626_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1526_c7_74be]
signal n16_MUX_uxn_opcodes_h_l1526_c7_74be_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1526_c7_74be_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1526_c7_74be]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_74be_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_74be_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1526_c7_74be]
signal result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_74be_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_74be_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1526_c7_74be]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_74be_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_74be_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1526_c7_74be]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_74be_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_74be_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1526_c7_74be]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_74be_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_74be_return_output : signed(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1526_c7_74be]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_74be_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_74be_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1526_c7_74be]
signal result_ram_value_MUX_uxn_opcodes_h_l1526_c7_74be_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1526_c7_74be_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1526_c7_74be]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_74be_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_74be_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1527_c3_2375]
signal BIN_OP_OR_uxn_opcodes_h_l1527_c3_2375_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1527_c3_2375_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1527_c3_2375_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1530_c32_d012]
signal BIN_OP_AND_uxn_opcodes_h_l1530_c32_d012_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1530_c32_d012_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1530_c32_d012_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1530_c32_3bd0]
signal BIN_OP_GT_uxn_opcodes_h_l1530_c32_3bd0_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1530_c32_3bd0_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1530_c32_3bd0_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1530_c32_79cf]
signal MUX_uxn_opcodes_h_l1530_c32_79cf_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1530_c32_79cf_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1530_c32_79cf_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1530_c32_79cf_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1532_c11_2469]
signal BIN_OP_EQ_uxn_opcodes_h_l1532_c11_2469_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1532_c11_2469_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1532_c11_2469_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1532_c7_e76a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_e76a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1532_c7_e76a]
signal result_ram_value_MUX_uxn_opcodes_h_l1532_c7_e76a_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1532_c7_e76a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e76a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1532_c7_e76a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e76a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1532_c7_e76a]
signal result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_e76a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1532_c7_e76a]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_e76a_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1537_c32_c021]
signal CONST_SR_8_uxn_opcodes_h_l1537_c32_c021_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1537_c32_c021_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1539_c11_5773]
signal BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5773_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5773_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5773_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1539_c7_b533]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_b533_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_b533_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_b533_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_b533_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1539_c7_b533]
signal result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_b533_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_b533_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_b533_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_b533_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1539_c7_b533]
signal result_ram_value_MUX_uxn_opcodes_h_l1539_c7_b533_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1539_c7_b533_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1539_c7_b533_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1539_c7_b533_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1539_c7_b533]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_b533_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_b533_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_b533_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_b533_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1541_c21_8180]
signal BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_8180_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_8180_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_8180_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1544_c11_df8a]
signal BIN_OP_EQ_uxn_opcodes_h_l1544_c11_df8a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1544_c11_df8a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1544_c11_df8a_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1544_c7_9733]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_9733_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_9733_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_9733_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_9733_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1544_c7_9733]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_9733_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_9733_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_9733_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_9733_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_552f
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_552f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_552f_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_f62f( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.ram_addr := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.is_stack_read := ref_toks_5;
      base.is_ram_read := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_ram_write := ref_toks_9;
      base.ram_value := ref_toks_10;
      base.is_sp_shift := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962
BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_left,
BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_right,
BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_a07b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_a07b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_a07b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_a07b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_a07b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_a07b_return_output);

-- n16_MUX_uxn_opcodes_h_l1485_c2_0c19
n16_MUX_uxn_opcodes_h_l1485_c2_0c19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1485_c2_0c19_cond,
n16_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue,
n16_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse,
n16_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output);

-- t16_MUX_uxn_opcodes_h_l1485_c2_0c19
t16_MUX_uxn_opcodes_h_l1485_c2_0c19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1485_c2_0c19_cond,
t16_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue,
t16_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse,
t16_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0c19
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0c19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0c19_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0c19
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0c19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0c19_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0c19
result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0c19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0c19_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0c19
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0c19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0c19_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0c19
result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0c19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0c19_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0c19
result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0c19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0c19_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0c19
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0c19 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0c19
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0c19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0c19_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0c19
result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0c19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0c19_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0c19
result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0c19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0c19_cond,
result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0c19
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0c19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output);

-- printf_uxn_opcodes_h_l1486_c3_c98a_uxn_opcodes_h_l1486_c3_c98a
printf_uxn_opcodes_h_l1486_c3_c98a_uxn_opcodes_h_l1486_c3_c98a : entity work.printf_uxn_opcodes_h_l1486_c3_c98a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1486_c3_c98a_uxn_opcodes_h_l1486_c3_c98a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f_left,
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f_right,
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f_return_output);

-- n16_MUX_uxn_opcodes_h_l1493_c7_e356
n16_MUX_uxn_opcodes_h_l1493_c7_e356 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1493_c7_e356_cond,
n16_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue,
n16_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse,
n16_MUX_uxn_opcodes_h_l1493_c7_e356_return_output);

-- t16_MUX_uxn_opcodes_h_l1493_c7_e356
t16_MUX_uxn_opcodes_h_l1493_c7_e356 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1493_c7_e356_cond,
t16_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue,
t16_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse,
t16_MUX_uxn_opcodes_h_l1493_c7_e356_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_e356
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_e356 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_e356_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_e356_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_e356
result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_e356 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_e356_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_e356_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_e356
result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_e356 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_e356_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_e356_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_e356
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_e356 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_e356_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_e356_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_e356
result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_e356 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_e356_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_e356_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_e356
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_e356 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_e356_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_e356_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_e356
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_e356 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_e356_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_e356_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1493_c7_e356
result_ram_value_MUX_uxn_opcodes_h_l1493_c7_e356 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1493_c7_e356_cond,
result_ram_value_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1493_c7_e356_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_e356
result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_e356 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_e356_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_e356_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de_left,
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de_right,
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de_return_output);

-- n16_MUX_uxn_opcodes_h_l1497_c7_4724
n16_MUX_uxn_opcodes_h_l1497_c7_4724 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1497_c7_4724_cond,
n16_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue,
n16_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse,
n16_MUX_uxn_opcodes_h_l1497_c7_4724_return_output);

-- t16_MUX_uxn_opcodes_h_l1497_c7_4724
t16_MUX_uxn_opcodes_h_l1497_c7_4724 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1497_c7_4724_cond,
t16_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue,
t16_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse,
t16_MUX_uxn_opcodes_h_l1497_c7_4724_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_4724
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_4724 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_4724_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_4724_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_4724
result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_4724 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_4724_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_4724_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_4724
result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_4724 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_4724_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_4724_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_4724
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_4724 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_4724_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_4724_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_4724
result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_4724 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_4724_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_4724_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_4724
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_4724 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_4724_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_4724_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_4724
result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_4724 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_4724_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_4724_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1497_c7_4724
result_ram_value_MUX_uxn_opcodes_h_l1497_c7_4724 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1497_c7_4724_cond,
result_ram_value_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1497_c7_4724_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_4724
result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_4724 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_4724_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_4724_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867
BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867_left,
BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867_right,
BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867_return_output);

-- n16_MUX_uxn_opcodes_h_l1503_c7_62c0
n16_MUX_uxn_opcodes_h_l1503_c7_62c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1503_c7_62c0_cond,
n16_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue,
n16_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse,
n16_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output);

-- t16_MUX_uxn_opcodes_h_l1503_c7_62c0
t16_MUX_uxn_opcodes_h_l1503_c7_62c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1503_c7_62c0_cond,
t16_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue,
t16_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse,
t16_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_62c0
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_62c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_62c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_62c0
result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_62c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_62c0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_62c0
result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_62c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_62c0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_62c0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_62c0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_62c0
result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_62c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_62c0_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_62c0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_62c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_62c0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_62c0
result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_62c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_62c0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1503_c7_62c0
result_ram_value_MUX_uxn_opcodes_h_l1503_c7_62c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1503_c7_62c0_cond,
result_ram_value_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_62c0
result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_62c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff_left,
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff_right,
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff_return_output);

-- n16_MUX_uxn_opcodes_h_l1507_c7_0038
n16_MUX_uxn_opcodes_h_l1507_c7_0038 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1507_c7_0038_cond,
n16_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue,
n16_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse,
n16_MUX_uxn_opcodes_h_l1507_c7_0038_return_output);

-- t16_MUX_uxn_opcodes_h_l1507_c7_0038
t16_MUX_uxn_opcodes_h_l1507_c7_0038 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1507_c7_0038_cond,
t16_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue,
t16_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse,
t16_MUX_uxn_opcodes_h_l1507_c7_0038_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0038
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0038 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0038_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0038_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_0038
result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_0038 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_0038_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_0038_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_0038
result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_0038 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_0038_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_0038_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_0038
result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_0038 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_0038_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_0038_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_0038
result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_0038 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_0038_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_0038_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_0038
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_0038 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_0038_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_0038_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0038
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0038 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0038_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0038_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1507_c7_0038
result_ram_value_MUX_uxn_opcodes_h_l1507_c7_0038 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1507_c7_0038_cond,
result_ram_value_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1507_c7_0038_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0038
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0038 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0038_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0038_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1508_c3_4618
BIN_OP_OR_uxn_opcodes_h_l1508_c3_4618 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1508_c3_4618_left,
BIN_OP_OR_uxn_opcodes_h_l1508_c3_4618_right,
BIN_OP_OR_uxn_opcodes_h_l1508_c3_4618_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc_left,
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc_right,
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc_return_output);

-- n16_MUX_uxn_opcodes_h_l1512_c7_a211
n16_MUX_uxn_opcodes_h_l1512_c7_a211 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1512_c7_a211_cond,
n16_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue,
n16_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse,
n16_MUX_uxn_opcodes_h_l1512_c7_a211_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_a211
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_a211 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_a211_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_a211_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_a211
result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_a211 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_a211_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_a211_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_a211
result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_a211 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_a211_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_a211_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_a211
result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_a211 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_a211_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_a211_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_a211
result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_a211 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_a211_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_a211_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_a211
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_a211 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_a211_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_a211_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_a211
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_a211 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_a211_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_a211_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1512_c7_a211
result_ram_value_MUX_uxn_opcodes_h_l1512_c7_a211 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1512_c7_a211_cond,
result_ram_value_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1512_c7_a211_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_a211
result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_a211 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_a211_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_a211_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012
BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012_left,
BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012_right,
BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012_return_output);

-- n16_MUX_uxn_opcodes_h_l1516_c7_610a
n16_MUX_uxn_opcodes_h_l1516_c7_610a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1516_c7_610a_cond,
n16_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue,
n16_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse,
n16_MUX_uxn_opcodes_h_l1516_c7_610a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_610a
result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_610a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_610a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_610a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_610a
result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_610a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_610a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_610a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_610a
result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_610a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_610a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_610a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_610a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_610a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_610a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_610a_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_610a
result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_610a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_610a_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_610a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_610a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_610a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_610a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_610a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_610a
result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_610a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_610a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_610a_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1516_c7_610a
result_ram_value_MUX_uxn_opcodes_h_l1516_c7_610a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1516_c7_610a_cond,
result_ram_value_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1516_c7_610a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_610a
result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_610a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_610a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_610a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983
BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983_left,
BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983_right,
BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983_return_output);

-- n16_MUX_uxn_opcodes_h_l1522_c7_e405
n16_MUX_uxn_opcodes_h_l1522_c7_e405 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1522_c7_e405_cond,
n16_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue,
n16_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse,
n16_MUX_uxn_opcodes_h_l1522_c7_e405_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_e405
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_e405 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_e405_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_e405_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_e405
result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_e405 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_e405_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_e405_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_e405
result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_e405 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_e405_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_e405_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_e405
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_e405 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_e405_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_e405_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_e405
result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_e405 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_e405_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_e405_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_e405
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_e405 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_e405_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_e405_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_e405
result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_e405 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_e405_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_e405_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1522_c7_e405
result_ram_value_MUX_uxn_opcodes_h_l1522_c7_e405 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1522_c7_e405_cond,
result_ram_value_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1522_c7_e405_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_e405
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_e405 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_e405_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_e405_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1526_c11_3626
BIN_OP_EQ_uxn_opcodes_h_l1526_c11_3626 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1526_c11_3626_left,
BIN_OP_EQ_uxn_opcodes_h_l1526_c11_3626_right,
BIN_OP_EQ_uxn_opcodes_h_l1526_c11_3626_return_output);

-- n16_MUX_uxn_opcodes_h_l1526_c7_74be
n16_MUX_uxn_opcodes_h_l1526_c7_74be : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1526_c7_74be_cond,
n16_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue,
n16_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse,
n16_MUX_uxn_opcodes_h_l1526_c7_74be_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_74be
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_74be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_74be_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_74be_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_74be
result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_74be : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_74be_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_74be_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_74be
result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_74be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_74be_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_74be_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_74be
result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_74be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_74be_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_74be_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_74be
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_74be : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_74be_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_74be_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_74be
result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_74be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_74be_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_74be_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1526_c7_74be
result_ram_value_MUX_uxn_opcodes_h_l1526_c7_74be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1526_c7_74be_cond,
result_ram_value_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1526_c7_74be_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_74be
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_74be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_74be_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_74be_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1527_c3_2375
BIN_OP_OR_uxn_opcodes_h_l1527_c3_2375 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1527_c3_2375_left,
BIN_OP_OR_uxn_opcodes_h_l1527_c3_2375_right,
BIN_OP_OR_uxn_opcodes_h_l1527_c3_2375_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1530_c32_d012
BIN_OP_AND_uxn_opcodes_h_l1530_c32_d012 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1530_c32_d012_left,
BIN_OP_AND_uxn_opcodes_h_l1530_c32_d012_right,
BIN_OP_AND_uxn_opcodes_h_l1530_c32_d012_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1530_c32_3bd0
BIN_OP_GT_uxn_opcodes_h_l1530_c32_3bd0 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1530_c32_3bd0_left,
BIN_OP_GT_uxn_opcodes_h_l1530_c32_3bd0_right,
BIN_OP_GT_uxn_opcodes_h_l1530_c32_3bd0_return_output);

-- MUX_uxn_opcodes_h_l1530_c32_79cf
MUX_uxn_opcodes_h_l1530_c32_79cf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1530_c32_79cf_cond,
MUX_uxn_opcodes_h_l1530_c32_79cf_iftrue,
MUX_uxn_opcodes_h_l1530_c32_79cf_iffalse,
MUX_uxn_opcodes_h_l1530_c32_79cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1532_c11_2469
BIN_OP_EQ_uxn_opcodes_h_l1532_c11_2469 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1532_c11_2469_left,
BIN_OP_EQ_uxn_opcodes_h_l1532_c11_2469_right,
BIN_OP_EQ_uxn_opcodes_h_l1532_c11_2469_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_e76a
result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_e76a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_e76a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1532_c7_e76a
result_ram_value_MUX_uxn_opcodes_h_l1532_c7_e76a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1532_c7_e76a_cond,
result_ram_value_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e76a
result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e76a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e76a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e76a
result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e76a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e76a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_e76a
result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_e76a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_e76a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_e76a
result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_e76a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_e76a_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1537_c32_c021
CONST_SR_8_uxn_opcodes_h_l1537_c32_c021 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1537_c32_c021_x,
CONST_SR_8_uxn_opcodes_h_l1537_c32_c021_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5773
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5773 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5773_left,
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5773_right,
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5773_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_b533
result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_b533 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_b533_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_b533_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_b533_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_b533_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_b533
result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_b533 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_b533_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_b533_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_b533_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_b533_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1539_c7_b533
result_ram_value_MUX_uxn_opcodes_h_l1539_c7_b533 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1539_c7_b533_cond,
result_ram_value_MUX_uxn_opcodes_h_l1539_c7_b533_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1539_c7_b533_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1539_c7_b533_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_b533
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_b533 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_b533_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_b533_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_b533_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_b533_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_8180
BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_8180 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_8180_left,
BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_8180_right,
BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_8180_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1544_c11_df8a
BIN_OP_EQ_uxn_opcodes_h_l1544_c11_df8a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1544_c11_df8a_left,
BIN_OP_EQ_uxn_opcodes_h_l1544_c11_df8a_right,
BIN_OP_EQ_uxn_opcodes_h_l1544_c11_df8a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_9733
result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_9733 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_9733_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_9733_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_9733_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_9733_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_9733
result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_9733 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_9733_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_9733_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_9733_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_9733_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_552f
CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_552f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_552f_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_552f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_a07b_return_output,
 n16_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output,
 t16_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f_return_output,
 n16_MUX_uxn_opcodes_h_l1493_c7_e356_return_output,
 t16_MUX_uxn_opcodes_h_l1493_c7_e356_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_e356_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_e356_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_e356_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_e356_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_e356_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_e356_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_e356_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1493_c7_e356_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_e356_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de_return_output,
 n16_MUX_uxn_opcodes_h_l1497_c7_4724_return_output,
 t16_MUX_uxn_opcodes_h_l1497_c7_4724_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_4724_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_4724_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_4724_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_4724_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_4724_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_4724_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_4724_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1497_c7_4724_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_4724_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867_return_output,
 n16_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output,
 t16_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff_return_output,
 n16_MUX_uxn_opcodes_h_l1507_c7_0038_return_output,
 t16_MUX_uxn_opcodes_h_l1507_c7_0038_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0038_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_0038_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_0038_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_0038_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_0038_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_0038_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0038_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1507_c7_0038_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0038_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1508_c3_4618_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc_return_output,
 n16_MUX_uxn_opcodes_h_l1512_c7_a211_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_a211_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_a211_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_a211_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_a211_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_a211_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_a211_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_a211_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1512_c7_a211_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_a211_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012_return_output,
 n16_MUX_uxn_opcodes_h_l1516_c7_610a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_610a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_610a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_610a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_610a_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_610a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_610a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_610a_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1516_c7_610a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_610a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983_return_output,
 n16_MUX_uxn_opcodes_h_l1522_c7_e405_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_e405_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_e405_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_e405_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_e405_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_e405_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_e405_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_e405_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1522_c7_e405_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_e405_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1526_c11_3626_return_output,
 n16_MUX_uxn_opcodes_h_l1526_c7_74be_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_74be_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_74be_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_74be_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_74be_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_74be_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_74be_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1526_c7_74be_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_74be_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1527_c3_2375_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1530_c32_d012_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1530_c32_3bd0_return_output,
 MUX_uxn_opcodes_h_l1530_c32_79cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1532_c11_2469_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output,
 CONST_SR_8_uxn_opcodes_h_l1537_c32_c021_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5773_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_b533_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_b533_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1539_c7_b533_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_b533_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_8180_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1544_c11_df8a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_9733_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_9733_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_552f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_a07b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_a07b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_a07b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_a07b_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1493_c7_e356_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1485_c2_0c19_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1493_c7_e356_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1485_c2_0c19_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_e356_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0c19_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1485_c2_0c19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0c19_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_e356_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0c19_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1485_c2_0c19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0c19_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_e356_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0c19_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_e356_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0c19_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_e356_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1489_c3_3748 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_e356_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0c19_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_e356_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0c19_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_e356_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0c19_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_e356_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1486_c3_c98a_uxn_opcodes_h_l1486_c3_c98a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1497_c7_4724_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1493_c7_e356_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1497_c7_4724_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1493_c7_e356_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_4724_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_e356_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_4724_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_e356_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_4724_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_e356_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_4724_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_e356_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_4724_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_e356_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1495_c3_be6a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_4724_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_e356_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_4724_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_e356_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_4724_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_e356_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_4724_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_e356_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1497_c7_4724_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1497_c7_4724_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_4724_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_4724_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_4724_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_4724_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_4724_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1501_c3_a6d1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_4724_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_4724_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_4724_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_4724_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1507_c7_0038_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1503_c7_62c0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1507_c7_0038_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1503_c7_62c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0038_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_62c0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_0038_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_62c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_0038_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_62c0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_0038_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_0038_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_62c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1505_c3_3579 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_0038_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_62c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0038_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_62c0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_0038_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_62c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0038_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1512_c7_a211_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1507_c7_0038_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1507_c7_0038_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_a211_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0038_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_a211_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_0038_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_a211_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_0038_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_a211_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_0038_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_a211_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_0038_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1510_c3_c5b7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_a211_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_0038_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_a211_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0038_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_a211_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_0038_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_a211_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0038_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1508_c3_4618_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1508_c3_4618_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1508_c3_4618_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1516_c7_610a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1512_c7_a211_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_610a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_a211_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_610a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_a211_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_610a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_a211_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_610a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_a211_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_610a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_a211_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1514_c3_eb74 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_610a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_a211_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_610a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_a211_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_610a_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_a211_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_610a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_a211_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1522_c7_e405_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1516_c7_610a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_e405_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_610a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_e405_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_610a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_e405_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_610a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_e405_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_610a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_e405_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_610a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1520_c3_234e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_e405_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_610a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_e405_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_610a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_e405_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_610a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_e405_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_610a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1526_c7_74be_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1522_c7_e405_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_74be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_e405_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_74be_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_e405_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_74be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_e405_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_74be_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_e405_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_74be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_e405_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1524_c3_f9c7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1522_c7_e405_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_e405_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_74be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_e405_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_74be_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_e405_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_74be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_e405_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_3626_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_3626_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_3626_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1526_c7_74be_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_74be_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_74be_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1526_c7_74be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_74be_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_74be_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_74be_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_74be_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_74be_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_74be_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1527_c3_2375_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1527_c3_2375_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1527_c3_2375_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1530_c32_79cf_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1530_c32_79cf_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1530_c32_79cf_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1530_c32_d012_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1530_c32_d012_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1530_c32_d012_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1530_c32_3bd0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1530_c32_3bd0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1530_c32_3bd0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1530_c32_79cf_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_2469_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_2469_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_2469_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_b533_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_e76a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_b533_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_e76a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_b533_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e76a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e76a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_b533_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_e76a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_e76a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1537_c32_c021_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1537_c32_c021_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1537_c22_4557_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5773_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5773_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5773_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_b533_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_b533_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_9733_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_b533_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_b533_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1541_c3_e836 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_b533_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_b533_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_b533_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_b533_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_b533_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_b533_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_b533_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_9733_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_b533_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_8180_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_8180_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_8180_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1542_c22_09fb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_df8a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_df8a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_df8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_9733_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_9733_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_9733_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_9733_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_9733_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_9733_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_7682_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_0fb3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_dcf5_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_ed50_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_8d8b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1516_l1503_l1507_DUPLICATE_9235_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1532_l1512_l1522_l1539_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_9903_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1508_l1527_l1498_l1517_DUPLICATE_904d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_552f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_552f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f62f_uxn_opcodes_h_l1549_l1481_DUPLICATE_6b5e_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_3626_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1530_c32_79cf_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1489_c3_3748 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1489_c3_3748;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_2469_right := to_unsigned(9, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1530_c32_3bd0_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1505_c3_3579 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1505_c3_3579;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1495_c3_be6a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1495_c3_be6a;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_9733_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1514_c3_eb74 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1514_c3_eb74;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1510_c3_c5b7 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1510_c3_c5b7;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1501_c3_a6d1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1501_c3_a6d1;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_a07b_iffalse := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_b533_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1530_c32_d012_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l1530_c32_79cf_iffalse := resize(to_signed(-4, 4), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1524_c3_f9c7 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1524_c3_f9c7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_df8a_right := to_unsigned(11, 4);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5773_right := to_unsigned(10, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_9733_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1520_c3_234e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1520_c3_234e;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_8180_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_right := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_a07b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1530_c32_d012_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1527_c3_2375_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1537_c32_c021_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_3626_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_2469_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5773_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_df8a_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1508_c3_4618_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_8180_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse := t16;
     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1485_c2_0c19] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1485_c2_0c19_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1493_c11_685f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1508_l1527_l1498_l1517_DUPLICATE_904d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1508_l1527_l1498_l1517_DUPLICATE_904d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_8[uxn_opcodes_h_l1537_c32_c021] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1537_c32_c021_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1537_c32_c021_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1537_c32_c021_return_output := CONST_SR_8_uxn_opcodes_h_l1537_c32_c021_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1485_c6_4962] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_left;
     BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_return_output := BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1516_l1503_l1507_DUPLICATE_9235 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1516_l1503_l1507_DUPLICATE_9235_return_output := result.is_sp_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1541_c21_8180] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_8180_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_8180_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_8180_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_8180_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_8180_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_8180_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1542_c22_09fb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1542_c22_09fb_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1526_c7_74be] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1526_c7_74be_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1516_c11_7012] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012_left;
     BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012_return_output := BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1512_c11_0ffc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1507_c11_a4ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1526_c11_3626] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1526_c11_3626_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_3626_left;
     BIN_OP_EQ_uxn_opcodes_h_l1526_c11_3626_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_3626_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_3626_return_output := BIN_OP_EQ_uxn_opcodes_h_l1526_c11_3626_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_7682 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_7682_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1522_c11_d983] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983_left;
     BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983_return_output := BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_dcf5 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_dcf5_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_8d8b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_8d8b_return_output := result.ram_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1522_c7_e405] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1522_c7_e405_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l1530_c32_d012] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1530_c32_d012_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1530_c32_d012_left;
     BIN_OP_AND_uxn_opcodes_h_l1530_c32_d012_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1530_c32_d012_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1530_c32_d012_return_output := BIN_OP_AND_uxn_opcodes_h_l1530_c32_d012_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1539_c11_5773] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5773_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5773_left;
     BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5773_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5773_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5773_return_output := BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5773_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1544_c11_df8a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1544_c11_df8a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_df8a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1544_c11_df8a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_df8a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_df8a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1544_c11_df8a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_ed50 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_ed50_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1532_l1512_l1522_l1539_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_9903 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1532_l1512_l1522_l1539_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_9903_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1497_c11_a9de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de_left;
     BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de_return_output := BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1532_c11_2469] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1532_c11_2469_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_2469_left;
     BIN_OP_EQ_uxn_opcodes_h_l1532_c11_2469_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_2469_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_2469_return_output := BIN_OP_EQ_uxn_opcodes_h_l1532_c11_2469_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1485_c2_0c19] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1485_c2_0c19_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1503_c11_3867] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867_left;
     BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867_return_output := BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_0fb3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_0fb3_return_output := result.is_ram_read;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1530_c32_3bd0_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1530_c32_d012_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_a07b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1485_c2_0c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1485_c2_0c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c6_4962_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1493_c7_e356_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_e356_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_e356_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_e356_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_e356_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_e356_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_e356_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_e356_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_e356_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_e356_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1493_c7_e356_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_685f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1497_c7_4724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_4724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_4724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_4724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_4724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_4724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_4724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_4724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_4724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_4724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1497_c7_4724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_a9de_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1503_c7_62c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_62c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_62c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_62c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_62c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_62c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_62c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_62c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1503_c7_62c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_3867_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1507_c7_0038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_0038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_0038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_0038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_0038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_0038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_0038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1507_c7_0038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a4ff_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1512_c7_a211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_a211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_a211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_a211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_a211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_a211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_a211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_a211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_a211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_a211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_0ffc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1516_c7_610a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_610a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_610a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_610a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_610a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_610a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_610a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_610a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_610a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_610a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c11_7012_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1522_c7_e405_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_e405_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_e405_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_e405_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_e405_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_e405_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_e405_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_e405_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_e405_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_e405_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d983_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1526_c7_74be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_3626_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_74be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_3626_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_74be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_3626_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_74be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_3626_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_74be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_3626_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_74be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_3626_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_74be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_3626_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_74be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_3626_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_74be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_3626_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e76a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_2469_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_e76a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_2469_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_e76a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_2469_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e76a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_2469_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_e76a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_2469_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_e76a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_2469_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_b533_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5773_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_b533_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5773_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_b533_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5773_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_b533_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5773_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_9733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_df8a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_9733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1544_c11_df8a_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1541_c3_e836 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c21_8180_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1508_c3_4618_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1508_l1527_l1498_l1517_DUPLICATE_904d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1527_c3_2375_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1508_l1527_l1498_l1517_DUPLICATE_904d_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_552f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1508_l1527_l1498_l1517_DUPLICATE_904d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_b533_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1542_c22_09fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_dcf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_dcf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_dcf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_dcf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_dcf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_dcf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_dcf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_dcf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_dcf5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_7682_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_7682_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_7682_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_7682_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_7682_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_7682_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_7682_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_7682_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_7682_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_b533_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_7682_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1532_l1512_l1522_l1539_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_9903_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1532_l1512_l1522_l1539_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_9903_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1532_l1512_l1522_l1539_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_9903_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1532_l1512_l1522_l1539_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_9903_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1532_l1512_l1522_l1539_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_9903_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1532_l1512_l1522_l1539_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_9903_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1532_l1512_l1522_l1539_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_9903_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1532_l1512_l1522_l1539_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_9903_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1532_l1512_l1522_l1539_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_9903_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_b533_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1532_l1512_l1522_l1539_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_9903_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_9733_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1532_l1512_l1522_l1539_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_9903_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_0fb3_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_0fb3_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_0fb3_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_0fb3_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_0fb3_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_0fb3_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_0fb3_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_0fb3_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_0fb3_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_0fb3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_ed50_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_ed50_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_ed50_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_ed50_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_ed50_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_ed50_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_ed50_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_ed50_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_ed50_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_9733_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1493_l1497_l1526_l1516_l1544_l1503_l1507_DUPLICATE_ed50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1516_l1503_l1507_DUPLICATE_9235_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1516_l1503_l1507_DUPLICATE_9235_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1516_l1503_l1507_DUPLICATE_9235_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1516_l1503_l1507_DUPLICATE_9235_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1516_l1503_l1507_DUPLICATE_9235_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1516_l1503_l1507_DUPLICATE_9235_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1516_l1503_l1507_DUPLICATE_9235_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1516_l1503_l1507_DUPLICATE_9235_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1512_l1485_l1522_l1493_l1497_l1516_l1503_l1507_DUPLICATE_9235_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_8d8b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_8d8b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_8d8b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_8d8b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_8d8b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_8d8b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_8d8b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_8d8b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_8d8b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_b533_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1512_l1485_l1522_l1539_l1493_l1497_l1526_l1516_l1503_l1507_DUPLICATE_8d8b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1485_c2_0c19_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1526_c7_74be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1485_c2_0c19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1522_c7_e405_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_b533_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1541_c3_e836;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1526_c7_74be] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_74be_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_74be_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_74be_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_74be_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1532_c7_e76a] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_e76a_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_e76a_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1485_c1_a07b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_a07b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_a07b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_a07b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_a07b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_a07b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_a07b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_a07b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_a07b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1544_c7_9733] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_9733_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_9733_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_9733_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_9733_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_9733_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_9733_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_9733_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_9733_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1537_c22_4557] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1537_c22_4557_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1537_c32_c021_return_output);

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1485_c2_0c19] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0c19_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0c19_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1532_c7_e76a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e76a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e76a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1544_c7_9733] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_9733_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_9733_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_9733_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_9733_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_9733_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_9733_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_9733_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_9733_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1530_c32_3bd0] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1530_c32_3bd0_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1530_c32_3bd0_left;
     BIN_OP_GT_uxn_opcodes_h_l1530_c32_3bd0_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1530_c32_3bd0_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1530_c32_3bd0_return_output := BIN_OP_GT_uxn_opcodes_h_l1530_c32_3bd0_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1539_c7_b533] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_b533_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_b533_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_b533_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_b533_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_b533_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_b533_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_b533_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_b533_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1508_c3_4618] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1508_c3_4618_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1508_c3_4618_left;
     BIN_OP_OR_uxn_opcodes_h_l1508_c3_4618_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1508_c3_4618_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1508_c3_4618_return_output := BIN_OP_OR_uxn_opcodes_h_l1508_c3_4618_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1539_c7_b533] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1539_c7_b533_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_b533_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1539_c7_b533_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_b533_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1539_c7_b533_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_b533_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_b533_return_output := result_ram_value_MUX_uxn_opcodes_h_l1539_c7_b533_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_552f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_552f_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_552f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_552f_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_552f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1485_c2_0c19] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0c19_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0c19_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1527_c3_2375] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1527_c3_2375_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1527_c3_2375_left;
     BIN_OP_OR_uxn_opcodes_h_l1527_c3_2375_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1527_c3_2375_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1527_c3_2375_return_output := BIN_OP_OR_uxn_opcodes_h_l1527_c3_2375_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1522_c7_e405] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_e405_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_e405_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_e405_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_e405_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1530_c32_79cf_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1530_c32_3bd0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1508_c3_4618_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1527_c3_2375_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1537_c22_4557_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_552f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1499_l1518_DUPLICATE_552f_return_output;
     VAR_printf_uxn_opcodes_h_l1486_c3_c98a_uxn_opcodes_h_l1486_c3_c98a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1485_c1_a07b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_b533_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1544_c7_9733_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_b533_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1544_c7_9733_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c7_74be_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1539_c7_b533_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1539_c7_b533_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_e405_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1532_c7_e76a] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1532_c7_e76a_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_e76a_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output := result_ram_value_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1532_c7_e76a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_e76a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_e76a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1516_c7_610a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_610a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_610a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_610a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_610a_return_output;

     -- MUX[uxn_opcodes_h_l1530_c32_79cf] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1530_c32_79cf_cond <= VAR_MUX_uxn_opcodes_h_l1530_c32_79cf_cond;
     MUX_uxn_opcodes_h_l1530_c32_79cf_iftrue <= VAR_MUX_uxn_opcodes_h_l1530_c32_79cf_iftrue;
     MUX_uxn_opcodes_h_l1530_c32_79cf_iffalse <= VAR_MUX_uxn_opcodes_h_l1530_c32_79cf_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1530_c32_79cf_return_output := MUX_uxn_opcodes_h_l1530_c32_79cf_return_output;

     -- printf_uxn_opcodes_h_l1486_c3_c98a[uxn_opcodes_h_l1486_c3_c98a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1486_c3_c98a_uxn_opcodes_h_l1486_c3_c98a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1486_c3_c98a_uxn_opcodes_h_l1486_c3_c98a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l1507_c7_0038] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1507_c7_0038_cond <= VAR_t16_MUX_uxn_opcodes_h_l1507_c7_0038_cond;
     t16_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue;
     t16_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1507_c7_0038_return_output := t16_MUX_uxn_opcodes_h_l1507_c7_0038_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1539_c7_b533] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_b533_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_b533_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_b533_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_b533_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_b533_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_b533_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_b533_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_b533_return_output;

     -- n16_MUX[uxn_opcodes_h_l1526_c7_74be] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1526_c7_74be_cond <= VAR_n16_MUX_uxn_opcodes_h_l1526_c7_74be_cond;
     n16_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue;
     n16_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1526_c7_74be_return_output := n16_MUX_uxn_opcodes_h_l1526_c7_74be_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1522_c7_e405] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_e405_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_e405_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_e405_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_e405_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1539_c7_b533] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_b533_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_b533_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_b533_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_b533_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_b533_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_b533_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_b533_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_b533_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1526_c7_74be] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_74be_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_74be_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_74be_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_74be_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1526_c7_74be] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_74be_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_74be_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_74be_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_74be_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue := VAR_MUX_uxn_opcodes_h_l1530_c32_79cf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1526_c7_74be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_b533_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1526_c7_74be_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_b533_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_74be_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_e405_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c7_610a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1507_c7_0038_return_output;
     -- t16_MUX[uxn_opcodes_h_l1503_c7_62c0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1503_c7_62c0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1503_c7_62c0_cond;
     t16_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue;
     t16_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output := t16_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1512_c7_a211] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_a211_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_a211_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_a211_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_a211_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1526_c7_74be] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_74be_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_74be_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_74be_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_74be_return_output;

     -- n16_MUX[uxn_opcodes_h_l1522_c7_e405] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1522_c7_e405_cond <= VAR_n16_MUX_uxn_opcodes_h_l1522_c7_e405_cond;
     n16_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue;
     n16_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1522_c7_e405_return_output := n16_MUX_uxn_opcodes_h_l1522_c7_e405_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1526_c7_74be] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1526_c7_74be_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_74be_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_74be_return_output := result_ram_value_MUX_uxn_opcodes_h_l1526_c7_74be_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1532_c7_e76a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_e76a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_e76a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1522_c7_e405] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_e405_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_e405_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_e405_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_e405_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1526_c7_74be] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_74be_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_74be_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_74be_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_74be_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1516_c7_610a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_610a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_610a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_610a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_610a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1532_c7_e76a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e76a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e76a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e76a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e76a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1522_c7_e405] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_e405_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_e405_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_e405_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_e405_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1522_c7_e405_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1522_c7_e405_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c7_e76a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_e405_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c7_610a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_74be_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1526_c7_74be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_74be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_a211_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output;
     -- t16_MUX[uxn_opcodes_h_l1497_c7_4724] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1497_c7_4724_cond <= VAR_t16_MUX_uxn_opcodes_h_l1497_c7_4724_cond;
     t16_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue;
     t16_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1497_c7_4724_return_output := t16_MUX_uxn_opcodes_h_l1497_c7_4724_return_output;

     -- n16_MUX[uxn_opcodes_h_l1516_c7_610a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1516_c7_610a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1516_c7_610a_cond;
     n16_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue;
     n16_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1516_c7_610a_return_output := n16_MUX_uxn_opcodes_h_l1516_c7_610a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1526_c7_74be] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_74be_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_74be_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_74be_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_74be_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1516_c7_610a] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_610a_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_610a_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_610a_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_610a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1516_c7_610a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_610a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_610a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_610a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_610a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1512_c7_a211] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_a211_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_a211_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_a211_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_a211_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1522_c7_e405] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_e405_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_e405_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_e405_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_e405_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1526_c7_74be] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_74be_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_74be_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_74be_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_74be_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_74be_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_74be_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1522_c7_e405] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1522_c7_e405_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_e405_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_e405_return_output := result_ram_value_MUX_uxn_opcodes_h_l1522_c7_e405_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1507_c7_0038] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_0038_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_0038_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_0038_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_0038_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1522_c7_e405] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_e405_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_e405_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_e405_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_e405_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1516_c7_610a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_74be_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1516_c7_610a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1526_c7_74be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c7_610a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1512_c7_a211_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_e405_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1522_c7_e405_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_e405_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_0038_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1497_c7_4724_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1512_c7_a211] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_a211_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_a211_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_a211_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_a211_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1516_c7_610a] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1516_c7_610a_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_610a_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_610a_return_output := result_ram_value_MUX_uxn_opcodes_h_l1516_c7_610a_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1512_c7_a211] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_a211_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_a211_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_a211_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_a211_return_output;

     -- n16_MUX[uxn_opcodes_h_l1512_c7_a211] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1512_c7_a211_cond <= VAR_n16_MUX_uxn_opcodes_h_l1512_c7_a211_cond;
     n16_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue;
     n16_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1512_c7_a211_return_output := n16_MUX_uxn_opcodes_h_l1512_c7_a211_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1516_c7_610a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_610a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_610a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_610a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_610a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1522_c7_e405] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_e405_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_e405_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_e405_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_e405_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1503_c7_62c0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_62c0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_62c0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output;

     -- t16_MUX[uxn_opcodes_h_l1493_c7_e356] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1493_c7_e356_cond <= VAR_t16_MUX_uxn_opcodes_h_l1493_c7_e356_cond;
     t16_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue;
     t16_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1493_c7_e356_return_output := t16_MUX_uxn_opcodes_h_l1493_c7_e356_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1522_c7_e405] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_e405_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_e405_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_e405_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_e405_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_e405_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_e405_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1516_c7_610a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_610a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_610a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_610a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_610a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1507_c7_0038] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_0038_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_0038_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_0038_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_0038_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1512_c7_a211_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_e405_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1512_c7_a211_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c7_e405_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1512_c7_a211_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1507_c7_0038_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1516_c7_610a_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1516_c7_610a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c7_610a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1493_c7_e356_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1512_c7_a211] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1512_c7_a211_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_a211_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_a211_return_output := result_ram_value_MUX_uxn_opcodes_h_l1512_c7_a211_return_output;

     -- t16_MUX[uxn_opcodes_h_l1485_c2_0c19] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1485_c2_0c19_cond <= VAR_t16_MUX_uxn_opcodes_h_l1485_c2_0c19_cond;
     t16_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue;
     t16_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output := t16_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1512_c7_a211] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_a211_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_a211_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_a211_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_a211_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1503_c7_62c0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_62c0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_62c0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1507_c7_0038] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0038_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0038_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0038_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0038_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1507_c7_0038] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_0038_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_0038_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_0038_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_0038_return_output;

     -- n16_MUX[uxn_opcodes_h_l1507_c7_0038] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1507_c7_0038_cond <= VAR_n16_MUX_uxn_opcodes_h_l1507_c7_0038_cond;
     n16_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue;
     n16_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1507_c7_0038_return_output := n16_MUX_uxn_opcodes_h_l1507_c7_0038_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1516_c7_610a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_610a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_610a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_610a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_610a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1512_c7_a211] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_a211_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_a211_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_a211_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_a211_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1516_c7_610a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_610a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_610a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_610a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_610a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_610a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_610a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1497_c7_4724] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_4724_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_4724_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_4724_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_4724_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1507_c7_0038_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c7_610a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1507_c7_0038_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1516_c7_610a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0038_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1512_c7_a211_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1512_c7_a211_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_a211_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_4724_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1512_c7_a211] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_a211_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_a211_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_a211_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_a211_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1503_c7_62c0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1507_c7_0038] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_0038_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_0038_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_0038_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_0038_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1497_c7_4724] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_4724_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_4724_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_4724_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_4724_return_output;

     -- n16_MUX[uxn_opcodes_h_l1503_c7_62c0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1503_c7_62c0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1503_c7_62c0_cond;
     n16_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue;
     n16_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output := n16_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1493_c7_e356] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_e356_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_e356_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_e356_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_e356_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1507_c7_0038] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1507_c7_0038_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_0038_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_0038_return_output := result_ram_value_MUX_uxn_opcodes_h_l1507_c7_0038_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1512_c7_a211] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_a211_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_a211_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_a211_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_a211_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_a211_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_a211_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1503_c7_62c0] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_62c0_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_62c0_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1507_c7_0038] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_0038_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_0038_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_0038_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_0038_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_a211_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_a211_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_4724_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1507_c7_0038_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1507_c7_0038_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1507_c7_0038_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_e356_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1507_c7_0038] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0038_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0038_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0038_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0038_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1503_c7_62c0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1503_c7_62c0] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1503_c7_62c0_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_62c0_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output := result_ram_value_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1497_c7_4724] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_4724_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_4724_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_4724_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_4724_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1497_c7_4724] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_4724_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_4724_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_4724_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_4724_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1503_c7_62c0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_62c0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_62c0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1493_c7_e356] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_e356_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_e356_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_e356_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_e356_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1507_c7_0038] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0038_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0038_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0038_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0038_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0038_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0038_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1485_c2_0c19] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0c19_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0c19_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output;

     -- n16_MUX[uxn_opcodes_h_l1497_c7_4724] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1497_c7_4724_cond <= VAR_n16_MUX_uxn_opcodes_h_l1497_c7_4724_cond;
     n16_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue;
     n16_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1497_c7_4724_return_output := n16_MUX_uxn_opcodes_h_l1497_c7_4724_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1497_c7_4724_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0038_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1497_c7_4724_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0038_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_4724_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_e356_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1497_c7_4724] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_4724_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_4724_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_4724_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_4724_return_output;

     -- n16_MUX[uxn_opcodes_h_l1493_c7_e356] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1493_c7_e356_cond <= VAR_n16_MUX_uxn_opcodes_h_l1493_c7_e356_cond;
     n16_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue;
     n16_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1493_c7_e356_return_output := n16_MUX_uxn_opcodes_h_l1493_c7_e356_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1493_c7_e356] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_e356_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_e356_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_e356_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_e356_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1485_c2_0c19] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0c19_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0c19_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1497_c7_4724] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1497_c7_4724_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_4724_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_4724_return_output := result_ram_value_MUX_uxn_opcodes_h_l1497_c7_4724_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1503_c7_62c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_62c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_62c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1493_c7_e356] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_e356_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_e356_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_e356_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_e356_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1503_c7_62c0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_62c0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_62c0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_62c0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_62c0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1497_c7_4724] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_4724_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_4724_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_4724_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_4724_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1493_c7_e356_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1493_c7_e356_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_62c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_e356_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1497_c7_4724_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1497_c7_4724_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_4724_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1497_c7_4724] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_4724_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_4724_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_4724_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_4724_return_output;

     -- n16_MUX[uxn_opcodes_h_l1485_c2_0c19] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1485_c2_0c19_cond <= VAR_n16_MUX_uxn_opcodes_h_l1485_c2_0c19_cond;
     n16_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue;
     n16_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output := n16_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1493_c7_e356] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1493_c7_e356_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_e356_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_e356_return_output := result_ram_value_MUX_uxn_opcodes_h_l1493_c7_e356_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1493_c7_e356] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_e356_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_e356_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_e356_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_e356_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1485_c2_0c19] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0c19_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0c19_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1485_c2_0c19] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1497_c7_4724] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_4724_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_4724_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_4724_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_4724_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_4724_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_4724_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1493_c7_e356] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_e356_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_e356_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_e356_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_e356_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_4724_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1497_c7_4724_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1493_c7_e356_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1493_c7_e356_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_e356_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1485_c2_0c19] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0c19_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0c19_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1485_c2_0c19] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0c19_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0c19_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output := result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1493_c7_e356] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_e356_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_e356_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_e356_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_e356_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1485_c2_0c19] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1493_c7_e356] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_e356_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_e356_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_e356_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_e356_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_e356_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_e356_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_e356_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c7_e356_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1485_c2_0c19] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0c19_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0c19_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1485_c2_0c19] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0c19_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0c19_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0c19_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0c19_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_f62f_uxn_opcodes_h_l1549_l1481_DUPLICATE_6b5e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f62f_uxn_opcodes_h_l1549_l1481_DUPLICATE_6b5e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_f62f(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c2_0c19_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f62f_uxn_opcodes_h_l1549_l1481_DUPLICATE_6b5e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f62f_uxn_opcodes_h_l1549_l1481_DUPLICATE_6b5e_return_output;
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
