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
entity stz_0CLK_5110df32 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz_0CLK_5110df32;
architecture arch of stz_0CLK_5110df32 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1754_c6_de1c]
signal BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1754_c1_5d3a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_5d3a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_5d3a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_5d3a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_5d3a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1754_c2_1c59]
signal t8_MUX_uxn_opcodes_h_l1754_c2_1c59_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1754_c2_1c59]
signal n8_MUX_uxn_opcodes_h_l1754_c2_1c59_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1754_c2_1c59]
signal result_ram_addr_MUX_uxn_opcodes_h_l1754_c2_1c59_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1754_c2_1c59]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1754_c2_1c59]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_1c59_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1754_c2_1c59]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1754_c2_1c59_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1754_c2_1c59]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1754_c2_1c59]
signal result_ram_value_MUX_uxn_opcodes_h_l1754_c2_1c59_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1754_c2_1c59]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_1c59_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1754_c2_1c59]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_1c59_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1755_c3_9a9e[uxn_opcodes_h_l1755_c3_9a9e]
signal printf_uxn_opcodes_h_l1755_c3_9a9e_uxn_opcodes_h_l1755_c3_9a9e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1760_c11_8a17]
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1760_c7_5ab9]
signal t8_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1760_c7_5ab9]
signal n8_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1760_c7_5ab9]
signal result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1760_c7_5ab9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1760_c7_5ab9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1760_c7_5ab9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1760_c7_5ab9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1760_c7_5ab9]
signal result_ram_value_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1760_c7_5ab9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1760_c7_5ab9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1763_c11_4719]
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1763_c7_7e94]
signal t8_MUX_uxn_opcodes_h_l1763_c7_7e94_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1763_c7_7e94]
signal n8_MUX_uxn_opcodes_h_l1763_c7_7e94_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1763_c7_7e94]
signal result_ram_addr_MUX_uxn_opcodes_h_l1763_c7_7e94_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1763_c7_7e94]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1763_c7_7e94]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_7e94_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1763_c7_7e94]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1763_c7_7e94_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1763_c7_7e94]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1763_c7_7e94]
signal result_ram_value_MUX_uxn_opcodes_h_l1763_c7_7e94_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1763_c7_7e94]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_7e94_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1763_c7_7e94]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_7e94_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1767_c11_80cb]
signal BIN_OP_EQ_uxn_opcodes_h_l1767_c11_80cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1767_c11_80cb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1767_c11_80cb_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1767_c7_2639]
signal n8_MUX_uxn_opcodes_h_l1767_c7_2639_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1767_c7_2639_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1767_c7_2639]
signal result_ram_addr_MUX_uxn_opcodes_h_l1767_c7_2639_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1767_c7_2639_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1767_c7_2639]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_2639_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_2639_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1767_c7_2639]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_2639_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_2639_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1767_c7_2639]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1767_c7_2639_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1767_c7_2639_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1767_c7_2639]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_2639_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_2639_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1767_c7_2639]
signal result_ram_value_MUX_uxn_opcodes_h_l1767_c7_2639_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1767_c7_2639_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1767_c7_2639]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_2639_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_2639_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1767_c7_2639]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_2639_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_2639_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1770_c11_b9cd]
signal BIN_OP_EQ_uxn_opcodes_h_l1770_c11_b9cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1770_c11_b9cd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1770_c11_b9cd_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1770_c7_308e]
signal n8_MUX_uxn_opcodes_h_l1770_c7_308e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1770_c7_308e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1770_c7_308e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_308e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_308e_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1770_c7_308e]
signal result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_308e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_308e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1770_c7_308e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_308e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_308e_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1770_c7_308e]
signal result_ram_value_MUX_uxn_opcodes_h_l1770_c7_308e_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1770_c7_308e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1770_c7_308e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_308e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_308e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1770_c7_308e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1770_c7_308e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1770_c7_308e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1770_c7_308e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_308e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_308e_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1774_c32_34f2]
signal BIN_OP_AND_uxn_opcodes_h_l1774_c32_34f2_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1774_c32_34f2_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1774_c32_34f2_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1774_c32_2e6c]
signal BIN_OP_GT_uxn_opcodes_h_l1774_c32_2e6c_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1774_c32_2e6c_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1774_c32_2e6c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1774_c32_767e]
signal MUX_uxn_opcodes_h_l1774_c32_767e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1774_c32_767e_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1774_c32_767e_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1774_c32_767e_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1776_c11_a7f9]
signal BIN_OP_EQ_uxn_opcodes_h_l1776_c11_a7f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1776_c11_a7f9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1776_c11_a7f9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1776_c7_bc38]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_bc38_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1776_c7_bc38]
signal result_ram_addr_MUX_uxn_opcodes_h_l1776_c7_bc38_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1776_c7_bc38]
signal result_ram_value_MUX_uxn_opcodes_h_l1776_c7_bc38_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1776_c7_bc38]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_bc38_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1776_c7_bc38]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1776_c7_bc38_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1782_c11_9d69]
signal BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9d69_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9d69_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9d69_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1782_c7_ae08]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_ae08_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_ae08_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_ae08_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_ae08_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1782_c7_ae08]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_ae08_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_ae08_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_ae08_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_ae08_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_6c87( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.ram_addr := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.ram_value := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_stack_read := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c
BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c_left,
BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c_right,
BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_5d3a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_5d3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_5d3a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_5d3a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_5d3a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_5d3a_return_output);

-- t8_MUX_uxn_opcodes_h_l1754_c2_1c59
t8_MUX_uxn_opcodes_h_l1754_c2_1c59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1754_c2_1c59_cond,
t8_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue,
t8_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse,
t8_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output);

-- n8_MUX_uxn_opcodes_h_l1754_c2_1c59
n8_MUX_uxn_opcodes_h_l1754_c2_1c59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1754_c2_1c59_cond,
n8_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue,
n8_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse,
n8_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1754_c2_1c59
result_ram_addr_MUX_uxn_opcodes_h_l1754_c2_1c59 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1754_c2_1c59_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_1c59
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_1c59 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_1c59
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_1c59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_1c59_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1754_c2_1c59
result_is_ram_write_MUX_uxn_opcodes_h_l1754_c2_1c59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1754_c2_1c59_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_1c59
result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_1c59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1754_c2_1c59
result_ram_value_MUX_uxn_opcodes_h_l1754_c2_1c59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1754_c2_1c59_cond,
result_ram_value_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_1c59
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_1c59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_1c59_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_1c59
result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_1c59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_1c59_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output);

-- printf_uxn_opcodes_h_l1755_c3_9a9e_uxn_opcodes_h_l1755_c3_9a9e
printf_uxn_opcodes_h_l1755_c3_9a9e_uxn_opcodes_h_l1755_c3_9a9e : entity work.printf_uxn_opcodes_h_l1755_c3_9a9e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1755_c3_9a9e_uxn_opcodes_h_l1755_c3_9a9e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17
BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17_left,
BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17_right,
BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17_return_output);

-- t8_MUX_uxn_opcodes_h_l1760_c7_5ab9
t8_MUX_uxn_opcodes_h_l1760_c7_5ab9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond,
t8_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue,
t8_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse,
t8_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output);

-- n8_MUX_uxn_opcodes_h_l1760_c7_5ab9
n8_MUX_uxn_opcodes_h_l1760_c7_5ab9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond,
n8_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue,
n8_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse,
n8_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_5ab9
result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_5ab9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_5ab9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_5ab9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_5ab9
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_5ab9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9
result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1760_c7_5ab9
result_ram_value_MUX_uxn_opcodes_h_l1760_c7_5ab9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond,
result_ram_value_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_5ab9
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_5ab9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_5ab9
result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_5ab9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719_left,
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719_right,
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719_return_output);

-- t8_MUX_uxn_opcodes_h_l1763_c7_7e94
t8_MUX_uxn_opcodes_h_l1763_c7_7e94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1763_c7_7e94_cond,
t8_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue,
t8_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse,
t8_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output);

-- n8_MUX_uxn_opcodes_h_l1763_c7_7e94
n8_MUX_uxn_opcodes_h_l1763_c7_7e94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1763_c7_7e94_cond,
n8_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue,
n8_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse,
n8_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1763_c7_7e94
result_ram_addr_MUX_uxn_opcodes_h_l1763_c7_7e94 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1763_c7_7e94_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_7e94
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_7e94 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_7e94
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_7e94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_7e94_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1763_c7_7e94
result_is_ram_write_MUX_uxn_opcodes_h_l1763_c7_7e94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1763_c7_7e94_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_7e94
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_7e94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1763_c7_7e94
result_ram_value_MUX_uxn_opcodes_h_l1763_c7_7e94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1763_c7_7e94_cond,
result_ram_value_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_7e94
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_7e94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_7e94_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_7e94
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_7e94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_7e94_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1767_c11_80cb
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_80cb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_80cb_left,
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_80cb_right,
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_80cb_return_output);

-- n8_MUX_uxn_opcodes_h_l1767_c7_2639
n8_MUX_uxn_opcodes_h_l1767_c7_2639 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1767_c7_2639_cond,
n8_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue,
n8_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse,
n8_MUX_uxn_opcodes_h_l1767_c7_2639_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1767_c7_2639
result_ram_addr_MUX_uxn_opcodes_h_l1767_c7_2639 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1767_c7_2639_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1767_c7_2639_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_2639
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_2639 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_2639_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_2639_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_2639
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_2639 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_2639_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_2639_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1767_c7_2639
result_is_ram_write_MUX_uxn_opcodes_h_l1767_c7_2639 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1767_c7_2639_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1767_c7_2639_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_2639
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_2639 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_2639_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_2639_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1767_c7_2639
result_ram_value_MUX_uxn_opcodes_h_l1767_c7_2639 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1767_c7_2639_cond,
result_ram_value_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1767_c7_2639_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_2639
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_2639 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_2639_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_2639_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_2639
result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_2639 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_2639_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_2639_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1770_c11_b9cd
BIN_OP_EQ_uxn_opcodes_h_l1770_c11_b9cd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1770_c11_b9cd_left,
BIN_OP_EQ_uxn_opcodes_h_l1770_c11_b9cd_right,
BIN_OP_EQ_uxn_opcodes_h_l1770_c11_b9cd_return_output);

-- n8_MUX_uxn_opcodes_h_l1770_c7_308e
n8_MUX_uxn_opcodes_h_l1770_c7_308e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1770_c7_308e_cond,
n8_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue,
n8_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse,
n8_MUX_uxn_opcodes_h_l1770_c7_308e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_308e
result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_308e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_308e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_308e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_308e
result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_308e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_308e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_308e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_308e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_308e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_308e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_308e_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1770_c7_308e
result_ram_value_MUX_uxn_opcodes_h_l1770_c7_308e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1770_c7_308e_cond,
result_ram_value_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1770_c7_308e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_308e
result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_308e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_308e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_308e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1770_c7_308e
result_is_ram_write_MUX_uxn_opcodes_h_l1770_c7_308e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1770_c7_308e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1770_c7_308e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_308e
result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_308e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_308e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_308e_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1774_c32_34f2
BIN_OP_AND_uxn_opcodes_h_l1774_c32_34f2 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1774_c32_34f2_left,
BIN_OP_AND_uxn_opcodes_h_l1774_c32_34f2_right,
BIN_OP_AND_uxn_opcodes_h_l1774_c32_34f2_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1774_c32_2e6c
BIN_OP_GT_uxn_opcodes_h_l1774_c32_2e6c : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1774_c32_2e6c_left,
BIN_OP_GT_uxn_opcodes_h_l1774_c32_2e6c_right,
BIN_OP_GT_uxn_opcodes_h_l1774_c32_2e6c_return_output);

-- MUX_uxn_opcodes_h_l1774_c32_767e
MUX_uxn_opcodes_h_l1774_c32_767e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1774_c32_767e_cond,
MUX_uxn_opcodes_h_l1774_c32_767e_iftrue,
MUX_uxn_opcodes_h_l1774_c32_767e_iffalse,
MUX_uxn_opcodes_h_l1774_c32_767e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1776_c11_a7f9
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_a7f9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_a7f9_left,
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_a7f9_right,
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_a7f9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_bc38
result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_bc38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_bc38_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1776_c7_bc38
result_ram_addr_MUX_uxn_opcodes_h_l1776_c7_bc38 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1776_c7_bc38_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1776_c7_bc38
result_ram_value_MUX_uxn_opcodes_h_l1776_c7_bc38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1776_c7_bc38_cond,
result_ram_value_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_bc38
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_bc38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_bc38_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1776_c7_bc38
result_is_ram_write_MUX_uxn_opcodes_h_l1776_c7_bc38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1776_c7_bc38_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9d69
BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9d69 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9d69_left,
BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9d69_right,
BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9d69_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_ae08
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_ae08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_ae08_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_ae08_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_ae08_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_ae08_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_ae08
result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_ae08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_ae08_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_ae08_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_ae08_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_ae08_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_5d3a_return_output,
 t8_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output,
 n8_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17_return_output,
 t8_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output,
 n8_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719_return_output,
 t8_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output,
 n8_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1767_c11_80cb_return_output,
 n8_MUX_uxn_opcodes_h_l1767_c7_2639_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1767_c7_2639_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_2639_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_2639_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1767_c7_2639_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_2639_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1767_c7_2639_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_2639_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_2639_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1770_c11_b9cd_return_output,
 n8_MUX_uxn_opcodes_h_l1770_c7_308e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_308e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_308e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_308e_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1770_c7_308e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_308e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1770_c7_308e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_308e_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1774_c32_34f2_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1774_c32_2e6c_return_output,
 MUX_uxn_opcodes_h_l1774_c32_767e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1776_c11_a7f9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9d69_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_ae08_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_ae08_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_5d3a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_5d3a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_5d3a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_5d3a_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1754_c2_1c59_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1754_c2_1c59_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1754_c2_1c59_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1757_c3_4a77 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_1c59_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1754_c2_1c59_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1754_c2_1c59_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_1c59_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_1c59_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1755_c3_9a9e_uxn_opcodes_h_l1755_c3_9a9e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1761_c3_09aa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1763_c7_7e94_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1767_c7_2639_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1763_c7_7e94_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1767_c7_2639_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1763_c7_7e94_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_2639_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1765_c3_efdb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_2639_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_7e94_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1767_c7_2639_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1763_c7_7e94_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_2639_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1767_c7_2639_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1763_c7_7e94_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_2639_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_7e94_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_2639_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_7e94_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_80cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_80cb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_80cb_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1770_c7_308e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1767_c7_2639_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_308e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1767_c7_2639_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_308e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_2639_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1768_c3_9431 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1767_c7_2639_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_2639_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1770_c7_308e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1767_c7_2639_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_308e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_2639_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1770_c7_308e_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1767_c7_2639_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_308e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_2639_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_308e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_2639_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_b9cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_b9cd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_b9cd_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1770_c7_308e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_308e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_308e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_308e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1770_c7_308e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_308e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1770_c7_308e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_308e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1774_c32_767e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1774_c32_767e_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1774_c32_767e_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1774_c32_34f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1774_c32_34f2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1774_c32_34f2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1774_c32_2e6c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1774_c32_2e6c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1774_c32_2e6c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1774_c32_767e_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_a7f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_a7f9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_a7f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_bc38_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1776_c7_bc38_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1776_c7_bc38_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_ae08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_bc38_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_ae08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1776_c7_bc38_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1779_c21_7c48_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9d69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9d69_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9d69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_ae08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_ae08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_ae08_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_ae08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_ae08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_ae08_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1776_l1770_l1767_DUPLICATE_e4e4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1770_l1767_DUPLICATE_fc6c_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1782_l1770_l1767_DUPLICATE_2ece_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1776_l1767_DUPLICATE_df82_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1776_l1770_l1767_DUPLICATE_0d2b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1763_l1760_l1782_l1776_l1770_l1767_DUPLICATE_465e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1770_l1763_l1767_l1760_DUPLICATE_b778_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l1750_l1787_DUPLICATE_838e_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_b9cd_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1765_c3_efdb := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1765_c3_efdb;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1774_c32_767e_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_5d3a_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_ae08_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_ae08_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_a7f9_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l1774_c32_767e_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1761_c3_09aa := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1761_c3_09aa;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1768_c3_9431 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1768_c3_9431;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_80cb_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9d69_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1757_c3_4a77 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1757_c3_4a77;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1774_c32_2e6c_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1774_c32_34f2_right := to_unsigned(128, 8);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_5d3a_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1774_c32_34f2_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse := n8;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_80cb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_b9cd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_a7f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9d69_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1776_l1767_DUPLICATE_df82 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1776_l1767_DUPLICATE_df82_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1776_c11_a7f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1776_c11_a7f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_a7f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1776_c11_a7f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_a7f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_a7f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1776_c11_a7f9_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1767_c7_2639] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1767_c7_2639_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1776_l1770_l1767_DUPLICATE_0d2b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1776_l1770_l1767_DUPLICATE_0d2b_return_output := result.ram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1767_c11_80cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1767_c11_80cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_80cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1767_c11_80cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_80cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_80cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1767_c11_80cb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1770_c11_b9cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1770_c11_b9cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_b9cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1770_c11_b9cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_b9cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_b9cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1770_c11_b9cd_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1779_c21_7c48] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1779_c21_7c48_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1770_l1767_DUPLICATE_fc6c LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1770_l1767_DUPLICATE_fc6c_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1770_l1763_l1767_l1760_DUPLICATE_b778 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1770_l1763_l1767_l1760_DUPLICATE_b778_return_output := result.is_stack_read;

     -- BIN_OP_AND[uxn_opcodes_h_l1774_c32_34f2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1774_c32_34f2_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1774_c32_34f2_left;
     BIN_OP_AND_uxn_opcodes_h_l1774_c32_34f2_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1774_c32_34f2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1774_c32_34f2_return_output := BIN_OP_AND_uxn_opcodes_h_l1774_c32_34f2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1763_c11_4719] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719_left;
     BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719_return_output := BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1763_l1760_l1782_l1776_l1770_l1767_DUPLICATE_465e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1763_l1760_l1782_l1776_l1770_l1767_DUPLICATE_465e_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1782_l1770_l1767_DUPLICATE_2ece LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1782_l1770_l1767_DUPLICATE_2ece_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1776_l1770_l1767_DUPLICATE_e4e4 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1776_l1770_l1767_DUPLICATE_e4e4_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1760_c11_8a17] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17_left;
     BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17_return_output := BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1782_c11_9d69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9d69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9d69_left;
     BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9d69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9d69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9d69_return_output := BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9d69_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1754_c6_de1c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1774_c32_2e6c_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1774_c32_34f2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_5d3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1754_c2_1c59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_1c59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1754_c2_1c59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_1c59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1754_c2_1c59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1754_c2_1c59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_1c59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1754_c2_1c59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_de1c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_8a17_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1763_c7_7e94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_7e94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1763_c7_7e94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_7e94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1763_c7_7e94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1763_c7_7e94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_7e94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1763_c7_7e94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4719_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1767_c7_2639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_80cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_2639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_80cb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1767_c7_2639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_80cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_2639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_80cb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_2639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_80cb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1767_c7_2639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_80cb_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1767_c7_2639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_80cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_2639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_80cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_2639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_80cb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1770_c7_308e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_b9cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_308e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_b9cd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1770_c7_308e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_b9cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_308e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_b9cd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_308e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_b9cd_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_308e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_b9cd_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1770_c7_308e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_b9cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_308e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_b9cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_bc38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_a7f9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1776_c7_bc38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_a7f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_bc38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_a7f9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1776_c7_bc38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_a7f9_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1776_c7_bc38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_a7f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_ae08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9d69_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_ae08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9d69_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1779_c21_7c48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1770_l1767_DUPLICATE_fc6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1770_l1767_DUPLICATE_fc6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1770_l1767_DUPLICATE_fc6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1770_l1767_DUPLICATE_fc6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1770_l1767_DUPLICATE_fc6c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1776_l1770_l1767_DUPLICATE_e4e4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1776_l1770_l1767_DUPLICATE_e4e4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1776_l1770_l1767_DUPLICATE_e4e4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1776_l1770_l1767_DUPLICATE_e4e4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1776_l1770_l1767_DUPLICATE_e4e4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1776_l1770_l1767_DUPLICATE_e4e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1763_l1760_l1782_l1776_l1770_l1767_DUPLICATE_465e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1763_l1760_l1782_l1776_l1770_l1767_DUPLICATE_465e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1763_l1760_l1782_l1776_l1770_l1767_DUPLICATE_465e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1763_l1760_l1782_l1776_l1770_l1767_DUPLICATE_465e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1763_l1760_l1782_l1776_l1770_l1767_DUPLICATE_465e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_ae08_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1763_l1760_l1782_l1776_l1770_l1767_DUPLICATE_465e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1782_l1770_l1767_DUPLICATE_2ece_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1782_l1770_l1767_DUPLICATE_2ece_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1782_l1770_l1767_DUPLICATE_2ece_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1782_l1770_l1767_DUPLICATE_2ece_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1782_l1770_l1767_DUPLICATE_2ece_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_ae08_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1782_l1770_l1767_DUPLICATE_2ece_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1776_l1767_DUPLICATE_df82_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1776_l1767_DUPLICATE_df82_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1776_l1767_DUPLICATE_df82_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1776_l1767_DUPLICATE_df82_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1776_l1767_DUPLICATE_df82_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1770_l1763_l1767_l1760_DUPLICATE_b778_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1770_l1763_l1767_l1760_DUPLICATE_b778_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1770_l1763_l1767_l1760_DUPLICATE_b778_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1770_l1763_l1767_l1760_DUPLICATE_b778_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1776_l1770_l1767_DUPLICATE_0d2b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1776_l1770_l1767_DUPLICATE_0d2b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1776_l1770_l1767_DUPLICATE_0d2b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1776_l1770_l1767_DUPLICATE_0d2b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1776_l1770_l1767_DUPLICATE_0d2b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1763_l1760_l1754_l1776_l1770_l1767_DUPLICATE_0d2b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1767_c7_2639_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1782_c7_ae08] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_ae08_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_ae08_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_ae08_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_ae08_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_ae08_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_ae08_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_ae08_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_ae08_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1776_c7_bc38] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1776_c7_bc38_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1776_c7_bc38_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output := result_ram_value_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1776_c7_bc38] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1776_c7_bc38_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1776_c7_bc38_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1754_c1_5d3a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_5d3a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_5d3a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_5d3a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_5d3a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_5d3a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_5d3a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_5d3a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_5d3a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1767_c7_2639] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_2639_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_2639_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_2639_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_2639_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1782_c7_ae08] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_ae08_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_ae08_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_ae08_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_ae08_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_ae08_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_ae08_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_ae08_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_ae08_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1774_c32_2e6c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1774_c32_2e6c_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1774_c32_2e6c_left;
     BIN_OP_GT_uxn_opcodes_h_l1774_c32_2e6c_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1774_c32_2e6c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1774_c32_2e6c_return_output := BIN_OP_GT_uxn_opcodes_h_l1774_c32_2e6c_return_output;

     -- n8_MUX[uxn_opcodes_h_l1770_c7_308e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1770_c7_308e_cond <= VAR_n8_MUX_uxn_opcodes_h_l1770_c7_308e_cond;
     n8_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue;
     n8_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1770_c7_308e_return_output := n8_MUX_uxn_opcodes_h_l1770_c7_308e_return_output;

     -- t8_MUX[uxn_opcodes_h_l1763_c7_7e94] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1763_c7_7e94_cond <= VAR_t8_MUX_uxn_opcodes_h_l1763_c7_7e94_cond;
     t8_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue;
     t8_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output := t8_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1776_c7_bc38] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_bc38_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_bc38_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1770_c7_308e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_308e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_308e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_308e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_308e_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1774_c32_767e_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1774_c32_2e6c_return_output;
     VAR_printf_uxn_opcodes_h_l1755_c3_9a9e_uxn_opcodes_h_l1755_c3_9a9e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_5d3a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1770_c7_308e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_ae08_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_ae08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_308e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_2639_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output;
     -- t8_MUX[uxn_opcodes_h_l1760_c7_5ab9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond <= VAR_t8_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond;
     t8_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue;
     t8_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output := t8_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1770_c7_308e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_308e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_308e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_308e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_308e_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1770_c7_308e] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1770_c7_308e_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1770_c7_308e_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1770_c7_308e_return_output := result_ram_value_MUX_uxn_opcodes_h_l1770_c7_308e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1776_c7_bc38] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1776_c7_bc38_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1776_c7_bc38_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output;

     -- MUX[uxn_opcodes_h_l1774_c32_767e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1774_c32_767e_cond <= VAR_MUX_uxn_opcodes_h_l1774_c32_767e_cond;
     MUX_uxn_opcodes_h_l1774_c32_767e_iftrue <= VAR_MUX_uxn_opcodes_h_l1774_c32_767e_iftrue;
     MUX_uxn_opcodes_h_l1774_c32_767e_iffalse <= VAR_MUX_uxn_opcodes_h_l1774_c32_767e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1774_c32_767e_return_output := MUX_uxn_opcodes_h_l1774_c32_767e_return_output;

     -- n8_MUX[uxn_opcodes_h_l1767_c7_2639] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1767_c7_2639_cond <= VAR_n8_MUX_uxn_opcodes_h_l1767_c7_2639_cond;
     n8_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue;
     n8_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1767_c7_2639_return_output := n8_MUX_uxn_opcodes_h_l1767_c7_2639_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1763_c7_7e94] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_7e94_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_7e94_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output;

     -- printf_uxn_opcodes_h_l1755_c3_9a9e[uxn_opcodes_h_l1755_c3_9a9e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1755_c3_9a9e_uxn_opcodes_h_l1755_c3_9a9e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1755_c3_9a9e_uxn_opcodes_h_l1755_c3_9a9e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1776_c7_bc38] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_bc38_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_bc38_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_bc38_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_bc38_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1770_c7_308e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_308e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_308e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_308e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_308e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1767_c7_2639] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_2639_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_2639_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_2639_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_2639_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue := VAR_MUX_uxn_opcodes_h_l1774_c32_767e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1767_c7_2639_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1776_c7_bc38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_308e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_2639_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_308e_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1770_c7_308e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1770_c7_308e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_308e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_308e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_308e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_308e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1770_c7_308e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_308e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_308e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_308e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_308e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1770_c7_308e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1770_c7_308e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1770_c7_308e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1770_c7_308e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1770_c7_308e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1770_c7_308e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1770_c7_308e_return_output;

     -- n8_MUX[uxn_opcodes_h_l1763_c7_7e94] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1763_c7_7e94_cond <= VAR_n8_MUX_uxn_opcodes_h_l1763_c7_7e94_cond;
     n8_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue;
     n8_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output := n8_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1767_c7_2639] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1767_c7_2639_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1767_c7_2639_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1767_c7_2639_return_output := result_ram_value_MUX_uxn_opcodes_h_l1767_c7_2639_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1760_c7_5ab9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1767_c7_2639] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1767_c7_2639_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1767_c7_2639_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1767_c7_2639_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1767_c7_2639_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1767_c7_2639] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_2639_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_2639_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_2639_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_2639_return_output;

     -- t8_MUX[uxn_opcodes_h_l1754_c2_1c59] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1754_c2_1c59_cond <= VAR_t8_MUX_uxn_opcodes_h_l1754_c2_1c59_cond;
     t8_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue;
     t8_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output := t8_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1763_c7_7e94] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_7e94_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_7e94_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_308e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1770_c7_308e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_2639_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1767_c7_2639_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1767_c7_2639_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_308e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output;
     -- n8_MUX[uxn_opcodes_h_l1760_c7_5ab9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond <= VAR_n8_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond;
     n8_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue;
     n8_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output := n8_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1754_c2_1c59] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_1c59_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_1c59_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1763_c7_7e94] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1763_c7_7e94_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1763_c7_7e94_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output := result_ram_value_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1763_c7_7e94] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1763_c7_7e94_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1763_c7_7e94_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1763_c7_7e94] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1760_c7_5ab9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1767_c7_2639] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1767_c7_2639_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1767_c7_2639_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1767_c7_2639_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1767_c7_2639_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1767_c7_2639] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_2639_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_2639_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_2639_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_2639_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1767_c7_2639] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_2639_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_2639_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_2639_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_2639_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_2639_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_2639_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_2639_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1767_c7_2639_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_2639_return_output;
     -- n8_MUX[uxn_opcodes_h_l1754_c2_1c59] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1754_c2_1c59_cond <= VAR_n8_MUX_uxn_opcodes_h_l1754_c2_1c59_cond;
     n8_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue;
     n8_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output := n8_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1754_c2_1c59] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_1c59_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_1c59_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1760_c7_5ab9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1763_c7_7e94] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1760_c7_5ab9] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1760_c7_5ab9] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output := result_ram_value_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1763_c7_7e94] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_7e94_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_7e94_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1763_c7_7e94] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1763_c7_7e94_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1763_c7_7e94_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1763_c7_7e94_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1763_c7_7e94_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_7e94_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1760_c7_5ab9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1760_c7_5ab9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1754_c2_1c59] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1754_c2_1c59_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1754_c2_1c59_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1760_c7_5ab9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_5ab9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_5ab9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_5ab9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1754_c2_1c59] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1754_c2_1c59_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1754_c2_1c59_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output := result_ram_value_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1754_c2_1c59] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_5ab9_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1754_c2_1c59] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1754_c2_1c59_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1754_c2_1c59_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1754_c2_1c59] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1754_c2_1c59] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_1c59_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_1c59_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_1c59_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_1c59_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l1750_l1787_DUPLICATE_838e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l1750_l1787_DUPLICATE_838e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6c87(
     result,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_1c59_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l1750_l1787_DUPLICATE_838e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l1750_l1787_DUPLICATE_838e_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
