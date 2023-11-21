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
entity str2_0CLK_dd8f5d52 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(15 downto 0);
 return_output : out opcode_result_t);
end str2_0CLK_dd8f5d52;
architecture arch of str2_0CLK_dd8f5d52 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1532_c6_0f89]
signal BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1532_c2_f1f4]
signal result_u16_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1532_c2_f1f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1532_c2_f1f4]
signal result_u8_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1532_c2_f1f4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1532_c2_f1f4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1532_c2_f1f4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1532_c2_f1f4]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1532_c2_f1f4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1532_c2_f1f4]
signal t8_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1532_c2_f1f4]
signal n16_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1539_c11_4dd5]
signal BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1539_c7_dac3]
signal result_u16_value_MUX_uxn_opcodes_h_l1539_c7_dac3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1539_c7_dac3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_dac3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1539_c7_dac3]
signal result_u8_value_MUX_uxn_opcodes_h_l1539_c7_dac3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1539_c7_dac3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1539_c7_dac3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_dac3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1539_c7_dac3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1539_c7_dac3]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1539_c7_dac3_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1539_c7_dac3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_dac3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1539_c7_dac3]
signal t8_MUX_uxn_opcodes_h_l1539_c7_dac3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1539_c7_dac3]
signal n16_MUX_uxn_opcodes_h_l1539_c7_dac3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1543_c11_2b95]
signal BIN_OP_EQ_uxn_opcodes_h_l1543_c11_2b95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1543_c11_2b95_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1543_c11_2b95_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1543_c7_49e8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1543_c7_49e8]
signal result_u16_value_MUX_uxn_opcodes_h_l1543_c7_49e8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1543_c7_49e8]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1543_c7_49e8_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1543_c7_49e8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_49e8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1543_c7_49e8]
signal result_u8_value_MUX_uxn_opcodes_h_l1543_c7_49e8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1543_c7_49e8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1543_c7_49e8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_49e8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1543_c7_49e8]
signal t8_MUX_uxn_opcodes_h_l1543_c7_49e8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1543_c7_49e8]
signal n16_MUX_uxn_opcodes_h_l1543_c7_49e8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1547_c11_30ab]
signal BIN_OP_EQ_uxn_opcodes_h_l1547_c11_30ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1547_c11_30ab_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1547_c11_30ab_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1547_c7_73c8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1547_c7_73c8]
signal result_u16_value_MUX_uxn_opcodes_h_l1547_c7_73c8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1547_c7_73c8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_73c8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1547_c7_73c8]
signal result_u8_value_MUX_uxn_opcodes_h_l1547_c7_73c8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1547_c7_73c8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1547_c7_73c8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_73c8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1547_c7_73c8]
signal n16_MUX_uxn_opcodes_h_l1547_c7_73c8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1550_c30_bae2]
signal sp_relative_shift_uxn_opcodes_h_l1550_c30_bae2_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1550_c30_bae2_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1550_c30_bae2_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1550_c30_bae2_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1553_c31_ff18]
signal CONST_SR_8_uxn_opcodes_h_l1553_c31_ff18_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1553_c31_ff18_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1555_c11_6fc0]
signal BIN_OP_EQ_uxn_opcodes_h_l1555_c11_6fc0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1555_c11_6fc0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1555_c11_6fc0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1555_c7_e90e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c7_e90e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1555_c7_e90e]
signal result_u16_value_MUX_uxn_opcodes_h_l1555_c7_e90e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1555_c7_e90e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_e90e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1555_c7_e90e]
signal result_u8_value_MUX_uxn_opcodes_h_l1555_c7_e90e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1555_c7_e90e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_e90e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1557_c22_8ac3]
signal BIN_OP_PLUS_uxn_opcodes_h_l1557_c22_8ac3_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1557_c22_8ac3_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1557_c22_8ac3_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1560_c11_d0aa]
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c11_d0aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c11_d0aa_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c11_d0aa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1560_c7_0051]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_0051_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_0051_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_0051_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_0051_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1560_c7_0051]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_0051_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_0051_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_0051_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_0051_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1552_l1557_DUPLICATE_7b03
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1552_l1557_DUPLICATE_7b03_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1552_l1557_DUPLICATE_7b03_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1552_l1557_DUPLICATE_7b03_return_output : signed(17 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_c7f2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.is_stack_operation_16bit := ref_toks_7;
      base.is_ram_write := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89
BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89_left,
BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89_right,
BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1532_c2_f1f4
result_u16_value_MUX_uxn_opcodes_h_l1532_c2_f1f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1532_c2_f1f4
result_is_opc_done_MUX_uxn_opcodes_h_l1532_c2_f1f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1532_c2_f1f4
result_u8_value_MUX_uxn_opcodes_h_l1532_c2_f1f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c2_f1f4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c2_f1f4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4
result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1532_c2_f1f4
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1532_c2_f1f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1532_c2_f1f4
result_is_ram_write_MUX_uxn_opcodes_h_l1532_c2_f1f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output);

-- t8_MUX_uxn_opcodes_h_l1532_c2_f1f4
t8_MUX_uxn_opcodes_h_l1532_c2_f1f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond,
t8_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue,
t8_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse,
t8_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output);

-- n16_MUX_uxn_opcodes_h_l1532_c2_f1f4
n16_MUX_uxn_opcodes_h_l1532_c2_f1f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond,
n16_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue,
n16_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse,
n16_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5_left,
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5_right,
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1539_c7_dac3
result_u16_value_MUX_uxn_opcodes_h_l1539_c7_dac3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1539_c7_dac3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_dac3
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_dac3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_dac3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1539_c7_dac3
result_u8_value_MUX_uxn_opcodes_h_l1539_c7_dac3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1539_c7_dac3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_dac3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_dac3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_dac3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_dac3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_dac3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_dac3
result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_dac3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1539_c7_dac3
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1539_c7_dac3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1539_c7_dac3_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_dac3
result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_dac3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_dac3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output);

-- t8_MUX_uxn_opcodes_h_l1539_c7_dac3
t8_MUX_uxn_opcodes_h_l1539_c7_dac3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1539_c7_dac3_cond,
t8_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue,
t8_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse,
t8_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output);

-- n16_MUX_uxn_opcodes_h_l1539_c7_dac3
n16_MUX_uxn_opcodes_h_l1539_c7_dac3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1539_c7_dac3_cond,
n16_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue,
n16_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse,
n16_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1543_c11_2b95
BIN_OP_EQ_uxn_opcodes_h_l1543_c11_2b95 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1543_c11_2b95_left,
BIN_OP_EQ_uxn_opcodes_h_l1543_c11_2b95_right,
BIN_OP_EQ_uxn_opcodes_h_l1543_c11_2b95_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_49e8
result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_49e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1543_c7_49e8
result_u16_value_MUX_uxn_opcodes_h_l1543_c7_49e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1543_c7_49e8_cond,
result_u16_value_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1543_c7_49e8
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1543_c7_49e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1543_c7_49e8_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_49e8
result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_49e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_49e8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1543_c7_49e8
result_u8_value_MUX_uxn_opcodes_h_l1543_c7_49e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1543_c7_49e8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_49e8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_49e8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_49e8
result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_49e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_49e8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output);

-- t8_MUX_uxn_opcodes_h_l1543_c7_49e8
t8_MUX_uxn_opcodes_h_l1543_c7_49e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1543_c7_49e8_cond,
t8_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue,
t8_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse,
t8_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output);

-- n16_MUX_uxn_opcodes_h_l1543_c7_49e8
n16_MUX_uxn_opcodes_h_l1543_c7_49e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1543_c7_49e8_cond,
n16_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue,
n16_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse,
n16_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1547_c11_30ab
BIN_OP_EQ_uxn_opcodes_h_l1547_c11_30ab : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1547_c11_30ab_left,
BIN_OP_EQ_uxn_opcodes_h_l1547_c11_30ab_right,
BIN_OP_EQ_uxn_opcodes_h_l1547_c11_30ab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_73c8
result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_73c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1547_c7_73c8
result_u16_value_MUX_uxn_opcodes_h_l1547_c7_73c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1547_c7_73c8_cond,
result_u16_value_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_73c8
result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_73c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_73c8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1547_c7_73c8
result_u8_value_MUX_uxn_opcodes_h_l1547_c7_73c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1547_c7_73c8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_73c8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_73c8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_73c8
result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_73c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_73c8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output);

-- n16_MUX_uxn_opcodes_h_l1547_c7_73c8
n16_MUX_uxn_opcodes_h_l1547_c7_73c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1547_c7_73c8_cond,
n16_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue,
n16_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse,
n16_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1550_c30_bae2
sp_relative_shift_uxn_opcodes_h_l1550_c30_bae2 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1550_c30_bae2_ins,
sp_relative_shift_uxn_opcodes_h_l1550_c30_bae2_x,
sp_relative_shift_uxn_opcodes_h_l1550_c30_bae2_y,
sp_relative_shift_uxn_opcodes_h_l1550_c30_bae2_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1553_c31_ff18
CONST_SR_8_uxn_opcodes_h_l1553_c31_ff18 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1553_c31_ff18_x,
CONST_SR_8_uxn_opcodes_h_l1553_c31_ff18_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1555_c11_6fc0
BIN_OP_EQ_uxn_opcodes_h_l1555_c11_6fc0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1555_c11_6fc0_left,
BIN_OP_EQ_uxn_opcodes_h_l1555_c11_6fc0_right,
BIN_OP_EQ_uxn_opcodes_h_l1555_c11_6fc0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c7_e90e
result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c7_e90e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c7_e90e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1555_c7_e90e
result_u16_value_MUX_uxn_opcodes_h_l1555_c7_e90e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1555_c7_e90e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_e90e
result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_e90e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_e90e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1555_c7_e90e
result_u8_value_MUX_uxn_opcodes_h_l1555_c7_e90e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1555_c7_e90e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_e90e
result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_e90e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_e90e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1557_c22_8ac3
BIN_OP_PLUS_uxn_opcodes_h_l1557_c22_8ac3 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1557_c22_8ac3_left,
BIN_OP_PLUS_uxn_opcodes_h_l1557_c22_8ac3_right,
BIN_OP_PLUS_uxn_opcodes_h_l1557_c22_8ac3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1560_c11_d0aa
BIN_OP_EQ_uxn_opcodes_h_l1560_c11_d0aa : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1560_c11_d0aa_left,
BIN_OP_EQ_uxn_opcodes_h_l1560_c11_d0aa_right,
BIN_OP_EQ_uxn_opcodes_h_l1560_c11_d0aa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_0051
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_0051 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_0051_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_0051_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_0051_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_0051_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_0051
result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_0051 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_0051_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_0051_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_0051_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_0051_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1552_l1557_DUPLICATE_7b03
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1552_l1557_DUPLICATE_7b03 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1552_l1557_DUPLICATE_7b03_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1552_l1557_DUPLICATE_7b03_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1552_l1557_DUPLICATE_7b03_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output,
 t8_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output,
 n16_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output,
 t8_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output,
 n16_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1543_c11_2b95_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output,
 t8_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output,
 n16_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1547_c11_30ab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output,
 n16_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output,
 sp_relative_shift_uxn_opcodes_h_l1550_c30_bae2_return_output,
 CONST_SR_8_uxn_opcodes_h_l1553_c31_ff18_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1555_c11_6fc0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1557_c22_8ac3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1560_c11_d0aa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_0051_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_0051_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1552_l1557_DUPLICATE_7b03_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1536_c3_be1e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1539_c7_dac3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_dac3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1539_c7_dac3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1540_c3_2385 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1539_c7_dac3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_dac3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1539_c7_dac3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_dac3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1539_c7_dac3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1539_c7_dac3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_2b95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_2b95_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_2b95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1543_c7_49e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1543_c7_49e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_49e8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1543_c7_49e8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_49e8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1543_c7_49e8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1543_c7_49e8_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1544_c8_72c9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_30ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_30ab_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_30ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1552_c3_5677 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1547_c7_73c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_73c8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1547_c7_73c8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_73c8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1547_c7_73c8_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1550_c30_bae2_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1550_c30_bae2_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1550_c30_bae2_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1550_c30_bae2_return_output : signed(3 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1553_c31_ff18_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1553_c31_ff18_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1553_c21_7ec7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c11_6fc0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c11_6fc0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c11_6fc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c7_e90e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1557_c3_00ba : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c7_e90e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_0051_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_e90e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c7_e90e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_0051_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_e90e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1557_c22_8ac3_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1557_c22_8ac3_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1557_c22_8ac3_return_output : signed(18 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1558_c21_a0e8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_d0aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_d0aa_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_d0aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_0051_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_0051_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_0051_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_0051_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_0051_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_0051_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1532_l1539_l1555_l1543_DUPLICATE_6848_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1532_l1539_l1555_l1543_DUPLICATE_ecbc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1532_l1547_l1539_l1543_DUPLICATE_e7de_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1539_l1555_l1543_DUPLICATE_f9a1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1532_l1543_DUPLICATE_c282_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1532_l1560_l1555_l1543_l1539_DUPLICATE_5c50_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1560_l1555_l1547_l1543_l1539_DUPLICATE_44ed_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1552_l1557_DUPLICATE_9eac_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1552_l1557_DUPLICATE_7b03_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1552_l1557_DUPLICATE_7b03_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1552_l1557_DUPLICATE_7b03_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7f2_uxn_opcodes_h_l1565_l1527_DUPLICATE_76e6_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_0051_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_2b95_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1550_c30_bae2_y := resize(to_signed(-3, 3), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l1550_c30_bae2_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_0051_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1557_c22_8ac3_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_30ab_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1536_c3_be1e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1536_c3_be1e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c11_6fc0_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1540_c3_2385 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1540_c3_2385;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_d0aa_right := to_unsigned(5, 3);

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

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1550_c30_bae2_ins := VAR_ins;
     VAR_n16_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse := n16;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1552_l1557_DUPLICATE_7b03_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_2b95_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_30ab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c11_6fc0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_d0aa_left := VAR_phase;
     VAR_CONST_SR_8_uxn_opcodes_h_l1553_c31_ff18_x := VAR_previous_stack_read;
     VAR_n16_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1539_l1555_l1543_DUPLICATE_f9a1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1539_l1555_l1543_DUPLICATE_f9a1_return_output := result.is_sp_shift;

     -- sp_relative_shift[uxn_opcodes_h_l1550_c30_bae2] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1550_c30_bae2_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1550_c30_bae2_ins;
     sp_relative_shift_uxn_opcodes_h_l1550_c30_bae2_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1550_c30_bae2_x;
     sp_relative_shift_uxn_opcodes_h_l1550_c30_bae2_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1550_c30_bae2_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1550_c30_bae2_return_output := sp_relative_shift_uxn_opcodes_h_l1550_c30_bae2_return_output;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1552_l1557_DUPLICATE_9eac LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1552_l1557_DUPLICATE_9eac_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1539_c11_4dd5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1532_l1539_l1555_l1543_DUPLICATE_ecbc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1532_l1539_l1555_l1543_DUPLICATE_ecbc_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1555_c11_6fc0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1555_c11_6fc0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c11_6fc0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1555_c11_6fc0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c11_6fc0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c11_6fc0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1555_c11_6fc0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1547_c11_30ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1547_c11_30ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_30ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l1547_c11_30ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_30ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_30ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l1547_c11_30ab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1560_c11_d0aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1560_c11_d0aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_d0aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1560_c11_d0aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_d0aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_d0aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1560_c11_d0aa_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1532_l1539_l1555_l1543_DUPLICATE_6848 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1532_l1539_l1555_l1543_DUPLICATE_6848_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1543_c11_2b95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1543_c11_2b95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_2b95_left;
     BIN_OP_EQ_uxn_opcodes_h_l1543_c11_2b95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_2b95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_2b95_return_output := BIN_OP_EQ_uxn_opcodes_h_l1543_c11_2b95_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1532_l1543_DUPLICATE_c282 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1532_l1543_DUPLICATE_c282_return_output := result.is_stack_operation_16bit;

     -- CONST_SR_8[uxn_opcodes_h_l1553_c31_ff18] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1553_c31_ff18_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1553_c31_ff18_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1553_c31_ff18_return_output := CONST_SR_8_uxn_opcodes_h_l1553_c31_ff18_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1532_l1560_l1555_l1543_l1539_DUPLICATE_5c50 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1532_l1560_l1555_l1543_l1539_DUPLICATE_5c50_return_output := result.is_ram_write;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1544_c8_72c9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1544_c8_72c9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_previous_stack_read);

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1539_c7_dac3] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1539_c7_dac3_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1532_l1547_l1539_l1543_DUPLICATE_e7de LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1532_l1547_l1539_l1543_DUPLICATE_e7de_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1560_l1555_l1547_l1543_l1539_DUPLICATE_44ed LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1560_l1555_l1547_l1543_l1539_DUPLICATE_44ed_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1532_c6_0f89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89_left;
     BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89_return_output := BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1558_c21_a0e8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1558_c21_a0e8_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c6_0f89_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1539_c7_dac3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_dac3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_dac3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1539_c7_dac3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_dac3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1539_c7_dac3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1539_c7_dac3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1539_c7_dac3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_4dd5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1543_c7_49e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_2b95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_49e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_2b95_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_49e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_2b95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_2b95_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1543_c7_49e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_2b95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_2b95_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1543_c7_49e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_2b95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1543_c7_49e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_2b95_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1543_c7_49e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_2b95_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1547_c7_73c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_30ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_73c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_30ab_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_73c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_30ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_30ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_30ab_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1547_c7_73c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_30ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1547_c7_73c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_30ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_e90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c11_6fc0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_e90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c11_6fc0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c7_e90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c11_6fc0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c7_e90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c11_6fc0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c7_e90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c11_6fc0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_0051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_d0aa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_0051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_d0aa_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1552_l1557_DUPLICATE_7b03_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1552_l1557_DUPLICATE_9eac_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1544_c8_72c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1558_c21_a0e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1532_l1547_l1539_l1543_DUPLICATE_e7de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1532_l1547_l1539_l1543_DUPLICATE_e7de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1532_l1547_l1539_l1543_DUPLICATE_e7de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1532_l1547_l1539_l1543_DUPLICATE_e7de_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1532_l1539_l1555_l1543_DUPLICATE_6848_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1532_l1539_l1555_l1543_DUPLICATE_6848_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1532_l1539_l1555_l1543_DUPLICATE_6848_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1532_l1539_l1555_l1543_DUPLICATE_6848_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1560_l1555_l1547_l1543_l1539_DUPLICATE_44ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1560_l1555_l1547_l1543_l1539_DUPLICATE_44ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1560_l1555_l1547_l1543_l1539_DUPLICATE_44ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1560_l1555_l1547_l1543_l1539_DUPLICATE_44ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_0051_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1560_l1555_l1547_l1543_l1539_DUPLICATE_44ed_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1532_l1560_l1555_l1543_l1539_DUPLICATE_5c50_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1532_l1560_l1555_l1543_l1539_DUPLICATE_5c50_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1532_l1560_l1555_l1543_l1539_DUPLICATE_5c50_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1532_l1560_l1555_l1543_l1539_DUPLICATE_5c50_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_0051_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1532_l1560_l1555_l1543_l1539_DUPLICATE_5c50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1539_l1555_l1543_DUPLICATE_f9a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1539_l1555_l1543_DUPLICATE_f9a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1539_l1555_l1543_DUPLICATE_f9a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1532_l1539_l1555_l1543_DUPLICATE_f9a1_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1532_l1543_DUPLICATE_c282_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1532_l1543_DUPLICATE_c282_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1532_l1539_l1555_l1543_DUPLICATE_ecbc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1532_l1539_l1555_l1543_DUPLICATE_ecbc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1532_l1539_l1555_l1543_DUPLICATE_ecbc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1532_l1539_l1555_l1543_DUPLICATE_ecbc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1539_c7_dac3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1550_c30_bae2_return_output;
     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1543_c7_49e8] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1543_c7_49e8_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1543_c7_49e8_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1555_c7_e90e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1555_c7_e90e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c7_e90e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1553_c21_7ec7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1553_c21_7ec7_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1553_c31_ff18_return_output);

     -- t8_MUX[uxn_opcodes_h_l1543_c7_49e8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1543_c7_49e8_cond <= VAR_t8_MUX_uxn_opcodes_h_l1543_c7_49e8_cond;
     t8_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue;
     t8_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output := t8_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1555_c7_e90e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c7_e90e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c7_e90e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1547_c7_73c8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1539_c7_dac3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_dac3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_dac3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1560_c7_0051] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_0051_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_0051_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_0051_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_0051_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_0051_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_0051_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_0051_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_0051_return_output;

     -- n16_MUX[uxn_opcodes_h_l1547_c7_73c8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1547_c7_73c8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1547_c7_73c8_cond;
     n16_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue;
     n16_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output := n16_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1560_c7_0051] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_0051_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_0051_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_0051_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_0051_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_0051_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_0051_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_0051_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_0051_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1552_l1557_DUPLICATE_7b03 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1552_l1557_DUPLICATE_7b03_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1552_l1557_DUPLICATE_7b03_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1552_l1557_DUPLICATE_7b03_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1552_l1557_DUPLICATE_7b03_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1552_l1557_DUPLICATE_7b03_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1552_l1557_DUPLICATE_7b03_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1557_c22_8ac3_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1552_l1557_DUPLICATE_7b03_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1552_c3_5677 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1552_l1557_DUPLICATE_7b03_return_output)),16);
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1553_c21_7ec7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_0051_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_0051_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1552_c3_5677;
     -- BIN_OP_PLUS[uxn_opcodes_h_l1557_c22_8ac3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1557_c22_8ac3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1557_c22_8ac3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1557_c22_8ac3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1557_c22_8ac3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1557_c22_8ac3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1557_c22_8ac3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1532_c2_f1f4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1543_c7_49e8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1555_c7_e90e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_e90e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_e90e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1547_c7_73c8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1547_c7_73c8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1547_c7_73c8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1539_c7_dac3] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1539_c7_dac3_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1539_c7_dac3_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1555_c7_e90e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_e90e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_e90e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1543_c7_49e8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1543_c7_49e8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1543_c7_49e8_cond;
     n16_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue;
     n16_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output := n16_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1547_c7_73c8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output;

     -- t8_MUX[uxn_opcodes_h_l1539_c7_dac3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1539_c7_dac3_cond <= VAR_t8_MUX_uxn_opcodes_h_l1539_c7_dac3_cond;
     t8_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue;
     t8_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output := t8_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1557_c3_00ba := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1557_c22_8ac3_return_output)),16);
     VAR_n16_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1557_c3_00ba;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1547_c7_73c8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_73c8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_73c8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1543_c7_49e8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1543_c7_49e8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1543_c7_49e8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1555_c7_e90e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1555_c7_e90e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c7_e90e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c7_e90e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c7_e90e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1543_c7_49e8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1547_c7_73c8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_73c8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_73c8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output;

     -- n16_MUX[uxn_opcodes_h_l1539_c7_dac3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1539_c7_dac3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1539_c7_dac3_cond;
     n16_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue;
     n16_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output := n16_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1532_c2_f1f4] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1539_c7_dac3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output;

     -- t8_MUX[uxn_opcodes_h_l1532_c2_f1f4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond <= VAR_t8_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond;
     t8_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue;
     t8_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output := t8_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c7_e90e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1532_c2_f1f4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1539_c7_dac3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1543_c7_49e8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_49e8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_49e8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1547_c7_73c8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1547_c7_73c8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1547_c7_73c8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1547_c7_73c8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1547_c7_73c8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output := result_u16_value_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1539_c7_dac3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1539_c7_dac3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1539_c7_dac3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1532_c2_f1f4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond;
     n16_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue;
     n16_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output := n16_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1543_c7_49e8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_49e8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_49e8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output;

     -- Submodule level 5
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1547_c7_73c8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1532_c2_f1f4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1532_c2_f1f4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1539_c7_dac3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_dac3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_dac3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1543_c7_49e8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1543_c7_49e8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1543_c7_49e8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1543_c7_49e8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1543_c7_49e8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output := result_u16_value_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1539_c7_dac3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_dac3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_dac3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1543_c7_49e8_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1539_c7_dac3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1539_c7_dac3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1539_c7_dac3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1539_c7_dac3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1539_c7_dac3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1532_c2_f1f4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1532_c2_f1f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1539_c7_dac3_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1532_c2_f1f4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c7f2_uxn_opcodes_h_l1565_l1527_DUPLICATE_76e6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7f2_uxn_opcodes_h_l1565_l1527_DUPLICATE_76e6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c7f2(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output,
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1532_c2_f1f4_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7f2_uxn_opcodes_h_l1565_l1527_DUPLICATE_76e6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7f2_uxn_opcodes_h_l1565_l1527_DUPLICATE_76e6_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
